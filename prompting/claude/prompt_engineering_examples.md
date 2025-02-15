# Claude Prompt Engineering Examples

This document provides practical examples of effective prompt patterns for different use cases, demonstrating the best practices outlined in our guide.

## 1. Clear and Direct Prompting

### Bad Example
```
Can you help me analyze this code?
```

### Good Example
```
Please analyze this Python code for:
1. Potential performance bottlenecks
2. Security vulnerabilities
3. Code style issues
4. Opportunities for optimization

Format your response with clear headings for each category and include specific line numbers in your recommendations.
```

## 2. Using Examples (Multishot)

### Task: Generating Consistent Bug Reports

```
I need you to analyze bug reports and format them consistently. Here are two examples of the desired format:

<example>
Bug ID: AUTH-123
Severity: High
Component: Authentication Service
Description: Users unable to log in after password reset
Steps to Reproduce:
1. Request password reset
2. Click reset link in email
3. Set new password
4. Attempt to log in
Expected: Successful login with new password
Actual: Server returns 403 Forbidden
Impact: Critical user journey blocked
</example>

<example>
Bug ID: UI-456
Severity: Medium
Component: Dashboard
Description: Loading spinner never disappears on slow connections
Steps to Reproduce:
1. Throttle network speed to 3G
2. Navigate to dashboard
3. Wait for load completion
Expected: Spinner disappears after load
Actual: Spinner remains indefinitely
Impact: Poor user experience on slow connections
</example>

Please format the following bug report in the same style:
[User's bug report goes here]
```

## 3. Chain of Thought

### Task: Code Review

```
You are a senior software engineer conducting a code review. Think through each step of your analysis carefully.

<review_process>
1. First, understand the overall purpose and context of the code
2. Analyze the code's structure and organization
3. Identify potential issues in:
   - Logic
   - Performance
   - Security
   - Maintainability
4. Consider edge cases and potential failures
5. Suggest specific improvements
</review_process>

Please review this code following the above process. For each step, explain your thinking before moving to the next step.
```

## 4. XML Structure

### Task: Technical Documentation

```
<task>
Generate comprehensive API documentation for a REST endpoint.

<requirements>
- Include all standard HTTP methods
- Document request/response formats
- List all possible status codes
- Provide example requests and responses
</requirements>

<format>
Use the following structure for each endpoint:
1. Endpoint Overview
2. HTTP Methods
3. Request Format
4. Response Format
5. Status Codes
6. Examples
</format>

<style_guide>
- Use clear, concise language
- Include code blocks for all examples
- Mark required fields with *
- Include data types for all fields
</style_guide>
</task>
```

## 5. Role Definition

### Task: Security Audit

```
<system>You are a senior security auditor with expertise in web application security, penetration testing, and OWASP Top 10 vulnerabilities. Your role is to:
1. Thoroughly analyze code for security vulnerabilities
2. Assess the severity of each finding
3. Provide detailed remediation steps
4. Consider compliance requirements (GDPR, HIPAA, etc.)
5. Prioritize findings based on risk level
</system>

Please conduct a security audit of the following code, focusing particularly on:
1. Input validation
2. Authentication mechanisms
3. Data protection
4. Session management
```

## 6. Output Control

### Task: JSON Response

```
Analyze this text and provide a structured response in the following JSON format:

{
  "sentiment": {
    "score": <number between -1 and 1>,
    "label": <"positive", "negative", or "neutral">,
    "confidence": <number between 0 and 1>
  },
  "key_topics": [
    {
      "topic": <topic name>,
      "relevance": <number between 0 and 1>
    }
  ],
  "summary": <brief text summary>,
  "entities": [
    {
      "name": <entity name>,
      "type": <entity type>,
      "mentions": <number of mentions>
    }
  ]
}
```

## 7. Complex Task Chaining

### Task: Code Migration

```
Let's break down this code migration task into steps. After each step, I'll provide the output for you to use in the next step.

<step_1>
First, analyze the current code structure and identify all dependencies. List them in order of importance.
</step_1>

<step_2>
Using the dependency list, create a migration plan that minimizes service disruption. Include:
- Order of component migration
- Required temporary compatibility layers
- Testing points
</step_2>

<step_3>
Based on the migration plan, generate the necessary refactoring steps for each component.
</step_3>

<step_4>
Create a rollback plan for each migration step.
</step_4>

Let's start with step 1. Please analyze the following code:
[code goes here]
```

## Best Practices for Different Tasks

### Data Analysis
```
<task>Analyze this dataset for key insights</task>

<requirements>
1. Identify major trends
2. Highlight anomalies
3. Calculate key statistics
4. Generate visualizations
</requirements>

<output_format>
1. Executive Summary (2-3 sentences)
2. Key Findings (bullet points)
3. Detailed Analysis (by category)
4. Recommendations
5. Methodology
</output_format>

<data>
[dataset goes here]
</data>
```

### Code Generation
```
<task>Generate a Python function according to these specifications</task>

<requirements>
- Input: List of dictionaries containing user records
- Output: Filtered and transformed records
- Performance: O(n) time complexity
- Error Handling: Include input validation
</requirements>

<style_guide>
- Follow PEP 8
- Include type hints
- Add docstring with examples
- Include unit tests
</style_guide>

<additional_context>
This function will be used in a high-traffic API endpoint
</additional_context>
```

These examples demonstrate how to apply the best practices in real-world scenarios. Each example shows how to structure prompts for clarity, specificity, and effective task completion.
