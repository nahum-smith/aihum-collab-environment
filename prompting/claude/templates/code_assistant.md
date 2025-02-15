# Code Assistant Templates

## Code Clarifier

```xml
<task>
Analyze and explain the following code in a clear, detailed manner.
</task>

<code>
{$CODE_BLOCK}
</code>

<requirements>
- Explain the purpose and functionality
- Break down complex logic
- Highlight important patterns or techniques
- Note potential issues or improvements
- Include examples where helpful
</requirements>

<output_format>
1. Overview
2. Detailed Breakdown
3. Key Patterns & Techniques
4. Potential Improvements
5. Usage Examples (if applicable)
</output_format>
```

## Code Consultant

```xml
<task>
Review the following code and provide comprehensive feedback and improvements.
</task>

<code>
{$CODE_BLOCK}
</code>

<review_focus>
- Code quality and best practices
- Performance optimization
- Security considerations
- Error handling
- Documentation
- Testing suggestions
</review_focus>

<output_format>
{
  "summary": "Brief overview of the code",
  "strengths": ["List of positive aspects"],
  "improvements": [
    {
      "category": "Category of improvement",
      "issue": "Description of the issue",
      "suggestion": "Specific improvement suggestion",
      "example": "Code example if applicable"
    }
  ],
  "security_considerations": ["List of security notes"],
  "testing_recommendations": ["List of testing suggestions"]
}
</output_format>
```

## Bug Buster

```xml
<task>
Debug the following code and identify the root cause of issues.
</task>

<code>
{$CODE_BLOCK}
</code>

<error_info>
{$ERROR_MESSAGE} // Optional
{$EXPECTED_BEHAVIOR}
{$ACTUAL_BEHAVIOR}
</error_info>

<debug_requirements>
- Identify the root cause
- Explain the issue in detail
- Provide a solution
- Suggest preventive measures
</debug_requirements>

<output_format>
{
  "root_cause": "Description of the fundamental issue",
  "explanation": "Detailed explanation of why the bug occurs",
  "solution": {
    "fix": "Code fix",
    "explanation": "Why this fixes the issue"
  },
  "prevention": [
    "Steps to prevent similar issues"
  ]
}
</output_format>
```

## Function Generator

```xml
<task>
Generate a function based on the following requirements.
</task>

<requirements>
Purpose: {$PURPOSE}
Input Parameters: {$PARAMETERS}
Expected Output: {$OUTPUT}
Language: {$LANGUAGE}
Additional Requirements: {$REQUIREMENTS}
</requirements>

<style_guide>
- Clear and descriptive naming
- Comprehensive documentation
- Proper error handling
- Input validation
- Efficient implementation
</style_guide>

<output_format>
```{$LANGUAGE}
[Generated function with documentation]
```

Explanation:
1. Function overview
2. Parameter details
3. Return value details
4. Error handling approach
5. Usage examples
</output_format>
```
