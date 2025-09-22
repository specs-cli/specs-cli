#!/bin/bash

# Test Suite for Specs CLI
# Tests the complete functionality using standard CLI commands

# Note: Not using 'set -e' to allow tests to continue even if some fail

# Colors for test output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test counters
TEST_COUNT=0
PASS_COUNT=0
FAIL_COUNT=0
ASSERTION_COUNT=0

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SPECS_SCRIPT="$SCRIPT_DIR/specs.sh"

# Test output functions
test_info() {
    echo -e "${BLUE}[TEST INFO]${NC} $1"
}

test_pass() {
    echo -e "${GREEN}[PASS]${NC} $1"
    ((PASS_COUNT++))
    ((ASSERTION_COUNT++))
}

test_fail() {
    echo -e "${RED}[FAIL]${NC} $1"
    ((FAIL_COUNT++))
    ((ASSERTION_COUNT++))
}

# Function to run a test
run_test() {
    local test_name="$1"
    ((TEST_COUNT++))
    test_info "Running test: $test_name"
}

# Function to create temporary test directory
create_temp_dir() {
    local temp_dir=$(mktemp -d -t specs-test-XXXXXX)
    echo "$temp_dir"
}

# Function to cleanup temp directory
cleanup_temp_dir() {
    local temp_dir="$1"
    if [ -d "$temp_dir" ]; then
        rm -rf "$temp_dir"
    fi
}

# Function to verify file exists and contains expected content
verify_file() {
    local file_path="$1"
    local expected_content="$2"
    local test_name="$3"
    
    if [ ! -f "$file_path" ]; then
        test_fail "$test_name: File does not exist: $file_path"
        return 1
    fi
    
    if [ -n "$expected_content" ]; then
        if grep -q "$expected_content" "$file_path" 2>/dev/null; then
            test_pass "$test_name: File contains expected content: $(basename "$file_path")"
        else
            test_fail "$test_name: File missing expected content '$expected_content': $(basename "$file_path")"
            return 1
        fi
    else
        test_pass "$test_name: File exists: $(basename "$file_path")"
    fi
    return 0
}

# Function to verify directory structure
verify_directory() {
    local dir_path="$1"
    local test_name="$2"
    
    if [ -d "$dir_path" ]; then
        test_pass "$test_name: Directory exists: $(basename "$dir_path")"
        return 0
    else
        test_fail "$test_name: Directory does not exist: $(basename "$dir_path")"
        return 1
    fi
}

# Function to run CLI command and capture output
run_cli_command() {
    local cmd="$1"
    local output_file="$2"
    
    # Run command in a subshell to isolate set -e behavior
    (
        eval "$cmd"
    ) > "$output_file" 2>&1
    
    return $?
}

# Test CLI help command
test_help_command() {
    run_test "Help Command"
    
    local temp_dir=$(create_temp_dir)
    local output_file="$temp_dir/help_output.log"
    
    # Test help command
    if run_cli_command "\"$SPECS_SCRIPT\" help" "$output_file"; then
        test_pass "Help: Command executed successfully"
        
        # Verify help output contains expected sections
        if grep -q "USAGE:" "$output_file" && grep -q "COMMANDS:" "$output_file" && grep -q "OPTIONS:" "$output_file"; then
            test_pass "Help: Contains all expected sections"
        else
            test_fail "Help: Missing expected sections in help output"
        fi
        
        # Verify specific commands are documented
        if grep -q "init \[<path>\]" "$output_file" && grep -q "add-feature \[<path>\] <name>" "$output_file"; then
            test_pass "Help: Documents all main commands"
        else
            test_fail "Help: Missing command documentation"
        fi
        
    else
        test_fail "Help: Command execution failed"
        if [ -f "$output_file" ]; then
            echo "Command output:"
            cat "$output_file"
        fi
    fi
    
    cleanup_temp_dir "$temp_dir"
}

# Test CLI version command
test_version_command() {
    run_test "Version Command"
    
    local temp_dir=$(create_temp_dir)
    local output_file="$temp_dir/version_output.log"
    
    # Test version command
    if run_cli_command "\"$SPECS_SCRIPT\" version" "$output_file"; then
        test_pass "Version: Command executed successfully"
        
        # Verify version output format
        if grep -q "v[0-9]\+\.[0-9]\+\.[0-9]\+" "$output_file"; then
            test_pass "Version: Contains proper version format"
        else
            test_fail "Version: Invalid version format"
        fi
        
    else
        test_fail "Version: Command execution failed"
    fi
    
    cleanup_temp_dir "$temp_dir"
}

