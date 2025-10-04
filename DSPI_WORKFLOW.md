# DSPI Workflow

**Describe → Specify → Plan → Implement**

The DSPI Workflow is a systematic approach to Specification-Driven Development (SDD) that ensures high-quality, maintainable software through comprehensive documentation and structured implementation phases.

## Overview

The DSPI Workflow consists of four sequential phases that must be followed in order:

1. **Describe (D)**: Define the feature requirements and context
2. **Specify (S)**: Create detailed technical specifications
3. **Plan (P)**: Develop implementation strategy and roadmap
4. **Implement (I)**: Execute the plan with quality assurance

Each phase builds upon the previous one, ensuring that all aspects of feature development are thoroughly considered before implementation begins.

## Core Principles

### 1. Specification-First Development
- All development begins with comprehensive, technology-agnostic specifications
- Specifications serve as the single source of truth for feature requirements
- Implementation follows specifications exactly, not the other way around

### 2. Sequential Workflow Adherence
- Phases must be completed in order: D → S → P → I
- No phase can be skipped or rushed
- Each phase has specific quality gates that must be met before proceeding

### 3. Quality and Consistency
- Maintain high standards throughout all phases
- Follow established templates and patterns rigorously
- Validate completeness at each transition point

## Project Structure

The DSPI Workflow creates and maintains a specific project structure:

```
project-root/
├── specs/
│   ├── api-contract.md                # Global API specifications
│   ├── business-logic.md              # Global business logic specifications
│   ├── data-model.md                  # Global data model specifications
│   ├── infrastructure.md              # Global infrastructure specifications
│   ├── ui-design.md                   # Global UI/UX design specifications
│   └── [feature-name]/
│       ├── STORY.md                   # Manual feature description
│       ├── [feature-name]-specs.md    # Combined feature specifications
│       └── [feature-name]-plan.md     # Feature implementation plan
├── commands/                          # Workflow command files
│   ├── create_feature_plan.md
│   ├── create_feature_specs.md
│   ├── extract_api_contract.md
│   ├── extract_business_logic.md
│   ├── extract_data_model.md
│   ├── extract_infrastructure.md
│   ├── extract_ui_design.md
│   └── implement_feature_plan.md
└── [source code directories]
```

## Phase 0: Global Specification Extraction (Existing Codebases)

**Purpose**: Extract comprehensive specifications from existing codebases to establish a baseline for future development.

**When Required**: MANDATORY for all existing codebases before any feature development begins.

### Process

1. **Business Logic Extraction**
   - Command: `extract_business_logic`
   - Output: `specs/business-logic.md`
   - Analyzes core business rules, workflows, and domain logic

2. **Data Model Extraction**
   - Command: `extract_data_model`
   - Output: `specs/data-model.md`
   - Documents entities, relationships, and data structures

3. **API Contract Extraction**
   - Command: `extract_api_contract`
   - Output: `specs/api-contract.md`
   - Captures interface specifications and communication protocols

4. **UI Design Extraction**
   - Command: `extract_ui_design`
   - Output: `specs/ui-design.md`
   - Documents user interface patterns and design systems

5. **Infrastructure Extraction**
   - Command: `extract_infrastructure`
   - Output: `specs/infrastructure.md`
   - Captures deployment, configuration, and operational requirements

### Quality Gates
- All five global specification files must exist and be complete
- Specifications must accurately reflect the current codebase
- No feature development can proceed without complete global specifications

## Phase 1: Describe (D)

**Purpose**: Define the feature requirements, context, and boundaries through manual documentation.

### Process

1. **Create STORY.md**
   - Developer manually creates comprehensive feature description
   - Must include clear feature description and business value
   - For first feature: Include vision statement, architecture, business context, technology stack, and feature boundaries

2. **Content Requirements**
   - Feature Description (mandatory)
   - Business Context and Value
   - User Stories or Use Cases
   - Success Criteria
   - Feature Boundaries and Constraints

### Quality Gates
- STORY.md exists with clear, comprehensive description
- Business value is articulated
- Feature boundaries are well-defined
- Requirements are unambiguous

## Phase 2: Specify (S)

**Purpose**: Transform the feature description into detailed, technology-agnostic specifications.

### Process

1. **Command Execution**
   - Command: `create_feature_specs with STORY.md`
   - Creates feature-specific directory structure
   - Moves STORY.md into the feature directory

2. **Specification Generation**
   - Analyzes STORY.md and existing global specifications
   - Creates comprehensive `[feature-name]-specs.md` with sections:
     - Business Logic Specifications
     - Data Model Specifications
     - API Contract Specifications
     - UI/UX Design Specifications
     - Open Questions and Clarifications

3. **Interactive Clarification**
   - Resolve all open questions through developer interaction
   - Update specifications with clarified requirements
   - Ensure all ambiguities are eliminated

### Operating Modes

**Bootstrap Mode** (New Projects):
- Focus on foundational patterns and extensibility
- Establish architectural principles
- Create templates for future features

**Full Mode** (Existing Projects):
- Analyze integration with existing specifications
- Maintain consistency with established patterns
- Consider impact on existing functionality

