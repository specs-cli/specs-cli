# Specs CLI

An IDE-agnostic framework for AI-assisted Specification-Driven Development (SDD) applying the DSPI Workflow:

**Describe → Specify → Plan → Implement**

Specs CLI supports large existing codebases and of course starting a new project from scratch. For more details see: [DSPI_WORKFLOW.md](DSPI_WORKFLOW.md)

## Usage With Mode/Agent (recommended)

**Install the Mode (for Roo Code)**:
- Open your project and go to the Roo Code panel
- Click the three-dot menu (⋯) in the panel
- Select Modes from the dropdown menu
- Scroll down and click **Import Mode**
- Navigate to `specs-cli/roo-modes/`
- Select the `dspi-developer.yaml` file

**Install the Agent (for other IDEs)**:
- Copy the file content of `specs-cli/agents/dspi-developer.md` to your clipboard
- Go to your IDE's AI panel
- Open the settings and search for the option to create a new Agent or System Prompt
- Create the new Agent or System Prompt with
    - **Name**: DSPI Developer [version] (e.g. DSPI Developer v1)
    - **Prompt**: [Paste the content of `specs-cli/agents/dspi-developer.md`]
- Save the new Agent or System Prompt

**Install Commands**:
- Switch to the new Agent **DSPI Developer [version]** in your AI panel
- Enter this prompt: `install commands`
- Follow the instructions provided by the Agent

You are now ready. Just ask the Agent what to do next and it will guide you through the DSPI Workflow.

## Usage Without Mode/Agent

- Copy the `commands/` directory from `specs-cli/` to your project
- Make sure to use the IDE-specific location (e.g. `.roo/commands/` for Roo Code)
- Apply the DSPI workflow manually: [DSPI_WORKFLOW_MINI.md](DSPI_WORKFLOW_MINI.md)

## Recommended AI Models

For optimal results with Specs CLI commands, we recommend using:
- **Claude Sonnet 4**: Excellent at documenting, specifying and coding
- **DeepSeek V3.1**: Excellent at documenting
- **GPT-5**: Very good at documenting

Let us know your experience with other models and we will consider adding them to the list.

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
