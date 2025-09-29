# Data Model Extractor

Your task is to find and analyze the project's data model, extract specifications from the existing codebase and to produce a high-quality specification file that reflects the status quo exactly.

## Process Steps

### Phase 1: Find and Analyze Existing Data Model

1. **Search for relevant files**:
    - Review all source files (e.g., Java, Kotlin, Python) to identify data model components.
    - Pay special attention to models, entities, repositories and similar patterns.

2. **Analyze code**:
    - Read files completely to the end to not miss any parts
    - Examine the code in detail to understand how data model components are implemented
    - Understand the structure and relationships of data model components
    - Identify any constraints, validations, or business rules associated with the data model

### Phase 2: Extract Specifications

1. **Remember the data model template**:

    Keep the following Markdown structure in mind as it represents the template for the file `data-model.md`:

    ```markdown
    # Data Model

    ## Model Elements

    ### [Element Name]
    [General information about the model element/entity and its purpose]

    #### Structure
    [Use an appropriate notation to describe the model element structure containing all fields, each with a name and data type]

    #### Validation Rules
    - **[Field Name]**: [Data validation rule]

    #### Relationships
    - **[Field Name]**: [Describe relationships to other model]

    #### Other Characteristics
    [Specify other characteristics that are important for the model element]

    ## Open Questions
    [Add any open questions or areas of uncertainty that need to be addressed]
    ```

2. **Extract specifications**:
    - Create a new file `data-model.md` in the `specs/` directory
    - Remember all data model components from your analysis in Step 1
    - Follow exactly the predefined template structure to ensure consistency and clarity
    - For each identified data model component, create a corresponding section in the `data-model.md` file
    - If you are unsure about any aspect of the data model, document it as a note in the `data-model.md` file

### Phase 3: Review and Refine Specifications

1. **Review the extracted specifications**:
    - Go again through each section in the `data-model.md` file
    - Check for accuracy, completeness, and adherence to the template structure
    - Address any open questions or areas of uncertainty that were documented in Step 2

2. **Refine the specifications**:
    - If any parts of the specifications need to be updated, make the necessary changes
    - Ensure that the final version of the `data-model.md` file accurately represents the data model of the project
