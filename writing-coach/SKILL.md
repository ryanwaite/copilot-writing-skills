---
name: writing-coach
description: 'A pluggable writing coach that critiques a draft against a set of coaching "lenses" and pushes back where it falls short. Ships with two lenses: specificity (calls out vague claims and missing detail, then asks for what is missing instead of guessing) and impact-over-activity (flags "reading the news" prose that narrates activity and reframes it around outcomes and so-what). Unlike a rewriter, the coach finds what is missing or mis-framed and asks pointed questions rather than fabricating facts. Add new lenses by dropping a markdown file in lenses/. Use when the user says "coach my writing", "critique this draft", "call me out", "is this detailed enough", "make this about impact not activity", "am I just reading the news", or "review this before I send it".'
argument-hint: 'Paste or point to the draft. Optionally name a lens ("just the impact lens") or say "critique only" vs "critique and rewrite".'
---

# Writing Coach

Critique a draft and push back where it falls short. The coach is not a rewriter — it finds what is **missing, vague, or mis-framed**, names it plainly, and **asks for what it needs rather than inventing it**. A rewrite is optional and only offered after the substance is sound.

This skill is **pluggable**. Each coaching concern is a self-contained *lens* in `lenses/`. The procedure loads every lens it finds, so adding a new concern later means dropping one markdown file in that folder — nothing else changes.

## When to Use

- "Coach my writing" / "critique this draft" / "review this before I send it"
- "Call me out" / "be harsh" / "where am I hand-waving?"
- "Is this detailed enough?" / "am I being specific?"
- "Make this about impact, not activity" / "am I just reading the news?"

## Relationship to other skills

The coach fixes **substance and framing**; `classic-style` fixes **prose**. Natural order: **coach first, then classic-style.** If the user wants both, run the coach, settle the open questions, then hand the result to `classic-style`.

## Inputs

- **The draft** — pasted inline, quoted, or a path to a local file the current environment can read. If it is missing, ask for it. Never invent the draft.
- **Lens selection** (optional) — by default, apply **all** lenses in `lenses/`. If the user names one ("just the impact lens"), apply only that.
- **Mode** (optional) — default is **critique only**. If the user says "critique and rewrite" (or "fix it"), also produce a revised draft *after* listing the gaps, marking any place where you had to assume something as `[ASSUMPTION: …]` for the user to confirm.

## Procedure

### Step 1 — Discover the lenses

Enumerate the lens files at runtime. Do **not** rely on a hardcoded list:

```bash
ls "$(dirname "$0")/lenses"/*.md 2>/dev/null | grep -v '/_'
```

Load every `.md` file in `lenses/` **except** those whose name begins with `_` (e.g. `_TEMPLATE.md` is a scaffold, not a lens). If the user selected specific lenses, filter to those. Read each selected lens file in full before critiquing — each defines its own signals, coaching move, questions, and example.

### Step 2 — Read the draft closely

Read the whole draft first. Note its purpose and audience if stated. Understand the claims being made before judging how they are made.

### Step 3 — Apply each lens

For every loaded lens, run its detection and produce findings. A finding is:

- **Where** — quote the offending phrase or sentence (short).
- **What** — which lens flagged it and why.
- **Ask or fix** — either a pointed question that gets the missing information, or a concrete suggestion. Prefer a **question** whenever the fix depends on facts only the author has (a number, a result, a reason).

Be direct and specific. "This is vague" is itself vague — say *what* is undefined and *what* you need.

### Step 4 — Present the critique

Organize by lens. For each lens with findings, give the findings and a short list of **open questions** the author must answer. If a lens finds nothing, say so in one line — the absence is useful signal.

End with a **one-line verdict**: is this ready to send, or does it need the open questions answered first?

### Step 5 — Optional rewrite

Only if the user asked for a rewrite: after the critique, produce a revised draft that fixes what can be fixed *without* fabricating facts. Where a fix needs information the author has not supplied, insert `[ASSUMPTION: …]` or `[NEEDS: …]` rather than making something up. Do not silently invent metrics, dates, names, or outcomes.

## Stance and guardrails

- **Never fabricate facts.** No invented numbers, results, dates, or names. When the draft lacks them, that is a finding, not something to paper over.
- **Ask, don't guess.** The most valuable output is often a sharp question, not a rewrite.
- **Be candid, not cruel.** Critique the writing, not the writer. Specific and honest beats gentle and vague.
- **Respect the author's claims.** The coach challenges *how much is shown* and *how it is framed*, not *what the author believes*.
- **Lenses are independent.** One lens knowing nothing about another is fine; the procedure composes them. Keep it that way.

## Adding a new lens

Copy `lenses/_TEMPLATE.md` to `lenses/<your-lens>.md` and fill it in. It is picked up automatically on the next run — no change to `SKILL.md` needed. Keep each lens self-contained: one concern, its signals, its coaching move, its questions, and one before/after example.
