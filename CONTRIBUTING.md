# Contributing to Specs CLI

We welcome contributions from the community! This document provides guidelines for contributing to Specs CLI.

## 🚀 Getting Started

### Prerequisites

- Bash shell (Unix/Linux/macOS) or Git Bash (Windows)
- Basic understanding of shell scripting
- Familiarity with specification-driven development methodology

### Development Setup

1. **Fork the repository**
   ```bash
   # Fork on GitHub, then clone your fork
   git clone https://github.com/YOUR_USERNAME/specs-cli.git
cd specs-cli
   ```

2. **Make the CLI executable**
   ```bash
   chmod +x specs.sh
   chmod +x tests.sh
   ```

3. **Run tests to verify setup**
   ```bash
   ./tests.sh
   ```

## 🛠️ Development Workflow

### Making Changes

1. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes**
   - Follow existing code style and patterns
   - Add tests for new functionality
   - Update documentation as needed

3. **Test your changes**
   ```bash
   ./tests.sh
   ```

4. **Commit your changes**
   ```bash
   git add .
   git commit -m "brief description of your change"
   ```

5. **Push and create a Pull Request**
   ```bash
   git push origin feature/your-feature-name
   ```

## 📝 Coding Standards

### Shell Script Guidelines

- **Use `set -e`** at the beginning of scripts for error handling
- **Quote variables** to prevent word splitting: `"$variable"`
- **Use meaningful function names** with snake_case
- **Add comments** for complex logic
- **Follow existing indentation** (4 spaces)
- **Use consistent error handling** with colored output functions

### Template Guidelines

- **Use `{{NAME}}` placeholder** for project/feature name
- **Use `{{SANITIZED_NAME}}` placeholder** for feature directory
- **Include documentation** in template comments
- **Maintain consistent structure** across similar templates
- **Provide examples** where helpful
- **Keep templates focused** on their specific purpose

## 🧪 Testing

### Running Tests

```bash
# Run all tests
./tests.sh

# Tests automatically:
# - Create temporary directories
# - Test CLI commands
# - Verify file creation
# - Check template substitution
# - Clean up after tests
```

### Adding Tests

When adding new functionality:

1. **Add test cases** in `tests.sh`
2. **Follow existing test patterns**
3. **Test both success and failure cases**
4. **Ensure tests clean up** temporary files
5. **Verify tests pass** before submitting PR

### Test Structure

```bash
# Test function template
test_your_feature() {
    run_test "Your Feature Test"
    
    # Setup
    local temp_dir=$(create_temp_dir)
    
    # Execute
    ./specs.sh your-command "$temp_dir/test-project"
    
    # Verify
    verify_file "$temp_dir/test-project/expected-file.md" "expected content" "Your Feature Test"
    
    # Cleanup
    cleanup_temp_dir "$temp_dir"
}
```

## 📚 Documentation

### README Updates

- **Keep examples current** with actual CLI behavior
- **Update version numbers** when releasing
- **Add new features** to appropriate sections
- **Maintain consistent formatting**

### Template Documentation

- **Add header comments** explaining template purpose
- **Include usage examples** in templates
- **Document placeholder variables**
- **Provide clear next steps**

## 🐛 Bug Reports

### Before Reporting

1. **Check existing issues** for duplicates
2. **Test with latest version**
3. **Try basic troubleshooting** from README

### Bug Report Template

```markdown
**Describe the bug**
A clear description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Run command '...'
2. See error

**Expected behavior**
What you expected to happen.

**Environment:**
- OS: [e.g. macOS 12.0, Ubuntu 20.04, Windows 11]
- Shell: [e.g. bash 5.1, zsh 5.8]
- Specs CLI version: [e.g. 0.1.0]

**Additional context**
Any other context about the problem.
```

## 💡 Feature Requests

### Before Requesting

1. **Check existing issues** and discussions
2. **Consider if it fits** Specs CLI's scope
3. **Think about implementation** complexity

### Feature Request Template

```markdown
**Is your feature request related to a problem?**
A clear description of what the problem is.

**Describe the solution you'd like**
A clear description of what you want to happen.

**Describe alternatives you've considered**
Other solutions or features you've considered.

**Additional context**
Any other context about the feature request.
```

## 🏷️ Release Process

### Version Numbering

We follow [Semantic Versioning](https://semver.org/):

- **MAJOR**: Incompatible API changes
- **MINOR**: New functionality (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

### Release Checklist

- [ ] Update version in `specs.sh`
- [ ] Update `CHANGELOG.md`
- [ ] Run full test suite
- [ ] Update documentation
- [ ] Create GitHub release
- [ ] Tag release in git

## 🤝 Community Guidelines

### Code of Conduct

- **Be respectful** and inclusive
- **Help others** learn and contribute
- **Focus on constructive** feedback
- **Assume positive intent**

### Communication

- **Use GitHub Issues** for bugs and feature requests
- **Use GitHub Discussions** for questions and ideas
- **Be clear and concise** in communications
- **Provide context** and examples

## 🎯 Areas for Contribution

### High Priority

- **Bug fixes** and stability improvements
- **Test coverage** expansion
- **Documentation** improvements
- **Cross-platform** compatibility

### Medium Priority

- **New templates** for different project structures
- **CLI enhancements** and new commands
- **Performance** optimizations
- **Integration examples** with popular tools

### Low Priority

- **Advanced features** for power users
- **Alternative output formats**
- **Internationalization**

## 📞 Getting Help

- **Documentation**: Check README and template files
- **Issues**: Search existing GitHub issues
- **Discussions**: Join GitHub Discussions
- **Direct Contact**: Open an issue for maintainer attention

---

**Thank you for contributing to Specs CLI!** 🙏

Your contributions help make AI-assisted development more accessible and effective for developers worldwide.