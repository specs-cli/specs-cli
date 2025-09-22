#!/bin/bash

# Specs CLI
# Creates a complete spec-driven development project structure or adds features

set -e

# Version
VERSION="0.0.2"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
    if [ "$QUIET" != "true" ]; then
        echo -e "${BLUE}[INFO]${NC} $1"
    fi
}

print_success() {
    if [ "$QUIET" != "true" ]; then
        echo -e "${GREEN}[SUCCESS]${NC} $1"
    fi
}

print_warning() {
    if [ "$QUIET" != "true" ]; then
        echo -e "${YELLOW}[WARNING]${NC} $1"
    fi
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to show usage
show_usage() {
    cat << EOF
Specs CLI v${VERSION}

USAGE:
    $(basename "$0") <command> [options]

COMMANDS:
    init [<path>]               Initialize a new specs project
    add-feature [<path>] <name> Add a feature to existing project
    install                     Install specs as a system command
    help                        Show this help message
    version                     Show version information

OPTIONS:
    -n, --name <name>          Project name (for init command)
    -f, --force                Force operation (overwrite existing files)
    -q, --quiet                Suppress non-error output
    -h, --help                 Show help message

EXAMPLES:
    # Initialize new project
    $(basename "$0") init                              # Uses current directory
    $(basename "$0") init /path/to/my-project
    $(basename "$0") init --name "My Awesome Project"  # Uses current directory
    
    # Add feature to existing project
    $(basename "$0") add-feature "User Authentication"        # Uses current directory
    $(basename "$0") add-feature /path/to/project "User Authentication"
    $(basename "$0") add-feature "Product Catalog" --force    # Uses current directory
    
    # Install as system command
    $(basename "$0") install

DESCRIPTION:
    Specs CLI implements the specification-first development methodology.
    It creates structured project templates that encourage writing
    specifications before implementation, optimizing AI-assisted development.

EOF
}

# Function to show version
show_version() {
    echo "v${VERSION}"
}

# Function to create directory if it doesn't exist
create_dir() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        print_info "Created directory: $1"
    fi
}

# Function to sanitize names for filesystem use
sanitize_name() {
    local name="$1"
    # Convert to lowercase, replace spaces and special chars with hyphens
    # Remove multiple consecutive hyphens and trim leading/trailing hyphens
    echo "$name" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/-\+/-/g' | sed 's/^-\|-$//g'
}

# Function to transform template comments for generated files
transform_template_comments() {
    local content="$1"
    local target_name="$2"
    
    # Check if content starts with template comment block
    if echo "$content" | head -1 | grep -q "^<!--$"; then
        # Extract the template type from the second line
        local template_type=$(echo "$content" | sed -n '2s/ TEMPLATE$//p')
        
        # Create user-friendly comment for generated files (using printf for proper newlines)
        local new_comment
        new_comment=$(printf "<!--\nGenerated from %s specification template\n\nThis file contains the %s specification for: %s\n\nTo modify this specification:\n1. Update the content below as needed\n2. Use this as a reference for implementation\n3. Keep this file updated as requirements change\n-->" "$template_type" "$template_type" "$target_name")
        
        # Replace the entire template comment block with the new comment
        # First, get content after the template comment block
        local content_after_comment=$(echo "$content" | sed -n '/^-->$/,$p' | tail -n +2)
        
        # Combine new comment with remaining content
        content="$new_comment\n$content_after_comment"
    fi
    
    echo -e "$content"
}

