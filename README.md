# Specs CLI

A tool-independent CLI for specification-driven development (SDD) that enables seamless agentic coding workflows in any IDE. Specs CLI automates project initialization with structured specification templates, optimizing AI-assisted development through systematic spec-first methodology that enhances collaboration between developers and AI coding agents.

## 🚀 Key Benefits

- **Automated Setup**: Complete project initialization with optimal structure for AI collaboration
- **Consistency**: Standardized templates ensure uniform development patterns across projects
- **Time Efficiency**: Eliminates manual setup and reduces project initialization overhead
- **AI Optimization**: Project layouts specifically designed for seamless AI assistance
- **Production Focus**: Templates built for maintainable, scalable software systems

## 📦 Installation

### Quick Start

```bash
# Clone the repo
git clone https://github.com/specs-cli/specs-cli.git
cd specs-cli

# Make the CLI executable (Unix/Linux/macOS)
chmod +x specs.sh

# Verify installation
./specs.sh version
```

### Install as System Command

For easier access, you can install `specs` as a system-wide command:

```bash
# Install specs globally
./specs.sh install

# Follow the instructions to update your current session:
export PATH="$HOME/.local/bin:$PATH"

# Now you can use 'specs' from your target project directory
specs help
specs init
specs add-feature "New Feature"
```

**What the install command does:**
- Creates a symbolic link to `specs` in your local bin directory
- Automatically updates your shell configuration (`~/.zshrc`, `~/.bash_profile`, etc.)
- Makes the `specs` command available system-wide
- Provides instructions for immediate use in the current terminal session

### System Requirements

- **Unix/Linux/macOS**: Bash shell (included by default)
- **Windows**: Git Bash (comes with Git for Windows)
- **Dependencies**: None - pure Bash implementation

## 🛠️ Usage

### Specs CLI Commands

Specs CLI provides the following commands:

```bash
# Show help
./specs.sh help

# Initialize a new specs project
./specs.sh init /path/to/my-project
./specs.sh init /path/to/my-project --name "My Awesome Project"

# Add a feature to existing project
./specs.sh add-feature /path/to/project "User Authentication"
./specs.sh add-feature /path/to/project "Product Catalog" --force

# Install as system command (makes 'specs' available globally)
./specs.sh install

# Show version
./specs.sh version
```

### Command Options

- `-n, --name <name>`: Project name (for init command)
- `-f, --force`: Force operation (overwrite existing files)
- `-q, --quiet`: Suppress non-error output
- `-h, --help`: Show help message

## 📋 Target Project Structure

Specs CLI creates a standardized project structure optimized for AI collaboration:

```
my-project/
├── PROGRESS.md              # Main workflow file - START HERE
├── specs/                   # All specifications
│   ├── system-overview.md   # High-level system design
│   ├── infrastructure.md    # Infrastructure specifications
│   ├── shared/              # Shared specifications
│   │   ├── api-contract.md  # API definitions
│   │   ├── data-model.md    # Data structures
│   │   ├── ui-design.md     # UI/UX specifications
│   │   └── business-logic.md # Business rules
│   └── features/            # Feature-specific specs
│       └── feature-name/    # Individual feature specs
└── features/                # Implementation code
    └── feature-name/        # Feature implementations
```

## 🎯 Core Workflow

### 1. Initialize Your Project

```bash
# For new projects
./specs.sh init ~/my-new-project --name "My Project"

# For existing codebases
./specs.sh init ~/existing-project --force
```

### 2. Follow PROGRESS.md

After initialization, **open `PROGRESS.md`** - this is your primary workflow file that provides:

- ✅ **Structured Task Lists**: Pre-defined checklists for different project types
- 🤖 **AI Collaboration Prompts**: Ready-to-use prompts for AI assistants
- 📊 **Phase Management**: Clear separation between specification and implementation
- 📈 **Progress Tracking**: Checkboxes to monitor completion

### 3. Specification-Driven Development

1. **Write Specifications First**: Always complete specs before implementation
2. **Use AI Assistance**: Leverage provided prompts in `PROGRESS.md`
3. **Iterative Refinement**: Refine specs based on implementation learnings
4. **Feature Isolation**: Add new features using the `add-feature` command

## 🔧 Advanced Usage

### Working with Existing Codebases

Specs CLI automatically detects existing code and adapts:

- **Existing Code Detected**: Uses `PROGRESS_FROM_CODE.md` template
- **New Project**: Uses `PROGRESS_FROM_SCRATCH.md` template

### Adding Features

```bash
# Add a new feature with dedicated specs
./specs.sh add-feature ~/my-project "User Authentication"

# This creates:
# specs/features/user-authentication/
# features/user-authentication/
```

### Customizing Templates

All templates are located in the `templates/` directory:

- `PROGRESS_FROM_CODE.md` - For existing codebases
- `PROGRESS_FROM_SCRATCH.md` - For new projects
- `system-overview.md` - System architecture template
- `infrastructure.md` - Infrastructure specifications
- `api-contract.md` - API design template
- `data-model.md` - Data structure template
- `ui-design.md` - UI/UX design template
- `business-logic.md` - Business rules template

## 🤖 AI Collaboration Best Practices

### Recommended AI-Powered IDEs

- **VS Code + Cline** - Popular combination
- **VS Code + Roo Code** - Popular combination
- **Trae AI** - All-in-one IDE

### Workflow Tips

1. **Use Provided Prompts**: Leverage AI prompts in `PROGRESS.md`
2. **Review Generated Specs**: Always review AI-generated specifications
3. **Context Preservation**: The structured approach ensures AI has comprehensive context
4. **Incremental Development**: Work through checklists systematically

## 🧪 Testing

Run the test suite to verify Specs CLI functionality:

```bash
# Run all tests
./tests.sh

# Tests cover:
# - Project initialization
# - Feature addition
# - Template generation
# - Error handling
# - CLI argument parsing
```

## 🆘 Troubleshooting

### Common Issues

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
- Avoid spaces in paths or use quotes

### Getting Help

- 📖 **Documentation**: Check this README and template files
- 🐛 **Issues**: Report bugs on GitHub Issues
- 💬 **Discussions**: Join GitHub Discussions for questions
- 📧 **Contact**: Open an issue for direct support

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

### Development Guidelines

- Follow existing code style and patterns
- Add tests for new functionality
- Update documentation for user-facing changes
- Ensure backward compatibility

## 📚 Acknowledgments

The Specs CLI templates and project structure methodology were originally developed and documented in the book [Mastering AI Agents](https://mastering-ai-agents.com). This CLI tool brings those proven concepts to life as a practical development toolkit.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.