file(REMOVE_RECURSE
  "../../../../lib/libssl.pdb"
  "../../../../lib/libssl.a"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/ssl.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