# Function to safely copy template file
safe_copy_template() {
    local template_path="$1"
    local target_path="$2"
    local target_name="$3"
    
    if [ ! -f "$template_path" ]; then
        print_error "Template not found: $template_path"
        return 1
    fi
    
    if [ -f "$target_path" ] && [ "$FORCE" != "true" ]; then
        print_warning "File already exists, skipping: $target_path"
        return 0
    fi
    
    # Read template content
    local content=$(cat "$template_path")
    
    # Replace placeholders with actual values
    content=${content//"{{NAME}}"/$target_name}
    content=${content//"{{SANITIZED_NAME}}"/$(sanitize_name "$target_name")}
    
    # Transform template comments for generated files
    content=$(transform_template_comments "$content" "$target_name")
    
    echo "$content" > "$target_path"
    print_success "Created: $target_path"
}

# Function to validate path
validate_path() {
    local path="$1"
    local should_exist="$2"
    
    # Expand tilde to home directory
    path="${path/#\~/$HOME}"
    
    if [ -z "$path" ]; then
        print_error "Path cannot be empty"
        return 1
    fi
    
    if [ "$should_exist" = "true" ]; then
        if [ ! -d "$path" ]; then
            print_error "Directory does not exist: $path"
            return 1
        fi
    fi
    
    echo "$path"
}

# Function to detect existing code
has_existing_code() {
    local project_path="$1"
    
    # Check for code files
    if find "$project_path" -maxdepth 3 -type f \( -name "*.js" -o -name "*.ts" -o -name "*.py" -o -name "*.java" -o -name "*.cpp" -o -name "*.c" -o -name "*.go" -o -name "*.rs" -o -name "*.php" -o -name "*.rb" -o -name "*.cs" -o -name "*.swift" -o -name "*.kt" -o -name "*.scala" -o -name "*.dart" -o -name "*.vue" -o -name "*.jsx" -o -name "*.tsx" \) -not -path "*/node_modules/*" -not -path "*/vendor/*" -not -path "*/.git/*" 2>/dev/null | head -1 | grep -q .; then
        return 0
    fi
    
    # Check for project structure indicators
    if [ -d "$project_path/src" ] || [ -d "$project_path/lib" ] || [ -d "$project_path/app" ] || [ -f "$project_path/package.json" ] || [ -f "$project_path/requirements.txt" ] || [ -f "$project_path/Cargo.toml" ] || [ -f "$project_path/go.mod" ] || [ -f "$project_path/pom.xml" ] || [ -f "$project_path/build.gradle" ]; then
        return 0
    fi
    
    return 1
}

# Function to initialize new project
init_project() {
    local project_path="$1"
    local project_name="$2"
    
    # Validate and expand path
    project_path="${project_path/#\~/$HOME}"
    
    if [ -z "$project_path" ]; then
        print_error "Project path is required"
        return 1
    fi
    
    # Check if path already exists
    if [ -d "$project_path" ]; then
        if [ "$FORCE" != "true" ]; then
            print_error "Directory already exists: $project_path"
            print_error "Use --force to add specs structure to existing directory"
            return 1
        else
            print_warning "Directory exists, adding specs structure: $project_path"
        fi
    else
        # Try to create the directory
        if ! mkdir -p "$project_path" 2>/dev/null; then
            print_error "Cannot create directory: $project_path"
            print_error "Please check permissions and try again"
            return 1
        fi
        print_success "Created project directory: $project_path"
    fi
    
    # Set project name
    if [ -z "$project_name" ]; then
        project_name=$(basename "$project_path")
    fi
    
    print_info "Creating specs project: $project_name"
    print_info "Location: $project_path"
    
    # Get script directory to find templates (before changing directories)
    # Handle symlinks by resolving to the actual script location
    local script_path="${BASH_SOURCE[0]}"
    if [ -L "$script_path" ]; then
        script_path="$(readlink "$script_path")"
    fi
    local script_dir="$(cd "$(dirname "$script_path")" && pwd)"
    
    # Change to project directory
    cd "$project_path"
    
    # Create main project structure
    print_info "Creating project structure..."
    
    # Create main directories
    create_dir "specs"
    
    # Copy template files for new project
    print_info "Creating project files from templates..."
    
    # Detect existing code
    if has_existing_code "$project_path"; then
        print_info "Existing codebase detected - using PROGRESS_FROM_CODE template"
        safe_copy_template "$script_dir/templates/PROGRESS_FROM_CODE.md" "PROGRESS.md" "$project_name"
    else
        print_info "No existing codebase detected - using PROGRESS_FROM_SCRATCH template"
        safe_copy_template "$script_dir/templates/PROGRESS_FROM_SCRATCH.md" "PROGRESS.md" "$project_name"
    fi
    
    # Copy system overview
    safe_copy_template "$script_dir/templates/system-overview.md" "specs/system-overview.md" "$project_name"
    
    # Copy infrastructure specification
    safe_copy_template "$script_dir/templates/infrastructure.md" "specs/infrastructure.md" "$project_name"
    
    print_success "\n✅ Project structure created successfully!"
    print_info "\nNext steps:"
    print_info "  1. Open the project in your AI-powered IDE (e.g. Trae AI, VS Code + Roo Code)"
    print_info "  2. Open PROGRESS.md and work through tasks step by step"
    print_info "  3. Use AI to generate specifications and code"
}

# Function to add feature
add_feature() {
    local project_path="$1"
    local feature_name="$2"
    
    # Validate inputs
    project_path=$(validate_path "$project_path" "true") || return 1
    
    if [ -z "$feature_name" ]; then
        print_error "Feature name is required"
        return 1
    fi
    
    # Check if it's a specification-first project
    if [ ! -d "$project_path/specs" ] && [ "$FORCE" != "true" ]; then
        print_error "This doesn't appear to be a specs project (no specs/ directory found)"
        print_error "Use --force to continue anyway"
        return 1
    fi
    
    # Sanitize feature name
    local feature_dir=$(sanitize_name "$feature_name")
    
    # Check if feature already exists
    if [ -d "$project_path/specs/$feature_dir" ] && [ "$FORCE" != "true" ]; then
        print_error "Feature '$feature_name' already exists"
        print_error "Use --force to overwrite existing files"
        return 1
    fi
    
    # Get project name from directory or PROGRESS.md
    local project_name=$(basename "$project_path")
    if [ -f "$project_path/PROGRESS.md" ]; then
        local extracted_name=$(head -1 "$project_path/PROGRESS.md" | sed 's/^# \([^ ]*\) .*/\1/' | tr -d '\n')
        if [ ! -z "$extracted_name" ] && [ "$extracted_name" != "$project_name" ]; then
            project_name="$extracted_name"
        fi
    fi
    
    print_info "Adding feature '$feature_name' to project: $project_name"
    print_info "Location: $project_path"
    
    # Get script directory to find templates (before changing directories)
    # Get script directory to find templates (handle symlinks)
    local script_path="${BASH_SOURCE[0]}"
    if [ -L "$script_path" ]; then
        script_path="$(readlink "$script_path")"
    fi
    local script_dir="$(cd "$(dirname "$script_path")" && pwd)"
    
    # Change to project directory
    cd "$project_path"
    
    # Create feature structure
    print_info "Creating feature structure..."
    
    # Create feature directories
    create_dir "specs/$feature_dir"
    
    # Copy feature template files
    print_info "Creating feature specification files..."
    
    safe_copy_template "$script_dir/templates/api-contract.md" "specs/$feature_dir/api-contract.md" "$feature_name"
    safe_copy_template "$script_dir/templates/data-model.md" "specs/$feature_dir/data-model.md" "$feature_name"
    safe_copy_template "$script_dir/templates/ui-design.md" "specs/$feature_dir/ui-design.md" "$feature_name"
    safe_copy_template "$script_dir/templates/business-logic.md" "specs/$feature_dir/business-logic.md" "$feature_name"
    safe_copy_template "$script_dir/templates/ai-workflow.md" "specs/$feature_dir/ai-workflow.md" "$feature_name"
    
    print_success "\n✅ Feature '$feature_name' added successfully!"
    print_info "\nNext steps:"
    print_info "  1. Update PROGRESS.md with new feature tasks"
    print_info "  2. Find specifications in specs/$feature_dir/"
    print_info "  3. Use AI to generate specifications and code"
}

# Function to install specs as a system command
install_system_command() {
    local script_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
    local install_dir="/usr/local/bin"
    local fallback_dir="$HOME/.local/bin"
    local command_name="specs"
    
    print_info "Installing specs as a system command..."
    
    # Make script executable
    chmod +x "$script_path"
    
    # Try to install to /usr/local/bin first
    if [ -w "$install_dir" ] || sudo -n true 2>/dev/null; then
        print_info "Installing to $install_dir/$command_name"
        
        if [ -w "$install_dir" ]; then
            ln -sf "$script_path" "$install_dir/$command_name"
        else
            sudo ln -sf "$script_path" "$install_dir/$command_name"
        fi
        
        print_success "✅ Successfully installed 'specs' command!"
        print_info "You can now use 'specs' from anywhere in your terminal."
    else
        # Fallback to user's local bin directory
        print_info "Installing to $fallback_dir/$command_name"
        
        mkdir -p "$fallback_dir"
        ln -sf "$script_path" "$fallback_dir/$command_name"
        
        # Check if ~/.local/bin is in PATH
        if [[ ":$PATH:" != *":$fallback_dir:"* ]]; then
            # Determine shell config file based on current shell
            local shell_config=""
            local current_shell="$(basename "$SHELL")"
            case "$current_shell" in
                zsh)
                    shell_config="$HOME/.zshrc"
                    ;;
                bash)
                    shell_config="$HOME/.bash_profile"
                    ;;
                *)
                    shell_config="$HOME/.profile"
                    ;;
            esac
            
            # Add to PATH in shell config if not already there
            local path_export='export PATH="$HOME/.local/bin:$PATH"'
            if [ -f "$shell_config" ] && ! grep -q "HOME/.local/bin" "$shell_config"; then
                echo "" >> "$shell_config"
                echo "# Added by specs install command" >> "$shell_config"
                echo "$path_export" >> "$shell_config"
                print_info "Added ~/.local/bin to PATH in $shell_config"
            elif [ ! -f "$shell_config" ]; then
                echo "$path_export" > "$shell_config"
                print_info "Created $shell_config and added ~/.local/bin to PATH"
            fi
            
            print_success "✅ Successfully installed 'specs' command!"
            print_info "PATH updated for future terminal sessions."
            print_warning "⚠️  To use 'specs' in this current session, run:"
            echo "    export PATH=\"\$HOME/.local/bin:\$PATH\""
            print_info "Or open a new terminal window."
        else
            print_success "✅ Successfully installed 'specs' command!"
            print_info "You can now use 'specs' from anywhere in your terminal."
        fi
    fi
}

