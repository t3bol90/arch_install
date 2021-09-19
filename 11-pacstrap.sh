#!/bin/bash

# Package files must live in the same directory as this script.
# Modify the package files' content as needed before pacstrapping.
PACKAGE_FILES=(00-all)

################################################################################

# GREP:
# ^#                comment lines (lines starting with #)
# \|                OR
# ^[[:space::]]*$   empty lines (lines with either nothing or blank spaces)
for each in "${PACKAGE_FILES[@]}"; do
    pacstrap -i /mnt $(grep -v '^#\|^[[:space:]]*$' packages-$each.txt)
done
