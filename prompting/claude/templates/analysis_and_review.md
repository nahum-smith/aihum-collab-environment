# Analysis and Review Templates

## Review Classifier

```xml
<task>
Analyze and classify the following review based on sentiment, key themes, and actionable feedback.
</task>

<review>
{$REVIEW_TEXT}
</review>

<classification_parameters>
Categories: {$CATEGORIES}
Sentiment Scale: {$SENTIMENT_SCALE}
Required Insights: {$REQUIRED_INSIGHTS}
</classification_parameters>

<output_format>
{
  "sentiment": {
    "score": "Numeric score",
    "label": "Sentiment category",
    "confidence": "Confidence level"
  },
  "themes": [
    {
      "category": "Theme category",
      "mentions": ["Relevant quotes"],
      "sentiment": "Theme-specific sentiment"
    }
  ],
  "actionable_feedback": [
    {
      "area": "Area for improvement",
      "suggestion": "Specific suggestion",
      "priority": "Priority level"
    }
  ],
  "summary": "Brief summary of key points"
}
</output_format>
```

## Ethical Dilemma Analyzer

```xml
<task>
Analyze the following ethical dilemma and provide a structured evaluation.
</task>

<dilemma>
{$DILEMMA_DESCRIPTION}
</dilemma>

<stakeholders>
{$STAKEHOLDER_LIST}
</stakeholders>

<considerations>
- Ethical principles involved
- Potential consequences
- Legal implications
- Stakeholder impacts
- Precedents
</considerations>

<output_format>
# Ethical Analysis

## Situation Overview
[Brief description of the dilemma]

## Stakeholder Analysis
[Impact on each stakeholder]

## Ethical Principles
[Relevant ethical principles]

## Options Analysis
[Possible courses of action]

## Recommendations
[Recommended approach with justification]

## Risk Mitigation
[Steps to minimize negative impacts]
</output_format>
```

## Perspective Analyzer

```xml
<task>
Analyze the following topic from multiple perspectives and viewpoints.
</task>

<topic>
{$TOPIC}
</topic>

<analysis_parameters>
Perspectives: {$PERSPECTIVE_LIST}
Depth: {$ANALYSIS_DEPTH}
Context: {$RELEVANT_CONTEXT}
</analysis_parameters>

<output_format>
# Multi-Perspective Analysis: {$TOPIC}

## Overview
[Topic introduction and context]

## Perspectives
[For each perspective]:
- Viewpoint summary
- Key arguments
- Supporting evidence
- Potential biases
- Limitations

## Common Ground
[Areas of agreement]

## Key Differences
[Major points of divergence]

## Synthesis
[Integrated analysis]

## Recommendations
[Balanced conclusions]
</output_format>
```

## Decision Analysis

```xml
<task>
Analyze the following decision scenario and provide structured recommendations.
</task>

<scenario>
{$DECISION_SCENARIO}
</scenario>

<parameters>
Objectives: {$OBJECTIVES}
Constraints: {$CONSTRAINTS}
Criteria: {$DECISION_CRITERIA}
Timeline: {$TIMELINE}
</parameters>

<output_format>
# Decision Analysis

## Scenario Overview
[Brief description]

## Options Analysis
[For each option]:
- Description
- Pros and cons
- Cost-benefit analysis
- Risk assessment
- Implementation considerations

## Evaluation Matrix
[Scored comparison against criteria]

## Recommendation
- Primary recommendation
- Rationale
- Implementation plan
- Risk mitigation

## Alternatives
[Backup options]
</output_format>
```