# Parse command line arguments
COMMAND=""
PROJECT_PATH=""
FEATURE_NAME=""
PROJECT_NAME=""
FORCE="false"
QUIET="false"

while [[ $# -gt 0 ]]; do
    case $1 in
        init)
            COMMAND="init"
            shift
            if [[ $# -gt 0 ]] && [[ $1 != -* ]]; then
                PROJECT_PATH="$1"
                shift
            fi
            ;;
        add-feature)
            COMMAND="add-feature"
            shift
            # Parse arguments - could be either "feature-name" or "path feature-name"
            if [[ $# -gt 0 ]] && [[ $1 != -* ]]; then
                # Check if we have two non-option arguments (path + feature)
                if [[ $# -gt 1 ]] && [[ $2 != -* ]]; then
                    PROJECT_PATH="$1"
                    FEATURE_NAME="$2"
                    shift 2
                else
                    # Only one argument, treat as feature name (use current dir as path)
                    FEATURE_NAME="$1"
                    shift
                fi
            fi
            ;;
        install)
            COMMAND="install"
            shift
            ;;
        help|--help|-h)
            show_usage
            exit 0
            ;;
        version|--version|-v)
            show_version
            exit 0
            ;;
        -n|--name)
            shift
            if [[ $# -gt 0 ]]; then
                PROJECT_NAME="$1"
                shift
            else
                print_error "Option --name requires an argument"
                exit 1
            fi
            ;;
        -f|--force)
            FORCE="true"
            shift
            ;;
        -q|--quiet)
            QUIET="true"
            shift
            ;;
        -*)
            print_error "Unknown option: $1"
            echo "Use '$(basename "$0") help' for usage information"
            exit 1
            ;;
        *)
            print_error "Unknown command: $1"
            echo "Use '$(basename "$0") help' for usage information"
            exit 1
            ;;
    esac
