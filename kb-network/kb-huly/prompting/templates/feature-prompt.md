---
title: "Feature Documentation Prompt"
description: "Template for generating feature documentation"
type: "prompt"
version: "1.0"
lastUpdated: "2025-02-16"
---

# Feature Documentation Generation Prompt

## Context
You are documenting a feature for the Huly platform. The documentation should be both human-readable and machine-processable.

## Requirements
1. Include frontmatter metadata
2. Use mermaid diagrams
3. Provide code examples
4. Link related documents

## Template Structure

### Frontmatter
```yaml
---
title: "${FEATURE_NAME}"
description: "${FEATURE_DESCRIPTION}"
category: "features"
tags: ${TAGS_ARRAY}
machineReadable: true
version: "${VERSION}"
lastUpdated: "${DATE}"
---
```

### Content Sections
1. Overview
2. Architecture (with mermaid)
3. Components
4. Configuration
5. Usage Examples
6. Best Practices
7. Troubleshooting
8. Related Documentation

## Example Usage
```bash
/prompt feature "Task Management" "Core task tracking functionality" '["tasks", "management"]'
```

## Validation Rules
1. All required frontmatter fields must be present
2. Mermaid diagrams must be valid
3. Code examples must be properly formatted
4. Links must point to existing documents
