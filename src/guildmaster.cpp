#include "DatabaseEnv.h"
#include "Player.h"
#include "ScriptedGossip.h"
#include "ScriptMgr.h"
#include "World.h"

#define COST_GH_BUY 1000 //1000 g.
#define COST_GH_SELL 500 //500 g.
#define MSG_GOSSIP_TELE          "Teleport to GuildHouse"
#define MSG_GOSSIP_BUY           "Buy GuildHouse (1000 gold)"
#define MSG_GOSSIP_SELL          "Sell GuildHouse (500 gold)"
#define MSG_GOSSIP_NEXTPAGE      "Next -->"
#define MSG_INCOMBAT             "You are in combat and cannot be teleported to your GuildHouse."
#define MSG_NOGUILDHOUSE         "Your guild currently does not own a GuildHouse."
#define MSG_NOFREEGH             "Unfortunately, all GuildHouses are in use."
#define MSG_ALREADYHAVEGH        "Sorry, but you already own a GuildHouse (%s)."
#define MSG_NOTENOUGHMONEY       "You do not have the 1000 gold required to purchase a GuildHouse."
#define MSG_GHOCCUPIED           "This GuildHouse is unavailable for purchase as it is currently in use."
#define MSG_CONGRATULATIONS      "Congratulations! You have successfully purchased a GuildHouse."
#define MSG_SOLD                 "You have sold your GuildHouse and have received 500 gold."
#define MSG_NOTINGUILD           "You need to be in a guild before you can use a GuildHouse."
#define MSG_SELL_CONFIRM         "Are you sure you want to sell your guildhouse for half the buy price?"

#define OFFSET_GH_ID_TO_ACTION 1500
#define OFFSET_SHOWBUY_FROM 10000

#define ACTION_TELE 1001
#define ACTION_SHOW_BUYLIST 1002 //deprecated. Use (OFFSET_SHOWBUY_FROM + 0) instead
#define ACTION_SELL_GUILDHOUSE 1003

#define ICON_GOSSIP_BALOON 0
#define ICON_GOSSIP_WING 2
#define ICON_GOSSIP_BOOK 3
#define ICON_GOSSIP_WHEEL1 4
#define ICON_GOSSIP_WHEEL2 5
#define ICON_GOSSIP_GOLD 6
#define ICON_GOSSIP_BALOONDOTS 7
#define ICON_GOSSIP_TABARD 8
#define ICON_GOSSIP_XSWORDS 9

#define GOSSIP_COUNT_MAX 10

class guildmaster : public CreatureScript
{
public:
    guildmaster() : CreatureScript("guildmaster") { }

    bool isPlayerGuildLeader(Player *player)
    {
        return (player->GetRank() == 0) && (player->GetGuildId() != 0);
    }

    bool getGuildHouseCoords(uint32 guildId, float &x, float &y, float &z, uint32 &map)
    {
        if (guildId == 0) //if player has no guild
            return false;

        QueryResult result;
        result = WorldDatabase.Query("SELECT `x`, `y`, `z`, `map` FROM `guildhouses` WHERE `guildId` = {}", guildId);
        if (result)
        {
            Field *fields = result->Fetch();
            x = fields[0].Get<float>();
            y = fields[1].Get<float>();
            z = fields[2].Get<float>();
            map = fields[3].Get<uint32>();
            return true;
        }
        return false;
    }

    void teleportPlayerToGuildHouse(Player *player, Creature *_creature)
    {
        if (player->IsInCombat()) //don't allow teleporting while in combat
        {
            _creature->Whisper(MSG_INCOMBAT, LANG_UNIVERSAL, player);
            return;
        }

        float x, y, z;
        uint32 map;

        if (getGuildHouseCoords(player->GetGuildId(), x, y, z, map))
            player->TeleportTo(map, x, y, z, 0.0f);
        else
            _creature->Whisper(MSG_NOGUILDHOUSE, LANG_UNIVERSAL, player);
    }

    bool showBuyList(Player *player, Creature *_creature, uint32 showFromId = 0)
    {
        //show not occupied guildhouses
        QueryResult result;
        result = WorldDatabase.Query("SELECT `id`, `comment` FROM `guildhouses` WHERE `guildId` = 0 AND `id` > {} ORDER BY `id` ASC LIMIT {}", showFromId, GOSSIP_COUNT_MAX);

        if (result)
        {
            uint32 guildhouseId = 0;
            std::string comment = "";
            do
            {
                Field *fields = result->Fetch();
                guildhouseId = fields[0].Get<int32>();
                comment = fields[1].Get<std::string>();
                //send comment as a gossip item
                //transmit guildhouseId in Action variable
                AddGossipItemFor(player, ICON_GOSSIP_TABARD, comment.c_str(), GOSSIP_SENDER_MAIN, guildhouseId + OFFSET_GH_ID_TO_ACTION);
            } while (result->NextRow());

            if (result->GetRowCount() == GOSSIP_COUNT_MAX)
            {
                //assume that we have additional page
                //add link to next GOSSIP_COUNT_MAX items
                AddGossipItemFor(player, ICON_GOSSIP_BALOONDOTS, MSG_GOSSIP_NEXTPAGE, GOSSIP_SENDER_MAIN, guildhouseId + OFFSET_SHOWBUY_FROM);
            }
            SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
            return true;
        }
        else if (!result)
        {
            //all guildhouses are occupied
            _creature->Whisper(MSG_NOFREEGH, LANG_UNIVERSAL, player);
            CloseGossipMenuFor(player);
        }
        else
            //this condition occurs when COUNT(guildhouses) % GOSSIP_COUNT_MAX == 0
            //just show GHs from beginning
            showBuyList(player, _creature, 0);
        return false;
    }

