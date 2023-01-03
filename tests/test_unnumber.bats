# Create a tmp directory to make the tests inside

# Test that the directories are unnumbered
@test "Remove the indexes from the directories" {
  # Create a test directory
  mkdir -p tmp/01_Admin
  cd tmp
  
  # Run the "unnumber" function inside this directory
  run ../build/unnumber

  # Check that the directory has been correctly renamed
  run ls
  [[ ! $(echo "$output" | grep 01_Admin ) ]] # 01_Admin should not be in the output
  [[ $(echo "$output" | grep Admin ) ]] # Admin should be in the output


  # Clean up 
  cd ../
  rm -r tmp
}

