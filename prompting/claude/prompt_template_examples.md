# Real-World Prompt Template Examples

This document provides practical examples of prompt templates for common use cases, demonstrating how to effectively use variables and structure.

## 1. Code Documentation Generator

```xml
<task>
Generate comprehensive documentation for {$LANGUAGE} code.
</task>

<code_input>
{$CODE}
</code_input>

<documentation_requirements>
Style Guide: {$STYLE_GUIDE}
Documentation Level: {$DETAIL_LEVEL}
Include:
- Function descriptions
- Parameter details
- Return values
- Usage examples
- Edge cases
</documentation_requirements>

<example_usage>
Input:
{$CODE} = ```python
def process_data(items, threshold=0.5):
    results = []
    for item in items:
        if item.score > threshold:
            results.append(item.transform())
    return results
```

Output:
```python
def process_data(items: List[Item], threshold: float = 0.5) -> List[Item]:
    """
    Process a list of items by filtering and transforming them based on a score threshold.
    
    Args:
        items: List of Item objects to process
        threshold: Minimum score required for item inclusion (default: 0.5)
        
    Returns:
        List of transformed items that met the threshold criteria
        
    Example:
        >>> items = [Item(score=0.7), Item(score=0.3)]
        >>> process_data(items)
        [TransformedItem(...)]
        
    Note:
        - Items with scores <= threshold are excluded
        - Each included item is transformed using its transform() method
    """
```
</example_usage>
```

## 2. API Response Handler

```xml
<task>
Generate a response handler for {$API_NAME} API responses.
</task>

<api_spec>
Endpoint: {$ENDPOINT}
Response Format: {$RESPONSE_FORMAT}
Error Codes: {$ERROR_CODES}
</api_spec>

<requirements>
Language: {$LANGUAGE}
Error Handling: {$ERROR_HANDLING_LEVEL}
Logging: {$LOGGING_REQUIREMENTS}
</requirements>

<example_usage>
Input:
{$ENDPOINT} = "/users"
{$RESPONSE_FORMAT} = "JSON"
{$ERROR_CODES} = ["400", "401", "403", "404", "500"]
{$LANGUAGE} = "Python"
{$ERROR_HANDLING_LEVEL} = "Comprehensive"
{$LOGGING_REQUIREMENTS} = "Debug level with timestamps"

Output:
```python
import logging
from typing import Dict, Optional
from datetime import datetime

logging.basicConfig(
    format='%(asctime)s - %(levelname)s - %(message)s',
    level=logging.DEBUG
)

class APIResponseHandler:
    def __init__(self):
        self.logger = logging.getLogger(__name__)
        
    def handle_response(self, response) -> Dict:
        """
        Handle API response from /users endpoint
        
        Args:
            response: Raw API response
            
        Returns:
            Processed response data or error details
            
        Raises:
            APIError: If response indicates an error
        """
        try:
            self.logger.debug(f"Processing response: {response.status_code}")
            
            if response.status_code == 200:
                return self._process_success(response)
                
            return self._handle_error(response)
            
        except Exception as e:
            self.logger.error(f"Error processing response: {str(e)}")
            raise
            
    def _process_success(self, response) -> Dict:
        """Process successful API response"""
        try:
            data = response.json()
            self.logger.debug(f"Successfully processed response data")
            return {
                'success': True,
                'data': data,
                'timestamp': datetime.now().isoformat()
            }
        except ValueError as e:
            self.logger.error(f"Invalid JSON in response: {str(e)}")
            raise APIError("Invalid response format")
            
    def _handle_error(self, response) -> Dict:
        """Handle API error response"""
        error_map = {
            400: "Bad Request",
            401: "Unauthorized",
            403: "Forbidden",
            404: "Not Found",
            500: "Internal Server Error"
        }
        
        error_msg = error_map.get(
            response.status_code,
            f"Unknown error: {response.status_code}"
        )
        
        self.logger.error(
            f"API Error: {error_msg} - {response.text}"
        )
        
        return {
            'success': False,
            'error': error_msg,
            'details': response.text,
            'timestamp': datetime.now().isoformat()
        }
```
</example_usage>
```

## 3. Data Validation Template

```xml
<task>
Create a data validation system for {$DATA_TYPE} data.
</task>

<validation_rules>
{$VALIDATION_RULES}
</validation_rules>

<error_handling>
Error Level: {$ERROR_LEVEL}
Error Format: {$ERROR_FORMAT}
</error_handling>

<example_usage>
Input:
{$DATA_TYPE} = "user_profile"
{$VALIDATION_RULES} = """
{
    "name": {
        "type": "string",
        "required": true,
        "min_length": 2,
        "max_length": 100
    },
    "email": {
        "type": "email",
        "required": true
    },
    "age": {
        "type": "integer",
        "required": true,
        "min": 13,
        "max": 120
    }
}
"""
{$ERROR_LEVEL} = "Strict"
{$ERROR_FORMAT} = "JSON"

Output:
```python
from typing import Dict, List, Any
import re
from dataclasses import dataclass
from datetime import datetime

