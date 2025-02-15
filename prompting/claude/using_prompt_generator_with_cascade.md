# Using the Prompt Generator with Cascade

## Overview

To use the prompt generator with Cascade, follow this workflow:

1. **Define Your Task**
   ```xml
   <task_request>
   I need a prompt for [your specific task]
   
   Purpose: [task purpose]
   Target Output: [desired output]
   Special Requirements: [any special needs]
   </task_request>
   ```

2. **Request Prompt Generation**
   ```xml
   <prompt_request>
   Please generate a prompt template for this task using the prompt generator format.
   
   Additional Requirements:
   - [Any specific requirements]
   - [Format preferences]
   - [Error handling needs]
   </prompt_request>
   ```

3. **Test and Refine**
   ```xml
   <test_request>
   Let's test this prompt with the following sample input:
   [Your sample input]
   </test_request>
   ```

## Example Usage

### 1. Code Review Prompt

```xml
<task_request>
I need a prompt for conducting thorough code reviews.

Purpose: Ensure consistent, high-quality code reviews
Target Output: Structured review feedback with actionable items
Special Requirements:
- Security focus
- Performance considerations
- Best practices checking
</task_request>

<prompt_request>
Please generate a code review prompt template that:
- Follows security best practices
- Includes performance analysis
- Provides actionable feedback
</prompt_request>
```

### 2. Technical Documentation

```xml
<task_request>
I need a prompt for generating technical documentation.

Purpose: Create clear, comprehensive documentation
Target Output: Well-structured markdown documentation
Special Requirements:
- API documentation focus
- Example generation
- Error scenario coverage
</task_request>

<prompt_request>
Please generate a documentation prompt template that:
- Follows technical writing best practices
- Includes example generation
- Covers error scenarios comprehensively
</prompt_request>
```

## Best Practices

1. **Be Specific**
   - Clearly state your task requirements
   - Specify desired output format
   - Include any special considerations

2. **Iterative Refinement**
   - Test the generated prompt
   - Request adjustments based on results
   - Verify error handling

3. **Provide Context**
   - Include relevant background information
   - Specify target audience
   - Mention any constraints

## Common Patterns

1. **Task Definition**
   ```xml
   <task_request>
   Task: [Brief task description]
   Purpose: [What you want to achieve]
   Audience: [Who will use the output]
   Requirements:
   - [Requirement 1]
   - [Requirement 2]
   - [Requirement 3]
   </task_request>
   ```

2. **Prompt Generation**
   ```xml
   <prompt_request>
   Generate a prompt template for [task] that includes:
   1. Clear role definition
   2. Input/output specifications
   3. Error handling guidelines
   4. Quality checks
   5. Example implementation
   </prompt_request>
   ```

3. **Testing**
   ```xml
   <test_request>
   Test this prompt with:
   Input: [Sample input]
   Expected Output: [What you expect]
   Edge Cases:
   - [Edge case 1]
   - [Edge case 2]
   </test_request>
   ```

## Working with Cascade

1. **Initial Request**
   - Start with a clear task description
   - Specify all requirements upfront
   - Include any constraints or limitations

2. **Refinement**
   - Review the generated prompt
   - Request specific adjustments
   - Test with sample inputs

3. **Implementation**
   - Use the final prompt for your task
   - Monitor results
   - Request adjustments if needed

## Example Workflow

```xml
<user>
I need a prompt for analyzing customer feedback data.
</user>

<cascade>
I'll help you create a prompt using the generator. Could you specify:
1. What type of analysis you need?
2. Desired output format?
3. Any special requirements?
</cascade>

<user>
1. Sentiment analysis and key themes
2. JSON output with scores and categories
3. Need to handle multiple languages
</user>

<cascade>
[Generates prompt template using the generator]

Would you like to test this with some sample feedback?
</cascade>

<user>
Yes, let's test with these examples...
</user>

[Continue iterative refinement]
```

## Tips for Success

1. **Clear Communication**
   - Be specific about requirements
   - Provide examples when possible
   - Ask for clarification if needed

2. **Iterative Development**
   - Start with basic requirements
   - Test and refine
   - Add complexity gradually

3. **Quality Assurance**
   - Test edge cases
   - Verify error handling
   - Validate output format

Remember: I'm here to help you create and refine prompts that meet your specific needs. Don't hesitate to ask for adjustments or clarification at any step in the process.
