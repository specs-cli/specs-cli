# DSPI Workflow Mini

**Discovery → Specification → Planning → Implementation**

The DSPI Workflow is a structured, AI-assisted approach to specification-driven development. This is the manual guide to be used without the agent.

## Slash Command Registration

| IDE | Install Commands | Execute Commands |
|-----|------------------|------------------|
| Roo Code | Copy all files from `specs-cli/commands/` into `your-project/.roo/commands/` | `/[command] [arguments]` |
| Cline | Copy all files from `specs-cli/commands/` into `your-project/.clinerules/workflows/` | `/[command].md [arguments]` |
| Others | Copy all files from `specs-cli/commands/` into `your-project/commands/` | `execute @[command].md [arguments]` |

## Phase 1: Discovery (D)

### 1.1 Codebase Discovery (for existing codebases)

This step is mandatory for projects with existing codebase. Essential specs are extracted to be used later during the DSPI Workflow.

**Run command**: `/sc_discover`

This will analyze your existing codebase and create five specification files. Review and adapt them to your project needs!

Added structure:
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

> **Tip**: For the first feature of a new project, it is recommended to use a very detailed **STORY.md** having multiple sections like *Vision Statement*, *General Architecture*, *Business Context*, *Technology Stack*, and *Feature Boundaries*. This first feature will serve as your initial project setup.

## Phase 2: Specification (S)

**Run command**: `/sc_specify with @STORY.md`

This will create separate specification files covering business logic, data model, API contract, and UI/UX design of the new feature. Additional specification types can be supported as needed. Review and adapt them to your needs!

**Move STORY.md** into the new feature specs directory.

Added structure:
```
specs/
└── [feature-name]/
    ├── [feature-name]-api-contract.md      # API endpoints and contracts
    ├── [feature-name]-business-logic.md    # Business rules and scenarios
    ├── [feature-name]-data-model.md        # Data structures and relationships
    ├── [feature-name]-ui-design.md         # UI/UX design specifications
    └── STORY.md                            # Manual feature description
```

## Phase 3: Planning (P)

**Run command**: `/sc_plan with @[feature-folder]`

This will create a feature implementation plan file. Review and adapt it to your needs!

Added structure:
```
specs/
└── [feature-name]/
    ├── [feature-name]-api-contract.md      # API endpoints and contracts
    ├── [feature-name]-business-logic.md    # Business rules and scenarios
    ├── [feature-name]-data-model.md        # Data structures and relationships
    ├── [feature-name]-ui-design.md         # UI/UX design specifications
    ├── [feature-name]-plan.md              # Feature implementation plan
    └── STORY.md                            # Manual feature description
```

## Phase 4: Implementation (I)

**Run command**: `/sc_implement with @[feature-name]-plan.md`

This will generate the feature implementation (code). Review, adapt and test it carefully!