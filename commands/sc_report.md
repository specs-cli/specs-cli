# Rate Specifications Accuracy

## Command Description
Analyze and rate the accuracy of global specifications in the `specs/` directory (excluding subdirectories) by comparing them against the actual codebase implementation. This command provides a comprehensive assessment of how well documentation represents the current state of the project.

## Execution Instructions

### Phase 1: Discovery and Analysis
1. **Examine Project Structure**
   - List all files in the `specs/` directory (but not in subdirectories)
   - Identify the main specification categories (api-contract, data-model, business-logic, infrastructure, ui-design, etc.)
   - Scan the project root and main directories to understand the technology stack and architecture

2. **Analyze Specification Content**
   - Read all specification files in `specs/` (but not in subdirectories)
   - Categorize specifications by type (API, data models, business logic, infrastructure, UI/UX)
   - Extract key claims, requirements, and technical details from each specification

3. **Examine Actual Implementation**
   - Analyze backend code structure (models, routes, controllers, middleware)
   - Review frontend code structure (components, pages, services, contexts)
   - Check configuration files (package.json, docker-compose.yml, environment files)
   - Examine database schemas and API endpoints

### Phase 2: Accuracy Assessment Framework

#### Rating Dimensions (Weighted Scoring)
- **Structural Accuracy (20%)**: Code structure matches specification descriptions
- **Functional Accuracy (25%)**: Described functionality is actually implemented and working
- **API Contract Accuracy (20%)**: API endpoints, request/response formats match specifications
- **Data Model Accuracy (15%)**: Database schemas align with documented models
- **Technology Agnostic (10%)**: Specifications avoid language-specific or implementation-specific details, focusing on behavior and requirements rather than technical implementation choices
- **Completeness (10%)**: Coverage of implemented features vs. documented features

#### Rating Scale (1-5 Points)
- **5 - Excellent**: Perfect alignment, no discrepancies found
- **4 - Good**: Minor discrepancies, mostly accurate with small gaps
- **3 - Fair**: Some notable gaps or inaccuracies that need attention
- **2 - Poor**: Significant misalignment between specs and implementation
- **1 - Critical**: Major inaccuracies, specs are outdated or completely wrong

### Phase 3: Detailed Comparison Process

#### For Each Specification File:
1. **Cross-Reference Analysis**
   - Compare specification claims against actual code implementation
   - Verify API endpoints exist and match documented contracts
   - Check data models against actual database schemas
   - Validate business logic implementation against documented rules
   - Assess technology agnosticism by identifying language-specific or framework-specific details that could be generalized

2. **Gap Identification**
   - Document features described in specs but not implemented
   - Identify implemented features not covered in specifications
   - Note discrepancies in technical details (validation rules, data types, etc.)
   - Flag specifications that contain unnecessary technical implementation details

3. **Implementation Verification**
   - Test that described functionality actually works as specified
   - Verify configuration settings match documented values
   - Check that security measures are implemented as described
   - Evaluate whether specifications focus on "what" (behavior/requirements) rather than "how" (implementation details)

### Phase 4: Scoring and Reporting

#### Calculate Individual Scores
For each specification file:
- Assign scores (1-5) for each rating dimension
- Calculate weighted average based on dimension weights
- Document specific findings and discrepancies

#### Generate Overall Assessment
- Calculate project-wide accuracy score
- Identify patterns across specification types
- Prioritize areas needing attention

### Phase 5: Output Format

#### Summary Report Structure:
```markdown
# Specification Accuracy Assessment

## Overall Rating: X.X/5.0 (Rating Level)

## Individual Specification Ratings:

### 1. [Specification Name] - Rating: X.X/5
**Strengths:**
- [List accurate aspects]

**Discrepancies:**
- [List inaccuracies and gaps]

**Recommendations:**
- [Specific improvement suggestions]

### [Repeat for each specification]

## Key Findings:
- [Overall patterns and insights]

## Priority Recommendations:
1. [Most critical updates needed]
2. [Secondary improvements]
3. [Nice-to-have enhancements]

## Methodology Notes:
- [Any limitations or assumptions made during analysis]
```

## Expected Deliverables

1. **Comprehensive Rating Report**: Detailed assessment of each specification file
2. **Gap Analysis**: List of discrepancies between specs and implementation
3. **Improvement Roadmap**: Prioritized recommendations for updating specifications
4. **Accuracy Metrics**: Quantitative scores for tracking improvement over time

## Success Criteria

- All specification files in `specs/` directory (excluding subdirectories) are analyzed
- Each specification receives a detailed accuracy rating with justification
- Specific discrepancies are documented with examples
- Actionable recommendations are provided for improving specification accuracy
- Overall project documentation health is assessed

## Notes for AI Agent Execution

- **Be Thorough**: Don't just skim files - deeply analyze implementation details
- **Be Specific**: Provide concrete examples of discrepancies, not just general statements
- **Be Constructive**: Focus on actionable improvements rather than just criticism
- **Be Systematic**: Follow the methodology consistently for all specifications
- **Cross-Validate**: When possible, verify findings across multiple code files
- **Consider Context**: Account for the project's development stage and technology choices

## Adaptation Guidelines

This command can be adapted for different project types by:
- Adjusting the specification categories based on what's found in `specs/`
- Modifying weight distributions based on project focus (API-heavy vs UI-heavy)
- Adding technology-specific validation steps (e.g., GraphQL schema validation)
- Customizing the rating criteria for different application types (mobile apps, microservices, etc.)