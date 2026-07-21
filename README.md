# copilot-writing-skills

A personal toolkit of [Copilot CLI](https://github.com/github/copilot-cli) skills for writing. The skills are designed to **compose**: coach the substance first, then polish the prose.

| Skill | Kind | What it does |
|---|---|---|
| [`writing-coach`](writing-coach/) | Critic | Critiques a draft against pluggable "lenses" and pushes back where it falls short. Ships with **specificity** (calls out vague claims and missing detail), **impact-over-activity** (flags "reading the news" prose and reframes around outcomes), and **executive-audience** (BLUF, explicit ask, one-screen brevity for SLT/exec updates). Add your own lenses by dropping a file in `writing-coach/lenses/`. |
| [`classic-style`](classic-style/) | Rewriter | Rewrites prose in Steven Pinker's Classic Style and strips AI writing artifacts (em-dashes, "not just X but Y", delve/leverage, rule-of-three padding, reflexive hedging). |

## The pipeline

The two skills do different jobs and are best used in order:

```
draft ──▶ writing-coach ──▶ (answer the open questions) ──▶ classic-style ──▶ final
          fixes substance & framing                        fixes the prose
```

- **`writing-coach`** finds what's *missing or mis-framed* and asks you for it. It never fabricates facts.
- **`classic-style`** takes prose whose substance is settled and makes it a clear window onto the world.

Use either on its own, too. "Coach this before I send it" or "rewrite this in classic style" both work.

## Repository layout

```
.
├── classic-style/
│   ├── SKILL.md
│   └── references/classic-style.md
├── writing-coach/
│   ├── SKILL.md
│   └── lenses/
│       ├── specificity.md
│       ├── impact-over-activity.md
│       ├── executive-audience.md
│       └── _TEMPLATE.md          # copy to add a new coaching lens
├── install.sh                    # installs one or both skills
├── LICENSE                       # MIT
└── README.md
```

## Installation

Skills live under your Copilot CLI skills directory (`~/.copilot/skills/`), one folder per skill. User skills load when Copilot CLI starts, so **restart your session after installing**.

### Install script

```bash
git clone https://github.com/ryanwaite/copilot-writing-skills.git
cd copilot-writing-skills

./install.sh                 # install all skills
./install.sh writing-coach   # install just one (repeatable: ./install.sh classic-style)
./install.sh --force         # overwrite existing copies
```

The script copies each skill folder into `~/.copilot/skills/` (override with `COPILOT_SKILLS_DIR`) and refuses to clobber an existing copy unless you pass `--force`.

### Manual copy

```bash
git clone https://github.com/ryanwaite/copilot-writing-skills.git
cp -R copilot-writing-skills/classic-style  ~/.copilot/skills/classic-style
cp -R copilot-writing-skills/writing-coach  ~/.copilot/skills/writing-coach
```

Restart Copilot CLI, then confirm:

```bash
ls ~/.copilot/skills/classic-style ~/.copilot/skills/writing-coach
```

## Extending

- **Add a coaching lens:** copy `writing-coach/lenses/_TEMPLATE.md` to `writing-coach/lenses/<name>.md` and fill it in. `writing-coach` enumerates its `lenses/` folder at runtime, so the new lens is picked up on the next run with no other changes.
- **Tune the style:** edit `classic-style/references/classic-style.md` — soften the em-dash rule, add house-voice before/after pairs, etc.

## Source

`classic-style` is distilled from Steven Pinker, *The Sense of Style* (Viking, 2014), Chapter 2, which draws on Francis-Noël Thomas & Mark Turner, *Clear and Simple as the Truth*.

## License

[MIT](LICENSE)
