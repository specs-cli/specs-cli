# Specs CLI

An IDE-agnostic framework for AI-assisted Specification-Driven Development (SDD) applying the DSPI Workflow:

**Describe → Specify → Plan → Implement**

Specs CLI **supports large existing codebases** and of course starting a new project from scratch. For more details see: [DSPI_WORKFLOW.md](DSPI_WORKFLOW.md)

## Installation (Roo Code)

**1. Clone the specs-cli repository**

**2. Slash Command Registration**:
1. Open your project and create `.roo/commands/` directory
2. Copy all files from `specs-cli/commands/` into `.roo/commands/`
3. Roo Code will automatically register the slash commands

Now you can use the slash commands in your Roo Code panel. For example: `/extract_business_logic`

**3. Mode Import**:
1. Open your project and go to the Roo Code panel
2. Click the three-dot menu (⋯) in the panel
3. Select Modes from the dropdown menu
4. Scroll down and click **Import Mode**
5. Navigate to `specs-cli/roo-modes/`
6. Select the `dspi-developer.yaml` file

Now you can switch to the new mode **DSPI Developer** in your Roo Code panel. This mode will guide you through the DSPI Workflow.

## Installation (other IDEs)

Generic installation guide for IDEs like Trae AI that do not support slash commands but still allow you to apply the whole DSPI Workflow.

**1. Clone the specs-cli repository**

**2. Copy Command Directory**:
1. Open your project and create `commands/` directory
2. Copy all files from `specs-cli/commands/` into your `commands/` directory

Now you can use the commands simply by executing them in AI prompts. For example: `execute extract_business_logic.md` (use @ or # to reference the file)

**3. Create New Agent**:
1. Copy the file content of `specs-cli/agents/dspi-developer.md` to your clipboard
2. Go to your IDE's AI panel
3. Open the settings and search for the option to create a new Agent or System Prompt
4. Create the new Agent or System Prompt with
    - **Name**: DSPI Developer
    - **Prompt**: [Paste the content of `specs-cli/agents/dspi-developer.md`]
5. Save the new Agent or System Prompt

Now you can switch to the new agent **DSPI Developer** in your AI panel. This agent will guide you through the DSPI Workflow.

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
