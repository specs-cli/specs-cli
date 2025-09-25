<!--
🚀 AI EXECUTABLE WORKFLOW 🚀
This file contains executable instructions for AI agents
Purpose: Systematic feature specification workflow for AI agents/assistants
-->

# Feature Specification Workflow: {{NAME}}

## ⚠️ CRITICAL WORKFLOW VALIDATION ⚠️

**MANDATORY PRE-EXECUTION CHECKS**:

1. **TEMPLATE VERIFICATION**: You are executing `specs/{{SANITIZED_NAME}}/generate-feature-specs.md` workflow ONLY. Do NOT execute any other AI generation workflows (generate-system-specs.md, generate-feature-code.md, etc.)

2. **OUTPUT DIRECTORY ENFORCEMENT**: ALL generated files MUST be placed in `specs/{{SANITIZED_NAME}}/` directory. Do NOT create files in the root `specs/` directory.

3. **EXISTING SYSTEM CONTEXT**: Before proceeding, acknowledge that the following system-level files already exist and provide general context:
   - `specs/system-overview.md` - Contains overall system architecture and design patterns
   - `specs/infrastructure.md` - Contains deployment, hosting, and infrastructure specifications
   
   **IMPORTANT**: Do NOT recreate, modify, or overlap with these files. Use them as reference context only.

4. **SCOPE LIMITATION**: This workflow generates feature-specific specifications only. Do NOT generate system-wide architecture files.

**VALIDATION CONFIRMATION**: Before proceeding, confirm:
- [ ] I am executing generate-feature-specs.md workflow only
- [ ] I will output files to specs/{{SANITIZED_NAME}}/ directory only
- [ ] I acknowledge existing specs/system-overview.md and specs/infrastructure.md files
- [ ] I will not recreate or overlap with existing system-level specifications

## Overview

This workflow provides a systematic approach for AI agents to either generate comprehensive specifications for new features OR analyze and document existing codebase functionality. The approach differs significantly based on whether you're designing a new feature or documenting existing code.

**Target Audience**: AI coding assistants and agents
**Prerequisites**: Feature requirements (for new features) or existing codebase to analyze
**Outcome**: Complete set of specification files
**Output Location**: All generated files must be placed in the `specs/{{SANITIZED_NAME}}/` directory

## Pre-Specification Question Tracking

**CRITICAL**: During specification generation, document all open questions and ambiguities that require developer input. Never stop specification generation - instead document questions and proceed with reasonable assumptions.

### QUESTIONS.md File Structure
**AI Agent Requirement**: Create and maintain a QUESTIONS.md file throughout specification generation with the following structure:

```markdown
# Specification Questions and Clarifications Log

## Business Logic Questions
### [Scenario/Rule Name]
- **Question**: [What needs clarification about business logic]
- **Context**: [Why this question arose during specification]
- **Assumption Made**: [What assumption was made to proceed with specification]
- **Impact**: [How this affects the specification and implementation]
- **Suggested Answer**: [AI's recommended approach if applicable]
- **Developer Answer**: [Developer's response - leave blank for developer to fill]

## Data Model Questions
### [Entity/Relationship Name]
- **Question**: [What needs clarification about data structure]
- **Context**: [Why this question arose during specification]
- **Assumption Made**: [What assumption was made to proceed with specification]
- **Impact**: [How this affects data design and relationships]
- **Suggested Answer**: [AI's recommended approach if applicable]
- **Developer Answer**: [Developer's response - leave blank for developer to fill]

## API Design Questions
### [Endpoint/Interface Name]
- **Question**: [What needs clarification about API design]
- **Context**: [Why this question arose during specification]
- **Assumption Made**: [What assumption was made to proceed with specification]
- **Impact**: [How this affects API contract and integration]
- **Suggested Answer**: [AI's recommended approach if applicable]
- **Developer Answer**: [Developer's response - leave blank for developer to fill]

## UI/UX Questions
### [Component/Flow Name]
- **Question**: [What needs clarification about user interface]
- **Context**: [Why this question arose during specification]
- **Assumption Made**: [What assumption was made to proceed with specification]
- **Impact**: [How this affects user experience and design]
- **Suggested Answer**: [AI's recommended approach if applicable]
- **Developer Answer**: [Developer's response - leave blank for developer to fill]

## Integration Questions
### [Integration Point Name]
- **Question**: [What needs clarification about system integration]
- **Context**: [Why this question arose during specification]
- **Assumption Made**: [What assumption was made to proceed with specification]
- **Impact**: [How this affects system architecture and dependencies]
- **Suggested Answer**: [AI's recommended approach if applicable]
- **Developer Answer**: [Developer's response - leave blank for developer to fill]

## Requirements Clarifications
### [Requirement Area]
- **Question**: [What requirement needs clarification]
- **Context**: [Why this question arose during specification]
- **Assumption Made**: [What assumption was made to proceed with specification]
- **Impact**: [How this affects overall feature design]
- **Suggested Answer**: [AI's recommended approach if applicable]
- **Developer Answer**: [Developer's response - leave blank for developer to fill]
```

