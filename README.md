# Specs CLI - 100% Markdown

Markdown slash commands for specification-driven development (SDD) using any AI-powered IDE.

## Example Usage (Roo Code)

### Register Slash Commands

1. Open your project and create the `.roo/commands/` directory
2. Clone the specs-cli repository
3. Copy all files from `specs-cli/commands/` into `.roo/commands/`
4. Roo Code will automatically register the slash commands

> **Tip**: Start a new AI session when using slash commands. This helps keep the AI context window as clean as possible for large codebases.

### Existing Codebase (skip for new projects)

**Run Slash Commands**:
1. `/extract_business_logic`
2. `/extract_data_model`
3. `/extract_api_contract`
4. `/extract_ui_design`
5. `/extract_infrastructure`

This will analyze your existing codebase and create five specification files. Be sure to review them carefully!

**Added structure**:
```
specs/
├── api-contract.md
├── business-logic.md
├── data-model.md
├── infrastructure.md
└── ui-design.md
```

### Specify New Feature

**Run Slash Commands**:
1. `/create_feature_specs [Feature Name] [Feature Description]`
2. `/create_feature_plan`

This will create two new specification files. Review them carefully!

**Added structure**:
```
specs/
├── [New Feature]/
│   ├── feature-plan.md
│   └── feature-specs.md
```

### Implement New Feature

**Run Slash Command**: `/implement_feature_plan`

This will generate the feature implementation code. Review it carefully!

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

The Specs CLI templates and project structure methodology were originally developed and documented in the book [Mastering AI Agents](https://mastering-ai-agents.com). This CLI brings those proven concepts to life for every-day development.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
