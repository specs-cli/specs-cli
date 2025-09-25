<!--
🚀 AI EXECUTABLE WORKFLOW 🚀
This file contains executable instructions for AI agents
Purpose: Systematic system architecture and infrastructure design workflow for AI agents/assistants
-->

# System Architecture & Infrastructure Design Workflow: {{NAME}}

## ⚠️ CRITICAL WORKFLOW VALIDATION ⚠️

**MANDATORY PRE-EXECUTION CHECKS**:

1. **TEMPLATE VERIFICATION**: You are executing `specs/generate-system-specs.md` workflow ONLY. Do NOT execute any other AI generation workflows (generate-feature-specs.md, generate-feature-code.md, etc.)

2. **OUTPUT DIRECTORY ENFORCEMENT**: Generated files MUST be placed in the root `specs/` directory:
   - `specs/system-overview.md` - System architecture and design patterns
   - `specs/infrastructure.md` - Deployment and infrastructure specifications

3. **SCOPE LIMITATION**: This workflow generates system-wide architecture files only. Do NOT generate feature-specific specifications.

**VALIDATION CONFIRMATION**: Before proceeding, confirm:
- [ ] I am executing generate-system-specs.md workflow only
- [ ] I will output system-level files to root specs/ directory only
- [ ] I will not generate feature-specific specifications
- [ ] I understand this creates system-wide architecture documentation

## Overview

This workflow provides a systematic approach for AI agents to either design comprehensive system architecture for new projects OR analyze and document existing system architecture. The approach differs significantly based on whether you're working with a new project or an existing codebase.

**Target Audience**: AI coding assistants and agents
**Prerequisites**: Business requirements, existing system context (if applicable), and technical constraints
**Outcome**: Complete system architecture and infrastructure specifications
**Output Location**: All generated files must be placed in the `specs/` directory

## Project Type Detection

**CRITICAL**: Before proceeding, determine if this is:
- **NEW PROJECT**: No existing codebase - provide architectural suggestions and recommendations
- **EXISTING CODEBASE**: Has existing code - analyze and document the current state accurately without assumptions

## Architecture Design Process

### Phase 1: Requirements Analysis & Context Assessment

#### [ ] Step 1.1: Project Type Assessment
**AI Agent Tasks**:
- **FOR NEW PROJECTS**: Analyze business objectives and success criteria
- **FOR NEW PROJECTS**: Identify key stakeholders and their needs
- **FOR NEW PROJECTS**: Determine functional and non-functional requirements
- **FOR EXISTING CODEBASES**: Analyze the actual codebase structure and organization
- **FOR EXISTING CODEBASES**: Examine configuration files, package.json, requirements.txt, etc.
- **FOR EXISTING CODEBASES**: Review actual API endpoints, database schemas, and UI components
- **FOR EXISTING CODEBASES**: Document what currently exists without making assumptions

#### [ ] Step 1.2: Technical Context Assessment
**AI Agent Tasks**:
- **FOR NEW PROJECTS**: Identify technology stack preferences and constraints
- **FOR NEW PROJECTS**: Assess team expertise and capabilities
- **FOR NEW PROJECTS**: Evaluate available infrastructure options
- **FOR NEW PROJECTS**: Document integration requirements with external systems
- **FOR EXISTING CODEBASES**: Analyze the actual technology stack in use
- **FOR EXISTING CODEBASES**: Examine deployment configurations and infrastructure setup
- **FOR EXISTING CODEBASES**: Review actual integrations and dependencies
- **FOR EXISTING CODEBASES**: Document the current system landscape as-is

### Phase 2: System Architecture Design

