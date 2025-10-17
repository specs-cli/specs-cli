# Global Specification Extractor

Your task is to comprehensively analyze the project's codebase and extract all specifications to produce high-quality specification files that reflect the status quo exactly. This command extracts API contracts, business logic, data models, infrastructure, and UI/UX design specifications in a coordinated manner to ensure consistency and avoid content overlap while enabling proper cross-referencing.

**CRITICAL SUCCESS FACTORS:**
- **Read files completely to the end** - Do not miss any parts of the implementation
- **Focus on actual implementation** - Document what exists, not what should exist
- **Deep code analysis** - Understand structure, relationships, constraints, and business rules
- **Iterative refinement** - Review and improve specifications multiple times

## Process Overview

This unified extractor will create five specification files sequentially in the `specs/` directory, following a dependency-optimized order:

**Phase 1: Foundation Layer**
1. `specs/data-model.md` - Data structures, entities, and relationships (foundational - no dependencies)

**Phase 2: Core Logic Layer**  
2. `specs/infrastructure.md` - Deployment, storage, network, and monitoring (depends on data model)

**Phase 3: Business Layer**
3. `specs/business-logic.md` - User scenarios, business rules, and workflows (depends on data model)

**Phase 4: Interface Layer**
4. `specs/api-contract.md` - Technical interfaces and API specifications (depends on data model and business logic)

**Phase 5: Presentation Layer**
5. `specs/ui-design.md` - UI components, user flows, and UX patterns (depends on business logic and API contract)

This sequential approach ensures that each specification can properly reference and build upon the previously extracted specifications, resulting in higher quality and more accurate cross-references.

## Codebase Analysis Patterns

### API Contract Patterns
**Search for these patterns in the codebase:**
- Controllers, routes, endpoints (directories: `routes/`, `controllers/`, `api/`, `endpoints/`)
- API middleware and authentication (files: `*middleware*`, `*auth*`, `*guard*`)
- Request/response handlers and validation
- Error handling and status codes
- Service interfaces and method signatures
- REST/GraphQL/gRPC endpoint definitions
- API documentation files (OpenAPI, Swagger, etc.)

### Business Logic Patterns
**Search for these patterns in the codebase:**
- Service layer implementations (directories: `services/`, `business/`, `domain/`)
- Business rule implementations and validations (files: `*Service*`, `*Manager*`, `*Handler*`)
- Workflow orchestration and state management
- User scenario implementations in controllers
- Business exception handling
- Domain models and business entities
- Use case implementations

### Data Model Patterns
**Search for these patterns in the codebase:**
- Model definitions (directories: `models/`, `entities/`, `domain/`, `data/`)
- Database schemas and migrations (files: `*Model*`, `*Entity*`, `*Schema*`, `*migration*`)
- Data validation rules and constraints
- Relationship definitions (foreign keys, associations)
- Repository patterns and data access layers (files: `*Repository*`, `*DAO*`, `*DataAccess*`)
- ORM/ODM configurations and mappings

### Infrastructure Patterns
**Search for these patterns in the codebase:**
- Configuration files (files: `*config*`, `*settings*`, `.env*`, `*properties`)
- Build and deployment scripts (files: `*build*`, `*deploy*`, `Dockerfile*`, `*compose*`)
- Database connection and setup files
- Environment-specific configurations
- Monitoring and logging configurations
- CI/CD pipeline definitions (files: `*pipeline*`, `*workflow*`, `.github/`, `.gitlab-ci*`)
- Infrastructure as Code (Terraform, CloudFormation, etc.)

### UI/UX Design Patterns
**Search for these patterns in the codebase:**
- UI components (directories: `components/`, `views/`, `pages/`, `screens/`)
- Routing and navigation (files: `*Router*`, `*Route*`, `*Navigation*`)
- State management (files: `*store*`, `*state*`, `*context*`, `*reducer*`)
- UI styling and theming (files: `*style*`, `*theme*`, `*css*`, `*scss*`, `*less*`)
- User interaction handlers and form validations
- Template files (HTML, JSX, Vue, Angular templates, etc.)
- Mobile UI patterns (Activities, Fragments, ViewControllers, etc.)

## Phase 1: Comprehensive Codebase Analysis

### Step 1: Systematic File Discovery and Cataloging
1. **Complete codebase scan** using targeted search patterns:
   - **Server-side files**: API routes, controllers, services, models, middleware
   - **Client-side files**: Components, pages, contexts, services, utilities
   - **Configuration files**: Environment, build, deployment, database configs
   - **Documentation files**: Existing specs, README files, architectural decisions

2. **Deep file analysis** for each discovered file:
   - **Read files completely to the end** - Critical for accuracy
   - **Understand implementation details** - Not just interfaces
   - **Identify relationships and dependencies** between components
   - **Extract business rules and constraints** from code logic
   - **Note validation patterns and error handling** approaches

### Step 2: Specification Type-Specific Deep Dive Analysis

#### API Contract Analysis
1. **Route examination**: Analyze all route files completely
   - Extract endpoint definitions, HTTP methods, parameters
   - Identify middleware usage (auth, validation, rate limiting)
   - Document request/response structures from actual code
   - Analyze error handling patterns and status codes