    bool isPlayerHasGuildhouse(Player *player, Creature *_creature, bool whisper = false)
    {
        QueryResult result;
        result = WorldDatabase.Query("SELECT `comment` FROM `guildhouses` WHERE `guildId` = {}",
            player->GetGuildId());

        if (result)
        {
            if (whisper)
            {
                Field *fields = result->Fetch();
                char msg[100];
                sprintf(msg, MSG_ALREADYHAVEGH, fields[0].Get<std::string>().c_str());
                _creature->Whisper(msg, LANG_UNIVERSAL, player);
            }
            return true;
        }
        return false;
    }

    void buyGuildhouse(Player *player, Creature *_creature, uint32 guildhouseId)
    {

        if (player->GetMoney() < COST_GH_BUY)
        {
            //show how much money player need to buy GH (in gold)
            char msg[100];
            sprintf(msg, MSG_NOTENOUGHMONEY);
            _creature->Whisper(msg, LANG_UNIVERSAL, player);
            return;
        }

        if (isPlayerHasGuildhouse(player, _creature, true))
            return;

        QueryResult result;
        //check if somebody already occupied this GH
        result = WorldDatabase.Query("SELECT `id` FROM `guildhouses` WHERE `id` = {} AND `guildId` <> 0", guildhouseId);

        if (result)
        {
            _creature->Whisper(MSG_GHOCCUPIED, LANG_UNIVERSAL, player);
            return;
        }
        //update DB
        result = WorldDatabase.Query("UPDATE `guildhouses` SET `guildId` = {} WHERE `id` = {}",
            player->GetGuildId(), guildhouseId);
        player->ModifyMoney(-10000000);
        //player->DestroyItemCount(token, cost, true);
        _creature->Whisper(MSG_CONGRATULATIONS, LANG_UNIVERSAL, player);
    }

    void sellGuildhouse(Player *player, Creature *_creature)
    {
        if (isPlayerHasGuildhouse(player, _creature))
        {
            QueryResult result;
            result = WorldDatabase.Query("UPDATE `guildhouses` SET `guildId` = 0 WHERE `guildId` = {}",
                player->GetGuildId());
            player->ModifyMoney(5000000);
            char msg[100];
            sprintf(msg, MSG_SOLD);
            _creature->Whisper(msg, LANG_UNIVERSAL, player);
        }
    }

    bool OnGossipSelect(Player *player, Creature *_creature, uint32 sender, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        if (sender != GOSSIP_SENDER_MAIN)
            return false;

        switch (action)
        {
        case ACTION_TELE:
            CloseGossipMenuFor(player);
            teleportPlayerToGuildHouse(player, _creature);
            break;
        case ACTION_SHOW_BUYLIST:
            showBuyList(player, _creature);
            break;
        case ACTION_SELL_GUILDHOUSE:
            sellGuildhouse(player, _creature);
            CloseGossipMenuFor(player);
            break;
        default:
            if (action > OFFSET_SHOWBUY_FROM)
                showBuyList(player, _creature, action - OFFSET_SHOWBUY_FROM);
            else if (action > OFFSET_GH_ID_TO_ACTION)
            {
                CloseGossipMenuFor(player);
                buyGuildhouse(player, _creature, action - OFFSET_GH_ID_TO_ACTION);
            }
            break;
        }
        return true;
    }

    bool OnGossipHello(Player *player, Creature *_creature)
    {
        if (player->GetGuildId() == 0)
        {
            _creature->Whisper(MSG_NOTINGUILD, LANG_UNIVERSAL, player);
            CloseGossipMenuFor(player);
            return true;
        }
        AddGossipItemFor(player, ICON_GOSSIP_BALOON, MSG_GOSSIP_TELE, GOSSIP_SENDER_MAIN, ACTION_TELE);

        if (isPlayerGuildLeader(player))
        {
            if (isPlayerHasGuildhouse(player, _creature))
                AddGossipItemFor(player, ICON_GOSSIP_GOLD, MSG_GOSSIP_SELL, GOSSIP_SENDER_MAIN, ACTION_SELL_GUILDHOUSE, MSG_SELL_CONFIRM, 0, false);
            else
                AddGossipItemFor(player, ICON_GOSSIP_GOLD, MSG_GOSSIP_BUY, GOSSIP_SENDER_MAIN, ACTION_SHOW_BUYLIST);
        }

        SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, _creature->GetGUID());
        return true;
    }
};

void AddSC_guildmaster()
{
    new guildmaster();
}
