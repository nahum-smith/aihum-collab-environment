# Data Analysis Templates

## Data Organizer

```xml
<task>
Analyze and organize the following data into a clear, structured format.
</task>

<data>
{$RAW_DATA}
</data>

<requirements>
Format: {$OUTPUT_FORMAT} // e.g., JSON, Table, CSV
Categories: {$CATEGORIES} // Optional grouping categories
Metrics: {$METRICS} // Optional metrics to calculate
</requirements>

<output_format>
1. Data Summary
2. Organized Data
3. Key Insights (if applicable)
4. Visualizations (if requested)
</output_format>
```

## SQL Query Generator

```xml
<task>
Generate SQL queries based on the following requirements.
</task>

<database_schema>
{$SCHEMA_DEFINITION}
</database_schema>

<query_requirements>
Purpose: {$QUERY_PURPOSE}
Tables: {$TABLES}
Conditions: {$CONDITIONS}
Output: {$DESIRED_OUTPUT}
</query_requirements>

<output_format>
```sql
[Generated SQL query]
```

Explanation:
1. Query purpose
2. Tables used and their relationships
3. Conditions and filters
4. Expected results
5. Performance considerations
</output_format>
```

## Report Generator

```xml
<task>
Generate a detailed report analyzing {$DATA_TYPE} data for {$TIME_PERIOD}.
</task>

<data_source>
{$DATA_SOURCE}
</data_source>

<report_parameters>
Metrics: {$METRICS}
Grouping: {$GROUPING}
Comparisons: {$COMPARISONS}
Format: {$OUTPUT_FORMAT}
</report_parameters>

<output_format>
# {$REPORT_TITLE}
Generated: {$TIMESTAMP}

## Executive Summary
[Key findings and highlights]

## Detailed Analysis
[Breakdown by metrics and groups]

## Trends and Patterns
[Identified trends and patterns]

## Recommendations
[Data-driven recommendations]

## Methodology
[Data sources and analysis methods]
</output_format>
```

## Efficiency Analyzer

```xml
<task>
Analyze the efficiency and performance of the following process or system.
</task>

<process_details>
{$PROCESS_DESCRIPTION}
Current Metrics: {$CURRENT_METRICS}
Goals: {$PERFORMANCE_GOALS}
Constraints: {$CONSTRAINTS}
</process_details>

<analysis_requirements>
- Performance bottlenecks
- Resource utilization
- Optimization opportunities
- Cost implications
- Implementation complexity
</analysis_requirements>

<output_format>
{
  "current_state": {
    "metrics": {},
    "bottlenecks": [],
    "resource_usage": {}
  },
  "optimization_opportunities": [
    {
      "area": "Area of improvement",
      "impact": "Expected impact",
      "effort": "Implementation effort",
      "recommendation": "Specific recommendation"
    }
  ],
  "implementation_plan": {
    "short_term": [],
    "medium_term": [],
    "long_term": []
  },
  "cost_benefit_analysis": {}
}
</output_format>
```
