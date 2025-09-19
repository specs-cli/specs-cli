# {{NAME}} Progress

## Overview
This file tracks progress for both the specification and implementation phases. Tasks can be delegated to the AI and can easily be checked off when completed.

## Create Specification
- [ ] Execute this AI prompt to the create system overview
```text
Fill out /specs/system-overview.md by applying the existing template structure as good as possible. Ask for more details if required information is missing. Here is my brief description of the project:
[Add brief project description here]
```
- [ ] Review /specs/system-overview.md specification
- [ ] Execute this AI prompt to specify shared parts
```text
Fill out all files in /specs/shared/ by applying the existing template structure of each file as good as possible. Specifications should be at the appropriate level of detail and not overlap between the different specification types. Only add specifications that can be clearly identified and do not guess them.Ask for more details if required information is missing. Here is my detailed description of the project core functionality:
[Add detailed description of core functionality here]
```
- [ ] Review all generated specifications in /specs/shared/
- [ ] Execute this AI prompt to specify the infrastructure
```text
Fill out /specs/infrastructure.md by applying the existing template structure as good as possible. Ask for more details if required information is missing. Here is my detailed description about build, deployment, hosting and operational requirements:
[Add detailed description of build, deployment, hosting and operational requirements here]
```
- [ ] Review /specs/infrastructure.md specification

## Generate Implementation
- [ ] Execute this AI prompt to generate global project files, shared implementation and infrastructure parts
```text
Read and understand all specifications and requirements in /specs/. Generate global project files, shared implementation and infrastructure parts of the project so everything fits exactly the pre-defined specifications and requirements. Do not guess or invent something that is not specified clearly but ask how to approach those implementation details and document decisions and new specification inside /specs/.
```