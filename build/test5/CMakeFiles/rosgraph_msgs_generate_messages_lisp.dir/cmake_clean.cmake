file(REMOVE_RECURSE
  "talker_automoc.cpp"
  "listener_wig_automoc.cpp"
  "listener_automoc.cpp"
  "listener_qml_automoc.cpp"
  "talker_qt_automoc.cpp"
  "talker_qml_automoc.cpp"
  "listener_qt_automoc.cpp"
  "talker_wig_automoc.cpp"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/rosgraph_msgs_generate_messages_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
