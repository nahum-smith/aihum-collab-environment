#!/bin/bash

# Script to add a new knowledge base as a submodule
# Usage: ./add_kb.sh <repository-url> <kb-name>

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print with color
print_colored() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

# Check if required arguments are provided
if [ "$#" -ne 2 ]; then
    print_colored $RED "Error: Incorrect number of arguments"
    print_colored $YELLOW "Usage: ./add_kb.sh <repository-url> <kb-name>"
    print_colored $YELLOW "Example: ./add_kb.sh https://github.com/org/their-kb.git awesome-kb"
    exit 1
fi

REPO_URL=$1
KB_NAME=$2
TARGET_DIR="kb-network/external/${KB_NAME}"

# Check if the target directory already exists
if [ -d "$TARGET_DIR" ]; then
    print_colored $RED "Error: Knowledge base directory already exists: $TARGET_DIR"
    exit 1
fi

print_colored $GREEN "Adding knowledge base: $KB_NAME"
print_colored $GREEN "Repository: $REPO_URL"
print_colored $GREEN "Target directory: $TARGET_DIR"

# Create parent directory if it doesn't exist
mkdir -p kb-network/external

# Add the submodule
print_colored $YELLOW "Adding submodule..."
git submodule add $REPO_URL $TARGET_DIR

if [ $? -ne 0 ]; then
    print_colored $RED "Error: Failed to add submodule"
    exit 1
fi

# Initialize and update the submodule
print_colored $YELLOW "Initializing submodule..."
git submodule update --init --recursive

if [ $? -ne 0 ]; then
    print_colored $RED "Error: Failed to initialize submodule"
    exit 1
fi

# Stage changes
git add .

# Commit the changes
print_colored $YELLOW "Committing changes..."
git commit -m "Add knowledge base: $KB_NAME"

if [ $? -ne 0 ]; then
    print_colored $RED "Error: Failed to commit changes"
    exit 1
fi

print_colored $GREEN "Successfully added knowledge base: $KB_NAME"
print_colored $GREEN "You can now access it at: $TARGET_DIR"
