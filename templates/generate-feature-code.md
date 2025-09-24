<!--
🚀 AI EXECUTABLE WORKFLOW 🚀
This file contains executable instructions for AI agents
Purpose: Systematic implementation workflow for AI agents/assistants
-->

# Feature Implementation Workflow: {{NAME}}

## ⚠️ CRITICAL WORKFLOW VALIDATION ⚠️

**MANDATORY PRE-EXECUTION CHECKS**:

1. **TEMPLATE VERIFICATION**: You are executing `specs/{{SANITIZED_NAME}}/generate-feature-code.md` workflow ONLY. Do NOT execute any other AI generation workflows (generate-feature-specs.md, generate-system-specs.md, etc.)

2. **PREREQUISITE VALIDATION**: All specification files must exist before implementation:
   - `specs/{{SANITIZED_NAME}}/business-logic.md`
   - `specs/{{SANITIZED_NAME}}/data-model.md`
   - `specs/{{SANITIZED_NAME}}/api-contract.md`
   - `specs/{{SANITIZED_NAME}}/ui-design.md`

3. **SCOPE LIMITATION**: This workflow implements features based on existing specifications only. Do NOT generate new specifications.

**VALIDATION CONFIRMATION**: Before proceeding, confirm:
- [ ] I am executing generate-feature-code.md workflow only
- [ ] All required specification files exist and are complete
- [ ] I will implement based on existing specifications only
- [ ] I will not generate new specification files during implementation

## Overview

This workflow provides a systematic 5-phase approach for AI agents to implement features following specification-driven development. Each phase includes specific tasks, quality gates, and validation criteria to ensure comprehensive and reliable implementation.

**Target Audience**: AI coding assistants and agents
**Prerequisites**: All specification files must exist and be complete
**Outcome**: Production-ready feature with comprehensive testing and documentation

## Pre-Implementation Validation & Issue Tracking

**CRITICAL**: Assess all required specifications and document any gaps or issues. Never stop implementation - instead document problems and proceed with reasonable assumptions.

### ISSUES.md File Structure
**AI Agent Requirement**: Create and maintain an ISSUES.md file throughout implementation with the following structure:

```markdown
# Implementation Issues and Assumptions Log

## Specification Gaps
### [Phase/Component Name]
- **Issue**: [Description of missing or unclear specification]
- **Assumption Made**: [What assumption was made to proceed]
- **Implementation Approach**: [How the issue was resolved]
- **Impact**: [Potential risks or limitations]
- **Requires Clarification**: [Yes/No - whether developer input is needed]

## Implementation Decisions
### [Phase/Component Name]
- **Decision**: [What implementation choice was made]
- **Reason**: [Why this approach was chosen]
- **Alternatives Considered**: [Other options that were evaluated]
- **Trade-offs**: [Benefits and drawbacks of the chosen approach]

## Untestable Scenarios
### [Phase/Component Name]
- **Scenario**: [What cannot be tested]
- **Reason**: [Why it cannot be tested]
- **Workaround**: [How the issue was addressed]
- **Risk**: [Potential impact of not testing]

## Missing Requirements
### [Phase/Component Name]
- **Missing**: [What requirement is missing]
- **Default Applied**: [What default behavior was implemented]
- **Justification**: [Why this default was chosen]
- **Validation Needed**: [How to verify this is correct]
```

### Step 1: Project State Assessment
**AI Agent Tasks**:
- **Analyze existing codebase** to determine if this is the first feature or an additional feature
- **Check for existing project structure** (package.json, requirements.txt, build files, etc.)
- **Identify existing features** by examining the `/specs/` directory for other feature folders

### Step 2: Required Specification Files
- `/specs/system-overview.md` - Architecture, tech stack, and high-level design
- `/specs/infrastructure.md` - Deployment, hosting, and operational requirements
- `/specs/{{SANITIZED_NAME}}/business-logic.md` - User scenarios, business rules, and workflows  
- `/specs/{{SANITIZED_NAME}}/data-model.md` - Data structures, relationships, and validation rules
- `/specs/{{SANITIZED_NAME}}/api-contract.md` - API endpoints, request/response formats, and error handling
- `/specs/{{SANITIZED_NAME}}/ui-design.md` - User interface components, flows, and design patterns

