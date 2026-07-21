---
name: writing-coach
description: 'A pluggable writing coach that critiques a draft against a set of coaching "lenses" and pushes back where it falls short. Ships with three lenses: specificity (calls out vague claims and missing detail, then asks for what is missing instead of guessing), impact-over-activity (flags "reading the news" prose that narrates activity and reframes it around outcomes and so-what), and executive-audience (checks SLT/exec updates for BLUF, an explicit ask, and one-screen brevity). Unlike a rewriter, the coach finds what is missing or mis-framed and asks pointed questions rather than fabricating facts. Add new lenses by dropping a markdown file in lenses/. Use when the user says "coach my writing", "critique this draft", "call me out", "is this detailed enough", "make this about impact not activity", "am I just reading the news", "is this ready for the SLT/execs", or "review this before I send it".'
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
- **Mode** (optional) — default is **critique only**. If the user says "critique and rewrite" (or "fix it"), also produce a revised draft *after* listing the gaps. Mark any place that needs a fact the author has not supplied as `[NEEDS: the exact question]` for the user to fill in. Never substitute an invented fact for a `[NEEDS: …]` marker.

## Procedure

### Step 1 — Discover the lenses

Load the lenses **fresh from disk every run** so newly added ones are picked up. Do not rely on a hardcoded list or on lenses that merely happen to be in context.

The lenses live in the `lenses/` folder next to this `SKILL.md`. List that folder and select every `*.md` file **except** those whose filename begins with `_` (e.g. `_TEMPLATE.md` is a scaffold, not a lens). Process them in sorted order for a stable result. For example, from the skill's own directory:

```bash
ls lenses/*.md 2>/dev/null | grep -v '/_' | sort
```

Then:

- **Report what loaded.** Before critiquing, state `Loaded lenses: <names>` so the user can see which lenses ran.
- **Treat zero lenses as an error, not an empty success.** If discovery finds no valid lens files, stop and say so rather than silently producing no findings.
- If the user selected specific lenses, filter to those (match on the lens title or filename; if a requested lens can't be found, say so).
- **Read each selected lens file in full** before critiquing — each defines its own applicability, signals, coaching move, questions, and example.

Because an agent (not a deterministic program) runs this, discovery is best-effort: if you cannot list the folder, say so instead of guessing which lenses exist.

### Step 2 — Read the draft closely

Read the whole draft first. Note its **purpose and audience** — stated or inferred — because the next step needs them to decide which lenses apply.

### Step 3 — Check each lens for applicability, then apply the ones that fit

"Apply all lenses" means **evaluate every loaded lens for fit**, not emit findings from every lens. For each lens, read its **Applies when** and **Does not apply when** sections and classify it:

1. **Applicable** — the draft's genre/audience matches. Run the lens.
2. **Not applicable** — it doesn't match (e.g. `executive-audience` on a casual Slack message). Skip it and note it in one line: `executive-audience: skipped (not an exec-facing update)`.
3. **Unknown** — you can't tell the audience or purpose. Ask the user, or skip provisionally and say you did.

For every **applicable** lens, run its detection and produce findings. A finding is:

- **Where** — quote the offending phrase or sentence (short).
- **What** — which lens flagged it and why.
- **Ask or fix** — either a pointed question that gets the missing information, or a concrete suggestion. Prefer a **question** whenever the fix depends on facts only the author has (a number, a result, a reason).

Be direct and specific. "This is vague" is itself vague — say *what* is undefined and *what* you need.

### Step 4 — Present the critique

Organize by lens. For each **applicable** lens with findings, give the findings and a short list of **open questions** the author must answer. If an applicable lens finds nothing, say so in one line — the absence is useful signal. List any **skipped** lenses (and why) in one line so the coverage is transparent.

End with a **scoped verdict** that only claims what the applied lenses can support: "No blocking findings under the lenses that applied," or "Not ready under these lenses until the open questions are answered." Do not declare a draft globally "ready to send" — lenses can't vouch for correctness, tone, or anything no lens covers.

### Step 5 — Optional rewrite

Only if the user asked for a rewrite: after the critique, produce a revised draft that fixes what can be fixed *without* fabricating facts. Where a fix needs information the author has not supplied — a metric, date, name, owner, or outcome — insert `[NEEDS: the exact question]` at that spot instead of inventing something. Every fact in the rewrite must appear in the original draft or in an answer the author has given. Do not fill a `[NEEDS: …]` marker with a plausible guess.

## Stance and guardrails

- **Never fabricate facts.** No invented numbers, results, dates, or names. When the draft lacks them, that is a finding, not something to paper over.
- **Ask, don't guess.** The most valuable output is often a sharp question, not a rewrite.
- **Be candid, not cruel.** Critique the writing, not the writer. Specific and honest beats gentle and vague.
- **Respect the author's claims.** The coach challenges *how much is shown* and *how it is framed*, not *what the author believes*.
- **Lenses are independent.** One lens knowing nothing about another is fine; the procedure composes them. Keep it that way.

## Adding a new lens

Copy `lenses/_TEMPLATE.md` to `lenses/<your-lens>.md` and fill it in. It is picked up automatically on the next run — no change to `SKILL.md` needed. Keep each lens self-contained: one concern, its signals, its coaching move, its questions, and one before/after example.
