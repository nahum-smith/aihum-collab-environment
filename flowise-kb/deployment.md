# Flowise Deployment Options

## Installation Methods
```mermaid
flowchart LR
    A[Installation Type] --> B{Local Node.js}
    A --> C{Docker}
    A --> D{Cloud}
    
    B --> E[Quick Start]
    C --> F[Production Ready]
    D --> G[Managed Service]
```

| Method | Requirements | Command | Auth Setup |
|--------|--------------|---------|------------|
| Node.js | Node 18+ | `npx flowise start` | ENV variables |
| Docker | Docker | `docker-compose up -d` | Image security |
| Cloud | Subscription | Browser login | OAuth/SAML |
