---
title: "Script Integration Guide"
description: "Guide for using kb-network scripts with Huly documentation"
category: "guides"
tags: ["scripts", "integration", "tools"]
machineReadable: true
version: "1.0"
lastUpdated: "2025-02-16"
---

# Script Integration Guide

## Overview

This guide explains how to use kb-network scripts with the Huly knowledge base.

## Available Scripts

### 1. prompt-gen.sh
Generate structured documentation prompts:

```bash
# Generate feature documentation
./prompt-gen.sh -t feature "Task Management" "Core task tracking"

# Generate API documentation
./prompt-gen.sh -t api "REST API" "Include authentication"
```

### 2. add_kb.sh
Manage knowledge base additions:

```bash
# Add a new section
./add_kb.sh features/new-feature

# Link external knowledge base
./add_kb.sh https://github.com/org/kb.git external-kb
```

### 3. inject_note.sh
Add notes to documentation:

```bash
# Add implementation note
./inject_note.sh implementation "Consider rate limiting"

# Add security note
./inject_note.sh security "Requires authentication"
```

## Integration Points

### With Documentation
1. Template usage
2. Validation rules
3. Version control
4. Cross-linking

### With Cascade
1. Prompt generation
2. Documentation updates
3. Knowledge sharing
4. Version management

## Best Practices

### Script Usage
1. Make executable
2. Use absolute paths
3. Follow templates
4. Validate output

### Documentation Flow
1. Generate structure
2. Add content
3. Validate
4. Update index

## Troubleshooting

### Common Issues
1. Permission errors
2. Template issues
3. Validation failures
4. Link problems

### Solutions
1. Check permissions
2. Verify templates
3. Run validation
4. Update links

## Related Documentation
- [Contributing Guide](../../CONTRIBUTING.md)
- [Templates](../../templates/README.md)
- [Validation Rules](../../metadata/schemas/validation.json)
