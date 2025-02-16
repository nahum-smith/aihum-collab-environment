---
title: "Platform API Integration"
description: "Guide for integrating with Huly's Platform API"
category: "api"
tags: ["api", "integration", "platform", "automation"]
machineReadable: true
version: "1.0"
lastUpdated: "2025-02-16"
searchPriority: "high"
relatedDocs: [
    "docs/security/authentication.md",
    "docs/features/project-management.md"
]
---

# Huly Platform API Integration

## Overview

The Huly Platform API provides programmatic access to Huly's features through a Node.js package.

## Installation

```bash
npm install
```

## Authentication

There are two ways to connect to the Huly platform:

### Using Email and Password
```typescript
const client = await connect('https://huly.app', {
  email: 'your-email',
  password: 'your-password',
  workspace: 'aihum-collab'
})

// Don't forget to close the connection when done
await client.close()
```

### Using Token
```typescript
const client = await connect('https://huly.app', {
  token: 'your-token',
  workspace: 'aihum-collab'
})

// Don't forget to close the connection when done
await client.close()
```

## Common Operations

### Creating Tasks
```typescript
const task = await client.tasks.create({
  title: "Task Title",
  assignee: "user-id",
  priority: "high",
  labels: ["documentation", "review"],
  dueDate: "2025-02-23",
  description: "Task description"
})
```

### Managing Projects
```typescript
// List projects
const projects = await client.projects.list()

// Create project
const project = await client.projects.create({
  name: "New Project",
  description: "Project description"
})
```

### Working with Comments
```typescript
// Add comment to task
const comment = await client.tasks.addComment(taskId, {
  content: "Comment text"
})
```

## Best Practices

1. **Token Security**
   - Store tokens in environment variables
   - Never commit tokens to version control
   - Rotate tokens regularly

2. **Error Handling**
   ```typescript
   try {
     const task = await client.tasks.create(...)
   } catch (error) {
     if (error.status === 401) {
       // Handle authentication error
     }
   }
   ```

3. **Rate Limiting**
   - Implement exponential backoff
   - Cache responses when possible
   - Monitor API usage

## Integration Examples

### Task Automation
```typescript
async function createReviewTask(kb: string, assignee: string) {
  const task = await client.tasks.create({
    title: `Review ${kb} Knowledge Base`,
    assignee,
    priority: "high",
    labels: ["documentation", "review"],
    dueDate: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000).toISOString(),
    description: `Please review the newly added ${kb} knowledge base.`
  })
  return task
}
```

### Webhook Integration
```typescript
import express from 'express'
const app = express()

app.post('/huly/webhook', async (req, res) => {
  const { event, data } = req.body
  if (event === 'task.created') {
    await handleNewTask(data)
  }
  res.sendStatus(200)
})
```

## API Reference

Full API documentation is available at:
- [Huly API Reference](https://api.huly.io/docs)
- [Platform API Examples](https://github.com/hcengineering/huly-examples)
