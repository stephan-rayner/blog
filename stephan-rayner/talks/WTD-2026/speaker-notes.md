## Speaker Notes: Trading in Trust

Matches `trading-in-trust-slides.pdf`, 26 slides for a 30-minute slot (Q&A separate). The official Write the Docs event graphic bookends the deck as an unnumbered bumper (page 1 and page 26). Slide 3 is your speaker card, rebuilt natively to fill the widescreen frame using your real headshot and the Write the Docs Berlin 2026 brand (Bree Serif, Nunito Sans, navy and gold). A Thank You slide sits at slide 4, right after the speaker card, that's a deliberate cold open joke (doing the important things early), not a mistake. The close (slide 25) is the actual end of the talk content, there's no dedicated Questions slide, flow for Q&A (where you hold) is still undecided, see open items.

### 1. Opening Bumper

The official event graphic, shown before you're introduced. No number, nothing to say, this is just what's on screen while the organizer introduces you.

### 2. Title

Walk on, let the title sit for a second before speaking. Introduce yourself and Grafana Labs in one line, then move straight into the claim, don't linger on bio here, that's what the intro from the organizers is for.

### 3. Speaker Card

Your speaker card: photo, name, the Grafana logo, talk title, and event details along the bottom, now with the QR code ("Scan to Connect") in place of the old LinkedIn and blog links. Brief beat, this is more a visual confirmation for the audience than something to narrate.

### 4. Thank You

The joke: you've been told to do the important things early, so you're going to say thank you right now, before the talk has even started. Land that line, let it get its laugh, then walk through the list on screen: Grafana Labs, Janine Chan (who encouraged you to submit this talk), "everyone who knows me and never mentioned my reading disorder when I told them I was speaking at a writing conference" (a general wink rather than naming your mother specifically), and the staff at Write the Docs last. Give each its own beat, the reading disorder line is the biggest laugh on the slide, don't let the WTD staff line that follows it step on the laugh, give it a beat of its own too. No "Stephan Rayner · Grafana Labs" subtitle under the headline anymore, the list carries the whole slide. List isn't final, more names likely to be added before rehearsal. Keep the whole bit quick, it's a cold open joke, not a real acknowledgments section, don't let it eat into your 30 minutes.

### 5. Documentation Isn't Just a Reference Artifact

State the thesis plainly: docs aren't just there to inform, they preserve the conditions under which people can work together honestly. This is the sentence the whole talk hangs off, say it slowly.

### 6. Without It, Power Fills the Vacuum

One beat, let it land. This is the setup for both stories, don't explain it yet, just plant it.

### 7. Two Stories, One Dynamic

Tell the audience what's coming: one story where the absence of documentation let power win, one where documentation itself was the power. This is your map, keeps people oriented for the next ten minutes.

### 8. Head of Data at a Toxic, Now Defunct Mobile Games Company

Set the scene fast: your role, a team of analysts and data engineers, stakeholders who wanted data. Keep this factual and a little wry, "toxic, now defunct" already does some of the comic work for you.

### 9. The Newest Person Is the Easiest to Pressure

Name the pattern before the incident, so the audience has the lens ready. Stakeholders went to whoever was least equipped to say no.

### 10. Demand Data from the New Analyst

The incident, now specific: Greg (Head of Business Development) leaned on Analina (Junior Analyst) for tutorial completion data sliced his way, chasing an 89% D1 retention number in a free-to-play mobile game he was convinced meant the company was about to be "millionaires." Play the gap between his confidence and what a number like that actually means without context, that gap is the joke and the warning at once. Keep this to 45 to 60 seconds, this is the part most likely to run long.

### 11. No Written Standard, No Cover

Pull back from the incident to the systemic gap: no documented standard for what could be shared, in what form, or why. Every request became a solo negotiation, Analina had nothing to point to.

### 12. The Org Chart, Not the Policy, Decided Who Won

Land the point hard, then pause before moving on. This is the end of story one, give it a beat of silence.

### 13. Solution: How We Addressed This

The resolution to story one, held back until after the "org chart, not the policy" line has landed and had its beat of silence. Walk through the fix: a written request filing process in a tool the team already used, plus event schema docs for stakeholders covering what an event is, why it's captured, what it can't tell you, and when it fires. Close on the payoff: this gave the analysts both a platform and a shield, that line is doing the work of tying the fix back to the thesis, so let it land before moving to story two. This is the proof that the fix wasn't hypothetical, keep it brisk, it's evidence for the framework to come, not a new story beat.

