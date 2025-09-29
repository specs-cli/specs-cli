# Infrastructure Extractor

Your task is to find and analyze the project's build, deployment, and monitoring infrastructure, extract specifications from the existing codebase, and produce a high-quality specification file that reflects the status quo exactly.

## Process Steps

### Phase 1: Find and Analyse Existing Infrastructure

1. **Search for relevant files**:
    - Review non-source files (e.g., Scripts, Settings, Configs, Templates) to identify build, deployment, and monitoring infrastructure.
    - Pay special attention to build, deployment, and monitoring files, scripts and similar patterns.

2. **Analyze code**:
    - Read files completely to the end to not miss any parts
    - Examine the code in detail to understand how build, deployment, and monitoring infrastructure is implemented
    - Understand control flow and user scenarios including success criteria, business rules, edge cases and exceptions

### Phase 2: Extract Specifications

1. **Remember the infrastructure template**:

    Keep the following Markdown structure in mind as it represents the template for the file `infrastructure.md`:

    ```markdown
    # Infrastructure

    ## Deployment
    [Deployment approach, tools, environments, processes and configurations]

    ## Storage
    [Storage solutions, technologies and configurations]

    ## Network
    [Network solutions, technologies and configurations]

    ## Security
    [Security solutions, technologies and configurations]

    ## Compliance
    [Compliance requirements, standards, and certifications]
    
    ## Monitoring
    [Monitoring and observability solutions, technologies and configurations]

    ## Disaster Recovery
    [Disaster backup strategy, recovery planning, procedures, and tools]

    ## Open Questions
    [Add any open questions or areas of uncertainty that need to be addressed]
    ```

2. **Extract specifications**:
    - Create a new file `infrastructure.md` in the `specs/` directory
    - Remember all infrastructure components from your analysis in Step 1
    - Follow exactly the predefined template structure to ensure consistency and clarity
    - For each identified infrastructure component, create a corresponding section in the `infrastructure.md` file
    - If you are unsure about any aspect of the infrastructure, document it as a note in the `infrastructure.md` file

### Phase 3: Review and Refine Specifications

1. **Review the extracted specifications**:
    - Go again through each section in the `infrastructure.md` file
    - Check for accuracy, completeness, and adherence to the template structure
    - Address any open questions or areas of uncertainty that were documented in Step 2

2. **Refine the specifications**:
    - If any parts of the specifications need to be updated, make the necessary changes
    - Ensure that the final version of the `infrastructure.md` file accurately represents the infrastructure of the project