@dataclass
class ValidationError:
    field: str
    error: str
    details: Dict[str, Any]

class DataValidator:
    def __init__(self, rules: Dict[str, Dict[str, Any]]):
        self.rules = rules
        self.email_pattern = re.compile(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        
    def validate(self, data: Dict[str, Any]) -> List[ValidationError]:
        """
        Validate data against defined rules
        
        Args:
            data: Dictionary of data to validate
            
        Returns:
            List of ValidationError objects
        """
        errors = []
        
        for field, rules in self.rules.items():
            if rules.get('required', False) and field not in data:
                errors.append(ValidationError(
                    field=field,
                    error="required_field_missing",
                    details={"message": f"Field '{field}' is required"}
                ))
                continue
                
            if field not in data:
                continue
                
            value = data[field]
            field_errors = self._validate_field(field, value, rules)
            errors.extend(field_errors)
            
        return errors
        
    def _validate_field(
        self,
        field: str,
        value: Any,
        rules: Dict[str, Any]
    ) -> List[ValidationError]:
        """Validate a single field against its rules"""
        errors = []
        
        # Type validation
        if rules.get('type'):
            type_error = self._validate_type(field, value, rules['type'])
            if type_error:
                errors.append(type_error)
                return errors
                
        # String validation
        if rules['type'] == 'string':
            errors.extend(self._validate_string(field, value, rules))
            
        # Number validation
        elif rules['type'] in ['integer', 'float']:
            errors.extend(self._validate_number(field, value, rules))
            
        # Email validation
        elif rules['type'] == 'email':
            errors.extend(self._validate_email(field, value))
            
        return errors
        
    def _validate_type(
        self,
        field: str,
        value: Any,
        expected_type: str
    ) -> Optional[ValidationError]:
        """Validate value type"""
        type_map = {
            'string': str,
            'integer': int,
            'float': float,
            'email': str
        }
        
        if not isinstance(value, type_map[expected_type]):
            return ValidationError(
                field=field,
                error="invalid_type",
                details={
                    "expected": expected_type,
                    "received": type(value).__name__
                }
            )
        return None
        
    def _validate_string(
        self,
        field: str,
        value: str,
        rules: Dict[str, Any]
    ) -> List[ValidationError]:
        """Validate string fields"""
        errors = []
        
        if 'min_length' in rules and len(value) < rules['min_length']:
            errors.append(ValidationError(
                field=field,
                error="string_too_short",
                details={
                    "min_length": rules['min_length'],
                    "actual_length": len(value)
                }
            ))
            
        if 'max_length' in rules and len(value) > rules['max_length']:
            errors.append(ValidationError(
                field=field,
                error="string_too_long",
                details={
                    "max_length": rules['max_length'],
                    "actual_length": len(value)
                }
            ))
            
        return errors
        
    def _validate_number(
        self,
        field: str,
        value: Union[int, float],
        rules: Dict[str, Any]
    ) -> List[ValidationError]:
        """Validate numeric fields"""
        errors = []
        
        if 'min' in rules and value < rules['min']:
            errors.append(ValidationError(
                field=field,
                error="value_too_small",
                details={
                    "min_value": rules['min'],
                    "actual_value": value
                }
            ))
            
        if 'max' in rules and value > rules['max']:
            errors.append(ValidationError(
                field=field,
                error="value_too_large",
                details={
                    "max_value": rules['max'],
                    "actual_value": value
                }
            ))
            
        return errors
        
    def _validate_email(
        self,
        field: str,
        value: str
    ) -> List[ValidationError]:
        """Validate email fields"""
        if not self.email_pattern.match(value):
            return [ValidationError(
                field=field,
                error="invalid_email",
                details={"value": value}
            )]
        return []
```
</example_usage>
```

## 4. Report Generator Template

```xml
<task>
Generate a {$REPORT_TYPE} report for {$DATA_SOURCE}.
</task>

<report_parameters>
Time Period: {$TIME_PERIOD}
Metrics: {$METRICS}
Grouping: {$GROUPING}
Format: {$OUTPUT_FORMAT}
</report_parameters>

<example_usage>
Input:
{$REPORT_TYPE} = "performance"
{$DATA_SOURCE} = "sales_data"
{$TIME_PERIOD} = "Q4 2024"
{$METRICS} = ["revenue", "growth", "conversion_rate"]
{$GROUPING} = "monthly"
{$OUTPUT_FORMAT} = "markdown"

Output:
```markdown
# Performance Report: Q4 2024
Generated: [timestamp]

## Executive Summary
[Auto-generated summary of key findings]

## Monthly Analysis

### October 2024
- Revenue: $1.2M
- Growth: +15% YoY
- Conversion Rate: 3.2%

[Additional months...]

## Key Insights
1. [Insight 1]
2. [Insight 2]
3. [Insight 3]

## Recommendations
1. [Recommendation 1]
2. [Recommendation 2]
3. [Recommendation 3]

## Methodology
[Description of data sources and analysis methods]
```
</example_usage>
```

These examples demonstrate how to create robust, reusable templates for common tasks while maintaining clarity and flexibility through well-structured variables.
