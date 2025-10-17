# Feature Implementation Plan Creator

Your task is to create a feature implementation plan for the new feature based on the feature specifications. The plan you are creating will reference all required resources like specifications and guide the AI through the whole feature implementation process.

## Initial Response

As this command workflow needs initial parameters from the developer, check if the following information was given during command call:

**Required parameters**:
    - [feature name, feature folder reference, or single spec file reference]
    - [technology stack]

1. **Detect and validate feature specification source**
    - If the parameter is a **feature name**: check if a subdirectory `specs/[sanitized-feature-name]/` exists
    - If the parameter is a **folder reference**: check if the specified folder exists and contains specification files
    - If the parameter is a **single file reference**: check if the file exists and determine the feature folder from its location
    - **Auto-detect specification files**: Once the feature folder is identified, scan for all specification files in the format `[sanitized-feature-name]-[spec-type].md`

2. **Validate specification files structure**
    - Check if at least one type-specific specification file exists in the feature folder
    - Identify all available specification types (business-logic, data-model, api-contract, ui-design, etc.)
    - If no specification files are found, respond with error: `Error: No feature specification files found. Please check the feature name, folder reference, or file reference.`

3. **Check if the technology stack is supported**
    - Check if the technology stack is supported for the feature
    - Use existing technology stack if parameter is not given but there is an existing codebase

4. **Detect project state and decide on planning mode**
    - Check if general specification files exist: `specs/api-contract.md`, `specs/business-logic.md`, `specs/data-model.md`, `specs/ui-design.md`, `specs/infrastructure.md`
    - Check if there is existing codebase (beyond basic project structure)
    - Determine planning mode:
        - **Bootstrap Mode**: If most general specs are missing OR minimal codebase exists
        - **Full Mode**: If general specs exist AND substantial codebase exists

5. **Decide whether to continue with the feature implementation plan creation**
    - If feature specification files exist, continue with the appropriate planning mode
    - If there is no existing codebase and no technology stack given, respond to the developer with an error message: `Error: No technology stack given. Please provide a technology stack.`

## Process Steps

**Note**: The following steps vary based on the detected planning mode (Bootstrap vs Full Mode).

### Phase 1: Analyze the feature specification files

1. **Read all feature specification files**
    - Read all type-specific specification files found in the feature folder: `specs/[sanitized-feature-name]/`
    - Process each specification file completely to extract all required information
    - Supported specification types include: business-logic, data-model, api-contract, ui-design, and any custom types

2. **Extract and consolidate information from all specification files**
    - **Business Logic**: Extract feature name, description, user scenarios, success criteria, business rules, and edge cases
    - **Data Model**: Extract model elements, structures, validation rules, relationships, and characteristics
    - **API Contract**: Extract interfaces, input/output models, event/message models, and error handling
    - **UI Design**: Extract UI components, user flows, UX patterns, and design requirements
    - **Custom Types**: Extract any additional type-specific requirements
    - If any critical information is missing across all files, respond with an error message detailing the missing information

3. **Analyze referenced specification resources (Mode-dependent)**
    - **Full Mode**: Read and analyze all referenced general specification files: `api-contract.md`, `business-logic.md`, `data-model.md`, `ui-design.md`, `infrastructure.md`
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
    - Break down the feature into logical implementation phases based on all specification types
    - Determine optimal sequence based on dependencies across business logic, data model, API, and UI requirements
    - Identify components that can be developed in parallel
    - Plan integration milestones and testing checkpoints

2. **Risk Assessment and Mitigation**
    - Identify potential implementation challenges and blockers across all specification types
    - Plan fallback strategies and alternative approaches
    - Document known limitations and constraints from all specification files
    - Prepare contingency plans for critical path items

3. **Testing and Quality Assurance Strategy**
    - Plan unit testing approach for new components across all specification types
    - Design integration testing for affected systems
    - Plan end-to-end testing scenarios covering all user flows
    - Define success criteria and acceptance tests based on all specification requirements

#### Bootstrap Mode - Foundation Strategy

