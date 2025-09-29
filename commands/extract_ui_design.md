# UI/UX Design Extractor

Your task is to find and analyze the project's UI/UX design, extract specifications from the existing codebase and to produce a high-quality specification file that reflects the status quo exactly.

## Process Steps

### Phase 1: Find and Analyse Existing UI/UX Design

1. **Search for relevant files**:
    - Review all source files (e.g., Java, Kotlin, Python) to identify UI/UX design components.
    - Pay special attention to controllers, flows, views, activities, and similar patterns.

2. **Analyze code**:
    - Read files completely to the end to not miss any parts
    - Examine the code in detail to understand how UI/UX design components are implemented
    - Understand user control flow, view navigation, and view design

### Phase 2: Extract Specifications

1. **Remember the UI/UX design template**:

    Keep the following Markdown structure in mind as it represents the template for the file `ui-design.md`:

    ```markdown
    # UI/UX Design

    ## UI Components

    ### [Component Name]
    [Specify the UI component]

    ## User Flows

    ### [Flow Name]
    [Use Mermaid syntax to describe the user flow]

    ## UX Patterns

    ### [Pattern Name]
    [Specify the UX pattern]

    ## Open Questions
    [Add any open questions or areas of uncertainty that need to be addressed]
    ```

2. **Extract specifications**:
    - Create a new file `ui-design.md` in the `specs/` directory
    - Remember all UI/UX design components from your analysis in Step 1
    - Follow exactly the predefined template structure to ensure consistency and clarity
    - For each identified UI/UX design component, create a corresponding section in the `ui-design.md` file
    - If you are unsure about any aspect of the UI/UX design, document it as a note in the `ui-design.md` file

### Phase 3: Review and Refine Specifications

1. **Review the extracted specifications**:
    - Go again through each section in the `ui-design.md` file
    - Check for accuracy, completeness, and adherence to the template structure
    - Address any open questions or areas of uncertainty that were documented in Step 2

2. **Refine the specifications**:
    - If any parts of the specifications need to be updated, make the necessary changes
    - Ensure that the final version of the `ui-design.md` file accurately represents the UI/UX design of the project
