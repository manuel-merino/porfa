file(REMOVE_RECURSE
  "../../../../lib/libtls.pdb"
  "../../../../lib/libtls.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/tls.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