## Project Type Detection

**CRITICAL**: Before proceeding, determine if this is:
- **NEW FEATURE**: No existing implementation - design and specify new functionality
- **EXISTING CODEBASE**: Has existing code - analyze and document what currently exists without assumptions

## Specification Generation Process

### Phase 1: Requirements Analysis & Planning

#### [ ] Step 1.1: Requirements Analysis
**AI Agent Tasks**:
- **FOR NEW FEATURES**: Analyze the provided feature requirements thoroughly
- **FOR NEW FEATURES**: Identify key user personas and their needs
- **FOR NEW FEATURES**: Determine the scope and boundaries of the feature
- **FOR NEW FEATURES**: **Document any unclear or missing requirements** in QUESTIONS.md with assumptions made
- **FOR EXISTING CODEBASES**: Analyze the actual codebase to understand current functionality
- **FOR EXISTING CODEBASES**: Examine existing API endpoints, database models, and UI components
- **FOR EXISTING CODEBASES**: Identify what features are currently implemented
- **FOR EXISTING CODEBASES**: Document the actual scope and boundaries of existing functionality
- **FOR EXISTING CODEBASES**: **Document any unclear or undocumented functionality** in QUESTIONS.md for developer clarification

#### [ ] Step 1.2: Technical Architecture Assessment
**AI Agent Tasks**:
- **MANDATORY**: Read and reference `specs/system-overview.md` for overall system architecture context
- **MANDATORY**: Read and reference `specs/infrastructure.md` for deployment and infrastructure context
- **FOR NEW FEATURES**: Review existing system architecture for integration (use system-overview.md as reference)
- **FOR NEW FEATURES**: Identify technology stack and patterns to follow (from system-overview.md)
- **FOR NEW FEATURES**: Plan data storage and API patterns (consistent with infrastructure.md)
- **FOR NEW FEATURES**: Assess UI/UX design system requirements (from system-overview.md)
- **FOR NEW FEATURES**: **Document any unclear integration points or missing architectural guidance** in QUESTIONS.md
- **FOR EXISTING CODEBASES**: Analyze the actual technology stack in use (cross-reference with system-overview.md)
- **FOR EXISTING CODEBASES**: Examine existing data storage and API patterns (consistent with infrastructure.md)
- **FOR EXISTING CODEBASES**: Review current UI/UX implementation (reference system-overview.md for context)
- **FOR EXISTING CODEBASES**: Document the existing technical architecture as-is (without duplicating system-overview.md content)
- **FOR EXISTING CODEBASES**: **Document any architectural inconsistencies or unclear patterns** in QUESTIONS.md for developer review

### Phase 2: Specification Generation

