---
title: "authentication"
description: "Documentation for authentication"
category: "security"
tags: ["security", "documentation"]
machineReadable: true
version: "1.0"
lastUpdated: "2025-02-15"
searchPriority: "high"
relatedDocs: []
---

# Flowise Authentication

## Security Architecture
```mermaid
sequenceDiagram
    participant User
    participant Flowise
    participant AuthProvider
    
    User->>Flowise: Access Request
    Flowise->>AuthProvider: Redirect to OAuth
    AuthProvider-->>User: Login Prompt
    User->>AuthProvider: Credentials
    AuthProvider->>Flowise: JWT Token
    Flowise-->>User: Session Cookie
```

## Authentication Methods
1. **Basic Auth**  
   `npx flowise start --FLOWISE_USERNAME=admin --FLOWISE_PASSWORD=secret`

2. **OAuth 2.0**  
   Configure via environment variables:
   ```bash
   FLOWISE_OAUTH_CLIENT_ID=your_client_id
   FLOWISE_OAUTH_CLIENT_SECRET=your_secret
   ```

3. **API Keys**  
   Manage keys through UI:  
   ```mermaid
   flowchart LR
       A[Admin Dashboard] --> B[Generate Key]
       B --> C[Scopes: read/write/admin]
       C --> D[Store in Vault]
   ```