# Test init command - new project from scratch
test_init_new_project() {
    run_test "Init New Project"
    
    local temp_dir=$(create_temp_dir)
    local project_dir="$temp_dir/test-project"
    local output_file="$temp_dir/init_output.log"
    
    # Run init command
    if run_cli_command "\"$SPECS_SCRIPT\" init \"$project_dir\" --name \"TestProject\"" "$output_file"; then
        test_pass "Init: Command executed successfully"
        
        # Verify directory structure
        verify_directory "$project_dir/specs" "Init"
        
        # Verify main files exist
        verify_file "$project_dir/PROGRESS.md" "" "Init"
        verify_file "$project_dir/specs/system-overview.md" "" "Init"
        verify_file "$project_dir/specs/infrastructure.md" "" "Init"
        
        # Check template replacement worked
        if [ -f "$project_dir/PROGRESS.md" ]; then
            if grep -q "TestProject" "$project_dir/PROGRESS.md" && ! grep -q "{{NAME}}" "$project_dir/PROGRESS.md"; then
                test_pass "Init: Template placeholders replaced correctly"
            else
                test_fail "Init: Template placeholders not replaced correctly"
            fi
        fi
        
        # Verify PROGRESS_FROM_SCRATCH template was used (no existing code)
        if grep -q "This guide helps you systematically develop your project from scratch" "$project_dir/PROGRESS.md"; then
            test_pass "Init: Correct template selected for new project"
        else
            test_fail "Init: Wrong template selected for new project"
        fi
        
    else
        test_fail "Init: Command execution failed"
        if [ -f "$output_file" ]; then
            echo "Command output:"
            cat "$output_file"
        fi
    fi
    
    cleanup_temp_dir "$temp_dir"
}

# Test init command with existing code
test_init_existing_code() {
    run_test "Init With Existing Code"
    
    local temp_dir=$(create_temp_dir)
    local project_dir="$temp_dir/existing-project"
    local output_file="$temp_dir/init_existing_output.log"
    
    # Create project directory with some existing code
    mkdir -p "$project_dir"
    echo "console.log('Hello World');" > "$project_dir/app.js"
    echo '{"name": "test", "version": "1.0.0"}' > "$project_dir/package.json"
    
    # Run init command with force flag
    if run_cli_command "\"$SPECS_SCRIPT\" init \"$project_dir\" --name \"ExistingProject\" --force" "$output_file"; then
        test_pass "Init Existing: Command executed successfully"
        
        # Verify directory structure was added
        verify_directory "$project_dir/specs" "Init Existing"
        
        # Verify original files still exist
        verify_file "$project_dir/app.js" "Hello World" "Init Existing"
        verify_file "$project_dir/package.json" "test" "Init Existing"
        
        # Verify new spec files were created
        verify_file "$project_dir/PROGRESS.md" "" "Init Existing"
        
        # Verify PROGRESS_FROM_CODE template was used (existing code detected)
        if grep -q "This guide helps you systematically enhance your existing project" "$project_dir/PROGRESS.md"; then
            test_pass "Init Existing: Correct template selected for existing code"
        else
            test_fail "Init Existing: Wrong template selected for existing code"
        fi
        
    else
        test_fail "Init Existing: Command execution failed"
        if [ -f "$output_file" ]; then
            echo "Command output:"
            cat "$output_file"
        fi
    fi
    
    cleanup_temp_dir "$temp_dir"
}

# Test init command error handling
test_init_error_handling() {
    run_test "Init Error Handling"
    
    local temp_dir=$(create_temp_dir)
    local project_dir="$temp_dir/existing-project"
    local output_file="$temp_dir/init_error_output.log"
    
    # Create existing directory
    mkdir -p "$project_dir"
    
    # Run init command without force flag (should fail)
    if ! run_cli_command "\"$SPECS_SCRIPT\" init \"$project_dir\"" "$output_file"; then
        test_pass "Init Error: Correctly fails when directory exists without --force"
        
        # Verify error message
        if grep -q "Directory already exists" "$output_file" && grep -q "Use --force" "$output_file"; then
            test_pass "Init Error: Provides helpful error message"
        else
            test_fail "Init Error: Missing or incorrect error message"
        fi
    else
        test_fail "Init Error: Should have failed when directory exists without --force"
    fi
    
    # Test init without path (should use current directory)
    # Create a separate temp directory and run the test from there to avoid polluting the CLI tool directory
    local test_cwd="$temp_dir/current-dir-test"
    mkdir -p "$test_cwd"
    
    if (cd "$test_cwd" && run_cli_command "\"$SPECS_SCRIPT\" init --force --quiet" "$output_file"); then
        test_pass "Init Error: Correctly uses current directory when path is missing"
        
        if grep -q "No path specified, using current directory" "$output_file" || [ -f "$test_cwd/PROGRESS.md" ]; then
            test_pass "Init Error: Successfully initializes in current directory"
        else
            test_fail "Init Error: Missing confirmation of current directory usage"
        fi
    else
        test_fail "Init Error: Should have succeeded using current directory"
    fi
    
    cleanup_temp_dir "$temp_dir"
}

