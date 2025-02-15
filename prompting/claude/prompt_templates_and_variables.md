# Prompt Templates and Variables with Claude

Prompt templates are reusable structures that help maintain consistency and reduce redundancy in your prompts. This guide covers how to effectively use templates and variables with Claude.

## When to Use Templates

Templates are particularly useful when you:
1. Need to process multiple similar inputs
2. Want to maintain consistent prompt structure
3. Have repeatable tasks
4. Need to scale your prompting workflow
5. Want to reduce prompt engineering effort

## Template Structure

### Basic Template Format
```xml
<task>
[Task description]
</task>

<context>
[Background information]
{$VARIABLE1}
</context>

<instructions>
[Specific instructions]
Use the information in {$VARIABLE2} to...
</instructions>

<output_format>
[Expected output structure]
</output_format>
```

### Variable Syntax
- Use `{$VARIABLE_NAME}` for variables
- Place variables within appropriate XML tags
- Only define variables once, then reference without `{$}` syntax
- Use clear, descriptive variable names

## Best Practices

### 1. Clear Structure
```xml
<system>
You are a {$ROLE} with expertise in {$DOMAIN}.
Your task is to {$TASK_DESCRIPTION}.
</system>

<input>
{$USER_INPUT}
</input>

<output_format>
Please provide your response in the following format:
1. Analysis
2. Recommendations
3. Next Steps
</output_format>
```

### 2. Variable Placement
- Place variables where they naturally fit in the context
- Use consistent naming conventions
- Document expected variable types/formats
- Consider variable dependencies

### 3. Error Handling
```xml
<validation>
If {$INPUT} is not in the correct format:
1. Explain the error
2. Provide an example of correct format
3. Request corrected input
</validation>
```

### 4. Context Management
```xml
<context>
Domain: {$DOMAIN}
User Level: {$EXPERTISE_LEVEL}
Previous Interaction: {$HISTORY}
</context>

<memory>
Key Points to Remember:
- User preferences: {$PREFERENCES}
- Important constraints: {$CONSTRAINTS}
</memory>
```

## Example Templates

### 1. Code Review Template
```xml
<task>
Perform a code review for the following {$LANGUAGE} code.
</task>

<code>
{$CODE_SNIPPET}
</code>

<review_criteria>
1. Code quality
2. Performance
3. Security
4. Best practices for {$LANGUAGE}
</review_criteria>

<output_format>
Provide your review in the following sections:
1. Summary
2. Issues Found
3. Recommendations
4. Code Examples
</output_format>
```

### 2. Data Analysis Template
```xml
<task>
Analyze {$DATA_TYPE} data to {$ANALYSIS_GOAL}.
</task>

<data>
{$DATASET}
</data>

<analysis_requirements>
1. {$METRIC1}
2. {$METRIC2}
3. {$METRIC3}
</analysis_requirements>

<output_format>
1. Key Findings
2. Statistical Analysis
3. Visualizations
4. Recommendations
</output_format>
```

### 3. Content Generation Template
```xml
<task>
Create {$CONTENT_TYPE} content for {$TARGET_AUDIENCE}.
</task>

<parameters>
Topic: {$TOPIC}
Tone: {$TONE}
Length: {$LENGTH}
Key Points: {$KEY_POINTS}
</parameters>

<style_guide>
{$STYLE_REQUIREMENTS}
</style_guide>

<output_format>
{$DESIRED_FORMAT}
</output_format>
```

## Implementation Tips

1. **Variable Validation**
```xml
<validation>
For each variable, ensure:
- Required variables are present
- Format is correct
- Values are within expected ranges
</validation>
```

2. **Template Versioning**
```xml
<metadata>
Template Version: {$VERSION}
Last Updated: {$DATE}
Author: {$AUTHOR}
Changes: {$CHANGELOG}
</metadata>
```

3. **Documentation**
```xml
<documentation>
Required Variables:
- {$VAR1}: [description, format, example]
- {$VAR2}: [description, format, example]

Optional Variables:
- {$OPTIONAL_VAR1}: [description, format, example]
</documentation>
```

## Common Pitfalls to Avoid

1. **Overcomplication**
   - Keep templates simple and focused
   - Don't add unnecessary variables
   - Maintain clear structure

2. **Poor Variable Names**
   - Use descriptive names
   - Follow consistent naming conventions
   - Document variable purposes

3. **Missing Validation**
   - Validate variable presence
   - Check variable formats
   - Handle missing/invalid values

4. **Lack of Context**
   - Provide necessary background
   - Include relevant constraints
   - Specify expected outcomes

## Testing Templates

1. **Validation Testing**
```xml
<test_cases>
Case 1: {$TEST_INPUT_1} → {$EXPECTED_OUTPUT_1}
Case 2: {$TEST_INPUT_2} → {$EXPECTED_OUTPUT_2}
Case 3: {$TEST_INPUT_3} → {$EXPECTED_OUTPUT_3}
</test_cases>
```

2. **Edge Cases**
```xml
<edge_cases>
1. Empty input
2. Maximum length input
3. Special characters
4. Invalid formats
</edge_cases>
```

## Template Management

1. **Organization**
```
templates/
  ├── code/
  │   ├── review.xml
  │   └── generation.xml
  ├── analysis/
  │   ├── data.xml
  │   └── text.xml
  └── content/
      ├── article.xml
      └── report.xml
```

2. **Version Control**
- Track template changes
- Document modifications
- Maintain backwards compatibility

3. **Reusability**
- Create modular templates
- Share common components
- Maintain template library

## Resources

1. Anthropic's Documentation
2. Template Examples
3. Best Practices Guide
4. Variable Reference
