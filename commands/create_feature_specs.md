# Feature Specifications Creator

Your task is to gather all required information about the new feature and produce a high-quality combined specification file that contains everything needed to plan the feature implementation.

## Initial Response

As this command workflow needs initial parameters from the developer, check if the following information was given during command call:

**Required parameters**:
- [feature name]
- [feature description]

### If all parameters are known

Respond to the developer:

```
I recognized the following parameters for the new feature:
- Feature Name: [feature name]
- Feature Description: [feature description]
```

### If parameters are missing

Respond to the developer:

```
The following parameters are still required for the new feature:
- [Mark missing parameters]
```

## Process Steps

Only if all required parameters are known, you can start the process and execute it step-by-step.

### Phase 1: Detect project state and decide on specification mode

Before creating feature specifications, determine the project's current state to adapt the specification approach:

1. **Check for existing general specifications**:
    - Look for `specs/api-contract.md`
    - Look for `specs/business-logic.md`
    - Look for `specs/data-model.md`
    - Look for `specs/ui-design.md`
    - Look for `specs/infrastructure.md`

2. **Check for existing codebase**:
    - Analyze the project structure for substantial implementation files
    - Check for established patterns, frameworks, and architectural decisions

3. **Determine specification mode**:
    - **Bootstrap Mode**: If general specification files are missing OR the codebase is minimal/empty
    - **Full Mode**: If general specification files exist AND there's a substantial codebase

4. **Proceed with the appropriate specification approach** based on the detected mode

### Phase 2: Create new feature specs subdirectory

Create a new subdirectory in `specs/` directory with the sanitized name of the feature.
**Example 1**: If the feature name is `Add User`, the subdirectory name should be `add-user`.
**Example 2**: If the feature name is `Add User to Group`, the subdirectory name should be `add-user-to-group`.

From now on you should work in this new subdirectory. All new files must be created or edited there.

**Your workspace from now on is**: `specs/[sanitized-feature-name]/`

### Phase 3: Create new feature specifications

1. **Remember the feature specifications template**:

    Keep the following Markdown structure in mind as it represents the template for the file `feature-specs.md`:

    ```
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

    ---

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

    ---

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

    ---

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

    ---

    # Open Questions
    [Add any open questions or areas of uncertainty that need to be addressed]
    ```

2. **Analyze requirements and create specifications file (Mode-dependent)**:

    - You are now working on the specifications file: `feature-specs.md`. Be careful, using the correct directory defined in Step 1.
    - As you don't know yet the technologies and frameworks being used for implementation, you must describe all specifications technology-agnostic.
    
    **Full Mode - Comprehensive Analysis**:
    - Analyze existing specifications in `specs/` folder and the existing codebase, concentrating on parts that are most probably related to the new feature you are describing.
    - Look for established patterns, naming conventions, and architectural decisions that should be followed.
    - Identify existing model elements, API interfaces, and UI components that the new feature should integrate with or extend.
    - Consider how the new feature fits into the existing business logic and data flow.
    
    **Bootstrap Mode - Foundation-Focused Analysis**:
    - Focus primarily on the feature description provided by the developer.
    - Create specifications that establish foundational patterns for the project.
    - Design model elements, API interfaces, and UI components that can serve as templates for future features.
    - Consider extensibility and how general specifications might be extracted later.
    
    - Analyze the feature description given by the developer and create detailed specifications for all sections defined by the specifications template.
    - Write all specifications to the target file `feature-specs.md`.

3. **Review and finalize specifications (Mode-dependent)**:

    **Full Mode**:
    - Review the completed `feature-specs.md` file and make sure all specifications are complete, accurate, and technology-agnostic.
    - Verify that the feature integrates properly with existing specifications and architectural patterns.
    - Ensure consistency with established naming conventions and data models.
    - Check that API interfaces follow existing patterns and don't conflict with current endpoints.
    - Validate that UI components align with existing design patterns and user flows.
    
    **Bootstrap Mode**:
    - Review the completed `feature-specs.md` file and make sure all specifications are complete, accurate, and technology-agnostic.
    - Verify that the specifications establish good foundational patterns for the project.
    - Ensure that model elements, API interfaces, and UI components are designed for extensibility.
    - Check that the specifications can serve as templates for future feature development.
    - Consider how general specifications might be extracted from this feature later.
    
    - If there are any open questions or areas of uncertainty, add them to the **Open Questions** specifications section.

### Phase 4: Ask the developer for clarification (Mode-dependent)

**Full Mode**:
1. **Review open questions with context**:
    - For each question in the **Open Questions** specifications section, ask the developer for clarification.
    - Provide context about how the answer might affect integration with existing specifications or codebase.
    - Consider questions about consistency with established patterns and architectural decisions.
    - **IMMEDIATELY** after receiving each answer, update the **Open Questions** section in `feature-specs.md` with the developer's response.
    - Always map the right question and answer together.
    - If the developer provides additional information or a different perspective, update the question and answer accordingly.
    - **NEVER wait for the developer to ask you to save the answers - persist them automatically as soon as they are provided.**

**Bootstrap Mode**:
1. **Review open questions with future considerations**:
    - For each question in the **Open Questions** specifications section, ask the developer for clarification.
    - Provide context about how the answer might affect future feature development and general specifications extraction.
    - Consider questions about foundational patterns and extensibility decisions.
    - **IMMEDIATELY** after receiving each answer, update the **Open Questions** section in `feature-specs.md` with the developer's response.
    - Always map the right question and answer together.
    - If the developer provides additional information or a different perspective, update the question and answer accordingly.
    - **NEVER wait for the developer to ask you to save the answers - persist them automatically as soon as they are provided.**

2. **Update specifications (Mode-dependent)**:
    - **Full Mode**: Make sure to update the file `feature-specs.md` with the developer's responses, ensuring consistency with existing specifications.
    - **Bootstrap Mode**: Make sure to update the file `feature-specs.md` with the developer's responses, considering how they establish foundational patterns for the project.
    - **Critical**: This update must happen immediately after each answer is received, not at the end of the conversation.
