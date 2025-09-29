# Feature Implementation Plan Creator

Your task is to create a feature implementation plan for the new feature based on the feature specifications. The plan you are creating will reference all required resources like specifications and guide the AI through the whole feature implementation process.

## Initial Response

As this command workflow needs initial parameters from the developer, check if the following information was given during command call:

**Required parameters**:
    - [feature name or specs file reference]
    - [technology stack]

1. **Check if corresponding specifications file exists**
    - If the parameter is a feature name, check if a file `feature-specs.md` exists in the subdirectory `specs/[sanitized-feature-name]/`
    - If the parameter is a feature specs file reference, check if the file exists

2. **Check if the technology stack is supported**
    - Check if the technology stack is supported for the feature
    - Use existing technology stack if parameter is not given but there is an existing codebase

3. **Detect project state and decide on planning mode**
    - Check if general specification files exist: `specs/api-contract.md`, `specs/business-logic.md`, `specs/data-model.md`, `specs/ui-design.md`, `specs/infrastructure.md`
    - Check if there is existing codebase (beyond basic project structure)
    - Determine planning mode:
        - **Bootstrap Mode**: If most general specs are missing OR minimal codebase exists
        - **Full Mode**: If general specs exist AND substantial codebase exists

4. **Decide whether to continue with the feature implementation plan creation**
    - If the feature specs file exists, continue with the appropriate planning mode
    - If the feature specs file does not exist, respond to the developer with an error message: `Error: Feature specs file not found. Please check the feature name or specs file reference.`
    - If there is no existing codebase and no technology stack given, respond to the developer with an error message: `Error: No technology stack given. Please provide a technology stack.`

## Process Steps

**Note**: The following steps vary based on the detected planning mode (Bootstrap vs Full Mode).

### Phase 1: Analyze the feature specifications file

1. **Read the feature specifications file**
    - If the parameter is a feature name, read the file `feature-specs.md` in the subdirectory `specs/[sanitized-feature-name]/`
    - If the parameter is a feature specs file reference, read the file
    - Read the file completely to make sure all required information is included

2. **Extract relevant information from the specifications file**
    - Identify the feature name, feature description, user scenarios, and business logic from the specifications file
    - If any required information is missing, respond to the developer with an error message that includes the missing information that needs to be provided

3. **Analyze referenced specification resources (Mode-dependent)**
    - **Full Mode**: Read and analyze all referenced specification files: `api-contract.md`, `business-logic.md`, `data-model.md`, `ui-design.md`, `infrastructure.md`
    - **Bootstrap Mode**: Skip general specs analysis (files may not exist yet)
    - Extract relevant components that will be affected by this feature
    - Identify dependencies between different specification components (if available)
    - Map external integrations and third-party services required

### Phase 2: Analyze existing codebase and architecture (Mode-dependent)

#### Full Mode - Comprehensive Analysis

1. **Codebase Structure Analysis**
    - Analyze existing project structure and architectural patterns
    - Identify existing components that will be affected by the new feature
    - Map current data models, API endpoints, and UI components
    - Document existing coding standards and conventions

2. **Dependency and Integration Analysis**
    - Identify existing dependencies and frameworks in use
    - Check compatibility requirements for new feature components
    - Map integration points with existing systems
    - Identify potential conflicts or breaking changes

3. **Technology Stack Assessment**
    - Verify current technology stack capabilities
    - Identify new dependencies or libraries needed
    - Check version compatibility and upgrade requirements
    - Plan for any infrastructure changes needed

#### Bootstrap Mode - Foundation Analysis

1. **Technology Stack Assessment**
    - Verify the specified technology stack capabilities for the feature
    - Identify core dependencies and libraries needed for this feature
    - Plan basic project structure and architectural patterns
    - Document coding standards and conventions to establish

2. **Foundation Planning**
    - Plan minimal project structure needed for this feature
    - Identify core components that this feature will establish
    - Plan for future extensibility and additional features
    - Consider integration points for future general specifications

### Phase 3: Develop implementation strategy (Mode-dependent)

#### Full Mode - Comprehensive Strategy

1. **Phase-based Implementation Planning**
    - Break down the feature into logical implementation phases
    - Determine optimal sequence based on dependencies
    - Identify components that can be developed in parallel
    - Plan integration milestones and testing checkpoints