#### [ ] Step 2.1: System Overview Specification
**AI Agent Tasks**:
- **FOR NEW PROJECTS**: Create comprehensive system overview using the embedded template and output location: `specs/system-overview.md`
- **FOR NEW PROJECTS**: Define proposed system boundaries and scope
- **FOR NEW PROJECTS**: Design major system components and their responsibilities
- **FOR NEW PROJECTS**: Plan system-level interactions and data flows
- **FOR NEW PROJECTS**: Recommend architectural patterns and design principles
- **FOR EXISTING CODEBASES**: Document the actual system overview based on project analysis, using the embedded template and output location: `specs/system-overview.md`
- **FOR EXISTING CODEBASES**: Identify existing system boundaries and scope from the project codebase
- **FOR EXISTING CODEBASES**: Document actual system components and their current responsibilities based on project analysis, using the embedded template and output location: `specs/system-overview.md`
- **FOR EXISTING CODEBASES**: Map existing system interactions and data flows
- **FOR EXISTING CODEBASES**: Identify architectural patterns currently in use

**System Overview Template Structure:**
```markdown
# System Overview: {{NAME}}

## System Purpose
[Describe the overall purpose and business value of the system]

## System Scope
[Define what is included and excluded from the system]

## Architectural Overview
[High-level system architecture description]

## System Components

### [Component Name]
**Purpose**: [What this component does]
**Responsibilities**: [Key responsibilities]
**Interfaces**: [How it interacts with other components]
**Technology**: [Technology stack or approach]

## Data Flow
[Describe how data flows through the system]

## Quality Attributes

### Performance
[Performance requirements and considerations]

### Scalability
[Scalability requirements and approach]

### Security
[Security requirements and measures]

### Reliability
[Reliability and availability requirements]

## Architectural Decisions

### [Decision Name]
**Context**: [Why this decision was needed]
**Decision**: [What was decided]
**Rationale**: [Why this decision was made]
**Consequences**: [Impact of this decision]

## Integration Points
[External systems and integration requirements]

## Constraints
[Technical, business, or regulatory constraints]
```

#### [ ] Step 2.2: Infrastructure Specification
**AI Agent Tasks**:
- **FOR NEW PROJECTS**: Create comprehensive infrastructure specification using the embedded template and output location: `specs/infrastructure.md`
- **FOR NEW PROJECTS**: Design deployment architecture and environments
- **FOR NEW PROJECTS**: Specify recommended compute, storage, and network requirements
- **FOR NEW PROJECTS**: Plan security and compliance measures
- **FOR NEW PROJECTS**: Design monitoring, logging, and observability strategy
- **FOR EXISTING CODEBASES**: Document the actual infrastructure setup from configuration files as implemented in the project, using the embedded template and output location: `specs/infrastructure.md`
- **FOR EXISTING CODEBASES**: Analyze existing deployment architecture and environments
- **FOR EXISTING CODEBASES**: Document current compute, storage, and network setup as implemented in the project, using the embedded template and output location: `specs/infrastructure.md`
- **FOR EXISTING CODEBASES**: Identify existing security and compliance measures
- **FOR EXISTING CODEBASES**: Document current monitoring, logging, and observability tools as implemented in the project, using the embedded template and output location: `specs/infrastructure.md`

**Infrastructure Template Structure:**
```markdown
# Infrastructure: {{NAME}}

## Infrastructure Overview
[High-level infrastructure description and approach]

## Deployment Architecture

### Environments
[Description of different environments: dev, staging, production]

### Deployment Model
[Cloud, on-premises, hybrid, or multi-cloud approach]

## Compute Resources

### [Service/Component Name]
**Type**: [VM, container, serverless, etc.]
**Specifications**: [CPU, memory, storage requirements]
**Scaling**: [Auto-scaling configuration]
**Availability**: [High availability setup]

## Storage Solutions

### [Storage Type]
**Purpose**: [What data is stored]
**Technology**: [Database, file system, object storage]
**Capacity**: [Storage requirements]
**Backup**: [Backup strategy]
**Performance**: [IOPS, throughput requirements]

## Network Architecture

### Network Topology
[Network design and segmentation]

### Load Balancing
[Load balancer configuration and strategy]

### CDN
[Content delivery network setup]

### DNS
[Domain name system configuration]

## Security Infrastructure

### Access Control
[Authentication and authorization systems]

### Network Security
[Firewalls, VPNs, network segmentation]

### Data Protection
[Encryption at rest and in transit]

### Compliance
[Regulatory compliance measures]

## Monitoring & Observability

### Monitoring
[System and application monitoring]

### Logging
[Centralized logging strategy]

### Alerting
[Alert configuration and escalation]

### Performance Tracking
[APM and performance monitoring]

## Backup & Disaster Recovery

### Backup Strategy
[Backup frequency, retention, and testing]

### Disaster Recovery
[DR procedures and RTO/RPO targets]

### Business Continuity
[Continuity planning and procedures]

## DevOps & Automation

### CI/CD Pipeline
[Continuous integration and deployment]

### Infrastructure as Code
[IaC tools and practices]

### Configuration Management
[Configuration management approach]

## Cost Optimization
[Cost management and optimization strategies]

## Maintenance & Operations
[Operational procedures and maintenance schedules]
```

