# Copyright 2023 AVSystem <avsystem@avsystem.com>
# AVSystem Anjay LwM2M SDK
# All rights reserved.
#
# Licensed under the AVSystem-5-clause License.
# See the attached LICENSE file for details.

set(ANJAY_VERSION "3.3.1")

get_filename_component(CURR_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)

if(NOT DEFINED avs_commons_DIR)
    set(avs_commons_DIR "${CMAKE_CURRENT_LIST_DIR}/../avs_commons")
endif()
find_package(avs_commons REQUIRED COMPONENTS algorithm;crypto;list;buffer;net;sched;stream;stream_net;url;utils;compat_threading;persistence)

if(NOT DEFINED avs_coap_DIR)
    set(avs_coap_DIR "${CMAKE_CURRENT_LIST_DIR}/../avs_coap")
endif()
find_package(avs_coap REQUIRED)

include(${CURR_DIR}/anjay-targets.cmake)

get_filename_component(ANJAY_INCLUDE_DIRS "${CURR_DIR}/../../" ABSOLUTE)
set(ANJAY_INCLUDE_DIRS "${ANJAY_INCLUDE_DIRS}" "${AVS_COMMONS_INCLUDE_DIRS}")
set(ANJAY_LIBRARIES anjay)
set(ANJAY_LIBRARIES_STATIC anjay)

unset(CURR_DIR)
