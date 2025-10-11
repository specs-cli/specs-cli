# DSPI Workflow

**Discovery → Specification → Planning → Implementation**

The **DSPI Workflow** is a structured, **AI-assisted framework for Specification-Driven Development (SDD)**.  
It ensures that every software feature — from idea to implementation — is **fully discovered, precisely specified, strategically planned, and rigorously implemented**, with AI agents assisting developers at each step while maintaining **human review and control**.

## Overview

The DSPI Workflow defines four sequential phases that guide the entire lifecycle of feature development:

1. **Discovery (D)** – Discover and understand the codebase and define feature intent, scope, and business context
2. **Specification (S)** – Convert descriptions into detailed, technology-agnostic specifications
3. **Planning (P)** – Translate specifications into actionable, technology-specific implementation plans
4. **Implementation (I)** – Execute the plan through code, testing, and integration

Each phase builds on the previous one, ensuring that all technical and business aspects are clarified before code is written.  
AI tools accelerate documentation, validation, and transformation between phases — but **developers remain the final authority** on every decision.

## Core Principles

### 1. AI-Assisted, Human-Controlled Development
- AI agents help generate, refine, and validate specifications, plans, and code.  
- Human developers retain full ownership of design decisions and quality assurance.  
- Automation increases consistency and speed, but responsibility remains with the team.

### 2. Specification-First Approach
- Development begins with **clear, technology-neutral specifications**.  
- Specifications act as the **single source of truth** connecting business logic, data, APIs, and UI.  
- Code is derived from specifications — never the other way around.

### 3. Sequential but Iterative Flow
- Phases follow the sequence **D → S → P → I** for clarity and traceability.  
- Iteration is expected: insights from later phases can refine earlier ones through controlled feedback loops.  
- Each phase must meet its **quality gates** before transitioning forward.

### 4. Quality and Traceability
- Every deliverable (story, spec, plan, implementation) is versioned and traceable.  
- Templates and structured documentation ensure consistency across teams.  
- AI validation assists in detecting ambiguity, missing coverage, or spec drift.

## 🔍 Quality Gate Philosophy

Quality gates define **when** a phase is complete and ready to transition to the next.  
In the AI-assisted DSPI Workflow, quality gates combine **automated validation** with **human review**, ensuring both consistency and accountability.

### Key Principles

- **AI-Assisted Validation:**  
  AI tools can check completeness, structure, and consistency between story, specs, plan, and code.

- **Human Judgment Remains Final:**  
  Developers confirm correctness, feasibility, and alignment with business goals.

- **Iterative Improvement Allowed:**  
  Teams can revisit earlier phases when issues are found without breaking the workflow’s integrity.

- **Measurable Completion:**  
  Each phase defines clear validation criteria — all must pass before moving forward.

- **Documentation Synchronization:**  
  Updated outputs must always reflect the current, agreed-upon state.

## Project Structure

```
project-root/
├── specs/
│   ├── api-contract.md
│   ├── business-logic.md
│   ├── data-model.md
│   ├── infrastructure.md
│   ├── ui-design.md
│   └── [feature-name]/
│       ├── STORY.md
│       ├── [feature-name]-business-logic.md
│       ├── [feature-name]-data-model.md
│       ├── [feature-name]-api-contract.md
│       ├── [feature-name]-ui-design.md
│       └── [feature-name]-plan.md
├── commands/
│   ├── create_feature_plan.md
│   ├── create_feature_specs.md
│   ├── extract_global_specs.md
│   └── implement_feature_plan.md
└── [source code directories]
```

## Phase 1: Discovery (D)

**Purpose:** Discover and understand the existing codebase and define new feature requirements, context, and boundaries.

### 1.1 Codebase Discovery (for existing codebases)

**When Required:** Mandatory for all existing codebases before any feature development begins.

#### Process
1. **Global Specs Extraction** – `/extract_global_specs` → `specs/` directory with all specification files:
   - `specs/business-logic.md`
   - `specs/data-model.md`
   - `specs/api-contract.md`
   - `specs/ui-design.md`
   - `specs/infrastructure.md`

#### Quality Gates
| Check Type | Description |
|-------------|-------------|
| **AI Validation** | All five global specification files exist and follow structure |
| **Human Review** | Specifications accurately reflect the current codebase |
| **Cross-Phase Consistency** | All components align and no contradictions exist |
| **Sign-Off Condition** | All specs approved before any new feature begins |

### 1.2 Feature Discovery

**Purpose:** Define feature requirements, context, and boundaries through manual documentation.

#### Process
1. Create `STORY.md` manually with business and functional context
2. Include: feature description, business value, use cases, success criteria, and constraints

#### Quality Gates
| Check Type | Description |
|-------------|-------------|
| **AI Validation** | Story completeness, clarity, missing fields |
| **Human Review** | Business value and boundaries validated |
| **Cross-Phase Consistency** | Aligns with global specs and project vision |
| **Sign-Off Condition** | STORY.md finalized and versioned |