### Phase 3: Architecture Validation & Optimization

#### [ ] Step 3.1: Architecture Review
**AI Agent Tasks**:
- **FOR NEW PROJECTS**: Validate proposed system architecture against business requirements
- **FOR NEW PROJECTS**: Ensure proposed architectural patterns are consistently applied
- **FOR NEW PROJECTS**: Review planned component interactions and dependencies
- **FOR NEW PROJECTS**: Assess proposed system complexity and maintainability
- **FOR EXISTING CODEBASES**: Validate documented architecture against actual implementation
- **FOR EXISTING CODEBASES**: Identify architectural patterns currently in use
- **FOR EXISTING CODEBASES**: Document actual component interactions and dependencies
- **FOR EXISTING CODEBASES**: Assess current system complexity and maintainability

#### [ ] Step 3.2: Infrastructure Validation
**AI Agent Tasks**:
- **FOR NEW PROJECTS**: Validate proposed infrastructure design against system requirements
- **FOR NEW PROJECTS**: Ensure planned security and compliance requirements are met
- **FOR NEW PROJECTS**: Review proposed scalability and performance capabilities
- **FOR NEW PROJECTS**: Assess cost implications and optimization opportunities
- **FOR EXISTING CODEBASES**: Validate documented infrastructure against actual setup
- **FOR EXISTING CODEBASES**: Document existing security and compliance measures
- **FOR EXISTING CODEBASES**: Assess current scalability and performance capabilities
- **FOR EXISTING CODEBASES**: Identify current cost optimization opportunities

#### [ ] Step 3.3: Integration Assessment
**AI Agent Tasks**:
- **FOR NEW PROJECTS**: Plan integration points and data flows
- **FOR NEW PROJECTS**: Design API contracts and interfaces
- **FOR NEW PROJECTS**: Plan security boundaries and access controls
- **FOR NEW PROJECTS**: Assess impact on existing systems and processes
- **FOR EXISTING CODEBASES**: Document existing integration points and data flows
- **FOR EXISTING CODEBASES**: Analyze current API contracts and interfaces
- **FOR EXISTING CODEBASES**: Document existing security boundaries and access controls
- **FOR EXISTING CODEBASES**: Map current system interactions and dependencies

### Phase 4: Documentation & Implementation Planning

#### [ ] Step 4.1: Architecture Documentation
**AI Agent Tasks**:
- **FOR NEW PROJECTS**: Document all architectural decisions with rationale
- **FOR NEW PROJECTS**: Create visual diagrams for planned system components and data flows
- **FOR NEW PROJECTS**: Document recommended architectural patterns and design principles
- **FOR NEW PROJECTS**: Specify technology choices and their justifications
- **FOR EXISTING CODEBASES**: Document existing architectural decisions and their rationale (if discoverable)
- **FOR EXISTING CODEBASES**: Create visual diagrams for current system components and data flows
- **FOR EXISTING CODEBASES**: Document architectural patterns and design principles currently in use
- **FOR EXISTING CODEBASES**: Document current technology choices and their context

#### [ ] Step 4.2: Infrastructure Documentation
**AI Agent Tasks**:
- **FOR NEW PROJECTS**: Document complete infrastructure specifications
- **FOR NEW PROJECTS**: Create deployment guides and runbooks
- **FOR NEW PROJECTS**: Specify monitoring and alerting configurations
- **FOR NEW PROJECTS**: Document security policies and procedures
- **FOR EXISTING CODEBASES**: Document current infrastructure specifications
- **FOR EXISTING CODEBASES**: Document existing deployment processes and runbooks
- **FOR EXISTING CODEBASES**: Document current monitoring and alerting configurations
- **FOR EXISTING CODEBASES**: Document existing security policies and procedures