#### [ ] Step 2.1: Business Logic Specification
**AI Agent Tasks**:
- **FOR NEW FEATURES**: Create comprehensive business logic specification using the embedded template, using the embedded template and output location: `specs/{{SANITIZED_NAME}}/business-logic.md`
- **FOR NEW FEATURES**: Define all user scenarios with clear "As a/I want/So that" format
- **FOR NEW FEATURES**: Specify measurable success criteria for each scenario
- **FOR NEW FEATURES**: Document all business rules with "When/Then" logic
- **FOR NEW FEATURES**: Identify and document edge cases and exceptions
- **FOR NEW FEATURES**: **Document any unclear business requirements or missing user scenarios** in QUESTIONS.md with assumptions made
- **FOR EXISTING CODEBASES**: Document the actual business logic implemented in the project, using the embedded template and output location: `specs/{{SANITIZED_NAME}}/business-logic.md`
- **FOR EXISTING CODEBASES**: Analyze existing user workflows and scenarios from the implementation
- **FOR EXISTING CODEBASES**: Document current business rules as implemented in the project, using the embedded template and output location: `specs/{{SANITIZED_NAME}}/business-logic.md`
- **FOR EXISTING CODEBASES**: Identify existing edge cases and exception handling
- **FOR EXISTING CODEBASES**: Map actual workflows and processes from the codebase
- **FOR EXISTING CODEBASES**: **Document any unclear business logic or undocumented workflows** in QUESTIONS.md for developer clarification

**Business Logic Template Structure:**
```markdown
# Business Logic: {{NAME}}

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

#### Technical Details
[Use code snippets or other representations to describe technical details if required]

## [Custom Sections]
[Add custom sections to describe what ever is important to know]
```

#### [ ] Step 2.2: Data Model Specification
**AI Agent Tasks**:
- **FOR NEW FEATURES**: Create comprehensive data model specification using the embedded template, using the embedded template and output location: `specs/{{SANITIZED_NAME}}/data-model.md`
- **FOR NEW FEATURES**: Define all entities with complete field specifications
- **FOR NEW FEATURES**: Specify data types, constraints, and validation rules
- **FOR NEW FEATURES**: Document relationships between entities
- **FOR NEW FEATURES**: Include indexing and performance considerations
- **FOR NEW FEATURES**: **Document any unclear data requirements or missing entity relationships** in QUESTIONS.md with assumptions made
- **FOR EXISTING CODEBASES**: Document the actual data models from database schemas, ORM models, or data structures, using the embedded template and output location: `specs/{{SANITIZED_NAME}}/data-model.md`
- **FOR EXISTING CODEBASES**: Analyze existing entities and their field specifications from the project codebase
- **FOR EXISTING CODEBASES**: Document current data types, constraints, and validation rules as implemented in the project, using the embedded template and output location: `specs/{{SANITIZED_NAME}}/data-model.md`
- **FOR EXISTING CODEBASES**: Map existing relationships between entities from the project codebase
- **FOR EXISTING CODEBASES**: Document current indexing and performance optimizations as implemented in the project, using the embedded template and output location: `specs/{{SANITIZED_NAME}}/data-model.md`
- **FOR EXISTING CODEBASES**: **Document any unclear data structures or undocumented relationships** in QUESTIONS.md for developer clarification

**Data Model Template Structure:**
```markdown
# Data Model: {{NAME}}

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
```

#### [ ] Step 2.3: API Contract Specification
**AI Agent Tasks**:
- **FOR NEW FEATURES**: Create comprehensive API contract specification using the embedded template, using the embedded template and output location: `specs/{{SANITIZED_NAME}}/api-contract.md`
- **FOR NEW FEATURES**: Define all endpoints with complete request/response formats
- **FOR NEW FEATURES**: Specify authentication and authorization requirements
- **FOR NEW FEATURES**: Document error handling and status codes
- **FOR NEW FEATURES**: Include rate limiting and security considerations
- **FOR NEW FEATURES**: **Document any unclear API requirements or missing endpoint specifications** in QUESTIONS.md with assumptions made
- **FOR EXISTING CODEBASES**: Document the actual API endpoints from route definitions, controllers, or API files as implemented in the project, using the embedded template and output location: `specs/{{SANITIZED_NAME}}/api-contract.md`
- **FOR EXISTING CODEBASES**: Analyze existing request/response formats from the implementation
- **FOR EXISTING CODEBASES**: Document current authentication and authorization mechanisms as implemented in the project, using the embedded template and output location: `specs/{{SANITIZED_NAME}}/api-contract.md`
- **FOR EXISTING CODEBASES**: Map existing error handling and status codes from the project codebase
- **FOR EXISTING CODEBASES**: Identify current security measures and rate limiting implementations
- **FOR EXISTING CODEBASES**: **Document any unclear API patterns or undocumented endpoints** in QUESTIONS.md for developer clarification

