# DSPI Workflow Mini

**Discovery → Specification → Planning → Implementation**

The DSPI Workflow is a structured, AI-assisted approach to Specification-Driven Development (SDD).

## Install Slash Commands

- Copy files from `specs-cli/commands/` into your project
- Use specific target directory for Slash Commands:
  - Roo Code: `.roo/commands/`
- If no Slash Commands supported, use `execute @[command].md [arguments]` instead

## Phase 1: Discovery (D)

### 1.1 Codebase Discovery (for existing codebases)

This step is mandatory for projects with existing codebase. Essential specs are extracted to be used later during the DSPI Workflow.

**Run command**: `/extract_global_specs`

This will analyze your existing codebase and create five specification files. Review and adapt them to your project needs!

**Added structure**:
```
specs/
├── api-contract.md      # Interface specifications
├── business-logic.md    # Business logic specifications
├── data-model.md        # Data model specifications
├── infrastructure.md    # Infrastructure specifications
└── ui-design.md         # UI/UX design specifications
```

### 1.2 Feature Discovery

**Write STORY.md**:
```
# [Feature Name]

## Feature Description
[Description of the feature in a few sentences]

[Add more sections if appropriate]
```

Writing **STORY.md** manually is important as it serves as primary AI input.

> **Tip**: For the first feature of a new project, it is recommended to use a very detailed **STORY.md** having multiple sections like **Vision Statement**, **General Architecture**, **Business Context**, **Technology Stack**, and **Feature Boundaries**. This first feature will serve as your initial project setup.

## Phase 2: Specification (S)

**Run command**: `/create_feature_specs with @STORY.md`

This will create separate specification files covering business logic, data model, API contract, and UI/UX design of the new feature. Additional specification types can be supported as needed. Review and adapt them to your needs!

**Move STORY.md** into the new feature specs directory.

**Added structure**:
```
specs/
└── [feature-name]/
    ├── [feature-name]-business-logic.md    # Business rules and scenarios
    ├── [feature-name]-data-model.md        # Data structures and relationships
    ├── [feature-name]-api-contract.md      # API endpoints and contracts
    ├── [feature-name]-ui-design.md         # UI/UX design specifications
    └── STORY.md                            # Manual feature description
```

## Phase 3: Planning (P)

**Run command**: `/create_feature_plan with @[feature-folder]`

This will create a feature implementation plan file. Review and adapt it to your needs!

**Added structure**:
```
specs/
└── [feature-name]/
    ├── [feature-name]-plan.md              # Feature implementation plan
    ├── [feature-name]-business-logic.md    # Business rules and scenarios
    ├── [feature-name]-data-model.md        # Data structures and relationships
    ├── [feature-name]-api-contract.md      # API endpoints and contracts
    ├── [feature-name]-ui-design.md         # UI/UX design specifications
    └── STORY.md                            # Manual feature description
```

## Phase 4: Implementation (I)

**Run command**: `/implement_feature_plan with @[feature-name]-plan.md`

This will generate the feature implementation (code). Review, adapt and test it carefully!