### Step 3: Integration Analysis (For Existing Projects)
**AI Agent Tasks** (Skip if this is the first feature):
- **Analyze existing data models** and identify integration points with new feature
- **Review existing API patterns** and ensure consistency with new endpoints
- **Examine existing UI components** and identify reusable elements or design patterns
- **Check existing business logic** for potential conflicts or dependencies
- **Validate existing test patterns** and coverage to maintain consistency

### Specification Quality Assessment
**AI Agent Tasks** (Execute BEFORE any implementation):
- **Completeness Validation**: Verify each specification file contains all required sections:
  - System Overview: Architecture, tech stack, coding standards, project structure
  - Infrastructure: Deployment strategy, security requirements, performance benchmarks
  - Business Logic: Complete user scenarios with success criteria, all business rules with conditions
  - Data Model: All entities with fields, types, constraints, relationships, validation rules
  - API Contract: All endpoints with parameters, responses, error codes, authentication
  - UI Design: All components with behavior, styling, responsive design, accessibility

- **Consistency Validation**: Check for conflicts between specification files:
  - Data model entities match API contract references
  - UI design components align with business logic specifications
  - Infrastructure requirements support system architecture choices
  - Security requirements consistent across all specification files

- **Clarity Assessment**: Identify ambiguous or incomplete requirements:
  - Vague language requiring interpretation ("should", "might", "could")
  - Missing edge case definitions or error handling specifications
  - Undefined integration points or external dependencies
  - Unclear success criteria or acceptance conditions

- **Measurability Check**: Ensure all requirements have concrete validation criteria:
  - Business rules have testable conditions and outcomes
  - Performance requirements include specific benchmarks
  - User scenarios include measurable success indicators
  - Quality requirements define specific validation methods

### Validation Rules & Issue Documentation
1. **Document all gaps and ambiguities** in specification quality assessment - never stop implementation
2. **Create issue tracking log** for any incomplete or conflicting requirements found
3. **Verify consistency** across all specification files with documented cross-references
4. **Confirm measurable criteria** exist for all requirements and success conditions
5. **For existing projects**: Validate compatibility with existing system without breaking changes
6. **Document assessment results** with specific gaps identified and implementation assumptions made
7. **Create ISSUES.md file** to track all specification gaps, assumptions, and implementation decisions
8. **Mark incomplete specs** with clear indicators and proceed with reasonable defaults
9. **Document all assumptions** made when specifications are unclear or missing details
10. **Continue implementation** using best practices when specifications are insufficient

## Implementation Phases

### Phase 1: Foundation Setup
**AI Agent Objective**: Establish technical foundation using specifications

#### [ ] Step 1.1: Environment & Project Structure
**AI Agent Tasks**:
- Read `/specs/system-overview.md` and `/specs/infrastructure.md`
- **Document any missing or unclear specifications** in ISSUES.md with implementation assumptions
- **If first feature**: Set up complete project structure according to specified architecture
- **If additional feature**: Verify existing project structure matches specifications and is up-to-date
- **If first feature**: Configure build tools, dependencies, and development environment from scratch
- **If additional feature**: Update dependencies only if required by new feature, maintaining compatibility
- **If first feature**: Initialize version control and basic project files
- **If additional feature**: Ensure version control is properly configured and create feature branch
- **Log any specification gaps** encountered and document the default choices made

#### [ ] Step 1.2: Data Layer Implementation
**AI Agent Tasks**:
- Read `/specs/{{SANITIZED_NAME}}/data-model.md` thoroughly and understand all entities and relationships
- **Document missing entity definitions, unclear relationships, or incomplete validation rules** in ISSUES.md
- **If first feature**: Implement all data models with exact specifications (fields, types, constraints)
- **If additional feature**: Implement new data models and update existing ones if needed, ensuring backward compatibility
- **If first feature**: Create database schemas, migrations, and indexes as required
- **If additional feature**: Create new migrations for schema changes, ensuring existing data integrity
- Implement all validation rules and business constraints from specifications
- **Document any assumed validation rules** when specifications are incomplete
- **If first feature**: Set up data access patterns (repositories, DAOs, ORMs) following architecture guidelines
- **If additional feature**: Follow existing data access patterns and extend them for new entities
- **If additional feature**: Verify relationships and foreign keys with existing entities work correctly
- Create seed data and fixtures for testing if specified
- **Log any missing test data specifications** and document the test data created
- Write comprehensive unit tests with complete coverage validation:
  - Every data model method has corresponding test cases
  - All validation rules tested with valid and invalid inputs
  - All error conditions and edge cases covered
  - All database operations tested with mock and integration scenarios
