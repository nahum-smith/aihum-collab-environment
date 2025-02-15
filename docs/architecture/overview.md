---
title: "overview"
description: "Documentation for overview"
category: "architecture"
tags: ["architecture", "documentation"]
machineReadable: true
version: "1.0"
lastUpdated: "2025-02-15"
searchPriority: "high"
relatedDocs: []
---

# Flowise Core Architecture

## System Components
```mermaid
graph TD
    A[Browser UI] --> B[Node Editor]
    B --> C[Flow Repository]
    B --> D[Execution Engine]
    D --> E[LLM Adapters]
    D --> F[API Gateways]
    E --> G[OpenAI]
    E --> H[HuggingFace]
    F --> I[Webhooks]
    F --> J[Database Connectors]
    C --> K[(PostgreSQL)]
    C --> L[(MongoDB)]
```

## Key Concepts
- **Nodes**: Modular components with typed inputs/outputs
- **Flows**: Directed acyclic graphs of connected nodes
- **Templates**: Reusable flow configurations
- **Triggers**: HTTP/webhook/scheduled starters
