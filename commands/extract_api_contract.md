# API Contract Extractor

Your task is to find and analyze the project's interfaces, extract specifications from the existing codebase and to produce a high-quality specification file that reflects the status quo exactly.

## Process Steps

### Phase 1: Find and Analyse Existing Interfaces

1. **Search for relevant files**:
    - Review all source files (e.g., Java, Kotlin, Python) to identify interfaces.
    - Pay special attention to controllers, services, activities, helpers and additional patterns that define interfaces.

2. **Analyze code**:
    - Read files completely to the end to not miss any parts
    - Concentrate on technical interfaces only and do not include user interfaces
    - Examine the code in detail to understand how interfaces are implemented
    - Understand the structure and relationships of interface components
    - Identify any constraints, validations, or business rules associated with the interface

### Phase 2: Extract Specifications

1. **Remember the interface template**:

    Keep the following Markdown structure in mind as it represents the template for the file `api-contract.md`:

    ```markdown
    # API Contract

    ## Interfaces

    ### [Interface Name]
    [General information about the interface that includes its purpose, interface type and how to access/use it]

    #### Input/Call
    [Describe parameters and input data model]

    #### Output/Response
    [Describe output data model]

    #### Event/Message
    [Describe event or message data model]

    #### Error Handling
    [Describe error types, error structure and interface behavior]

    #### Other Characteristics
    [Specify other characteristics that are important for the interface]

    ## Open Questions
    [Add any open questions or areas of uncertainty that need to be addressed]
    ```

2. **Extract specifications**:
    - Create a new file `api-contract.md` in the `specs/` directory
    - Remember all interface components from your analysis in Step 1
    - Follow exactly the predefined template structure to ensure consistency and clarity
    - For each identified interface component, create a corresponding section in the `api-contract.md` file
    - If you are unsure about any aspect of the interface, document it as a note in the `api-contract.md` file

### Phase 3: Review and Refine Specifications

1. **Review the extracted specifications**:
    - Go again through each section in the `api-contract.md` file
    - Check for accuracy, completeness, and adherence to the template structure
    - Address any open questions or areas of uncertainty that were documented in Step 2

2. **Refine the specifications**:
    - If any parts of the specifications need to be updated, make the necessary changes
    - Ensure that the final version of the `api-contract.md` file accurately represents the interfaces of the project