- **Track any untestable scenarios** due to incomplete specifications in ISSUES.md

#### [ ] Step 1.3: API Foundation
**AI Agent Tasks**:
- Read `/specs/{{SANITIZED_NAME}}/api-contract.md` thoroughly
- **Document missing endpoint specifications, unclear request/response formats, or incomplete error handling** in ISSUES.md
- **If first feature**: Implement all specified API endpoints with correct signatures
- **If additional feature**: Implement new API endpoints following existing patterns and conventions
- Set up request/response data structures as defined
- **Document any assumed data structures** when specifications are incomplete
- **If first feature**: Implement error handling patterns according to specifications
- **If additional feature**: Follow existing error handling patterns and extend them for new endpoints
- **If additional feature**: Ensure new endpoints integrate properly with existing authentication/authorization
- Add API documentation and input validation
- **If additional feature**: Update existing API documentation to include new endpoints
- **Log any missing validation rules** and document the validation logic implemented
- Write integration tests covering all endpoints
- **Track any untestable API scenarios** due to incomplete specifications in ISSUES.md

### Phase 2: Business Logic Implementation
**AI Agent Objective**: Implement core business functionality

#### [ ] Step 2.1: Core Business Rules & Services
**AI Agent Tasks**:
- Read `/specs/{{SANITIZED_NAME}}/business-logic.md` thoroughly and map all user scenarios
- **Document missing business rules, unclear specifications, or incomplete user scenarios** in ISSUES.md
- Implement every business rule with exact "When/Then" logic as specified
- **Document any assumed business logic** when specifications are unclear or missing
- Create service layer components that orchestrate data and API interactions
- Implement all workflow processes and state transitions as documented
- **Log any missing state transition definitions** and document the logic implemented
- Handle every edge case and exception scenario with proper error messages
- **Document any assumed edge cases** when specifications don't cover all scenarios
- Implement authorization and permission checks as specified
- **Track any missing authorization specifications** and document the security model implemented
- Write comprehensive unit tests with complete business logic validation:
  - Every business rule tested with all specified conditions
  - All user scenario paths covered with success and failure cases
  - Every workflow state transition tested
  - All authorization and permission checks validated
  - All error handling and exception scenarios covered
- **Document any untestable business logic** due to incomplete specifications in ISSUES.md

#### [ ] Step 2.2: User Scenarios & Integration
**AI Agent Tasks**:
- Implement each user scenario from `/specs/{{SANITIZED_NAME}}/business-logic.md` with complete "As a/I want/So that" flows
- **Document any incomplete or unclear user scenarios** in ISSUES.md with implementation assumptions
- Verify every success criteria is met and automatically testable
- **Log any missing success criteria** and document the validation approach used
- Validate business rule enforcement works correctly across all scenarios
- Test integration between business logic and data layer thoroughly
- **Track any integration issues** or missing integration specifications in ISSUES.md
- Create integration tests for complete user scenarios
- **Document any untestable user scenarios** due to incomplete specifications
- Document any implementation decisions or specification clarifications made in ISSUES.md

### Phase 3: User Interface Development
**AI Agent Objective**: Create user-facing components and interactions

#### [ ] Step 3.1: UI Components & Styling
**AI Agent Tasks**:
- Read `/specs/{{SANITIZED_NAME}}/ui-design.md` thoroughly
- **Document missing UI specifications, unclear design patterns, or incomplete styling guidelines** in ISSUES.md
- Implement all specified UI components with exact specifications
- **Document any assumed UI behaviors** when specifications are incomplete
- Apply design patterns, styling guidelines, and responsive design
- **Log any missing design system specifications** and document the design choices made
- Implement accessibility features as specified
- **Track any missing accessibility requirements** and document the accessibility standards applied
- Create reusable component library with documentation
- **Document any assumed component behaviors** in ISSUES.md

