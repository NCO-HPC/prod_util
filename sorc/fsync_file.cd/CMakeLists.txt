set(EXENAME fsync_file)
add_executable(${EXENAME} fsync_file.c)

install(TARGETS ${EXENAME}
  RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/exec)
