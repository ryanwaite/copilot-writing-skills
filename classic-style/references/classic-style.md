# Classic Style — Reference Specification

Distilled from Steven Pinker, *The Sense of Style* (Viking, 2014), Chapter 2, "A Window Onto the World" (on classic prose), which draws on Francis-Noël Thomas & Mark Turner, *Clear and Simple as the Truth*. The quoted passages below come from that chapter; page numbers vary by edition.

This file has two jobs:
1. Define **the stand** — the mental stance that *is* classic style.
2. List the practical **do / don't** rules and the modern **AI-artifact** cleanup, with before/after examples.

---

## 1. The stand

Classic style is not a set of rules; it is a **stance the writer adopts**. The rules below are just what follows once you take the stance. The stance has four assumptions:

- **Writing is a window onto the world.** "The writer can see something that the reader has not yet noticed, and he orients the reader's gaze so that she can see it for herself." The purpose of writing is *presentation*.
- **The motive is disinterested truth.** Prose succeeds when it "aligns language with the truth, the proof of success being clarity and simplicity." The truth exists independent of the writing, so the writer presents it rather than arguing, hedging, or fussing over the prose.
- **It is a conversation between equals.** The writer "must simulate two experiences: showing the reader something in the world, and engaging her in conversation." "Classic writing… makes the reader feel like a genius. Bad writing makes the reader feel like a dunce."
- **It is confident, not egalitarian about difficulty.** Unlike plain style, "the writer has worked hard to find something worth showing and the perfect vantage point from which to see it. The reader may have to work hard to discern it, but her efforts will be rewarded." *The early bird gets the worm* is plain; *The early bird gets the worm, but the second mouse gets the cheese* is classic.

Every "don't" below is a way a writer strays from this scenario: a writer, in conversation with a reader, directing the reader's gaze to something in the world.

Classic style is **one good default, not the only style.** It suits explanation, essays, memos, and argument-as-presentation. It is a poor fit where the genre truly demands hedged uncertainty (a legal disclaimer) or exhaustive qualification (a scientific methods section). Use judgment.

---

## 2. Do

- **Put a visible agent in the subject slot.** "All eyes are on an agent: a protagonist, a mover and shaker, a driving force. The agent pushes or prods something, and it moves or changes."
- **Use concrete nouns and active verbs.** Favor "fresh wording and concrete imagery over familiar verbiage and abstract summary."
- **Minimize abstractions.** Classic style "minimizes abstractions, which cannot be seen with the naked eye." Beware metaconcepts — level, perspective, approach, assumption, concept, context, framework, issue, model, process, range, role, strategy, tendency, variable. They are "packing material."
- **Turn zombie nouns back into verbs.** Nominalization "takes a perfectly spry verb and embalms it into a lifeless noun." Instead of *effecting an affirmation*, affirm; instead of *implementing a postponement*, postpone.
- **Start strong.** "Good writing starts strong. Not with a cliché ('Since the dawn of time'), not with a banality ('Recently, scholars have been increasingly concerned with…'), but with a contentful observation that provokes curiosity."
- **Prize the telling detail and the well-chosen word.** "The judicious placement of an uncommon word or idiom against a backdrop of simple nouns and verbs; the use of parallel syntax; the occasional planned surprise; the presentation of a telling detail that obviates an explicit pronouncement."
- **Trust the reader.** Assume an intelligent equal. Drop over-explanation.

---

## 3. Don't

Pinker's own list of "writerly habits that result in soggy prose":

- **Metadiscourse** — writing about the writing ("This essay will show…," "As noted above").
- **Signposting** — excess "First… Second… Finally." Some is fine; a thicket is not.
- **Hedging** — "almost, apparently, comparatively, fairly, in part, nearly, partially, presumably, rather, relatively, seemingly, somewhat, sort of, to a certain degree, to some extent," and the ubiquitous *I would argue*.
- **Apologizing** — pre-emptive throat-clearing about the difficulty of the topic.
- **Professional narcissism** — writing about your field's activities instead of its subject.
- **Clichés and mixed metaphors.**
- **Metaconcepts and zombie nouns** — see the "Do" section.
- **Unnecessary passives.** Keep the passive only when the agent should stay off-stage (*The honey was eaten*). Otherwise name the actor.
- **Shudder / scare quotes** — "the prissy use of quotation marks… to distance the writer from a common idiom."
- **Intensifier padding** — *very, really, quite*. "Substitute *damn* every time you're inclined to write *very*; your editor will delete it and the writing will be just as it should be."

---

## 4. AI-artifact cleanup (modern layer)

Not from Pinker — this is the "remove the machine tells" pass. Most overlap with the "don'ts" above; a few are specific to LLM output.

Remove or recast:

- **Em-dashes** used for dramatic asides or appositives. Recast as separate sentences, commas, or parentheses. Break the em-dash habit.
- **Antithesis scaffolding**: "It's not just X — it's Y," "not only… but also," "It isn't about A; it's about B." State the point directly.
- **Rule-of-three padding**: "clear, concise, and compelling," "fast, reliable, and scalable." Keep the load-bearing term.
- **LLM vocabulary**: delve, leverage, robust, underscore, seamless, streamline, elevate, tapestry, testament, realm, navigate the landscape, in the ever-evolving world of, unlock, harness, foster, pivotal, crucial, notably.
- **Reflexive hedging**: "it's worth noting," "arguably," "in many ways," "to some extent," "that said."
- **Windup openers / closers**: "In today's fast-paced world," "Here's the thing," "At the end of the day," "In conclusion," "Ultimately."
- **Formatting tics**: bold-everything, gratuitous emoji, and answering a prose question with a bullet list when a paragraph is called for.

---

## 5. Worked examples

**Zombie nouns → agent + verb**
- Before: *The implementation of the new policy resulted in a reduction of onboarding time.*
- After: *The new policy cut onboarding time in half.*

**Em-dash aside → clean sentences**
- Before: *The migration was risky — really risky — but the team pulled it off.*
- After: *The migration was risky. The team pulled it off anyway.*

**Antithesis scaffolding → direct claim**
- Before: *This isn't just a bug fix; it's a fundamental rethinking of how we handle state.*
- After: *This rewrite changes how we handle state.*

**Hedged and abstract → concrete and confident**
- Before: *It could be argued that, in many respects, the framework provides a level of flexibility that may prove beneficial to various stakeholders.*
- After: *The framework lets each team change its own settings without asking us.*

**Metaconcept packing → the object itself**
- Before: *We need to improve the customer engagement experience across multiple touchpoints.*
- After: *Customers should be able to reach us by phone, email, or chat, and get an answer the same day.*

**Windup opener → strong start**
- Before: *In today's fast-paced digital landscape, organizations are increasingly leveraging data to drive decisions.*
- After: *Every click a customer makes is a fact we can act on.*

**Passive with hidden agent → named agent**
- Before: *Mistakes were made during the rollout.*
- After: *We shipped the rollout without a staging test, and it broke checkout.*

---

## 6. Quick checklist for a rewrite

1. Who is the agent? Put them in the subject.
2. Any zombie nouns? Turn them back into verbs.
3. Any em-dashes or "not just X, it's Y"? Recast.
4. Any hedges or intensifiers? Cut or commit.
5. Any metaconcepts standing in for a real object? Replace with the object.
6. Does the opening say something, or clear its throat? Make it say something.
7. Would an intelligent equal feel talked down to? Fix it.
8. Read it aloud. Does it sound like one person showing another something real?