#### [ ] Step 3.2: User Flows & State Management
**AI Agent Tasks**:
- Implement all user flows from `/specs/{{SANITIZED_NAME}}/ui-design.md`
- **Document missing user flow specifications or unclear navigation patterns** in ISSUES.md
- Connect UI components to business logic layer
- **Log any missing integration specifications** between UI and business logic
- Implement state management according to architecture specifications
- **Document any assumed state management patterns** when specifications are unclear
- Add user feedback, loading states, and error handling
- **Track any missing UX specifications** for feedback and error states in ISSUES.md
- Test all user interactions and navigation paths
- **Document any untestable user flows** due to incomplete specifications

### Phase 4: Integration & Testing
**AI Agent Objective**: Ensure complete system integration and validation

#### [ ] Step 4.1: System Integration & Validation
**AI Agent Tasks**:
- Integrate all layers (data, business logic, API, UI) according to specifications
- **Document any integration issues or missing integration specifications** in ISSUES.md
- Verify all API contracts are correctly implemented and functional
- **Log any API contract discrepancies** and document the implementation approach used
- Test complete data flow through entire system
- **Track any untestable data flows** due to incomplete specifications
- Validate error handling and edge cases across all layers
- **Document any missing error handling specifications** and the error handling implemented
- Run security validation according to `/specs/infrastructure.md`
- **Log any missing security specifications** and document the security measures applied

#### [ ] Step 4.2: Comprehensive Testing & Quality Assurance
**AI Agent Tasks**:
- Execute comprehensive test validation with complete coverage verification:
  - All unit tests pass without failures or warnings
  - Every public method and function has corresponding test cases
  - All conditional logic branches tested with appropriate inputs
  - All error paths and exception handling validated
  - All integration points between components tested
- **Document any untestable code paths** due to incomplete specifications in ISSUES.md
- Run all integration tests and verify they pass
- **Log any integration test failures** and document workarounds or assumptions made
- Perform end-to-end testing of all user scenarios from specifications
- **Track any untestable user scenarios** due to missing specifications
- Conduct performance testing if requirements specified
- **Document any missing performance requirements** and the benchmarks used
- Validate implementation against all success criteria in specifications
- **Log any missing success criteria** and document the validation approach used

### Phase 5: Deployment & Documentation
**AI Agent Objective**: Deploy feature and finalize documentation

#### [ ] Step 5.1: Deployment & Operations
**AI Agent Tasks**:
- Follow deployment strategy from `/specs/infrastructure.md`
- Configure monitoring, logging, and alerting as specified
- Set up backup and recovery procedures if required
- Prepare rollback procedures and test them
- Validate security and compliance requirements are met

#### [ ] Step 5.2: Documentation & Completion
**AI Agent Tasks**:
- Update all technical documentation to reflect implementation
- **Document any missing documentation specifications** and the documentation approach used in ISSUES.md
- Create user guides and API documentation if specified
- **Log any missing documentation requirements** and document the content created
- Document any changes or clarifications made to original specifications in ISSUES.md
- Update deployment and maintenance guides
- **Track any missing operational specifications** and document the procedures implemented
- Prepare comprehensive summary of implementation for developer review including:
  - All features implemented and their current status
  - Complete ISSUES.md review with all specification gaps and assumptions
  - Recommendations for specification improvements
  - Areas requiring developer clarification or review
  - Performance and security considerations documented

## AI Agent Quality Gates & Issue Tracking

**IMPORTANT**: Each gate must be completed before proceeding to the next phase. Document all issues and gaps encountered - never stop implementation.

**RESUMPTION NOTE**: When resuming work, validate that all previous gates are actually complete by running tests and checking functionality before proceeding to the next incomplete gate. Review ISSUES.md for any documented problems that need attention.

**ISSUE DOCUMENTATION REQUIREMENT**: Maintain ISSUES.md throughout implementation with:
- Specification gaps and assumptions made
- Implementation decisions when specs are unclear
- Missing requirements and default approaches used
- Untestable scenarios and workarounds applied
- Performance assumptions and security measures implemented

