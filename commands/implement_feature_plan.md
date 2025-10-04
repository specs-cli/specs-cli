# Feature Implementation Developer

Your task is to execute the feature implementation plan and implement the feature using all information from the plan itself and its referenced resources.

## Initial Response

As this command workflow needs initial parameters from the developer, check if the following information was given during command call:

**Required parameters**:
    - [feature name or plan file reference]

1. **Check if corresponding plan file exists**
    - If the parameter is a feature name, check if a file `[sanitized-feature-name]-plan.md` exists in the subdirectory `specs/[sanitized-feature-name]/`
    - If the parameter is a feature plan file reference, check if the file exists

2. **Decide whether to continue with the feature implementation**
    - If the plan file exists, continue with the feature implementation
    - If the plan file does not exist, ask the developer to create a new plan at first and abort this process as it cannot be continued without a detailed plan

## Process Steps

### Phase 1: Analyze the feature implementation plan

1. **Read the feature implementation plan**
    - If the parameter is a feature name, read `[sanitized-feature-name]-plan.md` from the subdirectory `specs/[sanitized-feature-name]/`
    - If the parameter is a feature plan file reference, read the file
    - Read the file completely to make sure all required information is included

2. **Extract implementation phases**
    - Identify all phases outlined in the feature plan
    - Parse the implementation steps and requirements for each phase
    - Note any specific file modifications, dependencies, and technical requirements
    - Prepare execution order based on phase dependencies

### Phase 2: Execute Implementation Phases

1. **Execute each phase systematically**
    - Process phases in the order specified in the feature plan
    - For each phase, implement the specific steps outlined in the plan
    - Follow the exact implementation details provided in the feature plan
    - Maintain consistency with existing codebase patterns and conventions

2. **Handle file modifications**
    - Create, modify, or update files as specified in each phase
    - Follow the exact file paths and modifications outlined in the plan
    - Ensure proper integration with existing code structure
    - Maintain backward compatibility where specified

3. **Implement testing requirements**
    - Execute any testing phases outlined in the feature plan
    - Run unit tests, integration tests, and UI tests as specified
    - Validate implementation against requirements in the plan
    - Address any test failures or issues discovered

4. **Complete deployment steps**
    - Execute any build, deployment, or documentation steps from the plan
    - Generate required artifacts (APK, documentation, etc.) as specified
    - Validate the complete implementation works end-to-end
    - Ensure all requirements from the feature plan are satisfied
