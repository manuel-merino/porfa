file(REMOVE_RECURSE
  "lib/libnetlib.pdb"
  "lib/libnetlib.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C CXX)
  include(CMakeFiles/netlib.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