**API Contract Template Structure:**
```markdown
# API Contract: {{NAME}}

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
```

#### [ ] Step 2.4: UI Design Specification
**AI Agent Tasks**:
- **FOR NEW FEATURES**: Create comprehensive UI design specification using the embedded template, using the embedded template and output location: `specs/{{SANITIZED_NAME}}/ui-design.md`
- **FOR NEW FEATURES**: Define all UI components with detailed specifications
- **FOR NEW FEATURES**: Document user flows and navigation patterns
- **FOR NEW FEATURES**: Specify responsive design and accessibility requirements
- **FOR NEW FEATURES**: Include interaction patterns and feedback mechanisms
- **FOR NEW FEATURES**: **Document any unclear UI requirements or missing design specifications** in QUESTIONS.md with assumptions made
- **FOR EXISTING CODEBASES**: Document the actual UI components from React/Vue/Angular components or HTML/CSS files as implemented in the project, using the embedded template and output location: `specs/{{SANITIZED_NAME}}/ui-design.md`
- **FOR EXISTING CODEBASES**: Analyze existing user flows and navigation patterns from the implementation
- **FOR EXISTING CODEBASES**: Document current responsive design and accessibility features as implemented in the project, using the embedded template and output location: `specs/{{SANITIZED_NAME}}/ui-design.md`
- **FOR EXISTING CODEBASES**: Map existing interaction patterns and feedback mechanisms
- **FOR EXISTING CODEBASES**: Document the current design system and UI patterns in use as implemented in the project, using the embedded template and output location: `specs/{{SANITIZED_NAME}}/ui-design.md`
- **FOR EXISTING CODEBASES**: **Document any unclear UI patterns or undocumented components** in QUESTIONS.md for developer clarification

**UI Design Template Structure:**
```markdown
# UI/UX Design: {{NAME}}

## UI Components

### [Component Name]
[Specify the UI component]

## User Flows

### [Flow Name]
[Use Mermaid syntax to describe the user flow]

## UX Patterns

### [Pattern Name]
[Specify the UX pattern]

## [Custom Sections]
[Specify what ever is important for the applications user interface]
```

### Phase 3: Cross-Specification Validation

#### [ ] Step 3.1: Consistency Validation
**AI Agent Tasks**:
- **FOR NEW FEATURES**: Verify data model entities match API contract references
- **FOR NEW FEATURES**: Ensure UI design components align with business logic specifications
- **FOR NEW FEATURES**: Validate that all user scenarios have corresponding UI flows
- **FOR NEW FEATURES**: **Document any consistency issues or missing cross-references** in QUESTIONS.md for developer review
- **FOR EXISTING CODEBASES**: Verify documented data models match actual API implementations
- **FOR EXISTING CODEBASES**: Ensure documented UI components align with actual business logic in code
- **FOR EXISTING CODEBASES**: Validate that documented user scenarios match actual UI flows
- **FOR EXISTING CODEBASES**: Check consistency between documented specifications and actual code
- **FOR EXISTING CODEBASES**: **Document any inconsistencies between specifications and implementation** in QUESTIONS.md for developer review

#### [ ] Step 3.2: Completeness Assessment
**AI Agent Tasks**:
- **FOR NEW FEATURES**: Verify all business scenarios have supporting data models
- **FOR NEW FEATURES**: Ensure all UI components have corresponding API endpoints
- **FOR NEW FEATURES**: Check that all data relationships are properly defined
- **FOR NEW FEATURES**: **Document any missing specifications or incomplete coverage** in QUESTIONS.md for developer input
- **FOR EXISTING CODEBASES**: Verify all implemented business scenarios are documented
- **FOR EXISTING CODEBASES**: Ensure all existing UI components are documented with their API dependencies
- **FOR EXISTING CODEBASES**: Check that all existing data relationships are captured
- **FOR EXISTING CODEBASES**: Confirm all implemented features are properly documented
- **FOR EXISTING CODEBASES**: **Document any undocumented features or incomplete coverage** in QUESTIONS.md for developer clarification

