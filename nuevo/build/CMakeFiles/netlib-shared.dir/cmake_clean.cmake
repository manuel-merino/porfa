file(REMOVE_RECURSE
  "lib/libnetlib.pdb"
  "lib/libnetlib.so"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/netlib-shared.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
