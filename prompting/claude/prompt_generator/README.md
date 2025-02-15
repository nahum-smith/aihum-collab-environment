# Prompt Generator

A tool for generating structured prompts for various tasks.

## Quick Start

1. **Using the CLI Command**
```bash
/prompt [task] [requirement1] [requirement2] ...
```

Example:
```bash
/prompt create API docs include-endpoints show-examples
```

2. **Using the Shell Script**
```bash
./prompt-gen.sh "Create API docs" "Include endpoints" "Show examples"
```

## Installation

1. Make the script executable:
```bash
chmod +x scripts/prompt-gen.sh
```

2. Add alias to your shell config (~/.zshrc or ~/.bashrc):
```bash
alias pg='~/knowledge-bases/kb-nahum-jeff-shared/scripts/prompt-gen.sh'
```

## Features

- Structured prompt generation
- Template-based output
- Support for multiple requirements
- Built-in quality checks

## Templates

All templates are stored in the `templates/` directory:
- `api_docs.xml` - API documentation template
- `code_review.xml` - Code review template
- `technical_docs.xml` - Technical documentation template

## Usage with Cascade

When using with Cascade:
1. Use the `/prompt` command directly in chat
2. Cascade will automatically:
   - Generate appropriate template
   - Offer refinement options
   - Provide implementation guidance

## Examples

1. **API Documentation**
```bash
/prompt create API docs include-endpoints show-examples
```

2. **Code Review**
```bash
/prompt code review security-focus performance-check
```

3. **Technical Documentation**
```bash
/prompt create user guide include-examples show-workflows
```

## Best Practices

1. **Clear Task Description**
   - Be specific about requirements
   - Include key objectives
   - Specify output format

2. **Iterative Refinement**
   - Start with basic template
   - Add specific requirements
   - Refine based on needs

3. **Template Usage**
   - Use appropriate template
   - Customize as needed
   - Follow format guidelines

## Configuration

The prompt generator can be configured through `config.json`:
```json
{
  "defaultTemplate": "general",
  "outputFormat": "xml",
  "includeExamples": true,
  "qualityChecks": true
}
```

## Contributing

1. Add new templates to `templates/`
2. Update documentation
3. Test with various use cases
4. Submit pull request

## Support

- File issues in the repository
- Check documentation
- Contact maintainers
