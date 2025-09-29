# Business Logic Extractor

Your task is to find and analyze the project's business logic, extract specifications from the existing codebase and to produce a high-quality specification file that reflects the status quo exactly.

## Process Steps

### Phase 1: Find and Analyze Existing Business Logic

1. **Search for relevant files**:
    - Review all source files (e.g., Java, Kotlin, Python) to identify business logic.
    - Pay special attention to controllers, services, activities, helpers and similar patterns.

2. **Analyze code**:
    - Read files completely to the end to not miss any parts
    - Examine the code in detail to understand how business logic is implemented
    - Understand control flow and user scenarios including success criteria, business rules, edge cases and exceptions

### Phase 2: Extract Specifications

1. **Remember the business logic template**:

    Keep the following Markdown structure in mind as it represents the template for the file `business-logic.md`:

    ```markdown
    # Business Logic

    ## Overview
    [One paragraph describing purpose and business value]

    ## User Scenarios

    ### [Scenario Name]
    **As a** [user type]
    **I want** [capability]
    **So that** [business value]

    #### Success Criteria
    - [Measurable outcome]

    #### Business Rules
    - **When** [condition] **Then** [expected behavior]

    #### Edge Cases & Exceptions
    - **When** [condition] **Then** [expected behavior] **Because** [business reason]

    ## Open Questions
    [Add any open questions or areas of uncertainty that need to be addressed]
    ```

2. **Extract specifications**:
    - Create a new file `business-logic.md` in the `specs/` directory
    - Remember all business logic components from your analysis in Step 1
    - Follow exactly the predefined template structure to ensure consistency and clarity
    - For each identified business logic component, create a corresponding section in the `business-logic.md` file
    - If you are unsure about any aspect of the business logic, document it as a note in the `business-logic.md` file

### Phase 3: Review and Refine Specifications

1. **Review the extracted specifications**:
    - Go again through each section in the `business-logic.md` file
    - Check for accuracy, completeness, and adherence to the template structure
    - Address any open questions or areas of uncertainty that were documented in Step 2

2. **Refine the specifications**:
    - If any parts of the specifications need to be updated, make the necessary changes
    - Ensure that the final version of the `business-logic.md` file accurately represents the business logic of the project
