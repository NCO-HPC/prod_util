set(EXENAME ndate)
add_executable(${EXENAME} ndate.f)
target_link_libraries(${EXENAME} PRIVATE w3emc::w3emc_4)

install(TARGETS ${EXENAME}
  RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/exec)
