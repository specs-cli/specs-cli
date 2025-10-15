# [x] Specs CLI

Specs CLI is an Agentic CLI for AI-assisted Specification-Driven Development (SDD). It applies the DSPI Workflow:

**Discovery → Specification → Planning → Implementation**

Learn how it works in detail: [DSPI_WORKFLOW.md](DSPI_WORKFLOW.md)

## Installation

| IDE | Agent Installation | Commands Installation |
| --- | --- | --- |
| Roo Code | Click [⋯] → Modes → Import Mode → Select `specs-cli/roo-modes/dspi-developer.yaml` | Switch to DSPI Developer and type task: `install commands` |
| Trae AI | Create new Agent with name: DSPI Developer → Paste content of [agents/dspi-developer.md](agents/dspi-developer.md) | Switch to DSPI Developer and enter: `install commands` |
| Cline | Copy `agents/dspi-developer.md` into your project | Type task: `@dspi-developer.md install commands` |
| Windsurf | Copy `agents/dspi-developer.md` into your project | Ask: `@dspi-developer.md install commands` |

Ask the Agent what to do next and it will guide you through the DSPI Workflow or you can apply it manually using Slash Commands: [DSPI_WORKFLOW_MINI.md](DSPI_WORKFLOW_MINI.md)

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