#### [ ] Step 4.3: Implementation Planning
**AI Agent Tasks**:
- **FOR NEW PROJECTS**: Create phased implementation plan
- **FOR NEW PROJECTS**: Identify critical path and dependencies
- **FOR NEW PROJECTS**: Define milestones and success criteria
- **FOR NEW PROJECTS**: Plan for testing and validation at each phase
- **FOR EXISTING CODEBASES**: Document current development and deployment processes
- **FOR EXISTING CODEBASES**: Identify existing dependencies and critical paths
- **FOR EXISTING CODEBASES**: Document current testing and validation procedures
- **FOR EXISTING CODEBASES**: Map existing rollback procedures and risk mitigation

## AI Agent Quality Gates

### Gate 1: Requirements Understanding Complete
**AI Agent Validation**:
- Business objectives and success criteria are clearly understood
- Functional and non-functional requirements are documented
- Technical constraints and preferences are identified
- Stakeholder needs and expectations are captured
- Compliance and security requirements are understood

### Gate 2: System Architecture Design Complete
**AI Agent Validation**:
- System boundaries and scope are clearly defined
- Major components and their responsibilities are identified
- Architectural patterns and design principles are specified
- Quality attributes are addressed in the design
- Integration points and data flows are documented
- Architectural decisions are documented with rationale

### Gate 3: Infrastructure Design Complete
**AI Agent Validation**:
- Deployment architecture is fully specified
- Compute, storage, and network requirements are defined
- Security and compliance measures are planned
- Monitoring, logging, and observability are addressed
- Backup and disaster recovery strategies are defined
- Cost optimization strategies are included

### Gate 4: Architecture Validation Complete
**AI Agent Validation**:
- System architecture aligns with business requirements
- Infrastructure design supports system requirements
- Security and compliance requirements are met
- Scalability and performance requirements are addressed
- Integration points are validated and documented
- Risk assessment and mitigation strategies are defined

### Gate 5: Documentation & Planning Complete
**AI Agent Validation**:
- All architectural decisions are documented
- Infrastructure specifications are complete
- Implementation roadmap is defined
- Testing and validation strategies are planned
- Operational procedures are documented
- Knowledge transfer and training plans are created

## AI Agent Success Criteria

**Final Validation Checklist**:
- Complete specs/system-overview.md with comprehensive architecture design
- Complete specs/infrastructure.md with detailed infrastructure specifications
- All architectural decisions are documented with clear rationale
- Security, scalability, and performance requirements are addressed
- Integration points and dependencies are clearly defined
- Implementation roadmap with phases and milestones is created
- Risk assessment and mitigation strategies are documented
- Cost implications and optimization strategies are included
- Operational procedures and maintenance plans are defined
- Documentation is ready for development team handoff

## Usage Instructions for Developers

**To generate architecture and infrastructure specifications:**
1. Provide the AI agent with business requirements and technical context
2. Execute this prompt: "Design comprehensive system architecture and infrastructure for [System Name] by following the workflow in generate-system-specs.md"
3. Review each generated specification file
4. Request clarifications or modifications as needed
5. Once approved, use the specifications to guide implementation planning

**What the AI will deliver:**
- Complete specs/system-overview.md with architectural design and decisions
- Complete specs/infrastructure.md with detailed infrastructure specifications
- Documented architectural patterns and design principles
- Security, scalability, and performance considerations
- Implementation roadmap with phases and milestones
- Risk assessment and mitigation strategies
- Cost optimization recommendations
- Operational procedures and maintenance plans

**When to use this workflow:**
- Starting a new system or major system redesign
- Planning infrastructure for existing applications
- Modernizing legacy systems or infrastructure
- Preparing for significant scale or performance requirements
- Ensuring architectural consistency across projects
- Planning cloud migration or multi-cloud strategies
- Establishing architectural standards and guidelines