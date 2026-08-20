---
name: approver-review
description: "Produce a technically deep, readable assessment that helps an approver understand a pull request before approving it. Use when the user asks for an approver review, a detailed PR assessment, help understanding a PR, or an approval recommendation. Compare the PR's stated intent with the code, trace data and control flow, examine architecture, contracts, failure handling, lifecycle, security, operations, tests, compatibility, and rollback, then explain important implementation decisions and credible alternatives for a technical generalist."
argument-hint: "Provide a PR number or URL. Optionally name areas to emphasize."
---

# Approver Review

Help an approver understand what a pull request changes, how the implementation works, and what risk remains. Read the code as the primary source. Treat the PR description, linked issue, design documents, commit messages, and author comments as claims to verify.

This is an explanatory review with a decision at the end. It is broader than a bug hunt and more selective than a file-by-file walkthrough.

## Audience

Write in precise technical language for a technical generalist who can follow code, APIs, distributed systems, and architecture but may not know the PR's product area, framework, protocol, or infrastructure domain. Assume software-engineering fluency, not domain fluency.

- Use the correct technical term, then define domain-specific terms and acronyms in one concise sentence when they first matter.
- Explain unfamiliar mechanisms through concrete components, inputs, outputs, state changes, ownership, and failure behavior.
- Distinguish the general concept from this repository's implementation of it.
- Connect domain details to the approval decision: explain why they affect correctness, compatibility, operations, security, or rollback.
- Prefer a short explanation over unexplained jargon, acronym chains, internal code names, or vague abstractions.
- Do not dilute technical depth, replace mechanisms with analogies, or over-explain concepts familiar to a general software engineer.

Structure dense explanations as **conclusion → mechanism → consequence**. A reader should understand both what the code does and enough of the local domain to judge whether the implementation is sound.

## Relationship to other skills

Use repository-specific review or code-quality skills when they apply. Use security specialists when the user explicitly requests a security review.

Before presenting the final assessment, invoke `classic-style` and apply its guidance silently. Preserve technical qualifications and uncertainty. Do not add a separate prose-editing appendix.

## Inputs

- Pull request number, URL, or current PR context.
- Optional emphasis such as security, API compatibility, testing, or operations.
- Repository instructions and applicable design documents.

If no PR can be identified, ask for one. Do not infer a different PR.

## Principles

1. The diff and its callers outrank the PR narrative.
2. Explain decisions and seams, not every changed line.
3. Separate verified facts, reasonable inferences, and unanswered questions.
4. Distinguish test quantity from test quality.
5. Name credible alternatives only when the implementation involved a meaningful choice.
6. Report risks in proportion to their likelihood and impact.
7. Never approve because CI is green. Never reject because a different design also could work.
8. Cite repository-relative files and exact lines for consequential claims.

## Large PR mode

Use Large PR mode when the change exceeds roughly 1,000 changed lines, spans more than 30 files, crosses several subsystems, or cannot fit comfortably in one review pass. A 5,000-line PR is reviewable when its scope is coherent and the review remains accountable.

Large PR mode changes the review method, not the standard of evidence.

### Inventory before reading

Capture:

- commits and merge base
- files and changed-line counts
- languages and subsystems
- production, test, configuration, documentation, dependency, migration, and generated files
- public contracts and external boundaries
- generated files and the command that reproduces them

Classify each changed file before reviewing details. Separate mechanical changes from behavioral changes, but verify that a supposedly mechanical transformation follows one rule.

### Build a change map

Group files by coherent subsystem, execution path, and architectural boundary. Identify:

- entry points and callers
- important callees
- shared state and lifecycle owners
- persistence and migrations
- network, filesystem, process, cloud, and user-input boundaries
- dependency direction between groups

Do not divide one continuous control flow among reviewers. A batch should contain enough callers and callees to explain the behavior end to end.

### Maintain a coverage ledger

Track every changed file with:

| Field | Meaning |
|---|---|
| File | Repository-relative path |
| Category | Production, test, configuration, dependency, migration, generated, or documentation |
| Subsystem | Coherent review group |
| Risk | High, medium, or low |
| Depth | Deep, sampled, mechanical, generated, deferred, or blocked |
| Decision | Implementation decision or seam it supports |
| Evidence | Relevant tests, checks, callers, and specifications |
| Status | Pending or complete |