done

# Execute command
case "$COMMAND" in
    init)
        # Use current directory as default if no path provided
        if [ -z "$PROJECT_PATH" ]; then
            PROJECT_PATH="$(pwd)"
            print_info "No path specified, using current directory: $PROJECT_PATH"
        fi
        init_project "$PROJECT_PATH" "$PROJECT_NAME"
        ;;
    add-feature)
        if [ -z "$FEATURE_NAME" ]; then
            print_error "Feature name is required for add-feature command"
            echo "Usage: $(basename "$0") add-feature [<path>] <feature-name> [--force] [--quiet]"
            exit 1
        fi
        # Use current directory as default if no path provided
        if [ -z "$PROJECT_PATH" ]; then
            PROJECT_PATH="$(pwd)"
            print_info "No path specified, using current directory: $PROJECT_PATH"
        fi
        add_feature "$PROJECT_PATH" "$FEATURE_NAME"
        ;;
    install)
        install_system_command
        ;;
    "")
        print_error "No command specified"
        echo "Use '$(basename "$0") help' for usage information"
        exit 1
        ;;
    *)
        print_error "Unknown command: $COMMAND"
        echo "Use '$(basename "$0") help' for usage information"
        exit 1
        ;;
esac

echo ""
print_success "Happy Spec-Driven Development!"

# Ensure successful exit
exit 0