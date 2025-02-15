# Prompt Chain Examples

This document provides concrete examples of implementing prompt chains for common use cases.

## 1. Technical Documentation Chain

```xml
<chain_example>
<input>
Create comprehensive API documentation for a payment processing endpoint
</input>

<step1_information_gathering>
<prompt>
Extract all technical details about this payment processing endpoint:
{$API_SPEC}

Focus on:
- Endpoint details (URL, method, headers)
- Request/response formats
- Authentication requirements
- Rate limits
- Error scenarios

Output as structured JSON.
</prompt>

<example_output>
{
  "endpoint": {
    "url": "/api/v1/payments",
    "method": "POST",
    "headers": {
      "Authorization": "Bearer {token}",
      "Content-Type": "application/json"
    }
  },
  "request": {
    "body": {
      "amount": "number",
      "currency": "string",
      "description": "string",
      "customer_id": "string"
    }
  },
  "response": {
    "success": {
      "transaction_id": "string",
      "status": "string",
      "timestamp": "string"
    }
  },
  "errors": [
    {
      "code": "INVALID_AMOUNT",
      "message": "Invalid payment amount"
    }
  ],
  "rate_limits": {
    "requests_per_minute": 60
  }
}
</example_output>
</step1_information_gathering>

<step2_draft_documentation>
<prompt>
Create initial documentation draft using this technical information:
{$TECHNICAL_DETAILS}

Format using markdown with these sections:
1. Overview
2. Authentication
3. Request Format
4. Response Format
5. Error Handling
6. Rate Limits
7. Examples

Include code samples for common scenarios.
</prompt>

<example_output>
# Payment Processing API

## Overview
The Payment Processing API allows you to create and process payments securely...

## Authentication
All requests must include a Bearer token in the Authorization header...

[Additional sections...]
</example_output>
</step2_draft_documentation>

<step3_example_generation>
<prompt>
Generate comprehensive examples for this API endpoint:
{$API_DOCS}

Create examples for:
1. Successful payment
2. Invalid amount
3. Authentication error
4. Rate limit exceeded

Use multiple programming languages:
- curl
- Python
- Node.js
</prompt>

<example_output>
## Examples

### Successful Payment

#### curl
```bash
curl -X POST https://api.example.com/v1/payments \
  -H "Authorization: Bearer your_token" \
  -H "Content-Type: application/json" \
  -d '{
    "amount": 1000,
    "currency": "USD",
    "description": "Test payment",
    "customer_id": "cust_123"
  }'
```

[Additional examples...]
</example_output>
</step3_example_generation>

<step4_final_polish>
<prompt>
Review and enhance this documentation:
{$DRAFT_DOCS}

Improve:
1. Clarity and readability
2. Technical accuracy
3. Completeness
4. Formatting consistency

Add:
1. Table of contents
2. Quick start guide
3. Best practices section
4. Troubleshooting guide
</prompt>
</step4_final_polish>
</chain_example>
```

## 2. Code Review Chain

```xml
<chain_example>
<input>
Review a Python web service implementation
</input>

<step1_static_analysis>
<prompt>
Perform static analysis on this Python code:
{$CODE}

Check for:
1. Code style (PEP 8)
2. Common anti-patterns
3. Complexity metrics
4. Documentation coverage

Output findings in JSON format.
</prompt>

<example_output>
{
  "style_issues": [
    {
      "line": 45,
      "issue": "Line too long (92 characters)",
      "severity": "low"
    }
  ],
  "anti_patterns": [
    {
      "pattern": "Global state usage",
      "locations": ["config.py:23", "service.py:12"],
      "severity": "medium"
    }
  ],
  "complexity": {
    "cyclomatic": 12,
    "cognitive": 15,
    "maintainability_index": 65
  },
  "documentation": {
    "coverage": "70%",
    "missing_docstrings": ["UserService.validate", "PaymentHandler.process"]
  }
}
</example_output>
</step1_static_analysis>

<step2_security_review>
<prompt>
Analyze this Python web service for security issues:
{$CODE}
{$STATIC_ANALYSIS}

Focus on:
1. Input validation
2. Authentication/Authorization
3. Data encryption
4. Dependency vulnerabilities
5. Secure configuration

Output findings in JSON format.
</prompt>

<example_output>
{
  "vulnerabilities": [
    {
      "type": "SQL Injection",
      "location": "user_dao.py:56",
      "severity": "high",
      "description": "Raw SQL query with string formatting",
      "recommendation": "Use parameterized queries"
    }
  ],
  "security_config": {
    "issues": [
      {
        "type": "Insecure Cookie Settings",
        "location": "app.py:34",
        "recommendation": "Set secure and httponly flags"
      }
    ]
  }
}
</example_output>
</step2_security_review>

<step3_performance_review>
<prompt>
Analyze performance implications of this code:
{$CODE}
{$STATIC_ANALYSIS}
{$SECURITY_REVIEW}

Check for:
1. Database query optimization
2. Caching opportunities
3. Resource usage
4. Concurrency issues
5. Memory management

Output findings in JSON format.
</prompt>

<example_output>
{
  "database": {
    "issues": [
      {
        "type": "N+1 Query",
        "location": "user_service.py:78",
        "impact": "high",
        "recommendation": "Use join query"
      }
    ]
  },
  "caching": {
    "opportunities": [
      {
        "endpoint": "/api/users",
        "type": "Response caching",
        "estimated_impact": "25% reduction in DB load"
      }
    ]
  }
}
</example_output>
</step3_performance_review>

<step4_review_summary>
<prompt>
Generate a comprehensive review summary:
{$STATIC_ANALYSIS}
{$SECURITY_REVIEW}
{$PERFORMANCE_REVIEW}

Include:
1. Executive summary
2. Critical issues
3. Recommendations
4. Detailed findings
5. Action items

Format as markdown with priority labels.
</prompt>

<example_output>
# Code Review Summary

## Executive Summary
The review identified several critical issues requiring immediate attention...

## Critical Issues
🔴 SQL Injection vulnerability in user_dao.py
🔴 N+1 query pattern in user listing
🟡 Missing input validation in payment processing
...

[Additional sections...]
</example_output>
</step4_review_summary>
</chain_example>
```