### Gate 1: Foundation Complete
**AI Agent Validation**:
- All data models from `/specs/{{SANITIZED_NAME}}/data-model.md` implemented with complete test validation:
  - Every entity, field, and relationship specified is implemented
  - All validation rules enforced and tested
  - All CRUD operations functional and tested
  - All database constraints and indexes working correctly
- **Document any missing data model specifications** and the implementation choices made in ISSUES.md
- All API endpoints from `/specs/{{SANITIZED_NAME}}/api-contract.md` functional with comprehensive error handling
- **Log any missing API specifications** and document the API design decisions made
- Project structure exactly matches `/specs/system-overview.md` architecture specifications
- **Track any missing architecture specifications** and document the structural decisions made
- All dependencies, build tools, and development environment configured correctly
- Database schemas and migrations working properly
- **If first feature**: Basic CI/CD pipeline configured if specified in infrastructure requirements
- **If additional feature**: New feature integrates seamlessly with existing data layer without breaking changes
- **If additional feature**: New API endpoints follow existing patterns and don't conflict with existing routes
- **If additional feature**: All existing tests still pass after new feature integration
- **ISSUES.md updated** with all foundation-related specification gaps and implementation assumptions

### Gate 2: Business Logic Complete
**AI Agent Validation**:
- Every user scenario from `/specs/{{SANITIZED_NAME}}/business-logic.md` fully implemented and tested
- **Document any missing or unclear user scenarios** and the implementation approach used in ISSUES.md
- All business rules enforced with proper validation and error messages
- **Log any missing business rules** and document the business logic implemented
- Every edge case and exception scenario handled as specified
- **Track any missing edge case specifications** and document the exception handling implemented
- Service layer integration complete with comprehensive test validation:
  - Every service method tested with all input combinations
  - All business logic integration points verified
  - All data layer interactions tested and validated
  - All external service integrations mocked and tested
- **Document any untestable service integrations** due to incomplete specifications
- **If first feature**: Authorization and permission systems working correctly
- **If additional feature**: New feature integrates with existing authorization without breaking existing permissions
- **Log any missing authorization specifications** and document the security model implemented
- All workflow processes and state transitions functioning properly
- **Track any missing workflow specifications** and document the process logic implemented
- **If additional feature**: New business logic doesn't conflict with existing business rules
- **If additional feature**: Cross-feature interactions work correctly and are properly tested
- **ISSUES.md updated** with all business logic specification gaps and implementation assumptions

### Gate 3: UI Complete
**AI Agent Validation**:
- All UI components from `/specs/{{SANITIZED_NAME}}/ui-design.md` implemented and styled
- **Document any missing UI component specifications** and the design decisions made in ISSUES.md
- All user flows functional and match `/specs/{{SANITIZED_NAME}}/ui-design.md` specifications
- **Log any missing user flow specifications** and document the navigation logic implemented
- **If first feature**: Accessibility requirements met as specified
- **If additional feature**: New UI components follow existing design system and accessibility standards
- **Track any missing accessibility specifications** and document the accessibility standards applied
- Responsive design and cross-platform compatibility verified
- **Document any missing responsive design specifications** and the responsive approach used
- **If additional feature**: New UI integrates seamlessly with existing navigation and layout
- **If additional feature**: Existing UI functionality remains unaffected by new feature
- **ISSUES.md updated** with all UI specification gaps and design implementation assumptions

### Gate 4: Integration Complete
**AI Agent Validation**:
- End-to-end functionality verified for all user scenarios
- **Document any untestable user scenarios** due to incomplete specifications in ISSUES.md
- All unit, integration, and e2e tests passing with complete validation:
  - Every test suite executes without failures or errors
  - All user scenarios from specifications covered by e2e tests
  - All API endpoints tested with valid and invalid inputs
  - All UI components tested with user interaction scenarios
  - All integration points between system layers verified