# Test add-feature command
test_add_feature() {
    run_test "Add Feature"
    
    local temp_dir=$(create_temp_dir)
    local project_dir="$temp_dir/spec-project"
    local output_file="$temp_dir/feature_output.log"
    
    # First create a specs project
    run_cli_command "\"$SPECS_SCRIPT\" init \"$project_dir\" --quiet" "/dev/null"
    
    # Add a feature
    if run_cli_command "\"$SPECS_SCRIPT\" add-feature \"$project_dir\" \"User Authentication\"" "$output_file"; then
        test_pass "Add Feature: Command executed successfully"
        
        # Verify feature directory structure
        verify_directory "$project_dir/specs/user-authentication" "Add Feature"
        
        # Verify feature spec files
        verify_file "$project_dir/specs/user-authentication/api-contract.md" "" "Add Feature"
        verify_file "$project_dir/specs/user-authentication/data-model.md" "" "Add Feature"
        verify_file "$project_dir/specs/user-authentication/ui-design.md" "" "Add Feature"
        verify_file "$project_dir/specs/user-authentication/business-logic.md" "" "Add Feature"
        verify_file "$project_dir/specs/user-authentication/ai-workflow.md" "" "Add Feature"
        
        # Check template replacement worked
        if [ -f "$project_dir/specs/user-authentication/api-contract.md" ]; then
            if grep -q "User Authentication" "$project_dir/specs/user-authentication/api-contract.md" && ! grep -q "{{NAME}}" "$project_dir/specs/user-authentication/api-contract.md"; then
                test_pass "Add Feature: Template placeholders replaced correctly"
            else
                test_fail "Add Feature: Template placeholders not replaced correctly"
            fi
        fi
        
    else
        test_fail "Add Feature: Command execution failed"
        if [ -f "$output_file" ]; then
            echo "Command output:"
            cat "$output_file"
        fi
    fi
    
    cleanup_temp_dir "$temp_dir"
}

# Test add-feature error handling
test_add_feature_error_handling() {
    run_test "Add Feature Error Handling"
    
    local temp_dir=$(create_temp_dir)
    local project_dir="$temp_dir/non-spec-project"
    local output_file="$temp_dir/feature_error_output.log"
    
    # Create a non-spec project (no specs directory)
    mkdir -p "$project_dir"
    
    # Try to add feature to non-spec project
    if ! run_cli_command "\"$SPECS_SCRIPT\" add-feature \"$project_dir\" \"Test Feature\"" "$output_file"; then
        test_pass "Add Feature Error: Correctly fails for non-spec project"
        
        if grep -q "doesn't appear to be a specs project" "$output_file"; then
            test_pass "Add Feature Error: Provides helpful error message"
        else
            test_fail "Add Feature Error: Missing or incorrect error message"
        fi
    else
        test_fail "Add Feature Error: Should have failed for non-spec project"
    fi
    
    # Test missing feature name (path is now optional)
    if ! run_cli_command "\"$SPECS_SCRIPT\" add-feature" "$output_file"; then
        test_pass "Add Feature Error: Correctly fails when feature name is missing"
        
        if grep -q "Feature name is required" "$output_file"; then
            test_pass "Add Feature Error: Provides helpful error for missing feature name"
        else
            test_fail "Add Feature Error: Missing error message for missing feature name"
        fi
    else
        test_fail "Add Feature Error: Should have failed when feature name is missing"
    fi
    
    cleanup_temp_dir "$temp_dir"
}

