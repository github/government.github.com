---
title: FAQ
layout: support-page
description: Here we answer the most common questions about open source, open source communities and GitHub in general. You can help edit this page with a pull request.
permalink: /faq/
---

<span class='jump-menu'> Categories: <a href="#open_source">Open Source</a>, <a href="#open_source_community_building">Open Source Community Building</a>, <a href="#accounts">Accounts</a>, <a href="#more">More</a>, <a href="#edit_this_page">Edit this page</a></span>

---
## Open Source
---
#### Why should I use open source software?

There are [lots of arguments](http://www.dwheeler.com/oss_fs_why.html) in favor of adopting an existing <a href="#" class="glossary" title="Code or creation materials made easily accessible and free to the public.">open source</a> project over its proprietary counterparts. A few of the biggest ones:

* Lower cost - No costly licensing, no vendor lock in
* Nimble - Often better at remaining responsive to emerging trends
* Open - Open standards encourage interoperability. You own your own data; no proprietary formats
* Fast fixes - The distributed model enables rapid detection and patching of bugs
* Customizable - You own the code. Make it do what you want

---

#### What are the advantages of producing open source software?

In addition to the efficiencies inherent with a collaborative model (independent code review, communal feature development), empirically, [open source produces better, more reliable software](http://www.coverity.com/library/pdf/coverity-scan-2011-open-source-integrity-report.pdf). Think about it logically. When you (or your organization) is the only person that's ever going to see something, you're a lot more likely to "just make it work." After all, who would ever know?

But the same logic that applies to sweeping literal dirt under the rug doesn't apply to writing code. Whereas a rug will always serve to cover the floor, applications evolve over time and code is often constantly reused and repurposed as customers' needs change. Simply put, it's impossible to predict today where your code is going to be a year from now and it's in your best interest to plan accordingly.

[Open source hedges this risk](http://ben.balter.com/2012/06/26/why-you-should-always-write-software-as-open-source/) by distinguishing generic logic (say posting content online) from application-specific customization (say the use-case-specific presentation of that content). Yet when you're writing with the intention of producing proprietary or one-off code, you do everything in one pass. The true challenge arises when the same problem emerges again in another department, another business unit, or more generally in an even slightly different context. You're reinventing the wheel. You're "open sourcing" (even if within your organization).

Imagine you building a house and the contractor literally nails down all your furniture at the onset, saying you could always remove it before you sell. You'd almost certainly hire a new contractor. Even if you're never going to sell the house, you may want to get a new couch, or at the very least change a room's layout somewhere down the line. Yet software developers do it all the time. 

Distinguishing unrelated components encourages several coding best practices. In addition to introducing a modular design, meaning additional components could easily be added (or existing components removed) down the line, abstraction often yields objectively more stable and more readably maintainable code due to the abhorrence of the copy-and-paste effect. Justice Brandeis is famous for noting that "sunlight is the best disinfectant." Likewise, the transparency afforded by the open-source ethos produces more reliable software.

---

#### Why should I release my (agency's) software as open source?

Why not? Think about why we have proprietary software. Google doesn't share the code powering its search algorithm for fear that a competitor could benefit. That's their secret sauce. It'd be like Coca Cola sharing its secret formula. But outside certain military contexts, with public code, there's no competitor. In fact, quite the opposite's the case. If agency X writes a better way to store and publish content, and agency Y adopts it, that's a good thing for both the agencies and for the American people. It creates an efficiency across government that would not otherwise exist. Put another way, we're all on the same team here.

But open source isn't just sharing code among agencies. Imagine if agency X's content organizing code is posted online and a non-profit uses it to launch a new initiative, or a startup uses it to launch a new venture. Again, the agency is not in competition with the innovation and we all benefit.

Last, in that same example, let's say as that startup is adopting Agency X's code for their own use, they discover a bug, or a great new feature and contribute it back. Agency X, Agency Y, a startup and a non-profit are now all better off than if Agency X had not released the code.

More broadly, publicly funded code, is well, the public's code. It'd be like building a highway, but saying only firetrucks and police cars can use it, even though that's only a fraction of its potential. We see this most analogously with research grants in the scientific, academic, and medical communities, and the requirement to publish scholarly works and research findings that result from public funding.

---

#### What Agencies Participate in Open Source?

A lot. See the full list of [who's using GitHub](/community/).

---

## Open Source Community Building
---
#### How can I encouraging more community involvement?

Open source developers want to get behind a cause. Think of it as analogous to volunteering for a political campaign. They want to know what the project stands for, and where it is going. If they contribute, what will their code be used for in a six months or a year?  As a result, open source project documentation (the "readme") commonly includes four primary pieces of information: 

1. A project mission statement, philosophy, or goal,
2. A features and requirements list, or long-term project roadmap
3. The status of the project (active development, beta, etc.)
4. How to submit an issue/feature request or contribute a fix/enhancement

---


#### What are the best practices for project management and communication?

No matter how trivial the issue, make the discussion open. Even if issues are hashed out in-person, memorialize the conversation on the project's official communications channels. This does a few things: First, it creates a record of the decision, so that down the road, you (or more likely other contributors) can understand your reasoning. Second, it helps break down the us/them mentality, by showing the community respect and broadening the decision-making process. Last, and most helpful, engaging the community has the potential to generate more discourse, and thus more ideas and better decision.

---

#### What type of upkeep is required of an open source project?

Agencies should empower a team of trusted developers with decision-making authority to: 

1. Individually respond to any issues opened by users
2. Accept or reject [pull requests](#pull_requests) on behalf of the project, and 
3. Coordinate future releases

Avoid a traditional governance structure. Decentralization is the cornerstone of open source and collaborative development and is the key to its agility. Code commits should be early, often, and public.

---

#### What decision-making authority should we delegate to the community?

Most government projects are governed by a model known by its tongue-and-cheek name "benevolent dictatorship". This is not a bad thing. Almost all projects begin this way, and many major projects (including popular projects like Drupal and WordPress) remain this way today. The term simply means that ultimate decision-making authority rests in a single individual or groups of individuals, rather than by vote of the community as a whole. To be successful, this model will require significant management and delegation of development efforts around:

1. Patching, 
2. Translations, 
3. Documentation and FAQs, 
4. Issue tracking, and 
5. Support

---

#### Should we allow the community to commit to our repository? 

In the long term, individual contributors will emerge as key project stakeholders based on the quality and quantity of code contributions and involvement in day-to-day discussions. It is common to grant such contributors committer status (the ability to commit code to the project, accept pull requests, etc.). This is arguably a necessary step for the project's continued evolution.

---

#### When in the project life cycle should I make my code public?

The expectation is that those that produce the software would release the underlying code early and often in its raw form. Bugs and unpolished work are not only accepted, it's the norm. 

Think about it this way: putting out a press release with a typo (or even an unfinished press release) is embarrassing because the point of the network is to disseminate information from agency to press and erroneous or missing content hinder that end. The point of open source on the other hand is to collaborate in the creation of software. Allowing early adopters to discover bugs, review early project road maps, and suggest ways to improve the software *furthers* that end. As a result, openness, transparency and contributions and valued much more highly than refined code and polished documentation.

Put simply, the culture on this social network is not to criticize but to create.

---

## Accounts
---
#### I already have a GitHub account, do I need to create a new one for my agency?

1. Navigate to the [e-mail settings page](https://github.com/settings/emails) and add and confirm your .gov e-mail address.
2. Ensure that notifications for the organization go to your .gov account on the [notifications settings page](https://github.com/settings/notifications).
3. Create a new repository, or clone and navigate to your team's repository on your computer
4. Configure the repository to use your .gov account by issuing the command `git config user.email your@email.gov` (note, this does not have the `--global` flag as many tutorials suggest, we want the setting to stay within the repository so that commits to other repositories continue to come from your personal account)
5. Repeat step 4 with each additional repository you contribute to in your official capacity

---

#### Does each developer need an account?

Contractors and employees should use their individual accounts to commit code (rather than say an agency account), respond to support forums, etc., just as they would on any other project, or on any other social network, however to ensure records retention and that the commits come from an official source (e.g., to delineate commits in one's official capacity versus commits in one personal capacity), the account should be associated with a .gov e-mail address as [described above](#records).

It is arguably GitHub's secret sauce (making coding social as their slogan goes), provides a level of transparency and accountability, and is a long-standing norm in the open-source software community, not to mention, the fundamental software underlying the website. Almost without exception, all government agencies that have released open-source software, both on GitHub and otherwise have followed this model. 

---

#### I'm a government employee, but I don't have a GitHub account. How can I get started?

Simply register for a new GitHub account using your .gov e-mail address. Follow the normal instructions to set up Git, setting your Git e-mail address as your .gov address so that all commits are associated with your official account.

---

#### How does my agency sign up? Do we need to get our general counsel's office involved?

---

#### Should my agency be a user or an organization?

---

#### Should we include an open source license with our project?

Yes. Including a software license communicates to users what they can and can't do with the software, and more importantly, informs contributors as to what rights, if any, the waive by contributing.

---

#### Do we need to secure an agreement with contributors before accepting their code?

---

## More
---
#### What if I have a suggestion on how to improve this page?

Federal employees and members of the public are encouraged to contribute to this document...

---

#### Are there any additional resources you would recommend?

1. Producing Open Source Software – Karl Fogel (Practical)
2. The Cathedral and the Bazar – Eric S. Raymond (Theoretical)
3. Understanding Open Source and Free Software Licensing – Andrew M St. Laurent (O'Reilly)


## Edit this Page

This is how you do the edits pizza so pancake.