### Quality Gates
- Complete `[feature-name]-specs.md` following template structure
- All open questions resolved and documented
- Technology-agnostic specifications
- Consistency with global specifications (if applicable)

## Phase 3: Plan (P)

**Purpose**: Create a detailed implementation strategy and roadmap based on the specifications.

### Process

1. **Command Execution**
   - Command: `create_feature_plan with [feature-name]-specs.md`
   - Analyzes feature specifications and technical context
   - Determines appropriate technology stack and patterns

2. **Plan Generation**
   - Creates `[feature-name]-plan.md` with structured implementation approach:
     - Implementation Phases (logical groupings of work)
     - Specific Tasks and Deliverables
     - Technical Approach and Patterns
     - Testing Strategies
     - Risk Assessment and Mitigation
     - Integration Considerations

3. **Mode-Specific Planning**
   - **Bootstrap Mode**: Focus on foundation establishment and extensibility patterns
   - **Full Mode**: Emphasize integration points, risk assessment, and consistency maintenance

### Quality Gates
- Complete `[feature-name]-plan.md` following template structure
- Logical phase organization with clear dependencies
- All requirements from specifications addressed
- Comprehensive testing strategy included
- Risk mitigation strategies defined

## Phase 4: Implement (I)

**Purpose**: Execute the implementation plan with rigorous quality assurance.

### Process

1. **Command Execution**
   - Command: `implement_feature_plan with [feature-name]-plan.md`
   - Follows the plan phases in sequential order
   - Maintains consistency with existing codebase patterns

2. **Implementation Execution**
   - Execute each phase according to the plan
   - Implement all specified functionality
   - Follow established coding patterns and conventions
   - Handle both new code creation and existing code modifications

3. **Quality Assurance**
   - Implement comprehensive testing as specified
   - Run all existing and new tests
   - Validate implementation against specifications
   - Ensure end-to-end functionality

4. **Completion Validation**
   - Build and deploy processes
   - Generate necessary artifacts
   - Validate complete feature functionality
   - Update documentation as needed

### Quality Gates
- All plan phases completed successfully
- Code follows established patterns and conventions
- All tests pass (existing and new)
- Implementation matches specifications exactly
- Feature functions end-to-end as specified

## Command System

The DSPI Workflow is supported by eight command files that automate various aspects of the process:

### Extraction Commands (Phase 0)
- `extract_business_logic.md`
- `extract_data_model.md`
- `extract_api_contract.md`
- `extract_ui_design.md`
- `extract_infrastructure.md`

### Development Commands (Phases 2-4)
- `create_feature_specs.md`
- `create_feature_plan.md`
- `implement_feature_plan.md`

### Command Management
- Commands should be available locally in the `commands/` directory
- Can be downloaded from the specs-cli repository as needed
- Commands are designed to work with any AI-powered IDE or development environment

## Best Practices

### For New Projects (Bootstrap Mode)
- Start with a comprehensive first feature that establishes architectural foundations
- Design for extensibility and future feature development
- Create reusable patterns and templates
- Plan for eventual global specification extraction

### For Existing Projects (Full Mode)
- ALWAYS complete global specification extraction before feature development
- Maintain consistency with existing patterns and conventions
- Analyze integration points thoroughly
- Update global specifications after each feature
- Consider impact on existing functionality

### Universal Best Practices
- Never skip phases or rush through specifications
- Maintain technology-agnostic specifications until implementation
- Follow templates and patterns exactly
- Validate quality at every transition point
- Keep specifications and code synchronized
- Use clear, descriptive naming conventions (kebab-case recommended)

## Success Metrics

### Specification Quality
- Templates followed completely
- Technology-agnostic until implementation
- Comprehensive coverage of all requirements
- Clear, unambiguous documentation

### Workflow Adherence
- Sequential completion of all phases
- Proper validation at each quality gate
- Complete documentation at each step
- No shortcuts or skipped phases

### Implementation Success
- Code matches specifications exactly
- All tests pass consistently
- Seamless integration with existing systems
- Maintainable, high-quality code

## Error Handling and Recovery

### Common Issues and Solutions

**Missing Global Specifications**:
- For existing codebases, halt all feature work
- Complete Phase 0 extraction process
- Validate all five global specifications exist

**Incomplete Specifications**:
- Return to specification phase
- Resolve all open questions
- Update documentation before proceeding

**Implementation Deviations**:
- Compare implementation against specifications
- Update code to match specifications (not vice versa)
- Re-run quality assurance processes

**Quality Gate Failures**:
- Identify specific failure points
- Address issues systematically
- Re-validate before proceeding

## Maintenance and Evolution

### Ongoing Responsibilities
- Update global specifications after each feature
- Extract new patterns and conventions
- Maintain consistency across all documentation
- Regular validation of specification accuracy

### Continuous Improvement
- Refine templates based on experience
- Update command files as needed
- Enhance quality gates and validation processes
- Gather feedback and iterate on the workflow

---

The DSPI Workflow ensures systematic, high-quality software development through comprehensive specification-driven practices. By following this workflow rigorously, teams can achieve consistent, maintainable, and well-documented software systems that meet requirements precisely and integrate seamlessly with existing codebases.