# Test name sanitization
test_name_sanitization() {
    run_test "Name Sanitization"
    
    local temp_dir=$(create_temp_dir)
    local project_dir="$temp_dir/spec-project"
    local output_file="$temp_dir/sanitization_output.log"
    
    # First create a specs project
    run_cli_command "\"$SPECS_SCRIPT\" init \"$project_dir\" --quiet" "/dev/null"
    
    # Add a feature with special characters and spaces
    if run_cli_command "\"$SPECS_SCRIPT\" add-feature \"$project_dir\" \"User Auth & Login System!\" --quiet" "$output_file"; then
        test_pass "Name Sanitization: Command executed successfully"
        
        # Verify sanitized directory name was created
        if ls "$project_dir/specs/"user-auth* >/dev/null 2>&1; then
            test_pass "Name Sanitization: Special characters properly sanitized"
            # Show what directory was actually created
            sanitized_dir=$(ls "$project_dir/specs/user-authentication/" | grep "user-authentication")
            test_info "Created directory: $sanitized_dir"
        else
            test_fail "Name Sanitization: Directory name not properly sanitized"
            echo "Available directories:"
            ls -la "$project_dir/specs/user-authentication/" 2>/dev/null || echo "No user-authentication directory found"
        fi
        
    else
        test_fail "Name Sanitization: Command execution failed"
    fi
    
    cleanup_temp_dir "$temp_dir"
}

# Test quiet mode
test_quiet_mode() {
    run_test "Quiet Mode"
    
    local temp_dir=$(create_temp_dir)
    local project_dir="$temp_dir/quiet-project"
    local output_file="$temp_dir/quiet_output.log"
    
    # Run init command in quiet mode
    if run_cli_command "\"$SPECS_SCRIPT\" init \"$project_dir\" --quiet" "$output_file"; then
        test_pass "Quiet Mode: Command executed successfully"
        
        # Verify minimal output in quiet mode
        local line_count=$(wc -l < "$output_file")
        if [ "$line_count" -le 3 ]; then
            test_pass "Quiet Mode: Produces minimal output"
        else
            test_fail "Quiet Mode: Too much output in quiet mode ($line_count lines)"
        fi
        
        # Verify project was still created correctly
        verify_directory "$project_dir/specs" "Quiet Mode"
        verify_file "$project_dir/PROGRESS.md" "" "Quiet Mode"
        
    else
        test_fail "Quiet Mode: Command execution failed"
    fi
    
    cleanup_temp_dir "$temp_dir"
}

# Test force mode
test_force_mode() {
    run_test "Force Mode"
    
    local temp_dir=$(create_temp_dir)
    local project_dir="$temp_dir/force-project"
    local output_file="$temp_dir/force_output.log"
    
    # Create initial project
    run_cli_command "\"$SPECS_SCRIPT\" init \"$project_dir\" --quiet" "/dev/null"
    
    # Modify a file to test overwriting
    echo "# Modified content" > "$project_dir/PROGRESS.md"
    
    # Add feature twice with force mode
    run_cli_command "\"$SPECS_SCRIPT\" add-feature \"$project_dir\" \"Test Feature\" --quiet" "/dev/null"
    
    if run_cli_command "\"$SPECS_SCRIPT\" add-feature \"$project_dir\" \"Test Feature\" --force --quiet" "$output_file"; then
        test_pass "Force Mode: Command executed successfully"
        
        # Verify feature directory still exists
        verify_directory "$project_dir/specs/test-feature" "Force Mode"
        
    else
        test_fail "Force Mode: Command execution failed"
    fi
    
    cleanup_temp_dir "$temp_dir"
}