#### [ ] Step 3.3: Integration Points Documentation
**AI Agent Tasks**:
- **FOR NEW FEATURES**: Document how the feature integrates with existing systems
- **FOR NEW FEATURES**: Identify potential conflicts or dependencies
- **FOR NEW FEATURES**: Specify migration or upgrade requirements
- **FOR NEW FEATURES**: **Document any unclear integration requirements or missing dependencies** in QUESTIONS.md for developer guidance
- **FOR EXISTING CODEBASES**: Document how existing features integrate with other system components
- **FOR EXISTING CODEBASES**: Identify actual dependencies and integrations from the codebase
- **FOR EXISTING CODEBASES**: Document existing migration patterns or upgrade mechanisms
- **FOR EXISTING CODEBASES**: Map actual system boundaries and integration points
- **FOR EXISTING CODEBASES**: **Document any unclear integration patterns or undocumented dependencies** in QUESTIONS.md for developer clarification

### Phase 4: Quality Assurance & Finalization

#### [ ] Step 4.1: Specification Review
**AI Agent Tasks**:
- **FOR NEW FEATURES**: Review all specifications for clarity and completeness
- **FOR NEW FEATURES**: Ensure technical feasibility of all requirements
- **FOR NEW FEATURES**: Validate that success criteria are measurable
- **FOR NEW FEATURES**: Check that all assumptions are documented
- **FOR NEW FEATURES**: **Document any final concerns or missing information** in QUESTIONS.md for developer review before implementation
- **FOR EXISTING CODEBASES**: Review specifications for accuracy against actual code
- **FOR EXISTING CODEBASES**: Ensure all documented features match the implementation
- **FOR EXISTING CODEBASES**: Validate that documented behavior reflects actual system behavior
- **FOR EXISTING CODEBASES**: Check that no assumptions were made about non-existent features
- **FOR EXISTING CODEBASES**: **Document any final discrepancies or unclear areas** in QUESTIONS.md for developer clarification

#### [ ] Step 4.2: Documentation Standards
**AI Agent Tasks**:
- **FOR NEW FEATURES**: Ensure all specifications follow consistent formatting
- **FOR NEW FEATURES**: Validate that technical details are sufficient for implementation
- **FOR EXISTING CODEBASES**: Ensure all specifications accurately reflect the current codebase
- **FOR EXISTING CODEBASES**: Validate that documented technical details match actual implementation
- **FOR EXISTING CODEBASES**: Confirm that specifications represent the status quo without assumptions

## AI Agent Quality Gates

### Gate 1: Requirements Understanding Complete
**AI Agent Validation**:
- All feature requirements are clearly understood and documented or captured as questions in QUESTIONS.md
- User personas and their needs are identified or documented as questions in QUESTIONS.md
- Feature scope and boundaries are defined or unclear boundaries are noted in QUESTIONS.md
- Integration points are identified and documented or unclear dependencies are noted in QUESTIONS.md
- Any assumptions or clarifications needed are documented in QUESTIONS.md

### Gate 2: Business Logic Specification Complete
**AI Agent Validation**:
- All user scenarios are documented with clear "As a/I want/So that" format or gaps are documented in QUESTIONS.md
- Success criteria are measurable and specific or unclear criteria are noted in QUESTIONS.md
- All business rules are defined with "When/Then" logic or unclear rules are documented in QUESTIONS.md
- Edge cases and exceptions are identified and handled or unclear cases are noted in QUESTIONS.md
- Technical details are sufficient for implementation or missing details are documented in QUESTIONS.md

### Gate 3: Data Model Specification Complete
**AI Agent Validation**:
- All entities are defined with complete field specifications or unclear fields are documented in QUESTIONS.md
- Data types, constraints, and validation rules are specified or unclear rules are noted in QUESTIONS.md
- Relationships between entities are clearly documented or unclear relationships are noted in QUESTIONS.md
- Performance and indexing considerations are included or unclear requirements are documented in QUESTIONS.md
- Data integrity and consistency rules are defined or unclear rules are noted in QUESTIONS.md

