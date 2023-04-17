# Copyright 2023 AVSystem <avsystem@avsystem.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set(AVS_COMMONS_VERSION "5.3.0")




        set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/cmake")
        # Assume mbed TLS is installed to the same root as avs_commons
        set(MBEDTLS_ROOT_DIR "" CACHE STRING "mbed TLS installation directory")
        set(MBEDTLS_USE_STATIC_LIBS  CACHE BOOL "Force static versoin of mbed TLS")
        find_package(MbedTLS REQUIRED)

get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
include(${_DIR}/avs_commons-targets.cmake)

get_filename_component(AVS_COMMONS_INCLUDE_DIRS "${_DIR}/../../include" ABSOLUTE)


                     if(NOT TARGET avs_net AND TARGET avs_net_mbedtls)
                         add_library(avs_net INTERFACE)
                         target_link_libraries(avs_net INTERFACE avs_net_mbedtls)
                     endif()
                     if(NOT TARGET avs_compat_threading AND TARGET avs_compat_threading_pthread)
                         add_library(avs_compat_threading INTERFACE)
                         target_link_libraries(avs_compat_threading INTERFACE avs_compat_threading_pthread)
                     endif()
                     if(NOT TARGET avs_crypto AND TARGET avs_crypto_mbedtls)
                         add_library(avs_crypto INTERFACE)
                         target_link_libraries(avs_crypto INTERFACE avs_crypto_mbedtls)
                     endif()

foreach(_COMPONENT ${AVS_COMMONS_FIND_COMPONENTS})
    if(TARGET avs_${_COMPONENT})
        set(AVS_COMMONS_LIBRARIES ${AVS_COMMONS_LIBRARIES} avs_${_COMPONENT})
    elseif(AVS_COMMONS_FIND_REQUIRED)
        message(FATAL_ERROR "Component ${_COMPONENT} cannot be found")
    endif()
endforeach()

unset(_COMPONENT)
unset(_DIR)