## 3. Data Analysis Chain

```xml
<chain_example>
<input>
Analyze customer transaction data for fraud patterns
</input>

<step1_data_validation>
<prompt>
Validate this transaction dataset:
{$TRANSACTION_DATA}

Check for:
1. Data completeness
2. Format consistency
3. Value ranges
4. Duplicates
5. Anomalies

Output validation report in JSON format.
</prompt>

<example_output>
{
  "validation_summary": {
    "total_records": 10000,
    "valid_records": 9850,
    "invalid_records": 150
  },
  "issues": [
    {
      "type": "missing_values",
      "field": "transaction_time",
      "count": 23,
      "rows": [45, 67, 89]
    },
    {
      "type": "invalid_amount",
      "description": "Negative amounts",
      "count": 12,
      "rows": [123, 456]
    }
  ]
}
</example_output>
</step1_data_validation>

<step2_pattern_analysis>
<prompt>
Analyze transaction patterns in this validated dataset:
{$CLEANED_DATA}

Look for:
1. Unusual amount patterns
2. Frequency anomalies
3. Geographic patterns
4. Time-based patterns
5. User behavior patterns

Output analysis in JSON format.
</prompt>

<example_output>
{
  "amount_patterns": {
    "suspicious_ranges": [
      {
        "range": "999-1001",
        "frequency": 145,
        "significance": "Just below reporting threshold"
      }
    ]
  },
  "time_patterns": {
    "unusual_hours": [
      {
        "hour": "3-4 AM",
        "volume_increase": "300%"
      }
    ]
  }
}
</example_output>
</step2_pattern_analysis>

<step3_fraud_detection>
<prompt>
Identify potential fraud indicators:
{$PATTERN_ANALYSIS}

Apply these rules:
1. Velocity checks
2. Amount pattern matching
3. Location-based rules
4. User history analysis
5. Network analysis

Output findings in JSON format.
</prompt>

<example_output>
{
  "high_risk_transactions": [
    {
      "transaction_id": "tx_123",
      "risk_score": 0.89,
      "indicators": [
        "unusual_hour",
        "amount_pattern",
        "velocity"
      ]
    }
  ],
  "risk_patterns": {
    "velocity": {
      "threshold": "5 per hour",
      "violations": 23
    }
  }
}
</example_output>
</step3_fraud_detection>

<step4_report_generation>
<prompt>
Generate a comprehensive fraud analysis report:
{$VALIDATION_RESULTS}
{$PATTERN_ANALYSIS}
{$FRAUD_INDICATORS}

Include:
1. Executive summary
2. Key findings
3. Risk patterns
4. Recommendations
5. Detailed analysis

Format as markdown with visualizations.
</prompt>

<example_output>
# Fraud Analysis Report

## Executive Summary
Analysis of 10,000 transactions revealed several concerning patterns...

## Key Findings
1. Suspicious amount clustering around reporting thresholds
2. Unusual temporal patterns in early morning hours
3. Velocity violations in specific geographic regions

[Additional sections...]
</example_output>
</step4_report_generation>
</chain_example>
```

Each example demonstrates:
- Clear chain structure
- Specific prompts for each step
- Example inputs and outputs
- Error handling considerations
- Quality checks between steps
- Clear output formats

These examples can be adapted for similar use cases by modifying the specific requirements and validation criteria while maintaining the overall chain structure.
