file(REMOVE_RECURSE
  "../../../../lib/libcrypto.pdb"
  "../../../../lib/libcrypto.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/crypto.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()