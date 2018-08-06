file(REMOVE_RECURSE
  "../../../../lib/libtls.pdb"
  "../../../../lib/libtls.so"
  "../../../../lib/libtls.so.15.4.0"
  "../../../../lib/libtls.so.15"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/tls-shared.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