### 14. The Arrogant Senior ML Engineer Who Lost to an Expense Policy

Tone shift, and say so out loud if it helps: "this one's on me." Set up your own seniority and confidence so the fall is funnier and the point lands harder.

### 15. I Argued Anyway

Set the mismatch up front: you, a Senior Machine Learning Engineer, against Ronnie, a Junior Expense Analyst, on paper a lopsided fight. Then walk through what you wanted, what the policy said, and why you argued anyway. Let yourself sound a little ridiculous here, self-deprecation is doing real work in this story.

### 16. The Document Won on Its Own

The turn: not because Ronnie outranked you, he didn't come close, but because the document was written for exactly this pushback. The redacted policy line is now on screen below the pull quote, let it sit for a beat, then read it aloud before moving to the mechanism slide.

### 17. Good Documentation Externalizes Authority

Name the mechanism directly, this is the pivot from stories to framework. It levels a playing field otherwise decided by power, clout, or seniority, and it does that without a difficult conversation every single time.

### 18. We Trade in Trust, Not Documents

The bridge from mechanism to framework, and a callback to the talk's own title, say it plainly and let the room register it. Then the causal chain: no trust means volume doesn't matter, and no usability means no trust. That second clause is the setup for the next four slides, they're what "usable enough to be trusted" actually looks like.

### 19. Four Ways to Write Docs That Do This Work

Preview all four before going deep on each. Read them at a normal pace, don't over-explain yet, that's the next four slides.

### 20. Write for the Enforcer, Not Just the Reader

The reader wants to know what to do, the enforcer has to hold the line when someone pushes back, those are different jobs. Tie back to story one: Analina was an enforcer with nothing to enforce. Leave the audience with the test: "if someone argues, what does the enforcer say next?"

### 21. Anchor to Mission Rather Than Procedure

Procedure only covers the cases someone thought of, mission lets people reason from it when a case isn't covered. Tie back to story one: a data-sharing standard anchored to "why we protect user data" would have given Analina something a checklist couldn't. Leave the audience with the test: "if the steps run out, does the mission tell you what to do next?"

### 22. Document the Why Alongside the What

Rules without reasoning invite argument, because unreasoned rules look arbitrary. Tie back to story two: the expense policy won because it justified itself, not because it was strict. The third bullet is marked with a ❌, confirm what you want that to signal to the audience before you rehearse this one.

### 23. Make Your Limitations Visible

A doc that names what it doesn't cover builds more trust than one that oversells. Tie back to both stories if time allows: overselling scope is exactly what leaves an enforcer exposed later. Leave the audience with the test: "what doesn't this document cover, and have you said so?"

### 24. Good News We Are Almost Done!

A light beat between the last framework slide and the close, let the audience laugh and reset before the tone shifts back to serious for the final line.

### 25. A Document Can Be a Leveler and a Shield

The close, and the payoff for two things you planted earlier without naming: "levels a playing field" on the mechanism slide, and "platform and a shield" on slide 13. Naming both together here is what makes the pattern click into place. Also returns to the vacuum from slide 6. Deliver it slowly. Your QR code is in the bottom right and the Grafana logo is in the bottom left, whether you linger here for Q&A or treat this as the true end of the talk is still open, see below.

### 26. Closing Bumper

The official event graphic again, on screen as the room transitions out of your slot.

---

### Open Items Before You Rehearse

- The thank-you list on slide 4 isn't final, Grafana Labs, Janine Chan, and your mother are locked in, but you've said there's more names to add ("and so on"). Finalize the full list before rehearsal.
- Time yourself on slides 8 through 13 specifically (story one), that block is the one most likely to run past its budget, especially slide 10 now that it carries real dialogue beats, and slide 13 adds new content on top of an already full section.
- New slide 18 and the reworked close on slide 25 are first drafts, review both once you've seen the rendered deck.
- Slide 25 carries a QR code ("Scan to Connect") in the bottom right and the Grafana logo in the bottom left. Decide where you actually hold during Q&A now that slide 4 also says "Thank You," and whether the QR code and logo should move.