2. **Controller analysis**: Examine controller implementations
   - Understand request processing logic
   - Identify validation rules and business logic
   - Document actual response formats (not assumed ones)
   - Note authentication and authorization requirements

3. **Middleware analysis**: Study authentication and validation middleware
   - Document security implementations
   - Understand rate limiting and CORS configurations
   - Identify request/response transformation logic

#### Business Logic Analysis
1. **Service layer examination**: Analyze service implementations
   - Extract business rules from actual code logic
   - Identify workflow patterns and state management
   - Document validation rules and constraints
   - Understand error handling and exception patterns

2. **Controller business logic**: Extract user scenarios from controllers
   - Identify success and failure paths
   - Document business rule enforcement
   - Understand user interaction patterns
   - Extract edge case handling

3. **Model validation analysis**: Study model-level business rules
   - Extract validation constraints from schemas
   - Identify relationship rules and cascading behaviors
   - Document data integrity requirements

#### Data Model Analysis
1. **Schema examination**: Analyze database models completely
   - Extract all fields, types, and constraints
   - Identify relationships and foreign keys
   - Document validation rules and defaults
   - Understand indexing and performance considerations

2. **Migration analysis**: Study database migrations if present
   - Understand schema evolution
   - Identify data transformation patterns
   - Document relationship changes over time

3. **Repository pattern analysis**: Examine data access layers
   - Understand query patterns and optimizations
   - Identify data transformation logic
   - Document caching and performance strategies

#### Infrastructure Analysis
1. **Configuration analysis**: Examine all config files
   - Extract environment-specific settings
   - Identify service dependencies and connections
   - Document security configurations
   - Understand deployment patterns

2. **Build and deployment analysis**: Study build scripts and Docker files
   - Extract deployment processes and requirements
   - Identify service orchestration patterns
   - Document environment setup and dependencies
   - Understand scaling and monitoring configurations

#### UI/UX Design Analysis
1. **Component analysis**: Examine React components completely
   - Extract component structure and props
   - Identify state management patterns
   - Document user interaction handlers
   - Understand styling and theming approaches

2. **Routing analysis**: Study navigation and routing patterns
   - Extract user flow definitions
   - Identify protected routes and authentication flows
   - Document page transitions and state management
   - Understand URL structure and parameters

3. **Context and state analysis**: Examine state management
   - Extract global state patterns
   - Identify data flow and update mechanisms
   - Document user session management
   - Understand performance optimization patterns

## Phase 2: Sequential Specification Extraction

### Pre-Extraction Validation
Before creating specifications, ensure you have:
1. **Complete understanding** of all analyzed files
2. **Identified all cross-references** between different specification types
3. **Mapped dependencies** to follow the sequential order

### Sequential Extraction Process

**Step 1: Data Model Foundation (specs/data-model.md)**
- Extract first as it has no dependencies on other specs
- Focus on entities, relationships, and data structures
- This becomes the foundation for all other specifications

**Step 2: Infrastructure Layer (specs/infrastructure.md)**  
- Extract second, referencing the data model for storage requirements
- Focus on deployment, storage, network, and monitoring
- Can reference data model entities for storage design

**Step 3: Business Logic Layer (specs/business-logic.md)**
- Extract third, referencing data model for entity operations
- Focus on user scenarios, business rules, and workflows
- Can reference data model entities in business rules

**Step 4: API Contract Layer (specs/api-contract.md)**
- Extract fourth, referencing data model and business logic
- Focus on technical interfaces and API specifications
- Can reference data entities and business operations

**Step 5: UI Design Layer (specs/ui-design.md)**
- Extract last, referencing business logic and API contract
- Focus on UI components, user flows, and UX patterns
- Can reference business scenarios and API endpoints
2. **Identified all endpoints, components, and configurations** from actual code
3. **Extracted actual request/response formats** from implementation
4. **Documented real validation rules and constraints** from code
5. **Understood actual error handling patterns** from implementation

### API Contract Extraction

**Template for `specs/api-contract.md`:**
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
[Add any API contract related questions or areas of uncertainty that need to be addressed]
```

### Business Logic Extraction

**Template for `specs/business-logic.md`:**
```markdown
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

## Open Questions
[Add any business logic related questions or areas of uncertainty that need to be addressed]
```

### Data Model Extraction

**Template for `specs/data-model.md`:**
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
[Add any data model related questions or areas of uncertainty that need to be addressed]
```

### Infrastructure Extraction

**Template for `specs/infrastructure.md`:**
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

### UI Design Extraction

**Template for `specs/ui-design.md`:**
```markdown
# UI Design

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
[Add any UI/UX design related questions or areas of uncertainty that need to be addressed]
```

## Phase 3: Cross-Reference Integration

### Step 1: Identify Relationships
1. **Map connections** between specifications:
   - API endpoints ↔ Business scenarios ↔ Data models
   - UI components ↔ User flows ↔ API calls
   - Infrastructure ↔ Deployment ↔ All other specs
   - Consider technology-specific relationships (microservices, event-driven, etc.)

