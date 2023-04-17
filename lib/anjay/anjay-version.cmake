# Copyright 2023 AVSystem <avsystem@avsystem.com>
# AVSystem Anjay LwM2M SDK
# All rights reserved.
#
# Licensed under the AVSystem-5-clause License.
# See the attached LICENSE file for details.

set(PACKAGE_VERSION "3.3.1")

if (${PACKAGE_VERSION} VERSION_LESS ${PACKAGE_FIND_VERSION})
    set(PACKAGE_VERSION_COMPATIBLE FALSE)
else()
    set(PACKAGE_VERSION_COMPATIBLE TRUE)
    if (${PACKAGE_FIND_VERSION} STREQUAL ${PACKAGE_VERSION})
        set(PACKAGE_VERSION_EXACT TRUE)
    endif()
endif()
