# Lens: Executive Audience

**Concern:** A draft aimed at senior leadership buries the point, over-explains the process, or never says what it wants. It fails the "busy executive skimming on a phone" test.

## When it applies

Anything going up the chain: SLT and staff-meeting updates, exec briefings, board notes, skip-level emails, and any message whose readers include VPs, CVPs, or the CEO. The audience is smart, cross-functional, time-poor, and may last have seen this topic weeks ago.

## When it does not apply

Peer-to-peer or working-level writing: a message to your immediate team, a technical design doc for engineers, a casual Slack thread, or anything where the reader shares your context and there is no exec in the audience. Applying an exec lens there would strip useful detail. If no reader is a senior leader, skip this lens.

## Signals to detect

- **Buried lede / no BLUF**: the message doesn't open with the single most important thing (the status, the decision, or the ask). The reader has to dig for the point.
- **Missing or vague ask**: the reader can't tell what's wanted: FYI, a decision, resourcing, or air cover. If it's FYI, that isn't stated either.
- **Process narration**: "we met with," "we've been coordinating," "I did an analysis." Execs want outcome, risk, and ask, not how the sausage was made. (Overlaps the impact lens, sharpened for an exec reader.)
- **Too long to skim**: more than roughly one screen, no headers or bolded takeaways, no structure a reader can scan in 20 seconds.
- **No cache refresh**: assumes the reader remembers a prior thread. A one-line "what this is" refresher is missing. (Your OSSPrey prompt made this explicit: *"[describe OSSPrey to refresh the cache]."*)
- **Undefined jargon or acronyms**: terms that a single function knows but a cross-functional exec audience does not, used without a gloss.
- **Commitments with no owner or date**: "we'll stand up the board," "targets to be hit," with no name and no when.
- **Unqualified risk**: a risk named with no likelihood and no mitigation, or worse, a risk omitted to look tidy.

## The coaching move

Push the draft to **BLUF, bottom line up front.** The first two or three sentences should carry: *what this is* (one-line refresher), *where it stands*, *what you need*, and *by when*. Everything else is supporting detail the reader can drop into if they choose.

Then:
- **Make the ask explicit and singular.** One decision or one request, stated plainly. If it's purely informational, say "no action needed."
- **Cut the process.** Replace "we did X, Y, Z" with the outcome those actions produced.
- **Fit one screen.** Use a short header structure and bold the takeaways so it survives a phone skim.
- **Add a one-line refresher** for any topic the reader saw once, weeks ago.
- **Name owners and dates** on every commitment.
- **Qualify each risk** with likelihood and mitigation, and don't hide the ugly one.

For prose polish, machine phrasing, and AI tells such as em-dashes, this lens defers to the `classic-style` skill. Recommend a follow-up `classic-style` pass rather than flagging those here, so the two skills don't overlap.

Do not invent facts to fill the structure. Where the draft lacks an owner, a date, a metric, or the ask, that is a finding: ask the author, or mark it `[NEEDS: …]`.

## Questions to ask

- "What is the one sentence you want the SLT (or Satya) to remember?"
- "What do you need from them: a decision, awareness, resourcing, or air cover? By when?"
- "Would this survive a 20-second phone skim? What's above the fold?"
- "Does the reader still remember this topic, or does it need a one-line refresher?"
- "Every commitment here: who owns it, and by when?"
- "What's the biggest risk, how likely is it, and what are you doing about it?"

## Example

**Before**
> I wanted to give an update on the project. Over the past few weeks the team has met with several partners and worked through a number of open questions on governance. We've made good progress and coordinated with a few external groups. There's been a lot of effort across the org. The charter is being reviewed and we're hopeful about timing. More to come.

**Coaching (what the lens produces)**
- No BLUF: opens with "I wanted to give an update" instead of the news. *What's the single most important thing?*
- No ask: the reader doesn't know if a decision is needed. *FYI, or do you want something?*
- Pure process: "met with," "worked through," "coordinated," "a lot of effort." *What outcome did that produce?*
- No dates, owners, or refresher; "hopeful about timing" hides the real schedule and risk.

**Author supplied** (facts the author provided when answering; not invented by the coach)
> Launch target June 24; no action needed yet; project stands up a cross-industry foundation to ship fixes for critical OSS vulnerabilities pre-exploit; charter in final review with Google and Amazon as co-founders; a dozen launch partners confirmed; Jim Zemlin interim ED; risk is U.S. Treasury coordination tied to the June 2 EO; slip likelihood low; policy team closed the last open item yesterday; may ask for air cover if a partner wavers; will flag by June 20.

**After the author answers**
> **Launch is on track for June 24; no action needed from you yet.** [The project] stands up a cross-industry foundation to ship fixes for critical open-source vulnerabilities before they're exploited.
>
> **Where we are:** Charter is in final review with Google and Amazon as co-founders; a dozen launch partners are confirmed. Jim Zemlin will serve as interim Executive Director.
>
> **Risk:** The one variable is U.S. Treasury coordination tied to the June 2 EO. Likelihood of slip is low; our policy team closed the last open item yesterday.
>
> **What I may ask later:** air cover if a launch partner wavers. I'll flag by June 20 if so.
