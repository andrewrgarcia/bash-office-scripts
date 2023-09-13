# rename all files with name1_ as a prefix:
rename 's/^/name1_/' *

# rename all files starting with name1_ as a prefix with name2_ as their new prefix:
#for file in name1_*; do mv -v "$file" "${file/name1_/name_2}"; done


