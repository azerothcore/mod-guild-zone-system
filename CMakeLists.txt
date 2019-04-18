CU_SET_PATH("CMAKE_guildmaster_DIR" "${CMAKE_CURRENT_LIST_DIR}")

AC_ADD_SCRIPT("${CMAKE_CURRENT_LIST_DIR}/src/guildmaster.cpp")

AC_ADD_SCRIPT_LOADER("guildmaster"      "${CMAKE_CURRENT_LIST_DIR}/src/loader.h")

message("-- Guild House System CONFIGURED --")