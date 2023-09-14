#!/bin/bash

################################################################################
# Script Description:
#   This Bash script demonstrates two file renaming operations using the 'rename'
#   and 'mv' commands. It allows you to choose the operation and specify the 
#   prefix as an argument when calling the functions. If the operation is set
#   to 'true', all files are renamed with a 'prefix1_' prefix, else all files
#   prefixed with 'prefix1_' are replaced with the 'prefix2_' prefix
#
# Usage:
#   Ensure that you have the 'rename' command available on your system.
#   To run this script, save it as a .sh file and make it executable:
#   chmod +x rename_files.sh
#   Then execute it with a boolean argument and prefix:
#   ./rename_files.sh true prefix1_     # To add 'prefix1_' prefix
#   ./rename_files.sh false prefix1_ prefix2_ # To replace 'prefix1_' with 'prefix2_'
#
################################################################################

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ] && [ "$#" -ne 4 ]; then
  echo "Usage: $0 <true/false> <old_prefix> [new_prefix]"
  exit 1
fi

# Check if the argument is 'true' or 'false'
boolean_arg="$1"
if [ "$boolean_arg" != "true" ] && [ "$boolean_arg" != "false" ]; then
  echo "Invalid argument. Use 'true' or 'false'."
  exit 1
fi

# Function to add a prefix to all files
add_prefix() {
  local old_prefix="$2"
  local new_prefix="$3"
  rename "s/^/$new_prefix/" *
}

# Function to replace a prefix for files starting with the prefix
replace_prefix() {
  local old_prefix="$2"
  local new_prefix="$3"
  for file in "${old_prefix}"*; do
    new_name="${file/${old_prefix}/${new_prefix}}"
    mv -v "$file" "$new_name"
  done
}

# Choose the renaming operation based on the boolean argument
if [ "$boolean_arg" == "true" ]; then
  if [ "$#" -eq 3 ]; then
    echo "Please provide a prefix when using 'true' operation."
    exit 1
  fi
  echo "Adding '$3' as a prefix to all files..."
  add_prefix "$@"
else
  echo "Replacing '$2' with '$3' for files starting with the prefix..."
  replace_prefix "$@"
fi