`Deep` means the implementation and its relevant callers and callees were read. `Sampled` is allowed only for low-risk repetition after verifying the governing rule and representative edge cases. Never sample security-sensitive, destructive, concurrent, persistent, public-contract, or hand-written behavioral code.

Save the ledger and review notes as a session artifact when the review will span several turns. Update them after every batch so another turn can resume without losing scope.

### Review bounded batches

Review one coherent subsystem at a time. For each batch:

1. read its production paths, callers, tests, and contracts
2. trace its changed behavior end to end
3. record decisions, findings, risks, evidence, and unanswered questions
4. update the coverage ledger
5. stop expanding the batch when the next path belongs to another subsystem

Do not compress later batches because earlier ones consumed context. Preserve summaries between batches and reload the relevant source when making the final assessment.

### Delegate only independent work

Use independent review agents when the PR contains genuinely separate subsystems, language stacks, migrations, or generated-artifact checks that require substantial context.

- Give each reviewer complete PR context and exclusive ownership of its subsystem.
- Do not assign overlapping files or split a single execution path.
- Require file and line citations, evidence, and explicit coverage.
- Synthesize centrally.
- Personally inspect contracts that cross reviewer boundaries.

Delegation does not establish completeness. The coverage ledger does.

### Prioritize by risk

Always review these paths deeply before low-risk repetition:

- authentication, authorization, validation, and secrets
- persistence, schemas, and data migrations
- concurrency, shared state, caching, and lifecycle
- public APIs, events, wire formats, and compatibility
- destructive operations and external side effects
- retries, timeouts, cancellation, rollback, and cleanup
- build, dependency, packaging, and deployment changes

### Run cross-cutting passes

After subsystem review, inspect the whole PR again for:

- inconsistent error semantics
- leaked resources and incomplete shutdown
- confused state ownership
- broken dependency direction
- contract mismatches between subsystems
- security checks applied on one path but omitted on another
- tests that duplicate implementation assumptions instead of exercising contracts
- incompatible rollout, rollback, or mixed-version behavior

### Large PR approval gates

Do not recommend approval when:

- a significant file is deferred or blocked
- a high-risk flow has not been traced end to end
- generated output cannot be reproduced from reviewed source
- changed contracts lack suitable test evidence
- cross-subsystem contracts remain unchecked
- the PR's behavior cannot be explained as a coherent set of decisions
- the coverage ledger is incomplete

Size alone is not a reason to request changes. Recommend splitting the PR when coupled scope prevents independent validation, safe rollout, or a coherent explanation of behavior.

## Procedure

### 1. Establish scope

Read:

- PR title, body, linked issue or design, review threads, and checks
- merge base, commits, diff stat, and changed files
- repository instructions
- affected production code, callers, tests, package and build configuration

Use the merge base rather than an arbitrary branch tip. Exclude changes already present in the base.

State the PR's claimed purpose in one sentence, then state what the code actually changes. Call out scope drift, hidden behavior changes, and claims the diff does not support.

### 2. Build a one-screen orientation

Open with:

- **Purpose:** why this PR exists
- **Placement:** where the change sits in the system
- **Mechanism:** the main control and data flow
- **Failure surface:** what can fail and who observes it
- **Review focus:** the few decisions that determine whether the PR is safe

This section should let a generalist understand the change without reading the rest.
Introduce any domain knowledge required by the rest of the review here. Keep it brief and technical: identify the relevant system boundary, define the local terms, and explain the invariant or contract the PR must preserve.

### 3. Trace behavior through the system

Follow each important path from entry point to side effect and response. Cover only paths changed or made newly reachable by the PR.

For each path, identify:

- caller or trigger
- validation and trust boundary
- state read or written
- dependencies and external calls
- success result
- failure result
- cleanup, cancellation, retry, timeout, and concurrency behavior
- observable logs, metrics, statuses, or user feedback

Use a compact sequence or Mermaid diagram when prose would obscure the flow.

### 4. Assess the implementation by concern

Evaluate the concerns that apply:

- **Architecture:** module boundaries, dependency direction, ownership, coupling, composition, and migration seams
- **State and lifecycle:** initialization, reuse, mutation, concurrency, shutdown, cleanup, and resource ownership
- **Contracts:** APIs, HTTP methods and status codes, schemas, events, streams, serialization, compatibility, and generated artifacts
- **Error handling:** propagation, partial failure, retry, timeout, cancellation, idempotency, rollback, and success-shaped fallbacks
- **Security and privacy:** authentication, authorization, validation, injection, path confinement, secrets, destructive operations, and data exposure
- **Operations:** logging, diagnostics, recovery, deployability, configuration, observability, and rollback
- **Performance:** hot paths, blocking work, memory and connection lifetime, repeated work, and scaling limits
- **Dependencies:** new packages, permissions, supply-chain effects, runtime requirements, and lockfile changes
- **Compatibility and release:** existing callers, migration steps, flags, documentation, versioning, and changesets

Skip concerns that truly do not apply and say why in the coverage statement.

### 5. Examine testing as evidence

Map changed behavior and branches to tests. Separate:

- unit tests
- integration or contract tests
- functional or end-to-end tests
- manual evidence
- CI and build checks

For each layer, explain what it proves and what it cannot prove. Check happy paths, invalid input, dependency failure, cleanup, concurrency, timeout, retry, stale state, and compatibility where applicable.

Do not equate coverage percentage with behavioral coverage. Identify important behavior that no test exercises.

### 6. Explain important decisions

Organize this section around decisions and seams, not files. For every consequential decision, write:

#### Question

Ask the question an approver must be able to answer.

#### Code's answer

Explain what the implementation chose. Cite the significant files and lines.

#### Why it matters

Describe the behavioral, architectural, or operational consequence.

#### Alternative

Name a credible alternative and its tradeoff. Omit this subsection when no meaningful alternative exists.

#### Assessment

Say whether the choice is sound, what evidence supports it, and what uncertainty remains.

Include one to three questions for each file with significant changes, but group repeated questions under the shared decision. A significant file changes production behavior, a public contract, a system boundary, lifecycle, build output, or meaningful test evidence. Do not force questions for mechanical edits, fixtures, generated output, or configuration forwarding.

Questions are teaching devices. Answer them from the code. Do not ask the user questions whose answers are already present in the diff.

### 7. Rank risk

For each material risk, state:

- scenario
- likelihood
- impact
- detectability
- rollback or recovery difficulty
- existing mitigation
- remaining gap

Avoid invented numeric precision. Use `low`, `medium`, or `high` with a short justification.

### 8. Verify current status

Run the smallest relevant validation and inspect CI. Report commands only when they help the approver judge evidence or when something failed or was skipped.

Check whether prior review findings are fixed. Re-read the fix rather than relying on thread resolution.

### 9. Deliver the assessment

Use this order:

1. **Orientation**
2. **What the code changes**
3. **Data and control flow**
4. **Key implementation decisions**
5. **Failure handling and operations**
6. **Security and compatibility**
7. **Test evidence and gaps**
8. **Risk register**
9. **Findings**
10. **Approval recommendation**
11. **Coverage and confidence**

Findings must be actionable and cite exact changed lines. Separate:

- **Blocking findings**
- **Non-blocking concerns**
- **Strengths**
- **Residual risks**

End with one recommendation:

- **Approve**
- **Approve with follow-up**
- **Comment**
- **Request changes**
- **Not enough evidence**

Explain the recommendation in two or three sentences. State what would change it.

Under **Coverage and confidence**, list:

- evidence inspected
- checks run or observed
- applicable concerns covered
- concerns skipped and why
- unresolved questions
- confidence: high, medium, or low

For Large PR mode, include a compact coverage table summarizing each subsystem and every significant file. State where review was deep, sampled, mechanical, generated, blocked, or deferred. Approval requires no blocked or deferred significant files.

## Guardrails

- Do not narrate every file.
- Do not repeat the PR description without testing its claims.
- Do not pad the review with generic checklist language.
- Do not invent requirements, intent, alternatives, or test results.
- Do not treat style preferences as approval blockers.
- Do not hide uncertainty behind polished prose.
- Do not assume familiarity with product-specific architecture, protocols, deployment models, or internal terminology.
- Do not simplify away the mechanism that an approver needs to evaluate.
- Do not post comments, submit a review, or approve the PR unless the user explicitly asks.
- Do not expose secrets or use live production systems for validation.
- Keep the opening concise, then deepen progressively so the reader can stop after the orientation.
