#!/bin/bash

# Prompt Generator CLI Tool
# A powerful tool for generating structured prompts using templates

# Configuration
CONFIG_FILE="${HOME}/knowledge-bases/kb-nahum-jeff-shared/prompting/claude/prompt_generator/config.json"
TEMPLATE_DIR="${HOME}/knowledge-bases/kb-nahum-jeff-shared/prompting/claude/prompt_generator/templates"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Help function
show_help() {
    cat << EOF
Prompt Generator CLI Tool

Usage: 
  prompt-gen [options] "Task description" "Requirement1" "Requirement2" ...

Options:
  -t, --template NAME    Use specific template
  -f, --format FORMAT   Output format (xml, json, markdown)
  -i, --interactive     Interactive mode
  -d, --debug          Debug mode
  -h, --help           Show this help

Examples:
  # Basic usage
  prompt-gen "Create API docs" "Include endpoints" "Show examples"

  # With template
  prompt-gen -t api_docs "Document REST API" "Include auth"

  # Interactive mode
  prompt-gen -i "Create documentation"

  # Debug mode
  prompt-gen -d "Analyze code" "Security check"
EOF
}

# Parse arguments
parse_args() {
    TEMPLATE="general"
    FORMAT="xml"
    INTERACTIVE=false
    DEBUG=false

    while [[ $# -gt 0 ]]; do
        case $1 in
            -t|--template)
                TEMPLATE="$2"
                shift 2
                ;;
            -f|--format)
                FORMAT="$2"
                shift 2
                ;;
            -i|--interactive)
                INTERACTIVE=true
                shift
                ;;
            -d|--debug)
                DEBUG=true
                shift
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            *)
                break
                ;;
        esac
    done

    # Store remaining args
    TASK="$1"
    shift
    REQUIREMENTS=("$@")
}

# Generate prompt using template
generate_prompt() {
    local template_file="${TEMPLATE_DIR}/${TEMPLATE}.xml"
    
    # Check if template exists
    if [[ ! -f "$template_file" ]]; then
        echo -e "${RED}Error: Template '$TEMPLATE' not found${NC}"
        exit 1
    fi

    # Debug output
    if [[ "$DEBUG" == true ]]; then
        echo -e "${BLUE}Debug: Using template $template_file${NC}"
        echo -e "${BLUE}Debug: Task: $TASK${NC}"
        echo -e "${BLUE}Debug: Requirements: ${REQUIREMENTS[*]}${NC}"
    fi

    # Generate prompt
    cat << EOF
<prompt_request>
<metadata>
    <template>$TEMPLATE</template>
    <format>$FORMAT</format>
    <timestamp>$(date -u +"%Y-%m-%dT%H:%M:%SZ")</timestamp>
</metadata>

<task>
    <description>$TASK</description>
    <requirements>
$(for req in "${REQUIREMENTS[@]}"; do echo "        <requirement>$req</requirement>"; done)
    </requirements>
</task>

<template_content>
$(cat "$template_file")
</template_content>
</prompt_request>
EOF
}

# Interactive mode
run_interactive() {
    echo -e "${GREEN}Entering interactive mode...${NC}"
    
    # Get task
    echo -n "Enter task description: "
    read -r TASK

    # Get requirements
    REQUIREMENTS=()
    while true; do
        echo -n "Enter requirement (or 'done' to finish): "
        read -r req
        [[ "$req" == "done" ]] && break
        REQUIREMENTS+=("$req")
    done

    # Generate prompt
    generate_prompt
}

# Main execution
main() {
    # Parse command line arguments
    parse_args "$@"

    # Check for required arguments
    if [[ -z "$TASK" && "$INTERACTIVE" != true ]]; then
        echo -e "${RED}Error: Task description required${NC}"
        show_help
        exit 1
    fi

    # Run in appropriate mode
    if [[ "$INTERACTIVE" == true ]]; then
        run_interactive
    else
        generate_prompt
    fi
}

# Run main function
main "$@"
