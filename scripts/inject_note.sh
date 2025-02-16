#!/bin/bash

# This script injects a note into a specified knowledge base's __dyn_notes__.md file.
# Usage: inject_note.sh "Your note here" "Knowledge Base Name"

# Assign the first argument to NOTE, which is the content of the note to be added.
NOTE="$1"
# Assign the second argument to KB_NAME, which specifies the target knowledge base.
KB_NAME="$2"

# Determine the path to the __dyn_notes__.md file within the specified knowledge base.
FILE_PATH="$(dirname "$0")/../kb-network/$KB_NAME/__dyn_notes__.md"

# Check if both arguments are provided; if not, display usage instructions and exit.
if [ -z "$NOTE" ] || [ -z "$KB_NAME" ]; then
  echo "Usage: $0 \"Your note here\" \"Knowledge Base Name\""
  exit 1
fi

# If the __dyn_notes__.md file does not exist, create it with a header.
if [ ! -f "$FILE_PATH" ]; then
  echo -e "# Dynamic Notes\n\n" > "$FILE_PATH"
fi

# Function to generate tags based on note content
function generate_tags() {
  local note_content="$1"
  local tags="[system:note]"

  # Check for specific keywords to determine note type
  if [[ "$note_content" == *"idea"* ]]; then
    tags+=" [type:idea]"
  elif [[ "$note_content" == *"task"* ]]; then
    tags+=" [type:task]"
  elif [[ "$note_content" == *"reference"* ]]; then
    tags+=" [type:reference]"
  else
    tags+=" [type:general]"
  fi

  echo "$tags"
}

# Get the current timestamp
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Generate tags based on the note content
SYSTEM_TAGS=$(generate_tags "$NOTE")

# Append the note with its timestamp and generated tags to the __dyn_notes__.md file
echo "- $TIMESTAMP $SYSTEM_TAGS $NOTE" >> "$FILE_PATH"

# Output a confirmation message indicating the note has been added.
echo "Note added to the '$KB_NAME' knowledge base."
