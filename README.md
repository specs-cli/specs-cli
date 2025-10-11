# [x] Specs CLI

Specs CLI is an Agentic CLI for AI-assisted Specification-Driven Development (SDD). It applies the DSPI Workflow:

**Describe → Specify → Plan → Implement**

Use Specs CLI inside any AI-powered IDE with any AI model to immediately start spec-driven feature development for large existing codebases or brand-new projects. Learn more in [DSPI_WORKFLOW.md](DSPI_WORKFLOW.md)

## Usage With Agent (recommended)

**Install the Agent (Mode for Roo Code)**:
- Open your project and go to the Roo Code panel
- Click the three-dot menu (⋯) in the panel
- Select Modes from the dropdown menu
- Scroll down and click **Import Mode**
- Navigate to `specs-cli/roo-modes/`
- Select the `dspi-developer-[version].yaml` file

**Install the Agent (for other IDEs)**:
- Copy the file content of `specs-cli/agents/dspi-developer-[version].md` to your clipboard
- Go to your IDE's AI panel
- Open the settings and search for the option to create a new Agent or System Prompt
- Create the new Agent or System Prompt with
    - **Name**: DSPI Developer [version] (e.g. DSPI Developer X.0)
    - **Prompt**: [Paste the content of `specs-cli/agents/dspi-developer-[version].md`]
- Save the new Agent or System Prompt

**Install Commands**:
- Switch to the new Agent **DSPI Developer [version]** in your AI panel
- Enter this prompt: `install commands`
- Follow the instructions provided by the Agent

You are now ready. Just ask the Agent what to do next and it will guide you through the DSPI Workflow.

## Usage Without Agent

- Copy the `commands/` directory from `specs-cli/` to your project
- Make sure to use the IDE-specific location (e.g. `.roo/commands/` for Roo Code)
- Apply the DSPI workflow manually: [DSPI_WORKFLOW_MINI.md](DSPI_WORKFLOW_MINI.md)

> **Note**: If your IDE does not support slash commands, you can run them like this: `execute [command file].md [arguments]` (use @ or # to reference files or folders).

## Contributing

We welcome contributions! Here's how to get started:

- **Fork the repository**
- **Create a feature branch**: `git checkout -b feature/amazing-feature`
- **Make your changes**
- **Test your changes**
- **Commit your changes**: `git commit -m 'Add amazing feature'`
- **Push to the branch**: `git push origin feature/amazing-feature`
- **Open a Pull Request**

## Acknowledgments

- **Mastering AI Agents**: Specs CLI templates and project structure were originally developed and documented in the book [Mastering AI Agents](https://mastering-ai-agents.com)
- **HumanLayer**: Specs CLI command structure was heavily influenced by the [HumanLayer](https://www.humanlayer.dev) Claude Code setup

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.