- **Log any test failures or gaps** and document workarounds or assumptions made
- **If first feature**: Security requirements from `/specs/infrastructure.md` validated
- **If additional feature**: New feature maintains existing security standards and doesn't introduce vulnerabilities
- **Track any missing security specifications** and document the security measures implemented
- Performance benchmarks met if specified
- **Document any missing performance requirements** and the benchmarks used for validation
- **If additional feature**: System performance remains acceptable with new feature load
- **If additional feature**: All existing features continue to work correctly with new feature deployed
- **If additional feature**: Database performance and query optimization verified for new feature
- **ISSUES.md updated** with all integration specification gaps and testing assumptions

### Gate 5: Production Ready
**AI Agent Validation**:
- **If first feature**: Deployment successful according to `/specs/infrastructure.md`
- **If additional feature**: New feature deployed successfully without affecting existing functionality
- **Document any missing deployment specifications** and the deployment approach used in ISSUES.md
- **If first feature**: Monitoring and alerting configured and active
- **If additional feature**: Monitoring extended to cover new feature metrics and health checks
- **Log any missing monitoring specifications** and document the monitoring strategy implemented
- All documentation updated and complete
- **Track any missing documentation requirements** and document the documentation approach used
- **If additional feature**: Migration guide prepared if database or API changes affect existing clients
- Implementation summary prepared for developer review including all documented issues and assumptions
- **If additional feature**: Rollback plan documented and tested
- **ISSUES.md finalized** with complete summary of all specification gaps, assumptions, and implementation decisions

## AI Agent Success Criteria

**Final Validation Checklist**:
- All user scenarios from `/specs/{{SANITIZED_NAME}}/business-logic.md` are fully functional and tested
- **All missing or unclear user scenarios documented** in ISSUES.md with implementation approach used
- All API contracts from `/specs/{{SANITIZED_NAME}}/api-contract.md` are correctly implemented with proper error handling
- **All API specification gaps documented** in ISSUES.md with implementation decisions made
- All data models from `/specs/{{SANITIZED_NAME}}/data-model.md` are properly implemented with validation
- **All missing data model specifications documented** in ISSUES.md with validation rules implemented
- All UI components from `/specs/{{SANITIZED_NAME}}/ui-design.md` match specifications exactly and are responsive
- **All UI specification gaps documented** in ISSUES.md with design decisions made
- All infrastructure requirements from `/specs/infrastructure.md` are met and operational
- **All missing infrastructure specifications documented** in ISSUES.md with deployment approach used
- All 5 quality gates have been completed successfully with documented validation
- **ISSUES.md contains comprehensive documentation** of all specification gaps, assumptions, and implementation decisions
- Feature is successfully deployed and operational in target environment
- Comprehensive test suite passes with complete validation across all layers:
  - All unit tests execute successfully without failures
  - All integration tests verify cross-component functionality
  - All end-to-end tests validate complete user scenarios
  - All API contracts tested with comprehensive input validation
  - All UI components tested with accessibility and responsiveness verification
- **All untestable scenarios documented** in ISSUES.md with workarounds applied
- Security requirements validated and penetration testing completed if specified
- **All missing security specifications documented** in ISSUES.md with security measures implemented
- Performance benchmarks met according to specifications
- **All missing performance requirements documented** in ISSUES.md with benchmarks used
- Documentation is complete and up-to-date
- **Implementation summary includes** all documented issues, assumptions, and decisions for developer review

### Additional Validation for Existing Projects
**AI Agent Tasks** (Skip if this is the first feature):
- **System Integration**: New feature works seamlessly with all existing features
- **Data Consistency**: No data corruption or conflicts between new and existing features
- **API Compatibility**: New endpoints don't break existing API contracts or client integrations
- **UI Consistency**: New interface elements follow existing design patterns and don't disrupt user workflows
- **Performance Impact**: System performance remains acceptable with new feature under typical load
- **Regression Testing**: All existing functionality continues to work as expected
- **Cross-Feature Workflows**: User journeys that span multiple features work correctly
- **Database Migration**: Schema changes applied successfully without data loss
- **Backward Compatibility**: Existing clients and integrations continue to function
- **Feature Toggles**: If applicable, feature can be safely enabled/disabled without system impact
  - No defined test scenarios for business rules validation
  - Missing performance benchmarks or quality metrics
  - Undefined user acceptance criteria or success indicators
  - No specified error handling or recovery procedures