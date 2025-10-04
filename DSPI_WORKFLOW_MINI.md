# DSPI Workflow Mini

**Describe → Specify → Plan → Implement**

The DSPI Workflow is a systematic approach to Specification-Driven Development (SDD).

## Document Existing Codebase

This phase is mandatory for projects with existing codebase. Essential specs are extracted to be used later during the DSPI Workflow.

**Run commands**:
1. `/extract_business_logic`
2. `/extract_data_model`
3. `/extract_api_contract`
4. `/extract_ui_design`
5. `/extract_infrastructure`

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

## Add New Feature

We are applying the DSPI Workflow for efficient feature development:

### 1. Describe Feature

**Write STORY.md**:
```
# [Feature Name]

## Feature Description
[Description of the feature in a few sentences]

[Add more sections if appropriate]
```

Writing **STORY.md** manually is important as it serves as primary AI input.

> **Tip**: For the first feature of a new project, it is recommended to use a very detailed **STORY.md** having multiple sections like **Vision Statement**, **General Architecture**, **Business Context**, **Technology Stack**, and **Feature Boundaries**. This first feature will serve as your initial project setup.

### 2. Specify Feature

**Run command**: `/create_feature_specs with STORY.md` (use @ to reference the file)

This will create a combined feature specification file consisting of business logic, data model, API contract, and UI/UX design. Review and adapt it to your needs!

**Move STORY.md** into the new feature specs directory.

**Added structure**:
```
specs/
└── [feature-name]/
    ├── [feature-name]-specs.md    # Combined feature specifications
    └── STORY.md                   # Manual feature description
```

### 3. Plan Feature Implementation

**Run command**: `/create_feature_plan with [feature-name]-specs.md` (use @ to reference the file)

This will create a feature implementation plan file. Review and adapt it to your needs!

**Added structure**:
```
specs/
└── [feature-name]/
    ├── [feature-name]-plan.md     # Feature implementation plan
    ├── [feature-name]-specs.md    # Combined feature specifications
    └── STORY.md                   # Manual feature description
```

### 4. Implement Feature

**Run command**: `/implement_feature_plan with [feature-name]-plan.md` (use @ to reference the file)

This will generate the feature implementation code. Review, adapt and test it carefully!

**After each feature**: Consider extracting or updating global specifications like described in [Document Existing Codebase](#document-existing-codebase)
