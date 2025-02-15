# Content Generation Templates

## Document Generator

```xml
<task>
Generate a {$DOCUMENT_TYPE} document based on the following requirements.
</task>

<requirements>
Topic: {$TOPIC}
Audience: {$AUDIENCE}
Purpose: {$PURPOSE}
Style: {$STYLE}
Length: {$LENGTH}
Special Requirements: {$SPECIAL_REQUIREMENTS}
</requirements>

<output_format>
# {$TITLE}

## Executive Summary

[Main content organized by sections]

## References (if applicable)
</output_format>
```

## Meeting Scribe

```xml
<task>
Create a detailed summary of the following meeting notes.
</task>

<meeting_info>
Date: {$DATE}
Duration: {$DURATION}
Participants: {$PARTICIPANTS}
Agenda: {$AGENDA}
</meeting_info>

<notes>
{$MEETING_NOTES}
</notes>

<output_format>
# Meeting Summary: {$MEETING_TITLE}
Date: {$DATE}
Duration: {$DURATION}
Participants: {$PARTICIPANTS}

## Key Decisions
- [List of decisions made]

## Action Items
- [List of action items with assignees and deadlines]

## Discussion Points
- [Major topics discussed]

## Next Steps
- [Upcoming actions and follow-ups]

## Additional Notes
[Any other relevant information]
</output_format>
```

## Email Composer

```xml
<task>
Compose a professional email based on the following requirements.
</task>

<email_parameters>
Purpose: {$PURPOSE}
Recipient: {$RECIPIENT}
Tone: {$TONE}
Key Points: {$KEY_POINTS}
Call to Action: {$CALL_TO_ACTION}
</email_parameters>

<output_format>
Subject: {$SUBJECT}

Dear {$RECIPIENT},

[Email body]

Best regards,
{$SENDER}
</output_format>
```

## Technical Documentation

```xml
<task>
Create technical documentation for {$SUBJECT}.
</task>

<requirements>
Type: {$DOC_TYPE} // API, User Guide, System Design, etc.
Audience: {$AUDIENCE}
Depth: {$DETAIL_LEVEL}
Include:
- {$SECTIONS}
</requirements>

<output_format>
# {$TITLE}

## Overview
[Brief introduction and purpose]

## Technical Details
[Detailed technical information]

## Implementation
[Implementation details or usage instructions]

## Examples
[Practical examples and use cases]

## Troubleshooting
[Common issues and solutions]

## References
[Related documentation and resources]
</output_format>
```

## Product Description

```xml
<task>
Generate a compelling product description for {$PRODUCT_NAME}.
</task>

<product_details>
Name: {$PRODUCT_NAME}
Category: {$CATEGORY}
Key Features: {$FEATURES}
Target Audience: {$TARGET_AUDIENCE}
Price Point: {$PRICE}
USPs: {$UNIQUE_SELLING_POINTS}
</product_details>

<output_format>
# {$PRODUCT_NAME}

## Overview
[Compelling introduction]

## Key Features
- [Feature list with benefits]

## Perfect For
[Target audience description]

## Why Choose {$PRODUCT_NAME}
[Unique selling points]

## Specifications
[Technical details]

## Package Includes
[What's included]

## Price
[Pricing information]
</output_format>
```