## Phase 2: Specification (S)

**Purpose:** Transform the feature description into detailed, technology-agnostic specifications across multiple specification types.

### Process
1. Run: `/create_feature_specs with STORY.md`  
2. Generates separate specification type files:  
   - `[feature-name]-business-logic.md` – Business rules, scenarios, and logic  
   - `[feature-name]-data-model.md` – Data structures and relationships  
   - `[feature-name]-api-contract.md` – API endpoints and contracts  
   - `[feature-name]-ui-design.md` – UI/UX design specifications  
    requirements  
3. Additional specification types can be supported as needed by extending the command system.
4. Clarify all open items via interactive refinement

### Quality Gates
| Check Type | Description |
|-------------|-------------|
| **AI Validation** | All specification type files present, consistent, and linked |
| **Human Review** | Requirements unambiguous and correct across all specification types |
| **Cross-Phase Consistency** | Matches STORY.md and global specifications |
| **Sign-Off Condition** | All open questions resolved; all spec types finalized |

## Phase 3: Planning (P)

**Purpose:** Create a detailed, actionable implementation roadmap.

### Process
1. Run: `/create_feature_plan with [feature-name]`  
2. Generates `[feature-name]-plan.md` with:  
   - Implementation phases  
   - Tasks and deliverables  
   - Testing strategy  
   - Risk assessment  
   - Integration details  

### Quality Gates
| Check Type | Description |
|-------------|-------------|
| **AI Validation** | Tasks traceable to spec types, coverage complete |
| **Human Review** | Technical approach validated and feasible |
| **Cross-Phase Consistency** | Plan aligns with all spec types and architecture |
| **Sign-Off Condition** | Plan finalized; ready for implementation |

## Phase 4: Implementation (I)

**Purpose:** Execute the plan with high quality and alignment to specifications.

### Process
1. Run: `/implement_feature_plan with [feature-name]-plan.md`  
2. Follow defined phases and deliverables
3. Validate implementation with automated and manual testing
4. Ensure documentation and code stay synchronized

### Quality Gates
| Check Type | Description |
|-------------|-------------|
| **AI Validation** | Implementation matches specification types and passes tests |
| **Human Review** | Code reviewed for style, design, and maintainability |
| **Cross-Phase Consistency** | Code fully satisfies all spec types and plan |
| **Sign-Off Condition** | All tests pass; implementation complete and documented |

## Command System

### Discovery Commands (Phase 1)
- `extract_global_specs.md`

### Development Commands (Phases 2–4)
- `create_feature_specs.md`  
- `create_feature_plan.md`  
- `implement_feature_plan.md`

### Command Management
- Commands reside in the `commands/` directory
- Can be downloaded from the **Specs CLI** repository 
- Compatible with **any AI-powered IDE** (e.g., Roo Code, Trae AI, etc.)
- Registered as slash commands if placed inside the IDE-specific folder (e.g., `.roo/commands/` for Roo Code)
- If no slash commands supported by the IDE run them like this: `execute [command file].md [arguments]` (use @ or # to reference files or folders)

## Best Practices

### For New Projects (Bootstrap Mode)
- Start with a foundational feature defining architecture and standards
- Focus on extensibility and reusable templates
- Establish early quality gates for consistency

### For Existing Projects (Full Mode)
- Perform full global extraction before new features
- Keep global specifications updated continuously
- Maintain consistency and review integration points carefully

### Universal Best Practices
- Never skip documentation or validation steps
- Keep specs technology-agnostic until implementation
- Use AI for acceleration, not delegation
- Maintain traceability between story, specs, plan, and code
- Prefer clear, consistent naming conventions (`kebab-case` recommended)

## Success Metrics

| Category | Goals |
|-----------|-------|
| **Specification Quality** | Complete templates, technology-agnostic clarity, full requirement coverage |
| **Workflow Adherence** | Sequential yet flexible phase flow, validated transitions |
| **Implementation Success** | Code matches spec types, all tests pass, maintainable and consistent design |


## Error Handling and Recovery

| Issue | Resolution |
|--------|-------------|
| **Missing Global Specs** | Stop work, complete Phase 1.1 (Codebase Discovery) |
| **Incomplete Specs** | Return to "Specification" phase and clarify missing specification types |
| **Implementation Deviations** | Adjust code to match spec types; not vice versa |
| **Quality Gate Failures** | Fix issues and revalidate before continuing |

## Maintenance and Evolution

- Update global specs after each feature
- Regularly extract new architectural patterns
- Keep command files updated with evolving templates
- Gather feedback and iterate the workflow

---

### Summary

The **AI-assisted DSPI Workflow** provides a repeatable, human-centered framework for Specification-Driven Development.  
By combining structured documentation, iterative flexibility, and AI-powered validation, it helps teams produce **clear, maintainable, and high-quality software** — feature by feature, spec by spec.