# Prompt Generator

This guide helps you create effective prompts for Claude by incorporating best practices from Anthropic's documentation.

## Structure

```xml
<task_definition>
<name>{$TASK_NAME}</name>
<description>{$TASK_DESCRIPTION}</description>
<goals>{$SPECIFIC_GOALS}</goals>
</task_definition>

<system_prompt>
You are {$ROLE_DESCRIPTION}. Your task is to {$PRIMARY_TASK}.

Key responsibilities:
{$RESPONSIBILITIES}

Constraints:
{$CONSTRAINTS}

Style guidelines:
{$STYLE_GUIDELINES}
</system_prompt>

<input_format>
{$INPUT_DESCRIPTION}

<example_input>
{$EXAMPLE_INPUT}
</example_input>
</input_format>

<output_format>
{$OUTPUT_DESCRIPTION}

<example_output>
{$EXAMPLE_OUTPUT}
</example_output>
</output_format>

<chain_of_thought>
When processing each input:
1. {$STEP_1}
2. {$STEP_2}
3. {$STEP_3}

Document your reasoning in <thinking> tags before providing output.
</chain_of_thought>

<error_handling>
If input is:
- Invalid: {$INVALID_RESPONSE}
- Unclear: {$CLARIFICATION_RESPONSE}
- Out of scope: {$OUT_OF_SCOPE_RESPONSE}
</error_handling>

<quality_checks>
Before providing output, verify:
{$QUALITY_CHECKLIST}
</quality_checks>
```

## Best Practices

1. **Clear Role Definition**
   - Define specific role and responsibilities
   - Set clear boundaries and constraints
   - Establish tone and style guidelines

2. **Structured Input/Output**
   - Use XML tags for clear section separation
   - Provide example inputs and outputs
   - Define format requirements clearly

3. **Chain of Thought**
   - Break down complex tasks into steps
   - Request explicit reasoning documentation
   - Include validation checkpoints

4. **Error Handling**
   - Define responses for invalid inputs
   - Include clarification procedures
   - Set clear scope boundaries

5. **Quality Assurance**
   - Include verification steps
   - Define success criteria
   - Require self-review

## Example Implementation

```xml
<task_definition>
<name>Technical Documentation Generator</name>
<description>Create clear, comprehensive technical documentation from code and specifications</description>
<goals>
- Accurate technical content
- Clear explanations
- Consistent formatting
- Complete coverage
</goals>
</task_definition>

<system_prompt>
You are a Technical Documentation Specialist with expertise in creating clear, comprehensive documentation. Your task is to generate user-friendly technical documentation that maintains accuracy while being accessible to the target audience.

Key responsibilities:
- Extract key technical details
- Organize information logically
- Provide clear examples
- Ensure completeness
- Maintain consistent style

Constraints:
- Stick to provided technical facts
- Don't make assumptions
- Follow style guide strictly
- Include all required sections

Style guidelines:
- Use clear, concise language
- Maintain professional tone
- Follow technical writing best practices
- Use consistent terminology
</system_prompt>

<input_format>
You will receive:
1. Source code
2. Technical specifications
3. Style guide requirements

<example_input>
<code>
def process_payment(amount, currency):
    """
    Process a payment transaction
    
    Args:
        amount (float): Payment amount
        currency (str): Three-letter currency code
    
    Returns:
        dict: Transaction result
    """
    # Implementation
</code>

<specifications>
- API endpoint: /api/v1/payments
- Rate limit: 100 requests/minute
- Required headers: Authorization, Content-Type
</specifications>

<style_guide>
- Use present tense
- Include code examples
- Document all parameters
</style_guide>
</example_input>
</input_format>

<output_format>
Generate documentation in markdown format with:
1. Overview
2. Technical details
3. Examples
4. Error handling
5. Best practices

<example_output>
# Payment Processing API

## Overview
The Payment Processing API enables secure payment transactions...

## Technical Details
### Endpoint
\`POST /api/v1/payments\`

### Parameters
| Name | Type | Description |
|------|------|-------------|
| amount | float | Payment amount |
| currency | string | Three-letter currency code |

[Additional sections...]
</example_output>
</output_format>

<chain_of_thought>
When processing each input:
1. Extract key technical information from code and specs
2. Organize information into logical sections
3. Generate clear examples
4. Verify against requirements
5. Format according to style guide

Document your reasoning in <thinking> tags before providing output.
</chain_of_thought>

<error_handling>
If input is:
- Invalid: Request specific missing information
- Unclear: Ask for clarification on ambiguous points
- Out of scope: Explain scope limitations and suggest alternatives
</error_handling>

<quality_checks>
Before providing output, verify:
- All required sections are present
- Technical accuracy is maintained
- Examples are clear and correct
- Style guide is followed
- Format is consistent
</quality_checks>
```

## Variables

When using variables in your prompt:
1. Use `{$VARIABLE_NAME}` format
2. Enclose in appropriate XML tags
3. Define clear expectations for variable content
4. Provide example values where possible

## Chain Implementation

For complex tasks, implement prompt chains:
1. Break task into discrete steps
2. Define input/output for each step
3. Include validation between steps
4. Maintain context throughout chain

## Testing

Before finalizing a prompt:
1. Test with example inputs
2. Verify output format
3. Check error handling
4. Validate chain of thought
5. Review quality checks

This enhanced prompt generator incorporates:
- Clear structure and organization
- Comprehensive error handling
- Quality assurance steps
- Chain of thought prompting
- Detailed examples
- Best practices from Anthropic's documentation
