#!/bin/bash
set -e

LC_ALL=C

# Get the files passed by pre-commit
FILES="$@"

# Exit if no files
[ -z "$FILES" ] && exit 0

# Format the files
echo "$FILES" | tr ' ' ',' | xargs dotnet format --include

# Check if formatting made any changes
CHANGED=$(git diff --name-only -- $FILES)

if [ -n "$CHANGED" ]; then
    echo "Error: Code formatting changes detected in the following files:"
    echo "$CHANGED"
    echo ""
    echo "Please check the formatting result and commit the formatting changes."
    exit 1
fi

exit 0