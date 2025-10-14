# [x] Specs CLI

Specs CLI is an Agentic CLI for AI-assisted Specification-Driven Development (SDD). It applies the DSPI Workflow:

**Discovery → Specification → Planning → Implementation**

Use Specs CLI inside any AI-powered IDE with any AI model to immediately start spec-driven feature development for large existing codebases or brand-new projects. Learn more in [DSPI_WORKFLOW.md](DSPI_WORKFLOW.md)

## Usage With Agent (recommended)

**Install the Agent (Mode for Roo Code)**:
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
    - **Name**: DSPI Developer [version]
    - **Prompt**: [Paste the content of `specs-cli/agents/dspi-developer.md`]
- Save the new Agent or System Prompt

**Install Commands**:
- Switch to the new Agent **DSPI Developer** in your AI panel
- Enter this prompt: `install commands`
- Follow the instructions provided by the Agent

You are now ready. Just ask the Agent what to do next and it will guide you through the DSPI Workflow.

## Usage Without Agent

- Copy the `commands/` directory from `specs-cli/` to your project
- Make sure to use the IDE-specific location (e.g. `.roo/commands/` for Roo Code)
- Apply the DSPI workflow manually: [DSPI_WORKFLOW_MINI.md](DSPI_WORKFLOW_MINI.md)

> **Note**: If your IDE does not support slash commands, you can run them like this: `execute [command file].md [arguments]` (use @ or # to reference files or folders).

## Customization

This is how you can customize Specs CLI for your specific needs:

1. **Fork the repository**:
    - Fork the Specs CLI repository to your GitHub account.
    - This allows you to make changes and share them with others.

2. **Adapt command management**:
    - Change section `Command Management` in `agents/dspi-developer.md` to match your fork.
    - Do the same change in `roo-modes/dspi-developer.yaml`.
    - The URL should look like this in both Agents:
        ```
        https://raw.githubusercontent.com/[your-username]/specs-cli/main/commands/
        ```
    - Commands will now be downloaded from your fork when using your Agent.

3. **Customize specification templates**:
    - Templates are embedded into `extract_global_specs.md` and `create_feature_specs.md`.
    - Customize existing templates or add new templates as needed.
    - Changing command structure and logic is not recommended but of course possible.

4. **Create a stable version**:
    - Create a new version branch in your fork (e.g. `custom1`).
    - Push to the new branch (e.g. `custom1`).
    - Update the URL in `agents/dspi-developer.md` and `roo-modes/dspi-developer.yaml` to point to the new branch.
    - Example:
        ```
        https://raw.githubusercontent.com/[your-username]/specs-cli/custom1/commands/
        ```
    - Agents are now using the stable version of your fork during command installation.

## Acknowledgments

- **Mastering AI Agents**: Specs CLI templates and project structure were originally developed and documented in the book [Mastering AI Agents](https://mastering-ai-agents.com)
- **HumanLayer**: Specs CLI command structure was heavily influenced by the [HumanLayer](https://www.humanlayer.dev) Claude Code setup

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.