2. **Add cross-references** in each specification:
   - Use consistent naming conventions
   - Reference specific sections in other specifications
   - Avoid duplicating content across specifications
   - Account for different architectural patterns (monolith, microservices, serverless, etc.)

### Step 2: Ensure Content Separation
1. **API Contract**: Focus only on technical interface definitions
2. **Business Logic**: Focus only on business rules and user scenarios
3. **Data Model**: Focus only on data structure and relationships
4. **Infrastructure**: Focus only on deployment and operational concerns
5. **UI Design**: Focus only on user interface and experience

## Phase 4: Iterative Refinement and Cross-Validation

### Specification Review Process

After creating each specification, perform these validation steps:

#### 1. Implementation Accuracy Check
- **Verify all documented endpoints exist** in the actual codebase
- **Confirm all data structures match** actual model definitions
- **Validate all business rules** are extracted from real code logic
- **Check all error handling** matches actual implementation

#### 2. Completeness Validation
- **Ensure no major components are missing** from the specification
- **Verify all user-facing features** are documented
- **Confirm all API endpoints** are covered
- **Check all data models** are included

#### 3. Cross-Reference Consistency
- **Verify API Contract references** match actual Data Model entities
- **Ensure Business Logic scenarios** align with API Contract endpoints
- **Confirm UI Design flows** match Business Logic scenarios
- **Validate Infrastructure** supports all documented features

#### 4. Technical Depth Assessment
- **Ensure sufficient implementation detail** for developers
- **Verify actual code patterns** are documented
- **Confirm configuration details** are accurate
- **Check performance considerations** are included

### Refinement Iterations

For each specification that doesn't meet the quality standards:

#### Round 1: Gap Analysis
1. **Identify missing implementation details** by re-examining code
2. **Find undocumented endpoints or components** through deeper code search
3. **Locate missing business rules** in service layer code
4. **Discover additional error handling** patterns

#### Round 2: Detail Enhancement
1. **Add specific code examples** and configurations
2. **Include actual validation rules** from models and middleware
3. **Document real error messages** and status codes
4. **Add performance and security considerations**

#### Round 3: Integration Validation
1. **Ensure all cross-references** are accurate and complete
2. **Verify specification consistency** across all documents
3. **Confirm implementation feasibility** of documented features
4. **Validate business value alignment** with technical implementation

### Quality Gates

Before considering any specification complete, ensure:

✅ **Implementation Fidelity**: Every documented feature exists in code
✅ **Technical Depth**: Sufficient detail for implementation without guesswork
✅ **Business Alignment**: Clear connection between business value and technical implementation
✅ **Cross-Reference Accuracy**: All references between specifications are valid
✅ **Completeness**: No major features or components are missing
✅ **Actionability**: Specifications provide clear guidance for development

### Final Validation

After all specifications are complete:

1. **Perform end-to-end consistency check** across all five specifications
2. **Verify implementation completeness** by checking against actual codebase
3. **Validate business scenario coverage** matches actual user flows
4. **Confirm technical architecture** is accurately represented
5. **Ensure all open questions** are documented for follow-up

## Success Metrics

The unified extraction process should achieve:
- **Implementation Accuracy**: 95%+ of documented features exist in code
- **Technical Completeness**: All major components and patterns documented
- **Cross-Reference Consistency**: 100% valid references between specifications
- **Business Alignment**: Clear traceability from business value to implementation
- **Developer Usability**: Specifications provide sufficient detail for implementation

## Troubleshooting Common Issues

### Low Implementation Accuracy
- **Re-read files completely** to catch missed details
- **Search for additional patterns** using different keywords
- **Examine configuration files** more thoroughly
- **Check for dynamic or conditional logic** in code

### Missing Technical Depth
- **Focus on actual code implementations** rather than assumptions
- **Document specific configurations** and middleware
- **Include actual error handling** and validation logic
- **Add performance and security considerations**

### Poor Cross-Reference Quality
- **Verify entity names** match across specifications
- **Ensure endpoint paths** are consistent
- **Check business scenario alignment** with technical implementation
- **Validate data flow** between components

### Incomplete Business Logic
- **Examine service layer code** more thoroughly
- **Look for validation logic** in multiple locations
- **Check for business rules** in middleware and models
- **Review error handling** for business rule violations

## Execution Instructions

1. **Start with comprehensive codebase scanning** using the defined patterns
2. **Create all five specification files** in the `specs/` directory in sequential order:
   - specs/data-model.md (Foundation)
   - specs/infrastructure.md (Core Logic)
   - specs/business-logic.md (Business Layer)
   - specs/api-contract.md (Interface Layer)
   - specs/ui-design.md (Presentation Layer)
3. **Extract content sequentially** following the dependency-optimized order
4. **Add cross-references** as you build upon previously extracted specifications
5. **Review and refine** all specifications for accuracy and completeness
6. **Ensure no content duplication** while maintaining proper referencing

The final result should be five cohesive, cross-referenced specification files in the `specs/` directory that together provide a complete picture of the project without overlapping content, with each specification properly building upon the foundation established by the previous ones.