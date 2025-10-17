# [x] Specs CLI

Specs CLI is an agentic CLI for AI-assisted specification-driven development. It applies the DSPI Workflow.

## DSPI Workflow

Ship features deliberately. DSPI is an AI-assisted, specification-first workflow that turns ideas into well-defined specs, actionable plans, and tested code — with traceability at every step. Instead of diving straight into code, you capture intent, specify neutral requirements, plan confidently, and implement with quality gates that keep docs and code in sync.

With Specs CLI, each phase has a simple command. Outputs live in your repo, are reviewable, and remain versioned. The agent accelerates documentation and validation; you make the decisions.

- Discovery — Understand the system and define the feature. Extract global specs (`specs/business-logic.md`, `specs/data-model.md`, `specs/api-contract.md`, `specs/ui-design.md`, `specs/infrastructure.md`) and write a clear `STORY.md` describing intent, value, and boundaries.
- Specification — Convert the story into precise, technology‑agnostic specifications split by type: business logic, data model, API contract, and UI design. Resolve open questions early and link decisions back to the story.
- Planning — Translate specifications into an implementation plan: phases, tasks, testing strategy, risks, and integration notes. Every task maps to a spec, making scope and success measurable.
- Implementation — Execute the plan iteratively. Keep documentation and code synchronized; validate with automated checks and human review. When tests pass and specs are satisfied, the feature is complete.

Why teams use DSPI:
- Clarity: specifications are the single source of truth.
- Control: humans approve; AI assists.
- Consistency: templates reduce ambiguity and prevent drift.
- Traceability: every change links back to story and specs.

## Installation

| IDE | 1. Agent Installation | 2. Commands Installation (agentic) |
| --- | --- | --- |
| Roo Code | Click [⋯] → Modes → Import Mode → Select [dspi-developer.yaml](roo-modes/dspi-developer.yaml) | Switch to DSPI Developer and type task: `install commands` |
| Cline | Copy [dspi-developer.md](agents/dspi-developer.md) into `your-project/.clinerules/` | Type task: `install DSPI commands` |
| Windsurf | Copy [dspi-developer.md](agents/dspi-developer.md) into `your-project/.windsurf/rules/` | Type task: `install DSPI commands` |
| Trae AI | Create new Agent with name: *DSPI Developer* → Paste content of [dspi-developer.md](agents/dspi-developer.md) | Switch to DSPI Developer and enter: `install commands` |
| Others | Copy [dspi-developer.md](agents/dspi-developer.md) into your project | Ask: `@dspi-developer.md install commands` |

Now ask the Agent what to do next and it will guide you through the DSPI Workflow.

Want to apply the workflow manually, here is how: [DSPI_WORKFLOW.md](DSPI_WORKFLOW.md)

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
    - Templates are embedded into `sc_discover.md` and `sc_specify.md`.
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

## Community

Join our Discord to discuss Specs CLI, share your experiences, and get help from other users. → https://discord.gg/WemsX7CsuG

## Acknowledgments

- **Mastering AI Agents**: Specs CLI templates and project structure were originally developed and documented in the book [Mastering AI Agents](https://mastering-ai-agents.com)
- **HumanLayer**: Specs CLI command structure was heavily influenced by the [HumanLayer](https://www.humanlayer.dev) Claude Code setup

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.