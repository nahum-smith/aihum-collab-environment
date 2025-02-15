# Prompt Chain Templates

## Content Generation Chain

```xml
<chain_name>Content Generation and Refinement</chain_name>
<purpose>Generate high-quality content through multiple refinement stages</purpose>

<step1_initial_draft>
<task>Generate initial content draft</task>
<input>
Topic: {$TOPIC}
Audience: {$AUDIENCE}
Style: {$STYLE}
Length: {$LENGTH}
Key Points: {$KEY_POINTS}
</input>
<output_format>
Structured content with sections and headings
</output_format>
</step1_initial_draft>

<step2_content_improvement>
<task>Improve content quality and style</task>
<input>
Content: {$INITIAL_DRAFT}
Style Guide: {$STYLE_GUIDE}
Improvement Areas:
- Clarity
- Engagement
- Flow
- Technical accuracy
</input>
<output_format>
Improved content with change explanations
</output_format>
</step2_content_improvement>

<step3_fact_checking>
<task>Verify technical accuracy and add citations</task>
<input>
Content: {$IMPROVED_CONTENT}
Reference Materials: {$REFERENCES}
Verification Points: {$VERIFICATION_CHECKLIST}
</input>
<output_format>
Verified content with citations and fact-check notes
</output_format>
</step3_fact_checking>

<step4_final_polish>
<task>Polish and format for final delivery</task>
<input>
Content: {$VERIFIED_CONTENT}
Formatting Requirements: {$FORMAT_SPECS}
Final Checklist: {$FINAL_CHECKLIST}
</input>
<output_format>
Publication-ready content with formatting
</output_format>
</step4_final_polish>
```

## Code Review Chain

```xml
<chain_name>Comprehensive Code Review</chain_name>
<purpose>Perform thorough code review through multiple specialized stages</purpose>

<step1_static_analysis>
<task>Perform static code analysis</task>
<input>
Code: {$CODE}
Language: {$LANGUAGE}
Style Guide: {$STYLE_GUIDE}
</input>
<output_format>
{
  "style_issues": [],
  "potential_bugs": [],
  "complexity_metrics": {},
  "documentation_issues": []
}
</output_format>
</step1_static_analysis>

<step2_security_review>
<task>Identify security vulnerabilities</task>
<input>
Code: {$CODE}
Static Analysis Results: {$STATIC_ANALYSIS}
Security Checklist: {$SECURITY_CHECKLIST}
</input>
<output_format>
{
  "vulnerabilities": [],
  "security_risks": [],
  "recommended_fixes": []
}
</output_format>
</step2_security_review>

<step3_performance_analysis>
<task>Analyze performance implications</task>
<input>
Code: {$CODE}
Security Review: {$SECURITY_REVIEW}
Performance Criteria: {$PERFORMANCE_CRITERIA}
</input>
<output_format>
{
  "performance_issues": [],
  "optimization_opportunities": [],
  "complexity_analysis": {}
}
</output_format>
</step3_performance_analysis>

<step4_review_summary>
<task>Generate comprehensive review summary</task>
<input>
Static Analysis: {$STATIC_ANALYSIS}
Security Review: {$SECURITY_REVIEW}
Performance Analysis: {$PERFORMANCE_ANALYSIS}
</input>
<output_format>
# Code Review Summary

## Overview
[Summary of findings]

## Critical Issues
[List of critical issues]

## Recommendations
[Prioritized recommendations]

## Detailed Findings
[Categorized findings]
</output_format>
</step4_review_summary>
```

## Data Analysis Chain

```xml
<chain_name>Data Analysis Pipeline</chain_name>
<purpose>Process and analyze data through multiple stages</purpose>

<step1_data_validation>
<task>Validate and clean input data</task>
<input>
Data: {$RAW_DATA}
Schema: {$DATA_SCHEMA}
Validation Rules: {$VALIDATION_RULES}
</input>
<output_format>
{
  "cleaned_data": {},
  "validation_issues": [],
  "data_quality_metrics": {}
}
</output_format>
</step1_data_validation>

<step2_exploratory_analysis>
<task>Perform exploratory data analysis</task>
<input>
Data: {$CLEANED_DATA}
Analysis Requirements: {$ANALYSIS_REQUIREMENTS}
Metrics: {$REQUIRED_METRICS}
</input>
<output_format>
{
  "summary_statistics": {},
  "patterns": [],
  "correlations": [],
  "anomalies": []
}
</output_format>
</step2_exploratory_analysis>

<step3_detailed_analysis>
<task>Conduct detailed statistical analysis</task>
<input>
Data: {$CLEANED_DATA}
EDA Results: {$EDA_RESULTS}
Analysis Goals: {$ANALYSIS_GOALS}
</input>
<output_format>
{
  "statistical_tests": [],
  "model_results": {},
  "insights": []
}
</output_format>
</step3_detailed_analysis>

<step4_insights_generation>
<task>Generate actionable insights and visualizations</task>
<input>
Analysis Results: {$ANALYSIS_RESULTS}
Business Context: {$BUSINESS_CONTEXT}
Stakeholder Requirements: {$STAKEHOLDER_REQUIREMENTS}
</input>
<output_format>
# Analysis Report

## Executive Summary
[Key findings]

## Detailed Analysis
[Analysis details]

## Visualizations
[Key visualizations]

## Recommendations
[Data-driven recommendations]
</output_format>
</step4_insights_generation>
```

## Document Processing Chain

```xml
<chain_name>Document Processing and Analysis</chain_name>
<purpose>Process and analyze complex documents through multiple stages</purpose>

<step1_text_extraction>
<task>Extract and clean text from document</task>
<input>
Document: {$DOCUMENT}
Format: {$DOCUMENT_FORMAT}
Extraction Rules: {$EXTRACTION_RULES}
</input>
<output_format>
{
  "extracted_text": "",
  "metadata": {},
  "structure": {}
}
</output_format>
</step1_text_extraction>

<step2_content_analysis>
<task>Analyze document content and structure</task>
<input>
Text: {$EXTRACTED_TEXT}
Analysis Requirements: {$ANALYSIS_REQUIREMENTS}
</input>
<output_format>
{
  "topics": [],
  "key_points": [],
  "entities": [],
  "sentiment": {},
  "structure_analysis": {}
}
</output_format>
</step2_content_analysis>

<step3_insight_extraction>
<task>Extract insights and relationships</task>
<input>
Content Analysis: {$CONTENT_ANALYSIS}
Insight Requirements: {$INSIGHT_REQUIREMENTS}
</input>
<output_format>
{
  "key_insights": [],
  "relationships": [],
  "patterns": [],
  "implications": []
}
</output_format>
</step3_insight_extraction>

<step4_summary_generation>
<task>Generate comprehensive document summary</task>
<input>
Document Analysis: {$DOCUMENT_ANALYSIS}
Insights: {$EXTRACTED_INSIGHTS}
Summary Requirements: {$SUMMARY_REQUIREMENTS}
</input>
<output_format>
# Document Analysis Summary

## Overview
[Document summary]

## Key Findings
[Major findings]

## Detailed Analysis
[Analysis by section]

## Recommendations
[Action items and recommendations]
</output_format>
</step4_summary_generation>
```