# Test SANITIZED_NAME placeholder replacement
test_sanitized_name_placeholder() {
    run_test "SANITIZED_NAME Placeholder Replacement"
    
    local temp_dir=$(create_temp_dir)
    local project_dir="$temp_dir/spec-project"
    local output_file="$temp_dir/sanitized_name_output.log"
    
    # First create a specs project
    run_cli_command "\"$SPECS_SCRIPT\" init \"$project_dir\" --quiet" "/dev/null"
    
    # Add a feature with special characters that need sanitization
    local feature_name="User Profile & Settings!"
    local expected_sanitized="user-profile---settings-"
    
    if run_cli_command "\"$SPECS_SCRIPT\" add-feature \"$project_dir\" \"$feature_name\" --quiet" "$output_file"; then
        test_pass "SANITIZED_NAME: Feature creation command executed successfully"
        
        # Check that the ai-workflow.md file exists and contains the sanitized name
        local ai_workflow_file="$project_dir/specs/$expected_sanitized/ai-workflow.md"
        
        if [ -f "$ai_workflow_file" ]; then
            test_pass "SANITIZED_NAME: ai-workflow.md file created"
            
            # Verify {{SANITIZED_NAME}} placeholder was replaced with sanitized version
            if grep -q "$expected_sanitized" "$ai_workflow_file" && ! grep -q "{{SANITIZED_NAME}}" "$ai_workflow_file"; then
                test_pass "SANITIZED_NAME: {{SANITIZED_NAME}} placeholder replaced correctly in ai-workflow.md"
            else
                test_fail "SANITIZED_NAME: {{SANITIZED_NAME}} placeholder not replaced correctly in ai-workflow.md"
                # Show what was actually found for debugging
                echo "Expected sanitized name: $expected_sanitized"
                echo "File contents (first few lines with sanitized name references):"
                grep -n "sanitized\|SANITIZED" "$ai_workflow_file" | head -5 || echo "No sanitized name references found"
            fi
            
            # Also verify {{NAME}} placeholder was replaced with original name
            if grep -q "$feature_name" "$ai_workflow_file" && ! grep -q "{{NAME}}" "$ai_workflow_file"; then
                test_pass "SANITIZED_NAME: {{NAME}} placeholder also replaced correctly"
            else
                test_fail "SANITIZED_NAME: {{NAME}} placeholder not replaced correctly"
            fi
            
        else
            test_fail "SANITIZED_NAME: ai-workflow.md file not created at expected location: $ai_workflow_file"
            echo "Available files in feature directory:"
            ls -la "$project_dir/specs/$expected_sanitized/" 2>/dev/null || echo "Feature directory not found"
        fi
        
    else
        test_fail "SANITIZED_NAME: Feature creation command failed"
        if [ -f "$output_file" ]; then
            echo "Command output:"
            cat "$output_file"
        fi
    fi
    
    cleanup_temp_dir "$temp_dir"
}

# Test invalid commands
test_invalid_commands() {
    run_test "Invalid Commands"
    
    local temp_dir=$(create_temp_dir)
    local output_file="$temp_dir/invalid_output.log"
    
    # Test invalid command
    if ! run_cli_command "\"$SPECS_SCRIPT\" invalid-command" "$output_file"; then
        test_pass "Invalid Commands: Correctly rejects invalid command"
        
        if grep -q "Unknown command: invalid-command" "$output_file"; then
            test_pass "Invalid Commands: Provides helpful error message"
        else
            test_fail "Invalid Commands: Missing or incorrect error message"
        fi
    else
        test_fail "Invalid Commands: Should have failed for invalid command"
    fi
    
    # Test invalid option
    if ! run_cli_command "\"$SPECS_SCRIPT\" init /tmp/test --invalid-option" "$output_file"; then
        test_pass "Invalid Commands: Correctly rejects invalid option"
        
        if grep -q "Unknown option: --invalid-option" "$output_file"; then
            test_pass "Invalid Commands: Provides helpful error for invalid option"
        else
            test_fail "Invalid Commands: Missing error message for invalid option"
        fi
    else
        test_fail "Invalid Commands: Should have failed for invalid option"
    fi
    
    cleanup_temp_dir "$temp_dir"
}

# Main test execution
echo "==========================================="
echo "  Specs CLI Test Suite"
echo "==========================================="
echo ""

# Check if specs.sh exists and is executable
if [ ! -f "$SPECS_SCRIPT" ]; then
    test_fail "specs.sh not found at: $SPECS_SCRIPT"
    exit 1
fi

if [ ! -x "$SPECS_SCRIPT" ]; then
    test_fail "specs.sh is not executable: $SPECS_SCRIPT"
    exit 1
fi

test_info "Found specs.sh at: $SPECS_SCRIPT"
echo ""

# Run all tests
test_help_command
echo ""
test_version_command
echo ""
test_init_new_project
echo ""
test_init_existing_code
echo ""
test_init_error_handling
echo ""
test_add_feature
echo ""
test_add_feature_error_handling
echo ""
test_name_sanitization
echo ""
test_sanitized_name_placeholder
echo ""
test_quiet_mode
echo ""
test_force_mode
echo ""
test_invalid_commands
echo ""

# Print test summary
echo "==========================================="
echo "  Test Summary"
echo "==========================================="
echo -e "Test Functions: $TEST_COUNT"
echo -e "Total Assertions: $ASSERTION_COUNT"
echo -e "${GREEN}Passed: $PASS_COUNT${NC}"
echo -e "${RED}Failed: $FAIL_COUNT${NC}"
echo ""

if [ $FAIL_COUNT -eq 0 ]; then
    echo -e "${GREEN}🎉 All tests passed!${NC}"
    exit 0
else
    echo -e "${RED}❌ Some tests failed.${NC}"
    exit 1
fi