1. **Feature-First Implementation Planning**
    - Break down the feature into core implementation phases based on available specifications
    - Plan implementation as foundation for future features
    - Design for extensibility and future integration
    - Focus on establishing patterns for the project across all specification types

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
    [Comprehensive feature description including purpose, integration context, and impact on existing system based on all specification types]
    
    ## Process Steps
    
    ### Phase 1: [Phase Name - e.g., Data Model Enhancement]
    1. **[Specific Task Category]**
       - [Detailed implementation step based on data-model specifications]
       - [Specific deliverable or outcome]
       - [Validation criteria]
    
    2. **[Another Task Category]**
       - [Implementation details from business-logic specifications]
       - [Dependencies and prerequisites]
       - [Success criteria]
    
    ### Phase 2: [Phase Name - e.g., API Integration]
    1. **[API Development Tasks]**
       - [Implementation steps based on api-contract specifications]
       - [Interface requirements and error handling]
       - [Authentication and security measures]
    
    2. **[Business Logic Implementation]**
       - [Core functionality based on business-logic specifications]
       - [User scenarios and success criteria implementation]
       - [Business rules and edge case handling]
    
    ### Phase 3: [Phase Name - e.g., UI/UX Implementation]
    1. **[UI Component Development]**
       - [Component implementation based on ui-design specifications]
       - [User flow implementation]
       - [UX pattern integration]
    
    2. **[Frontend Integration]**
       - [API integration with UI components]
       - [Data binding and state management]
       - [User interaction handling]
    
    ### Phase N-1: Testing and Quality Assurance
    1. **Unit Testing**
       - [Specific testing requirements for each specification type]
       - [Test coverage expectations across all components]
    
    2. **Integration Testing**
       - [End-to-end testing scenarios covering all user flows]
       - [API integration testing]
       - [Performance and security testing]
    
    3. **User Acceptance Testing**
       - [User scenario validation from business-logic specs]
       - [UI/UX testing from ui-design specs]
       - [Accessibility and usability testing]
    
    ### Phase N: Documentation and Deployment
    1. **Technical Documentation**
       - [API documentation updates based on api-contract specs]
       - [Data model documentation updates]
       - [Architecture documentation]
    
    2. **User Documentation**
       - [User guide updates based on UI flows]
       - [Help content and troubleshooting]
    
    3. **Deployment Preparation**
       - [Migration scripts and procedures]
       - [Monitoring and rollback strategies]
    
    ## Implementation Details
    
    ### Data Model Changes
    - **New Models**: [List based on data-model specifications]
    - **Schema Updates**: [Database/storage schema modifications]
    - **Migration Strategy**: [How to handle existing data]
    - **Validation Rules**: [Data validation requirements from specs]
    
    ### API Integration
    - **New Endpoints**: [List from api-contract specifications]
    - **Authentication**: [Security requirements from api-contract specs]
    - **Error Handling**: [Error handling strategy from api-contract specs]
    - **Input/Output Models**: [Data models for API interfaces]
    
    ### UI/UX Components
    - **New Screens**: [List from ui-design specifications]
    - **Component Updates**: [Existing components to modify]
    - **User Flow Changes**: [Navigation updates from ui-design specs]
    - **UX Patterns**: [Design patterns to implement]
    
    ### Business Logic Implementation
    - **User Scenarios**: [Implementation approach for each scenario from business-logic specs]
    - **Business Rules**: [Rule implementation strategy]
    - **Edge Cases**: [Exception handling approach]
    - **Success Criteria**: [Validation and measurement approach]
    
    ### Testing Strategy
    - **Unit Testing**: [Component-level testing approach for each specification type]
    - **Integration Testing**: [System integration testing plan]
    - **UI Testing**: [User interface and experience testing]
    - **Business Logic Testing**: [Scenario and rule validation testing]
    - **Performance Testing**: [Load and performance validation]
    
    ## Dependencies and Prerequisites
    - **External Dependencies**: [Third-party libraries, services, APIs from all specs]
    - **Internal Dependencies**: [Existing components that must be updated first]
    - **Infrastructure Requirements**: [Server, database, or deployment changes needed]
    - **Team Dependencies**: [Other teams or expertise required]
    
    ## Risk Assessment
    - **Technical Risks**: [Potential technical challenges across all specification types and mitigation strategies]
    - **Integration Risks**: [Compatibility and breaking change concerns]
    - **Business Logic Risks**: [Complex business rule implementation challenges]
    - **UI/UX Risks**: [User experience and accessibility concerns]
    - **Timeline Risks**: [Critical path items and potential delays]
    - **Rollback Strategy**: [How to revert changes if needed]
    
    ## Resources
    - [Business Logic Specifications](./[sanitized-feature-name]-business-logic.md) - User scenarios, business rules, and success criteria
    - [Data Model Specifications](./[sanitized-feature-name]-data-model.md) - Data structures, validation rules, and relationships
    - [API Contract Specifications](./[sanitized-feature-name]-api-contract.md) - API interfaces, input/output models, and error handling
    - [UI Design Specifications](./[sanitized-feature-name]-ui-design.md) - UI components, user flows, and UX patterns
    - [General Business Logic](../business-logic.md) - Core business rules and logic (if exists)
    - [General Data Model](../data-model.md) - Overall data structure requirements (if exists)
    - [General API Contract](../api-contract.md) - General API interface definitions (if exists)
    - [General UI/UX Design](../ui-design.md) - Overall user interface requirements (if exists)
    - [Infrastructure Specifications](../infrastructure.md) - Technical infrastructure requirements (if exists)
    ```

    **Bootstrap Mode Template** - Keep the following simplified Markdown structure in mind for new projects:

    ```markdown
    # Feature Implementation Plan

    ## Overview
    [Feature description and purpose as foundation for the project based on all available specification types]

    ## Process Steps

    ### Phase 1: Foundation Setup
    1. **Project Structure**
       - Set up basic project architecture
       - Establish coding standards and conventions
       - Configure development environment

    2. **Core Dependencies**
       - Install and configure essential libraries based on all specification requirements
       - Set up build and development tools
       - Establish testing framework

    ### Phase 2: Feature Implementation
    1. **Data Layer Implementation**
       - Implement data structures from data-model specifications
       - Set up data validation and relationships
       - Create data access patterns

    2. **Business Logic Implementation**
       - Implement core functionality from business-logic specifications
       - Handle user scenarios and success criteria
       - Implement business rules and edge cases

    3. **API Layer Implementation**
       - Implement interfaces from api-contract specifications
       - Set up input/output handling and validation
       - Implement error handling and authentication

    4. **UI/UX Implementation**
       - Develop UI components from ui-design specifications
       - Implement user flows and navigation
       - Apply UX patterns and design guidelines

    ### Phase 3: Integration and Testing
    1. **Component Integration**
       - Connect all layers (data, business logic, API, UI)
       - Implement end-to-end functionality
       - Handle cross-specification type interactions

    2. **Foundation Testing**
       - Set up testing patterns and examples for each specification type
       - Implement basic unit tests across all components
       - Test core functionality and user scenarios

    3. **Initial Documentation**
       - Document setup and development process
       - Create basic user documentation
       - Establish documentation patterns for each specification type

    ## Implementation Details

    ### Technology Stack
    - **Framework**: [Primary development framework]
    - **Dependencies**: [Core libraries and tools needed for all specification types]
    - **Development Tools**: [Build tools, testing frameworks]

    ### Core Components
    - **Data Layer**: [Basic data structures and storage from data-model specs]
    - **Business Logic**: [Core feature functionality from business-logic specs]
    - **API Layer**: [Interface implementations from api-contract specs]
    - **User Interface**: [UI components from ui-design specs]

    ### Specification Type-Specific Implementation
    - **Business Logic Type**: [Key scenarios and rules to implement]
    - **Data Model Type**: [Critical data structures and relationships]
    - **API Contract Type**: [Essential interfaces and error handling]
    - **UI Design Type**: [Core components and user flows]

    ### Future Extensibility
    - **Architecture Patterns**: [Established patterns for future features across all specification types]
    - **Integration Points**: [Planned extension points for each specification type]
    - **General Specs**: [Placeholder for future general specifications extraction]

    ## Dependencies and Prerequisites
    - **Technology Stack**: [Required development environment for all specification types]
    - **External Services**: [Third-party services needed across all specifications]
    - **Development Setup**: [Local development requirements]

    ## Risk Assessment
    - **Learning Curve**: [Technology adoption challenges across all specification types]
    - **Foundation Risks**: [Architectural decisions that may need revision]
    - **Specification Type Integration Risks**: [Challenges in connecting different specification types]
    - **Future Migration**: [Potential refactoring needs as project grows]

    ## Resources
    - [Business Logic Specifications](./[sanitized-feature-name]-business-logic.md) - User scenarios, business rules, and success criteria
    - [Data Model Specifications](./[sanitized-feature-name]-data-model.md) - Data structures, validation rules, and relationships
    - [API Contract Specifications](./[sanitized-feature-name]-api-contract.md) - API interfaces, input/output models, and error handling
    - [UI Design Specifications](./[sanitized-feature-name]-ui-design.md) - UI components, user flows, and UX patterns
    - [Technology Documentation] - Framework and library documentation
    - [Development Setup Guide] - Environment setup instructions
    
    ## Notes for Future Development
    - This feature serves as the foundation for the project across multiple specification types
    - General specifications (api-contract.md, business-logic.md, etc.) should be extracted as more features are added
    - Architecture patterns established here should be consistent across future features
    - Each specification type (business logic, data model, API contract, UI design) should maintain consistency with patterns established in this feature
    ```

2. **Create the feature implementation plan (Mode-dependent)**:
    - Create a new file in your workspace: `[sanitized-feature-name]-plan.md`
    - **Full Mode**: Fill in the comprehensive template with information from all specification types
        - Use the comprehensive phase-based structure to organize implementation tasks across all specification types
        - Include detailed implementation sections based on all specification files and codebase analysis
        - Add specific risk assessments and mitigation strategies identified during planning
        - Reference all relevant specification resources in the Resources section
    - **Bootstrap Mode**: Fill in the simplified template focusing on foundation setup across all specification types
        - Use the foundation-focused phase structure that addresses all available specification types
        - Include technology stack and core component planning for each specification type
        - Add future extensibility considerations across all specification types
        - Reference all feature specification files and note future general specs extraction

3. **Validate and optimize the feature implementation plan (Mode-dependent)**
    - **Full Mode**: 
        - Review the plan for completeness against all specification type requirements
        - Verify that all dependencies and integration points across specification types are addressed
        - Ensure the phase sequencing is logical and accounts for cross-specification type dependencies
        - Validate that testing and quality assurance strategies cover all specification types
        - Check that risk mitigation strategies are realistic and actionable across all specification types
        - Confirm that all necessary resources and documentation from all specification types are referenced
    - **Bootstrap Mode**:
        - Review the plan for foundation completeness across all available specification types
        - Verify that technology stack choices support requirements from all specification files
        - Ensure the foundation setup enables future feature development across all specification types
        - Validate that basic testing and documentation patterns are established for each specification type
        - Check that future extensibility considerations are documented for all specification types
        - Confirm that the plan establishes good architectural patterns across all specification types
