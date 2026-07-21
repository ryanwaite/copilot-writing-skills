---
name: classic-style
description: 'Rewrite text in the Classic Style described by Steven Pinker in "The Sense of Style" (drawn from Thomas & Turner''s "Clear and Simple as the Truth"). Strips AI writing artifacts (em-dashes, "not just X but Y", delve/leverage, rule-of-three padding, reflexive hedging) and rewrites prose as a clear window onto the world: concrete nouns, active verbs, a visible agent, no metadiscourse. Use when the user says "rewrite in classic style", "classic style this", "Pinker-ify", "de-AI this", "make this sound human", or asks to remove em-dashes and AI tells.'
argument-hint: 'Paste or point to the text to rewrite; optionally say how aggressive to be (light touch vs. full rewrite)'
---

# Classic Style

Rewrite a passage so it reads as **classic prose**: the writer has seen something true about the world and directs the reader's gaze so she sees it for herself. Clarity and simplicity are the proof of success. Along the way, strip the artifacts that mark text as machine-generated.

The full specification, with before/after examples, lives in `references/classic-style.md`. **Read it before rewriting** — it is the authoritative definition and it is short.

## When to Use

- "Rewrite this in classic style" / "classic style this" / "Pinker-ify this"
- "De-AI this" / "make this sound human" / "remove the AI tells"
- "Get rid of the em-dashes" and similar artifact-removal requests
- Any time the user wants prose that is concrete, direct, and unfussy

## Inputs

- **The text** — pasted inline, quoted, or a path to a local file the current environment can read.
- **Aggressiveness** (optional) — default is a **full rewrite** that preserves meaning and the author's claims. If the user says "light touch," only remove artifacts and fix the worst offenders without reshaping voice. If the user says "keep my structure," preserve paragraph order and headings.

If the text is missing, ask for it. Do not invent content.

## Procedure

### Step 1 — Read the reference

Open `references/classic-style.md`. It contains the stand (the mental stance that defines the style), the do/don't checklist grounded in Pinker's own list, the AI-artifact list, and worked examples.

### Step 2 — Strip AI artifacts

Pass over the text and remove or replace the machine tells listed in the reference. The most common:

- **Em-dashes** used for dramatic asides → recast as separate sentences, commas, or parentheses. Avoid the em-dash habit entirely.
- **"It's not just X — it's Y" / "not only… but also"** antithesis scaffolding → state the point plainly.
- **Rule-of-three padding** ("clear, concise, and compelling") → keep the one word that carries the idea.
- **Corporate/LLM vocabulary** (delve, leverage, robust, underscore, seamless, tapestry, testament, navigate the landscape) → plain words.
- **Reflexive hedging** (arguably, it's worth noting, in many ways, to some extent) → cut, or commit to the claim.
- **Signpost throat-clearing** ("In today's fast-paced world," "Here's the thing," "In conclusion") → delete.
- **Formatting tics** — bold-everything, gratuitous emoji, listy answers to prose questions → normalize to prose.

### Step 3 — Rewrite for the stand

Now reshape the prose so it takes the classic stance (see reference for the full definition):

1. **Show a visible agent doing something.** Find the mover and put them in the subject slot. Turn zombie nouns back into verbs (*implementation of the postponement* → *we postponed it*).
2. **Prefer concrete nouns and active verbs.** Cut metaconcepts (level, approach, framework, process) where a plain object is meant.
3. **Kill unnecessary passives and nominalizations.** Keep a passive only when the agent should stay off-stage.
4. **Cut metadiscourse and hedging.** The writer never talks about the writing. State the truth as if pointing at it.
5. **Start strong.** Open with a contentful observation, not a cliché or a windup.
6. **Trust the reader.** Assume an intelligent equal; drop over-explanation and scare quotes.

Preserve the author's actual claims and facts. Classic style sharpens *how* something is said, never fabricates *what* is said.

### Step 4 — Present the result

Return the rewritten text. Then, unless the user asked for output only, add a short **"What changed"** note: 2–5 bullets naming the biggest moves (e.g., "removed 4 em-dashes," "turned three nominalizations into verbs," "cut the 'In today's world' opener"). Keep the note plain — no em-dashes in it.

If the passage is long, rewrite it in full rather than summarizing, and keep the original section order unless the user allows restructuring.

## Guardrails

- **Do not change meaning.** If a sentence's claim is unclear, ask rather than guess.
- **Not every dash is wrong** in the author's own source text, but the rewrite should avoid the em-dash habit. Prefer periods and commas.
- **Classic style is not plain style.** It is not about dumbing down; a single vivid, uncommon word against a plain backdrop is welcome (see reference).
- **Don't over-apply the "don'ts" as commandments.** They are consequences of the stand. When in doubt, ask: is the writer pointing the reader's gaze at something real?
- Match the register the user wants. Classic style suits essays, memos, and explanations; the user may still want a subject line or bullet list where that genuinely fits.
