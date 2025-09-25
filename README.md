# Specs CLI

A tool-independent CLI for specification-driven development (SDD) that enables high quality agentic coding in any AI-powered IDE. Specs CLI needs no deep IDE integration as you can execute AI workflows easily at the surface keeping full control and transparency.

- **Supports all AI-powered IDEs**: Roo Code, Cline, Trae AI, ...
- **Easy to adapt**: Customize AI workflows and spec templates to fit your project needs

## ⚙️ How It Works

1. **Open IDE**: New project or existing codebase
2. **IDE Terminal**: `specs init`
3. **Open PROGRESS.md**: Follow the instructions
4. AI executes workflows, you review and approve results

## 📦 Installation

### Quick Start

```bash
# Clone the repo
git clone https://github.com/specs-cli/specs-cli.git
cd specs-cli

# Make the CLI executable (Unix/Linux/macOS)
chmod +x specs.sh

# Verify installation
./specs.sh help
```

### Install as System Command

For direct access from your project directory:

```bash
# Install specs command globally
./specs.sh install

# Update your current session
export PATH="$HOME/.local/bin:$PATH"

# Now this works everywhere:
specs help
specs init
specs add-feature "New Feature"
```

### System Requirements

- **Unix/Linux/macOS**: Bash shell (included by default)
- **Windows**: Git Bash (comes with Git for Windows)
- **Dependencies**: None - pure Bash implementation

## 📁 Target Project Structure

This file structure will be created during AI workflow execution:

```
my-project/
├── PROGRESS.md                # Main workflow - START HERE
├── ISSUES.md                  # Implementation issues reporting
├── QUESTIONS.md               # Specification questions reporting
├── specs/                     # All specifications
│   ├── system-overview.md     # High-level system design
│   ├── infrastructure.md      # Infrastructure specifications
│   └── [feature-name]/        # Feature specifications
│       ├── api-contract.md    # API definitions
│       ├── data-model.md      # Data structures
│       ├── ui-design.md       # UI/UX specifications
│       └── business-logic.md  # Business rules
```

## 📝 Customizing Spec Templates

The AI workflows contain embedded specification templates that define the structure and content of generated documentation. If you need to adapt these templates to fit your project's specific needs, you can find them in the following workflow files:

- **`templates/generate-system-specs.md`** - Contains templates for:
  - system-overview.md
  - infrastructure.md

- **`templates/generate-feature-specs.md`** - Contains templates for:
  - business-logic.md
  - data-model.md
  - api-contract.md
  - ui-design.md
  - QUESTIONS.md

- **`templates/generate-feature-code.md`** - Contains template for:
  - ISSUES.md

To customize these templates, simply edit the relevant workflow file. The AI will use your modified templates when generating specifications and code for your project.

## 🔧 Troubleshooting

**Permission Errors (Unix/Linux/macOS)**
```bash
chmod +x specs.sh
```

**Windows Usage**
```bash
# Use Git Bash (recommended)
bash specs.sh init /c/Users/username/my-project
```

**Path Issues**
- Use absolute paths: `/home/user/projects/myapp`
- Tilde expansion supported: `~/projects/myapp`
- Avoid spaces in paths

## 🤝 Contributing

We welcome contributions! Here's how to get started:

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes** and add tests
4. **Run the test suite**: `./tests.sh`
5. **Commit your changes**: `git commit -m 'Add amazing feature'`
6. **Push to the branch**: `git push origin feature/amazing-feature`
7. **Open a Pull Request**

For detailed contribution guidelines, development setup, coding standards, and testing procedures, please see our [CONTRIBUTING.md](CONTRIBUTING.md) file.

## 🙏 Acknowledgments

The Specs CLI templates and project structure methodology were originally developed and documented in the book [Mastering AI Agents](https://mastering-ai-agents.com). This CLI tool brings those proven concepts to life as a practical development toolkit.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.