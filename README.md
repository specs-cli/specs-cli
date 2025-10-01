# Specs CLI

**Slash Commands for Any AI-Powered IDE**  
*(Works with Roo Code, Cline, Trae AI, and more)*

Specs CLI provides Markdown slash commands for Spec-Driven Development (SDD). Commands can be used with any AI-powered IDE.

Large existing codebases are supported by global spec-specific extraction commands.

Every new feature of your project can be developed (semi-)automatically by following the **DSPI-Workflow**:

- **D** escribe
- **S** pecify
- **P** lan
- **I** mplement

## Table of Contents

- [Slash Command Registration (Roo Code Example)](#slash-command-registration-roo-code-example)
- [Without Native Slash Commands](#without-native-slash-commands)
- [Document Existing Codebase](#document-existing-codebase)
- [Add New Feature](#add-new-feature)
  - [1. Describe Feature](#1-describe-feature)
  - [2. Specify Feature](#2-specify-feature)
  - [3. Plan Feature Implementation](#3-plan-feature-implementation)
  - [4. Implement Feature](#4-implement-feature)
- [Recommended AI Models](#recommended-ai-models)
- [Contributing](#contributing)
- [Acknowledgment](#acknowledgment)
- [License](#license)

## Slash Command Registration (Roo Code Example)

1. Open your project and create `.roo/commands/` directory
2. Clone the **specs-cli** repository
3. Copy all files from `specs-cli/commands/` into `.roo/commands/`
4. Roo Code will automatically register the slash commands

Now you can use the slash commands in your Roo Code panel.

For example: `/extract_business_logic`

> **Tip**: Keep the AI context window clean by starting a new task/chat each time using a slash command.

## Without Native Slash Commands

If you're not using Roo Code, you can still use the Specs CLI commands. Simply run them as AI prompts, using `execute` followed by the command file.

For example: `execute extract_business_logic.md` (use @ or # to reference the file)

## Document Existing Codebase

**Run commands**:
1. `/extract_business_logic`
2. `/extract_data_model`
3. `/extract_api_contract`
4. `/extract_ui_design`
5. `/extract_infrastructure`

This will analyze your existing codebase and create five specification files. Be sure to review and adapt them to your project needs!

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

**Run command**: `/create_feature_specs with STORY.md` (use @ to reference **STORY.md**)

This will create a combined feature specification file consisting of business logic, data model, API contract, and UI/UX design. Review and adapt it to your needs!

**Move STORY.md** into the new feature specs directory.

**Added structure**:
```
specs/
└── [New Feature]/
    ├── feature-specs.md    # Combined feature specifications
    └── STORY.md            # Manual feature description
```

### 3. Plan Feature Implementation

**Run command**: `/create_feature_plan with feature-specs.md` (use @ to reference **feature-specs.md**)

This will create a feature implementation plan file. Review and adapt it to your needs!

**Added structure**:
```
specs/
└── [New Feature]/
    ├── feature-plan.md     # Feature implementation plan
    ├── feature-specs.md    # Combined feature specifications
    └── STORY.md            # Manual feature description
```

### 4. Implement Feature

**Run command**: `/implement_feature_plan with feature-plan.md` (use @ to reference **feature-plan.md**)

This will generate the feature implementation code. Review, adapt and test it carefully!

**After each feature**: Consider extracting or updating global specifications like described in [Document Existing Codebase](#document-existing-codebase)

## Recommended AI Models

For optimal results with Specs CLI commands, we recommend using:
- **Claude Sonnet 4**: Excellent at documenting, specifying and coding
- **DeepSeek V3.1**: Excellent at documenting
- **GPT-5**: Very good at documenting

Let us know your experience with other models and we will consider adding them to the list.

## Contributing

We welcome contributions! Here's how to get started:

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes**
4. **Test your changes**
5. **Commit your changes**: `git commit -m 'Add amazing feature'`
6. **Push to the branch**: `git push origin feature/amazing-feature`
7. **Open a Pull Request**

## Acknowledgments

- **Mastering AI Agents**: Specs CLI templates and project structure were originally developed and documented in the book [Mastering AI Agents](https://mastering-ai-agents.com)
- **HumanLayer**: Specs CLI command structure was heavily influenced by the [HumanLayer](https://www.humanlayer.dev) Claude Code setup

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
