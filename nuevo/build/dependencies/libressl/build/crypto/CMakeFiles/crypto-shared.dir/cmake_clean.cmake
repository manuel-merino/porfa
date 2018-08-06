file(REMOVE_RECURSE
  "../../../../lib/libcrypto.pdb"
  "../../../../lib/libcrypto.so"
  "../../../../lib/libcrypto.so.41.1.0"
  "../../../../lib/libcrypto.so.41"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/crypto-shared.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
