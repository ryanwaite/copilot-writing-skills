# Lens: Specificity

**Concern:** The draft makes claims without enough detail to act on, verify, or trust. It gestures at things instead of showing them.

## When it applies

Any writing meant to inform a decision, report status, make a request, or record a fact: status updates, proposals, recommendations, bug reports, reviews, requests for approval.

## When it does not apply

Deliberately high-level or vision writing where detail is not yet the point (an early brainstorm, a mission statement, a teaser). Also skip on drafts the author has flagged as a rough first pass where they already know the specifics are missing. When in doubt, apply it — vagueness is usually a defect, not a choice.

## Signals to detect

- **Vague quantifiers**: "some," "several," "a number of," "significant," "substantial," "many," "a lot," "recently," "soon," "a while." Numbers and dates hide behind these.
- **Undefined terms and referents**: "the issue," "this," "that work," "the system," "stakeholders," "the team," where the reader can't tell *which* one.
- **Unsupported evaluative claims**: "went well," "was successful," "is a problem," "works better," "is at risk," with no evidence, metric, or example.
- **Missing who / what / when / how much**: an action with no owner, a change with no size, a deadline with no date, a result with no measure.
- **Hand-wavy mechanism**: "we'll figure out the integration," "somehow surface this." The hard part is named but not explained.
- **Abstraction with no instance**: a general claim ("customers want flexibility") with no concrete example that would let a reader picture it.

## The coaching move

For each vague spot, name **exactly** what is undefined and **what specific information would make it solid**. Do not accept your own vague critique ("be more specific"); point at the word and ask the precise question.

Push toward: a number instead of a quantifier, a name instead of a pronoun, a date instead of "soon," an example instead of an abstraction, evidence instead of a verdict. If the author genuinely cannot supply the detail yet, that itself should be stated ("owner TBD," "measuring next week") rather than smoothed over.

Do **not** invent the missing detail. The output is a question, not a fabricated fact.

## Questions to ask

- "'Several teams': which ones, and how many?"
- "'Went well': by what measure? What's the number or the outcome?"
- "'The issue': which issue specifically? Link or name it."
- "'Soon': what's the actual date?"
- "Who owns this, and by when?"
- "You say it's a problem: for whom, and how big?"

## Example

**Before**
> We made good progress on the migration this week. Several services were moved over and performance looks better. We should be done soon.

**Coaching (what the lens produces)**
- "good progress" / "looks better": no measure. *How much faster, on what metric?*
- "Several services": *which ones, how many of the total?*
- "should be done soon": *what date, and what's left?*

**Author supplied** (facts the author provided when answering; not invented by the coach)
> 7 of 12 services migrated; p95 latency 340 ms → 210 ms on the migrated set; remaining 5 due Aug 1; blocker is the shared auth library; Priya owns the patch.

**After the author answers**
> We migrated 7 of 12 services this week. Median p95 latency on the migrated set dropped from 340 ms to 210 ms. The remaining 5 are scheduled by Aug 1; the blocker is the shared auth library, which Priya is patching.