### Gate 4: API Contract Specification Complete
**AI Agent Validation**:
- All endpoints are defined with complete request/response formats or missing formats are documented in QUESTIONS.md
- Authentication and authorization requirements are specified or unclear requirements are noted in QUESTIONS.md
- Error handling and status codes are documented or unclear patterns are noted in QUESTIONS.md
- Security considerations are addressed or unclear requirements are documented in QUESTIONS.md
- API versioning and compatibility are planned or unclear strategies are noted in QUESTIONS.md

### Gate 5: UI Design Specification Complete
**AI Agent Validation**:
- All UI components are specified with detailed requirements or unclear requirements are documented in QUESTIONS.md
- User flows and navigation patterns are documented or unclear flows are noted in QUESTIONS.md
- Responsive design and accessibility requirements are included or unclear requirements are documented in QUESTIONS.md
- Interaction patterns and feedback mechanisms are defined or unclear patterns are noted in QUESTIONS.md
- Design system consistency is ensured or unclear patterns are documented in QUESTIONS.md

### Gate 6: Cross-Specification Validation Complete
**AI Agent Validation**:
- Data model entities match API contract references or inconsistencies are documented in QUESTIONS.md
- UI design components align with business logic specifications or misalignments are noted in QUESTIONS.md
- All user scenarios have corresponding UI flows or missing flows are documented in QUESTIONS.md
- API endpoints support all business logic requirements or gaps are noted in QUESTIONS.md
- Error handling is consistent across all specifications or inconsistencies are documented in QUESTIONS.md
- Integration points are properly documented or unclear points are noted in QUESTIONS.md
- QUESTIONS.md is complete and ready for developer review
- Specifications are complete, consistent, and implementation-ready

## AI Agent Success Criteria

**Final Validation Checklist**:
- All four specification files are created and complete:
  - `specs/{{SANITIZED_NAME}}/business-logic.md` with comprehensive user scenarios and business rules
  - `specs/{{SANITIZED_NAME}}/data-model.md` with complete entity definitions and relationships
  - `specs/{{SANITIZED_NAME}}/api-contract.md` with detailed endpoint specifications and error handling
  - `specs/{{SANITIZED_NAME}}/ui-design.md` with comprehensive component and flow specifications
- **CRITICAL**: No files created in root `specs/` directory (only in `specs/{{SANITIZED_NAME}}/`)
- **CRITICAL**: No overlap or duplication with existing `specs/system-overview.md` and `specs/infrastructure.md`
- All specifications are internally consistent and cross-validated
- Technical feasibility is confirmed for all requirements
- Success criteria are measurable and testable
- Integration points and dependencies are documented (referencing system-overview.md and infrastructure.md)
- Specifications are ready for implementation using generate-feature-code.md workflow
- All assumptions and clarifications are documented
- Specifications follow consistent formatting and documentation standards
- **VALIDATION**: Confirmed execution of generate-feature-specs.md workflow only (not other AI generation workflows)

## Usage Instructions for Developers

**To generate specifications for a new feature:**
1. Provide the AI agent with feature requirements
2. Execute this prompt: "Generate comprehensive specifications for [Feature Name] by following the workflow in generate-feature-specs.md"
3. Review each generated specification file
4. Request clarifications or modifications as needed
5. Once approved, use generate-feature-code.md for implementation

**What the AI will deliver:**
- Complete specs/{{SANITIZED_NAME}}/business-logic.md with all user scenarios and business rules
- Complete specs/{{SANITIZED_NAME}}/data-model.md with all entities and relationships
- Complete specs/{{SANITIZED_NAME}}/api-contract.md with all endpoints and contracts
- Complete specs/{{SANITIZED_NAME}}/ui-design.md with all components and flows
- Cross-validated specifications ready for implementation
- Documentation of any assumptions or clarifications needed

**When to use this workflow:**
- Starting a new feature from requirements
- Documenting existing features that lack specifications
- Ensuring comprehensive specification coverage before implementation
- Standardizing specification format across projects
- Preparing for systematic implementation using generate-feature-code.md