---
layout: story
author: Ben Balter, GitHub
title: A Modern Approach to Open Data
description: Developers from the Sunlight Foundation, GovTrack, and the New York Times decided to stop each building the same basic tools over and over, and start building an open data platform they could share.
image: /images/unitedstates.png
category: open data
---

Traditionally, consuming open government data required building and curating many custom tools and wrappers to convert the data from the form it's exposed in to something more immediately consumable by civic hackers, watchdog groups, and the general public. Developers haphazardly wrote small scripts as one-off efforts and threw them away, or left their solutions buried inside larger infrastructure, reinventing the wheel with each new transparency initiative.

Developers from the [Sunlight Foundation](http://sunlightfoundation.com/), [GovTrack](http://www.govtrack.us/), and the New York Times, however, decided to join forces and break from tradition when they reached out to other civic-minded developers and "decided to stop each building the same basic tools over and over, and start building a foundation [they] could share."

They set up shop at [github.com/unitedstates](https://github.com/unitedstates) and got to work collaboratively curating the [who](https://github.com/unitedstates/congress-legislators/) and [what](https://github.com/unitedstates/congress) of Congress. Using a mix of automation and brute force they quietly assembled the "basic information from all over the government -- THOMAS.gov, the House and Senate, the Congressional Bioguide, GPO's FDSys, and others -- that everyone needs to report, analyze, or build nearly anything to do with Congress."

But it didn't end there. Their efforts were about more than just code — [it was about making government transparency a group effort](http://sunlightfoundation.com/blog/2013/08/20/a-modern-approach-to-open-data/). A community began to emerge around the shared challenges of government data. Subject matter experts shed light on [the nuances of government datasets](https://github.com/unitedstates/congress-legislators/issues/2), and crowd source began to [fill in the gaps of missing data](https://github.com/unitedstates/congress-legislators/pull/39) while others still took to building tools to [analyze and visualize those very datasets](http://news.yahoo.com/senate-budget-amendments-interactive-track-changes-153640966.html).

What made these open data efforts such a success?

* **Collaboration in public** - When an issue arose, rather than lock such conversations to email or exclusive meetings, it was [discussed openly using GitHub Issues](https://github.com/unitedstates/congress-legislators/issues?state=open) where others could freely join the conversation, or refer to it in the future.

* **Platform Agnostic** - The shared tools and data where built using platform agnostic standards, standards like Markdown and YAML which are natively rendered on GitHub and could easily be incorporated elsewhere.

* **Eat your own dog food** - The project participants didn't just build the tools, they began using them immediately, even well before "version 1.0". Sunlight and GovTrack replaced their existing data scraping infrastructure with the shared tools, exposing shortcomings early on, allowing them to continuously iterate and build the project's forward momentum.

In a little over a year, [the unitedstates project has grown](https://github.com/unitedstates) to almost twenty repositories covering everything from [a shared US Code parser](https://github.com/unitedstates/uscode) to [a glossary of common bill nicknames](https://github.com/unitedstates/bill-nicknames) and has seen contributions from upwards of sixty open-source contributors.

Most of the tools within unitedstates don't do anything that hasn't already been solved before, but they approach shared problems in a unique way. When common issues arise, instead of tackling them independently, the community turns to a commons of shared resources where everyone can benefit from the improvements submitted.

Check out [unitedstates](https://github.com/unitedstates) on GitHub, or browse one of Sunlight's [other 200+ open source efforts](https://github.com/sunlightlabs).