2. **Risk Assessment and Mitigation**
    - Identify potential implementation challenges and blockers
    - Plan fallback strategies and alternative approaches
    - Document known limitations and constraints
    - Prepare contingency plans for critical path items

3. **Testing and Quality Assurance Strategy**
    - Plan unit testing approach for new components
    - Design integration testing for affected systems
    - Plan end-to-end testing scenarios
    - Define success criteria and acceptance tests

#### Bootstrap Mode - Foundation Strategy

1. **Feature-First Implementation Planning**
    - Break down the feature into core implementation phases
    - Plan implementation as foundation for future features
    - Design for extensibility and future integration
    - Focus on establishing patterns for the project

2. **Bootstrap Risk Assessment**
    - Identify technology stack learning curve and challenges
    - Plan for establishing development workflow and standards
    - Consider future migration and refactoring needs
    - Prepare for iterative development approach

3. **Foundation Testing Strategy**
    - Plan basic testing framework setup
    - Design testing patterns for future features
    - Plan initial quality assurance processes
    - Define success criteria for the foundation feature
    - Design integration testing strategy
    - Plan UI/UX testing and validation methods
    - Define acceptance criteria and success metrics

### Phase 4: Create new feature implementation plan

**Your workspace from now on is**: `specs/[sanitized-feature-name]/`

1. **Remember the feature implementation plan template (Mode-dependent)**:

    **Full Mode Template** - Keep the following comprehensive Markdown structure in mind:

    ```markdown
    # Feature Implementation Plan
    
    ## Overview
    [Comprehensive feature description including purpose, integration context, and impact on existing system]
    
    ## Process Steps
    
    ### Phase 1: [Phase Name - e.g., Data Model Enhancement]
    1. **[Specific Task Category]**
       - [Detailed implementation step]
       - [Specific deliverable or outcome]
       - [Validation criteria]
    
    2. **[Another Task Category]**
       - [Implementation details]
       - [Dependencies and prerequisites]
       - [Success criteria]
    
    ### Phase 2: [Phase Name - e.g., API Integration]
    [Continue with logical phases based on dependency analysis]
    
    ### Phase N-1: Testing and Quality Assurance
    1. **Unit Testing**
       - [Specific testing requirements]
       - [Test coverage expectations]
    
    2. **Integration Testing**
       - [End-to-end testing scenarios]
       - [Performance and security testing]
    
    3. **User Acceptance Testing**
       - [User scenario validation]
       - [Accessibility and usability testing]
    
    ### Phase N: Documentation and Deployment
    1. **Technical Documentation**
       - [API documentation updates]
       - [Architecture documentation]
    
    2. **User Documentation**
       - [User guide updates]
       - [Help content and troubleshooting]
    
    3. **Deployment Preparation**
       - [Migration scripts and procedures]
       - [Monitoring and rollback strategies]
    
    ## Implementation Details
    
    ### Data Model Changes
    - **New Models**: [List of new data structures needed]
    - **Schema Updates**: [Database/storage schema modifications]
    - **Migration Strategy**: [How to handle existing data]
    
    ### API Integration
    - **New Endpoints**: [List of API endpoints to implement/integrate]
    - **Authentication**: [Security and authentication requirements]
    - **Error Handling**: [Comprehensive error handling strategy]
    
    ### UI/UX Components
    - **New Screens**: [List of new user interface screens]
    - **Component Updates**: [Existing components to modify]
    - **User Flow Changes**: [Navigation and interaction updates]
    
    ### Testing Strategy
    - **Unit Testing**: [Component-level testing approach]
    - **Integration Testing**: [System integration testing plan]
    - **UI Testing**: [User interface and experience testing]
    - **Performance Testing**: [Load and performance validation]
    
    ## Dependencies and Prerequisites
    - **External Dependencies**: [Third-party libraries, services, APIs]
    - **Internal Dependencies**: [Existing components that must be updated first]
    - **Infrastructure Requirements**: [Server, database, or deployment changes needed]
    - **Team Dependencies**: [Other teams or expertise required]
    
    ## Risk Assessment
    - **Technical Risks**: [Potential technical challenges and mitigation strategies]
    - **Integration Risks**: [Compatibility and breaking change concerns]
    - **Timeline Risks**: [Critical path items and potential delays]
    - **Rollback Strategy**: [How to revert changes if needed]
    
    ## Resources
    - [Feature Specifications](./feature-specs.md) - Complete feature requirements and user scenarios
    - [Business Logic Specifications](../business-logic.md) - Core business rules and logic
    - [Data Model Specifications](../data-model.md) - Data structure requirements
    - [API Contract Specifications](../api-contract.md) - API interface definitions
    - [UI/UX Design Specifications](../ui-design.md) - User interface and experience requirements
    - [Infrastructure Specifications](../infrastructure.md) - Technical infrastructure requirements
    ```

    **Bootstrap Mode Template** - Keep the following simplified Markdown structure in mind for new projects:

    ```markdown
    # Feature Implementation Plan

    ## Overview
    [Feature description and purpose as foundation for the project]

    ## Process Steps

    ### Phase 1: Foundation Setup
    1. **Project Structure**
       - Set up basic project architecture
       - Establish coding standards and conventions
       - Configure development environment

    2. **Core Dependencies**
       - Install and configure essential libraries
       - Set up build and development tools
       - Establish testing framework

    ### Phase 2: Feature Implementation
    1. **Core Feature Development**
       - Implement main feature functionality
       - Create necessary data structures
       - Develop user interface components

    2. **Basic Integration**
       - Connect frontend and backend components
       - Implement basic error handling
       - Add essential validation

    ### Phase 3: Testing and Documentation
    1. **Foundation Testing**
       - Set up testing patterns and examples
       - Implement basic unit tests
       - Test core functionality

    2. **Initial Documentation**
       - Document setup and development process
       - Create basic user documentation
       - Establish documentation patterns

    ## Implementation Details

    ### Technology Stack
    - **Framework**: [Primary development framework]
    - **Dependencies**: [Core libraries and tools needed]
    - **Development Tools**: [Build tools, testing frameworks]

    ### Core Components
    - **Data Layer**: [Basic data structures and storage]
    - **Business Logic**: [Core feature functionality]
    - **User Interface**: [Essential UI components]

    ### Future Extensibility
    - **Architecture Patterns**: [Established patterns for future features]
    - **Integration Points**: [Planned extension points]
    - **General Specs**: [Placeholder for future general specifications]

    ## Dependencies and Prerequisites
    - **Technology Stack**: [Required development environment]
    - **External Services**: [Third-party services needed]
    - **Development Setup**: [Local development requirements]

    ## Risk Assessment
    - **Learning Curve**: [Technology adoption challenges]
    - **Foundation Risks**: [Architectural decisions that may need revision]
    - **Future Migration**: [Potential refactoring needs as project grows]

    ## Resources
    - [Feature Specifications](./feature-specs.md) - Complete feature requirements and user scenarios
    - [Technology Documentation] - Framework and library documentation
    - [Development Setup Guide] - Environment setup instructions
    
    ## Notes for Future Development
    - This feature serves as the foundation for the project
    - General specifications (api-contract.md, business-logic.md, etc.) should be extracted as more features are added
    - Architecture patterns established here should be consistent across future features
    ```

