# Copyright 2023 AVSystem <avsystem@avsystem.com>
# AVSystem CoAP library
# All rights reserved.
#
# Licensed under the AVSystem-5-clause License.
# See the attached LICENSE file for details.

set(AVS_COAP_VERSION "3.3.1-1-g75d8b88")

if(NOT DEFINED avs_commons_DIR)
    set(avs_commons_DIR "${CMAKE_CURRENT_LIST_DIR}/../avs_commons")
endif()
find_package(avs_commons REQUIRED COMPONENTS avs_buffer;avs_compat_threading;avs_list;avs_net;avs_sched;avs_utils;avs_crypto;avs_log;avs_stream;avs_persistence)


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was avs_coap-config.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

check_required_components(avs_coap)

include(${CMAKE_CURRENT_LIST_DIR}/avs_coap-targets.cmake)
