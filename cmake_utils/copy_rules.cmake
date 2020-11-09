# Creates a target to copy files relative to SOURCE, into directory DEST, while preserving
# relative directory structure.
function(copy_files TARGET_NAME SOURCE DEST)
  set(STAMP_FILE ${CMAKE_CURRENT_BINARY_DIR}/${TARGET_NAME}.stamp)

  set(OUTPUT_FILES)
  foreach(FILENAME ${ARGN})
    add_custom_command(
      OUTPUT ${DEST}/${FILENAME}
      COMMAND ${CMAKE_COMMAND} -E copy ${SOURCE}/${FILENAME} ${DEST}/${FILENAME}
      DEPENDS ${SOURCE}/${FILENAME}
      COMMENT "Copying file ${FILENAME}"
    )
    set(OUTPUT_FILES ${OUTPUT_FILES} ${DEST}/${FILENAME})
  endforeach(FILENAME)

  add_custom_command(
      OUTPUT ${STAMP_FILE}
      COMMAND ${CMAKE_COMMAND} -E touch ${STAMP_FILE}
      DEPENDS ${OUTPUT_FILES}
  )

  add_custom_target(${TARGET_NAME} ALL
    DEPENDS ${STAMP_FILE}
  )
  set_target_properties(
    ${TARGET_NAME} PROPERTIES
    STAMP_FILE ${STAMP_FILE}
  )
endfunction(copy_files)
