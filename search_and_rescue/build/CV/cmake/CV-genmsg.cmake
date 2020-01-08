# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "CV: 3 messages, 0 services")

set(MSG_I_FLAGS "-ICV:/home/mayuresh/search_and_rescue/src/CV/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(CV_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/single.msg" NAME_WE)
add_custom_target(_CV_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "CV" "/home/mayuresh/search_and_rescue/src/CV/msg/single.msg" ""
)

get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/info.msg" NAME_WE)
add_custom_target(_CV_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "CV" "/home/mayuresh/search_and_rescue/src/CV/msg/info.msg" "CV/single"
)

get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/Array.msg" NAME_WE)
add_custom_target(_CV_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "CV" "/home/mayuresh/search_and_rescue/src/CV/msg/Array.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(CV
  "/home/mayuresh/search_and_rescue/src/CV/msg/single.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/CV
)
_generate_msg_cpp(CV
  "/home/mayuresh/search_and_rescue/src/CV/msg/info.msg"
  "${MSG_I_FLAGS}"
  "/home/mayuresh/search_and_rescue/src/CV/msg/single.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/CV
)
_generate_msg_cpp(CV
  "/home/mayuresh/search_and_rescue/src/CV/msg/Array.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/CV
)

### Generating Services

### Generating Module File
_generate_module_cpp(CV
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/CV
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(CV_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(CV_generate_messages CV_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/single.msg" NAME_WE)
add_dependencies(CV_generate_messages_cpp _CV_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/info.msg" NAME_WE)
add_dependencies(CV_generate_messages_cpp _CV_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/Array.msg" NAME_WE)
add_dependencies(CV_generate_messages_cpp _CV_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(CV_gencpp)
add_dependencies(CV_gencpp CV_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS CV_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(CV
  "/home/mayuresh/search_and_rescue/src/CV/msg/single.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/CV
)
_generate_msg_eus(CV
  "/home/mayuresh/search_and_rescue/src/CV/msg/info.msg"
  "${MSG_I_FLAGS}"
  "/home/mayuresh/search_and_rescue/src/CV/msg/single.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/CV
)
_generate_msg_eus(CV
  "/home/mayuresh/search_and_rescue/src/CV/msg/Array.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/CV
)

### Generating Services

### Generating Module File
_generate_module_eus(CV
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/CV
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(CV_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(CV_generate_messages CV_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/single.msg" NAME_WE)
add_dependencies(CV_generate_messages_eus _CV_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/info.msg" NAME_WE)
add_dependencies(CV_generate_messages_eus _CV_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/Array.msg" NAME_WE)
add_dependencies(CV_generate_messages_eus _CV_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(CV_geneus)
add_dependencies(CV_geneus CV_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS CV_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(CV
  "/home/mayuresh/search_and_rescue/src/CV/msg/single.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/CV
)
_generate_msg_lisp(CV
  "/home/mayuresh/search_and_rescue/src/CV/msg/info.msg"
  "${MSG_I_FLAGS}"
  "/home/mayuresh/search_and_rescue/src/CV/msg/single.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/CV
)
_generate_msg_lisp(CV
  "/home/mayuresh/search_and_rescue/src/CV/msg/Array.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/CV
)

### Generating Services

### Generating Module File
_generate_module_lisp(CV
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/CV
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(CV_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(CV_generate_messages CV_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/single.msg" NAME_WE)
add_dependencies(CV_generate_messages_lisp _CV_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/info.msg" NAME_WE)
add_dependencies(CV_generate_messages_lisp _CV_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/Array.msg" NAME_WE)
add_dependencies(CV_generate_messages_lisp _CV_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(CV_genlisp)
add_dependencies(CV_genlisp CV_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS CV_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(CV
  "/home/mayuresh/search_and_rescue/src/CV/msg/single.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/CV
)
_generate_msg_nodejs(CV
  "/home/mayuresh/search_and_rescue/src/CV/msg/info.msg"
  "${MSG_I_FLAGS}"
  "/home/mayuresh/search_and_rescue/src/CV/msg/single.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/CV
)
_generate_msg_nodejs(CV
  "/home/mayuresh/search_and_rescue/src/CV/msg/Array.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/CV
)

### Generating Services

### Generating Module File
_generate_module_nodejs(CV
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/CV
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(CV_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(CV_generate_messages CV_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/single.msg" NAME_WE)
add_dependencies(CV_generate_messages_nodejs _CV_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/info.msg" NAME_WE)
add_dependencies(CV_generate_messages_nodejs _CV_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/Array.msg" NAME_WE)
add_dependencies(CV_generate_messages_nodejs _CV_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(CV_gennodejs)
add_dependencies(CV_gennodejs CV_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS CV_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(CV
  "/home/mayuresh/search_and_rescue/src/CV/msg/single.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/CV
)
_generate_msg_py(CV
  "/home/mayuresh/search_and_rescue/src/CV/msg/info.msg"
  "${MSG_I_FLAGS}"
  "/home/mayuresh/search_and_rescue/src/CV/msg/single.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/CV
)
_generate_msg_py(CV
  "/home/mayuresh/search_and_rescue/src/CV/msg/Array.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/CV
)

### Generating Services

### Generating Module File
_generate_module_py(CV
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/CV
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(CV_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(CV_generate_messages CV_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/single.msg" NAME_WE)
add_dependencies(CV_generate_messages_py _CV_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/info.msg" NAME_WE)
add_dependencies(CV_generate_messages_py _CV_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mayuresh/search_and_rescue/src/CV/msg/Array.msg" NAME_WE)
add_dependencies(CV_generate_messages_py _CV_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(CV_genpy)
add_dependencies(CV_genpy CV_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS CV_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/CV)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/CV
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(CV_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/CV)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/CV
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(CV_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/CV)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/CV
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(CV_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/CV)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/CV
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(CV_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/CV)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/CV\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/CV
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(CV_generate_messages_py std_msgs_generate_messages_py)
endif()
