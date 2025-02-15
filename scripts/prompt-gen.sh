#!/bin/bash

# Prompt Generator CLI Tool
# Usage: prompt-gen "Task description" "Requirement1" "Requirement2" ...

generate_prompt() {
    local task="$1"
    shift
    local requirements=("$@")

    cat << EOF
<prompt_request>
Task: $task
Key Requirements:
$(for req in "${requirements[@]}"; do echo "- $req"; done)
Output: Detailed prompt template
</prompt_request>
EOF
}

if [ $# -lt 1 ]; then
    echo "Usage: prompt-gen \"Task description\" \"Requirement1\" \"Requirement2\" ..."
    echo "Example: prompt-gen \"Create API documentation\" \"Include endpoints\" \"Show examples\""
    exit 1
fi

# Generate and output the prompt
generate_prompt "$@"
