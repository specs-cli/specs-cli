# {{NAME}} - Development Progress Guide

A step-by-step guide for systematic AI-assisted development using Specs CLI workflows and templates.

## Pre-requisites

- **AI Assistant**: Start a new/clean session in your AI-powered IDE (e.g. Cline, Roo Code, Trae AI, ...)
- **AI Model**: Switch to the recommended model `Claude-Sonnet-4` for reliable results.

## Phase 1: Project Foundation

### [ ] 1.1 Generate System Specifications

#### For Existing Codebases
**AI Prompt:**
```
Analyze and document the existing system architecture and infrastructure for {{NAME}} by following the workflow in specs/generate-system-specs.md

Note: This is an EXISTING CODEBASE. Analyze the actual project codebase, configuration files, and infrastructure to document the current state. Do not make assumptions or suggestions - reflect the status quo accurately.
```

#### For New Projects (No Existing Code)
**AI Prompt:**
```
Design comprehensive system architecture and infrastructure for {{NAME}} by following the workflow in specs/generate-system-specs.md

Project requirements: [Describe your project goals, tech stack, scalability needs]

Note: This is a NEW PROJECT with no existing codebase. Provide system architecture and infrastructure suggestions and recommendations.
```

**Review:** Check `specs/system-overview.md` and `specs/infrastructure.md`

## Phase 2: Existing Codebase Documentation (Skip for new projects)

### [ ] 2.1 Add Common Feature Structure
**Terminal Command:**
```bash
specs add-feature "Common"
```

### [ ] 2.2 Document Existing Project
**AI Prompt:**
```
Analyze and document the existing codebase by following the workflow in specs/common/generate-feature-specs.md.

IMPORTANT CONSTRAINTS:
- Execute ONLY the generate-feature-specs.md workflow (do NOT execute generate-system-specs.md or generate-feature-code.md or any other workflow)
- Output files ONLY to specs/common/ directory
- Use existing system-level architecture files as context reference: specs/system-overview.md and specs/infrastructure.md
- Do NOT recreate or overlap with system-level architecture files

Note: This is an EXISTING CODEBASE. Analyze the actual project codebase, structure, APIs, data models, and UI components to document what currently exists. Do not make assumptions or add features that don't exist - reflect the current implementation accurately.
```
**Review:** Check all files in `specs/common/` directory
**Validation:** Ensure no files were created in root `specs/` directory and no system-level files were duplicated

## Phase 3: New Feature Development

### [ ] 3.1 Initialize New Feature
**Terminal Command:**
```bash
specs add-feature "[Feature Name]"
```

### [ ] 3.2 Generate Feature Specifications
**AI Prompt:**
```
Generate comprehensive specifications for [Feature Name] by following the workflow in specs/[Feature Directory]/generate-feature-specs.md

IMPORTANT CONSTRAINTS:
- Execute ONLY the generate-feature-specs.md workflow (do NOT execute generate-system-specs.md or generate-feature-code.md or any other workflow)
- Output files ONLY to specs/[Feature Directory]/ directory
- Use existing system-level architecture files as context reference: specs/system-overview.md and specs/infrastructure.md
- Do NOT recreate or overlap with system-level architecture files

Feature requirements: [Describe what the feature should do]
```
**Review:** Check all files in `specs/[Feature Directory]/` directory
**Validation:** Ensure no files were created in root `specs/` directory and no system-level files were duplicated

### [ ] 3.3 Implement Feature
**AI Prompt:**
```
Implement the feature by following the workflow in specs/[Feature Directory]/generate-feature-code.md

IMPORTANT CONSTRAINTS:
- Execute ONLY the generate-feature-code.md workflow (do NOT execute generate-system-specs.md or generate-feature-specs.md or any other workflow)
- Use existing system-level architecture files as context reference: specs/system-overview.md and specs/infrastructure.md
```
**Monitor:** Check `ISSUES.md` for any implementation issues or assumptions

### [ ] 3.4 Final Validation
- [ ] Review ISSUES.md for any implementation issues or assumptions
- [ ] Solve issues and repeat step 3.3 if necessary
- [ ] Remove ISSUES.md file after all issues are solved
- [ ] Test the implemented feature

## Quick Reference

**For each new feature, repeat Phase 3:**
1. `specs add-feature "[Feature Name]"`
2. Generate specs with generate-feature-specs.md
3. Implement with generate-feature-code.md
4. Test and validate

**AI Workflow Files:**
- `generate-system-specs.md` - System design and infrastructure
- `generate-feature-specs.md` - Feature specifications
- `generate-feature-code.md` - Feature implementation

**Your Role:**
- Provide clear requirements in AI prompts
- Review and approve AI outputs
- Solve issues reported automatically in ISSUES.md
- Test final implementations