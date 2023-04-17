#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "avs_coap" for configuration ""
set_property(TARGET avs_coap APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(avs_coap PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "C"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libavs_coap.a"
  )

list(APPEND _cmake_import_check_targets avs_coap )
list(APPEND _cmake_import_check_files_for_avs_coap "${_IMPORT_PREFIX}/lib/libavs_coap.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
