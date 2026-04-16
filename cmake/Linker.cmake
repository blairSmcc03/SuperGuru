macro(SuperGuru_configure_linker project_name)
  set(SuperGuru_USER_LINKER_OPTION
    "DEFAULT"
      CACHE STRING "Linker to be used")
    set(SuperGuru_USER_LINKER_OPTION_VALUES "DEFAULT" "SYSTEM" "LLD" "GOLD" "BFD" "MOLD" "SOLD" "APPLE_CLASSIC" "MSVC")
  set_property(CACHE SuperGuru_USER_LINKER_OPTION PROPERTY STRINGS ${SuperGuru_USER_LINKER_OPTION_VALUES})
  list(
    FIND
    SuperGuru_USER_LINKER_OPTION_VALUES
    ${SuperGuru_USER_LINKER_OPTION}
    SuperGuru_USER_LINKER_OPTION_INDEX)

  if(${SuperGuru_USER_LINKER_OPTION_INDEX} EQUAL -1)
    message(
      STATUS
        "Using custom linker: '${SuperGuru_USER_LINKER_OPTION}', explicitly supported entries are ${SuperGuru_USER_LINKER_OPTION_VALUES}")
  endif()

  set_target_properties(${project_name} PROPERTIES LINKER_TYPE "${SuperGuru_USER_LINKER_OPTION}")
endmacro()
