# Script to auto-generate CLion run configurations from target names

# Find CLion run config dir
set(CLION_RUN_CONF_DIR ${CMAKE_SOURCE_DIR}/.idea/runConfigurations)
file(MAKE_DIRECTORY ${CLION_RUN_CONF_DIR})

function(gen_clion_run_configuration CMAKE_TARGET)

    # Create name (combine target name, Mbed target, and build config to generate a unique string)
    set(CONFIG_NAME "GDB ${CMAKE_TARGET} ${MBED_TARGET_NAME} ${CMAKE_BUILD_TYPE}")

    set(RUN_CONF_PATH "${CLION_RUN_CONF_DIR}/${CONFIG_NAME}.xml")

    file(GENERATE OUTPUT ${RUN_CONF_PATH} CONTENT
"<component name=\"ProjectRunConfigurationManager\">
  <configuration default=\"false\" name=\"${CONFIG_NAME}\" type=\"CLion_Remote\" remoteCommand=\"localhost:${GDB_PORT}\" symbolFile=\"$<TARGET_FILE:${CMAKE_TARGET}>\" sysroot=\"\">
    <method v=\"2\" />
  </configuration>
</component>
")

endfunction(gen_clion_run_configuration)