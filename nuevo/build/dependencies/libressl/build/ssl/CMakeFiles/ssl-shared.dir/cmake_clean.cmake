file(REMOVE_RECURSE
  "../../../../lib/libssl.pdb"
  "../../../../lib/libssl.so"
  "../../../../lib/libssl.so.43.2.0"
  "../../../../lib/libssl.so.43"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/ssl-shared.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