2. **Create the feature implementation plan (Mode-dependent)**:
    - Create a new file in your workspace: `feature-plan.md`
    - **Full Mode**: Fill in the comprehensive template with information from all analysis steps
        - Use the comprehensive phase-based structure to organize implementation tasks
        - Include detailed implementation sections based on codebase and dependency analysis
        - Add specific risk assessments and mitigation strategies identified during planning
        - Reference all relevant specification resources in the Resources section
    - **Bootstrap Mode**: Fill in the simplified template focusing on foundation setup
        - Use the foundation-focused phase structure
        - Include technology stack and core component planning
        - Add future extensibility considerations
        - Reference feature specifications and note future general specs extraction

3. **Validate and optimize the feature implementation plan (Mode-dependent)**
    - **Full Mode**: 
        - Review the plan for completeness against all specification requirements
        - Verify that all dependencies and integration points are addressed
        - Ensure the phase sequencing is logical and accounts for critical path items
        - Validate that testing and quality assurance strategies are comprehensive
        - Check that risk mitigation strategies are realistic and actionable
        - Confirm that all necessary resources and documentation are referenced
    - **Bootstrap Mode**:
        - Review the plan for foundation completeness
        - Verify that technology stack choices support the feature requirements
        - Ensure the foundation setup enables future feature development
        - Validate that basic testing and documentation patterns are established
        - Check that future extensibility considerations are documented
        - Confirm that the plan establishes good architectural patterns for the project
