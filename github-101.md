---
title: GitHub 101
layout: page
permalink: /github-101/
---

<div class="alert">Note: This copy is adapted from <a href="http://ben.balter.com/open-source-for-government">Open Source For Government</a>, and is intended to be heavily adapted before use.</div>

### Contents

* Table of Contents
{:toc}
 
## Open Source Generally

### What is Open Source

[Open source software](http://en.wikipedia.org/wiki/Open_source) is a collaborative model of software development whereby the human-readable source code used to produce a given piece of software is made freely available for others to adapt or improve upon as they see fit. Most often (although not always) such development efforts occur publicly, and may involve many disparate groups of developers contributing to the project (rather than a single software firm or a single agency).

Open source software (sometimes known as free, open source software or FOSS) represents a forward-thinking political philosophy, not an alternate software development workflow or business model. In this context, the word "free" refers to free as in speech, not "free" as in beer. In fact, there's no reason you can't sell open source software, or even make a living producing it. Many large, private sector firms (Facebook, Twitter, Microsoft, Google to name a few) are actually extremely influential members of the open source community.

### Why Open Source

#### Adopting an Open Source Project

There are [lots of arguments](http://www.dwheeler.com/oss_fs_why.html) in favor of adopting an existing open source project over its proprietary counterparts. A few of the biggest ones:

* Lower cost - No costly licensing, no vendor lock in
* Nimble - Often better at remaining responsive to emerging trends
* Open - Open standards encourage interoperability. You own your own data; no proprietary formats
* Fast fixes - The distributed model enables rapid detection and patching of bugs
* Customizable - You own the code. Make it do what you want

#### Starting an Open Source Project

In addition to the efficiencies inherent with a collaborative model (independent code review, communal feature development), empirically, [open source produces better, more reliable software](http://www.coverity.com/library/pdf/coverity-scan-2011-open-source-integrity-report.pdf). Think about it logically. When you (or your organization) is the only person that's ever going to see something, you're a lot more likely to "just make it work." After all, who would ever know?

But the same logic that applies to sweeping literal dirt under the rug doesn't apply to writing code. Whereas a rug will always serve to cover the floor, applications evolve over time and code is often constantly reused and repurposed as customers' needs change. Simply put, it's impossible to predict today where your code is going to be a year from now and it's in your best interest to plan accordingly.

[Open source hedges this risk](http://ben.balter.com/2012/06/26/why-you-should-always-write-software-as-open-source/) by distinguishing generic logic (say posting content online) from application-specific customization (say the use-case-specific presentation of that content). Yet when you're writing with the intention of producing proprietary or one-off code, you do everything in one pass. The true challenge arises when the same problem emerges again in another department, another business unit, or more generally in an even slightly different context. You're reinventing the wheel. You're "open sourcing" (even if within your organization).

Imagine you building a house and the contractor literally nails down all your furniture at the onset, saying you could always remove it before you sell. You'd almost certainly hire a new contractor. Even if you're never going to sell the house, you may want to get a new couch, or at the very least change a room's layout somewhere down the line. Yet software developers do it all the time. 

Distinguishing unrelated components encourages several coding best practices. In addition to introducing a modular design, meaning additional components could easily be added (or existing components removed) down the line, abstraction often yields objectively more stable and more readably maintainable code due to the abhorrence of the copy-and-paste effect. Justice Brandeis is famous for noting that "sunlight is the best disinfectant." Likewise, the transparency afforded by the open-source ethos produces more reliable software.

### Why Open Source and Government

Why not? Think about why we have proprietary software. Google doesn't share the code powering its search algorithm for fear that a competitor could benefit. That's their secret sauce. It'd be like Coca Cola sharing its secret formula. But outside certain military contexts, with public code, there's no competitor. In fact, quite the opposite's the case. If agency X writes a better way to store and publish content, and agency Y adopts it, that's a good thing for both the agencies and for the American people. It creates an efficiency across government that would not otherwise exist. Put another way, we're all on the same team here.

But open source isn't just sharing code among agencies. Imagine if agency X's content organizing code is posted online and a non-profit uses it to launch a new initiative, or a startup uses it to launch a new venture. Again, the agency is not in competition with the innovation and we all benefit.

Last, in that same example, let's say as that startup is adopting Agency X's code for their own use, they discover a bug, or a great new feature and contribute it back. Agency X, Agency Y, a startup and a non-profit are now all better off than if Agency X had not released the code.

More broadly, publicly funded code, is well, the public's code. It'd be like building a highway, but saying only firetrucks and police cars can use it, even though that's only a fraction of its potential. We see this most analogously with research grants in the scientific, academic, and medical communities, and the requirement to publish scholarly works and research findings that result from public funding.

### What Agencies Participate in Open Source?

[A lot](http://gsa.github.com/federal-open-source-repos/).

## Open Source Community Building

Open source is referred to as a community, because that's what it is. Open source isn't a source of free labor or an avenue to sporadically garner goodwill from Silicon Valley, nor is the release of open source software tantamount to the release of a press release or policy document. Open source is about fostering a space in which like-minded enthusiasts — coders, designers, user experience experts, even the users themselves — can come together and create something for their mutual benefit, a something that is almost without exception, greater than the sum of the individual parts. As such, when beginning an open source project, special steps must be taken to encourage community involvement.

### Encouraging Community Involvement

Simply [making the code public is not enough](http://ben.balter.com/2012/04/10/whats-missing-from-cfpbs-awesome-new-source-code-policy/). Open source developers want to get behind a cause. Think of it as analogous to volunteering for a political campaign. They want to know what the project stands for, and where it is going. If they contribute, what will their code be used for in a six months or a year?  As a result, open source project documentation (readme) commonly includes four primary pieces of information: 

1. A project mission statement, philosophy, or goal,
2. A features and requirements list, or long-term project roadmap, and most importantly 
3. The status of the project (active development, beta, etc.)
4. How to submit an issue/feature request or contribute a fix/enhancement

For help getting started, including other common sections, please see the [example readme](example-readme/).

### Mechanics

Creating an open-source project requires the project finder to stand up several pieces of critical infrastructure. It's not enough to simply make the code available, for example, as a zip file. Steps must be taken to ensure transparency and conversational, rather than announcement-driven communications. The goal here should be to make it as easy as possible for developers to find the project, grab the code, use it, and potentially contribute back. Most commonly, this infrastructure consists of:

1. Version control, 
2. Bug tracking ("issues" in GitHub parlance),
3. Packaging for downloading, and
4. Documentation hosting (in GitHub's case, a wiki).

### Communications

Beyond the obvious initial announcement publicizing the release, there are several forms of ongoing communication that may require a bit of planning prior to release. Most successful, large-scale projects have a two-way (note: not announcement only) mailing list, to facilitate interaction among developers, as well as an official IRC channel or other real-time chat forum. Alternatively, many projects use the open-source collaboration tool [P2](http://p2theme.com) to coordinate development efforts. The goal here is to provide a means by which developers can communicate with one another (rather than with the agency); to make a web rather than a hub and spoke. If two like-minded developers would like to contribute to a project, they shouldn't have to go through an intermediary (e.g. the agency) to do so.

### Have the discussion in public

No matter how trivial the issue, make the discussion open. Even if issues are hashed out in-person, memorialize the conversation on the project's official communications channels. This does a few things: First, it creates a record of the decision, so that down the road, you (or more likely other contributors) can understand your reasoning. Second, it helps break down the us/them mentality, by showing the community respect and broadening the decision-making process. Last, and most helpful, engaging the community has the potential to generate more discourse, and thus more ideas and better decision.

### Upkeep

Beyond the code itself, best practices dictate that maintaining an open-source project requires significant day-to-day upkeep and may entail both policy and technical decisions. Agencies should empower a team of trusted developers with decision-making authority to: 

1. Individually respond to any issues opened by users ("tickets"),
2. Accept or reject [pull requests](#pull_requests) on behalf of the project, and 
3. Coordinate future releases. 

The key here, however, is not to institute a traditional governance structure. Informality is the cornerstone of open source and collaborative development and is the key to its agility. Code commits should be early, often, and public (as apposed to say, committing privately and "open sourcing" once a week). If such a policy were to be overlaid, most if not all the benefits of open source outlined above would be offset by the added overhead.

*See also, [GitHub as a Social Network](#culture).*

### Governance

Most government projects are governed by a model known by its tongue-and-cheek name "benevolent dictatorship" (as opposed to democratic consensus building). This is not a bad thing. Almost all projects begin this way, and many major projects (including popular projects like Drupal and WordPress) remain this way today. 

The term simply means that ultimate decision-making authority rests in a single individual or groups of individuals, rather than by vote of the community as a whole. To be successful, this model will require significant management and delegation of development efforts around:

1. Patching, 
2. Translations, 
3. Documentation and FAQs, 
4. Issue tracking, and 
5. Support

### Delegation

The benevolent dictatorship model is arguably the norm for open-source software development, but it must be noted that organization and delegation of such efforts fall squarely on the agency's shoulders. You would be hard-pressed to find a successful open source project that does not have at least one full-time developer or community organizer.

### Committer Status

In the long term, individual contributors will emerge as key project stakeholders based on the quality and quantity of code contributions and involvement in day-to-day discussions. It is common to grant such contributors committer status (the ability to commit code to the project, accept pull requests, etc.). This is arguably a necessary step for the project's continued evolution.

## Github

### GitHub Generally

[GitHub](http://github.com) is a social code sharing service that allows teams to collaborate among themselves or with the general public and has quickly become the go-to social network for the open source community, much like Facebook is the primary social network among friends and classmates. Code is grouped by organizations, which consist of teams, which own repositories. Repositories can be either [private](#private_repositories) or [public](#public_repositories) (open source). 

GitHub is based on, and extends the social functionality, of an open-source [distributed version control system](http://en.wikipedia.org/wiki/Revision_control) known as [Git](http://en.wikipedia.org/wiki/Git_(software)). In essence, Git keeps a running log of all changes to a software project. Each time you make a change, you describe that change (a commit message) and then push that change to GitHub. GitHub also allows members of the public to "[fork](#forks)" existing projects, improve upon them, and then submit their changes back upstream as a "[pull request](#pull_requests)."

GitHub offers free public repositories for open source projects as well as subscription-based private repositories for closed projects. Agencies should create an organization account with GitHub, which can include an unlimited number of individual developer accounts. See [Records](#Records) below for more information.

*Additional Reading: [Introduction to Git and GitHub](https://help.github.com/), [Setting up Git](https://help.github.com/articles/set-up-git)*

### Culture

Each social network has a different culture, and espouses different values from its users. While posting pictures of a family vacation may be commonplace on Facebook, the same cannot be said for Twitter or Pinterest. Likewise, while providing customer service and interacting directly with customers via Twitter is an every day occurrence, if a major corporation were to try and friend me on Facebook, I'd be a little confused.

GitHub is no different. GitHub is about sharing, but instead of sharing photos or feedback you share code. Notice the word we use here is code, not software. The expectation is not that anyone can go and get a polished piece of software as you might from a big-box retailer. Instead, the expectation is that those that produce the software would release the underlying code early and often in its raw form. Bugs and unpolished work are not only accepted, it's the norm. 

Think about it this way: putting out a press release with a typo (or even an unfinished press release) is embarrassing because the point of the network is to disseminate information from agency to press and erroneous or missing content hinder that end. The point of open source on the other hand is to collaborate in the creation of software. Allowing early adopters to discover bugs, review early project roadmaps, and suggest ways to improve the software *furthers* that end. As a result, openness, transparence and contributions and valued much more highly than refined code and polished documentation.

Put simply, the culture on this social network is not to criticize but to create, and it has [mechanisms to enforce such social norms](https://github.com/WhiteHouse/petition/issues/2).

### Public Repositories

Public repositories are the default on GitHub. Public repositories are free and are freely accessible (to read but not edit) for anyone on the internet. Public repositories are cheap (literally). Do not be afraid to use them to save and store early R&D efforts, thought experiments, or even side projects.

Whereas on a government website it may be strange to have extraneous pages with content that has not be recently updated, public repos are treated differently. They often serve as the conical archive for other efforts, and at the very least, are used to showcase development efforts and creative thinking, no matter how small. As a result, a large presumption **in favor** of creating public repositories and a large presumption **against** deleting or renaming exists.

### Private Repositories

Private repositories allow you to create proprietary / closed source software. This could be used in two ways. First, it can be used simply to facilitate in the collaboration of internal tools or other projects that don't really make sense to open source due to their specific nature. Second, it can be used as a staging environment to prepare open source projects for release one they reach a minimum viable product.

Private repos are created on a [free-based pay structure](https://github.com/plans).

### Public Footprint

GitHub provides a handful of tools to organize projects (internally) and engage with the public. Each repository has:

1. A public facing page (powered by the projects readmd.md), 
2. A bug tracker (issues), and 
3. A wiki.

GitHub can also be used to host blogs and micro sites using the built in Jekyll engine (and their GitHub pages feature). [More Info](http://pages.github.com/)

### Social Coding

Two things that makes GitHub a bit different from many other code sharing services are the concepts of the fork and pull request. 

#### Forking

A fork is an alternate or parallel copy of a piece of software. Forks are created from public repositories from often unaffiliated developers. A GitHub user may fork a repository because they simply want a snapshot of the code as a simply bookmark, or more commonly, fork the repository in hopes of improving upon it. Even a user does not have permission to write to an agencies repository (e.g., a member of the public), they can always fork the repository, and make the desired changes in their fork without affecting the original.

#### Pull Requests

Pull requests allow other, unaffiliated developers to submit their improvements for consideration by the original project. The project administrators are publicly presented with the changes, along with a forum to discuss them, and can then either choose to accept or reject the proposed improvements. In most cases, once accepted, the changes are automatically merged and the contributor is given credit in the commit log.

It is [perfectly acceptable](http://ben.balter.com/2012/04/15/cfpb-accepts-first-citizen-submitted-pull-request-on-behalf-of-federal-government/) (and even encouraged) for the government to accept pull requests from the public.

### Records

When it comes to records, the good news about GitHub (and git), is that its chief purpose is to keep track of who made changes to what file when. In order to conform with the necessary records requirements, you must associate your commits with your .gov e-mail address so that notifications are properly captured by your agency's records management system. You can do this two ways:

#### If you don't yet have a GitHub account

Simply register for a new GitHub account using your .gov e-mail address. Follow the normal instructions to set up Git, setting your Git e-mail address as your .gov address so that all commits are associated with your official account.

#### If you already have a GitHub account

1. Navigate to the [e-mail settings page](https://github.com/settings/emails) and add and confirm your .gov e-mail address.
2. Ensure that notifications for the organization go to your .gov account on the [notifications settings page](https://github.com/settings/notifications).
3. Create a new repository, or clone and navigate to your team's repository on your computer
4. Configure the repository to use your .gov account by issuing the command `git config user.email your@email.gov` (note, this does not have the `--global` flag as many tutorials suggest, we want the setting to stay within the repository so that commits to other repositories continue to come from your personal account)
5. Repeat step 4 with each additional repository you contribute to in your official capacity

You can safely use your existing GitHub account and public key, as long as commits are associate with and notifications go to your official e-mail.

Some agency records retention office may also require more detailed records retention plans. Additional methods of ensuring no history is lost may be to use project activity RSS feeds, post-commit hooks to e-mail, or by hooking into the API directly. You can even use the Git repository itself as the formal record. Since the version control is fully distributed, it will contain a copy of each commit. It will not, however, contain GitHub social activity like comments or issues.

### Terms of Service

There is an existing gov-friendly terms of service ("TOS") which GitHub has already reviewed and signed with the White House, the General Services Administration, the Federal Communications Commission, and the Consumer Financial Protection Bureau among others. Before using the service you should double check with your agency's general counsel's office.

### Accounts

Create an organization. The organization can have an unlimited number of public projects associated with it, and an unlimited number of both public and undisclosed members with various levels of permissions. 

Contractors and employees should use their individual accounts to commit code (rather than say an agency account), respond to support forums, etc., just as they would on any other project, or on any other social network, however to ensure records retention and that the commits come from an official source (e.g., to delineate commits in one's official capacity versus commits in one personal capacity), the account should be associated with a .gov e-mail address as [described above](#records).

It is arguably GitHub's secret sauce (making coding social as their slogan goes), provides a level of transparency and accountability, and is a long-standing norm in the open-source software community, not to mention, the fundamental software underlying the website. Almost without exception, all government agencies that have released open-source software, both on GitHub and otherwise have followed this model. 

## Licensing

### Licensing Generally

Licensing concerns itself with two things. (1) Who "owns" the code, and (2) who has the right to use it. When a coder develops code (or a painter paints, or a writer writes) he "owns" the code. Put another way, he holds the code's copyright, or is the code's copyright holder. If the coder would like to let others use his code, he would grant them a "license" to do so. Such a license would confer limited rights or guarantees (e.g., the right to use). This license is generally provided in writing along with the software.

Think about it like renting an apartment. The landlord owns the property, but via your lease, confers upon you certain rights (e.g., the right to live there), but also reserves certain rights (e.g., the right to tear down a wall). Software licensing is no different. The copyright holder holds all rights to the software, and can license out some or all of those rights as he sees fit.

### Copyright

In most open source projects (although not all), copyright is held by the individual code contributors. So, for example, while the Microsoft corporation may own the right to Microsoft Windows (and thus upon purchasing it, you receive a license for its use), the rights to the open-source content management system, on the other hand, are held by thousands of individual contributors scattered around the world who echo individually license to you the right to use the software free of charge. License and copyright, although related are wholly distinct.

### Types of Licenses

Although technically one could create their own license, the open source community has generally adopted a handful of standard licenses. These license are well known and well understood, and make using or contributing to the software easier.

Most licenses do three things. (1) Describe what rights the copyright holder is granting to you, (2) Disclaim that you cant sue the copyright holder if something goes wrong, (3) Require you to include the text of the license if you redistribute it to others.

#### MIT, BSD, Apache

Some licenses, such as the MIT, BSD, or the Apache license simply serve primarily to clarify that the software's recipient is getting virtually unlimited rights to the software, so long as they include the text of the license if they redistribute it or make a derivative work. Such licenses do not heavily restrict use of the software. For example, here's the text of the MIT license:

> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

It is important to note that such licenses do not restrict the commercialization of software. If I produce module "foo" and release it under the MIT license, there is nothing stopping another from including that module in software "bar" and selling it under a proprietary (e.g. closed source) license.

#### GPL (Copyleft)

Another large class of licenses are called "Copyleft" licenses. They seek to use copyright law to ensure that source code remains in the public domain by requiring that derivative works of a copyleft licensed project be released under the same (or compatible) conditions.

Releasing the project under GPL is done simply by:

1. Including the text of the license within the repository,
2. Posting a boilerplate statement at the top of the main file that notes the licenses and releases subsequent distributors from liability, and 
3. Noting the license within the project's documentation.

##### Derivative Works

Any derivative work of a copyleft licensed projects must be released under the same or similar terms. Some popular copyleft licensed projects are WordPress and Drupal, two popular content management systems, both of which are licensed under the GPL.

A derivative work is a legal term of art, but in layman's terms, is any work that requires the former to function. So, in the above example a Drupal or Wordpress theme, plugin or module, which theoretically could not stand alone from the original, would be considered a derivative work if it uses the CMS's API. A stand alone CMS inspired by, but completely unrelated to (say written in a different language), however, would most likely not be considered derivative and could be licensed under any license.

The term derivative work also applies, more traditionally to forks and improvements upon the original codebase for which the above logic still applies. If I take the WordPress core files, change one line, and then distribute it, I am still bound by the terms of the GPL.

##### Distribution Requirement

Note however, the terms of the GPL don't kick into affect until the software is *distributed*. In that sense, an agency can take a GPL'd piece of software (say Drupal), expand upon it (e.g., by writing a module to produce custom functionality), and are not required to distribute it (e.g., the module may remain closed source).

Once the module is distributed however (e.g., posted online, shared with others outside the organization), the GPL requirements kick in and it must be licensed under the term so of the GPL.

### Dual Licensing

Some projects may be dual licensed. This is most often the case when something is offered to the public under the terms of both the GPL **and** and another license such as MIT. In this sense, most developers would chose the less restrictive MIT flavor for their project. However, if I have an existing GPL'd project and am looking to include the software, having the option to use the project under the GPL is attractive and simplifies under what terms I provide my software to others. It also resolves potential incompatibility between your license and the GPL.

To dual license software, simply note in the project's readme that the file is available under both licenses. No additional steps are necessary. When downstream developers use the software, they will chose what license they use it under (again, without taking any additional steps). This is most often the case with add-on frameworks such as jQuery which are likely to be incorporated in existing projects down stream.

### Government-Specific Considerations

There is [a strong presumption](http://ben.balter.com/2012/07/26/government-release-of-source-code-public-domain-or-open-source/) toward open source in government-produced software.

Under 17 U.S.C. § 105, any code created by a government employee on government time is not subject to domestic copyright protection (essentially public domain) and would be licensed as a US Government Work. 

If a project is a derivative work of virally licensed code (e.g., the GPL, the most common open source license), it must be licensed under the same terms as the upstream project (e.g., a WordPress plugin or using a code snippet that was posted under the GPL) and the question of licensing is simple.

If a project does not use any previously licensed code, things can get a bit tricky, especially if you get a pull request from the public (e.g., do contributors surrender the rights to their work by contributing?). It is important to specify the means and terms under which the public can contribute to encourage collaboration. If possible, I would recommend including even a single line of GPL licensed code to simplify things, but you are free to require contributions be licensed under any license, including public domain (although I wouldn't recommend it). Sample language for a GPL'd project below:

[Example Licenses](licenses/)

#### Contractor-created code

Absent permission from the contracting officer, the US Government retains unlimited rights for all work created under contract. FAR 52.227-14(c)(1)(i). Even if the contracting officer grants such rights, they do not take effect unless the contractor includes a copyright notice, acknowledgement of government sponsorship, and the contract number along with the code at the time of delivery. See FAR 27.404(a)(5).

#### Government-created code

If a government employee contributes to a project on government time and within the scope of his employment, such code is considered a US Government Work. US Government Works are not entitled to copyright protection under US copyright law (commonly known as falling within the "Public Domain") but may receive copyright protection abroad, and thus should still be licensed accordingly. See 17 USC § 105. 

Additionally, if a derivative work under a viral license, the government is still bound by the terms of the original license, thus the project as a whole would be licensed under the original license. Put another way, if a government agency is granted limited rights by a copyright holder to use or redistribute a piece of software under the condition that any contributions to the software be redistributed under the same terms, the government does not have the right to release the software under a less restrictive or incompatable license.[^1]

#### Community-contributed Code

Generally speaking, the government may not accept volunteer services (such as software development) absent appropriate compensation for fear of running afoul of gift restrictions or the Administrative Procedures Act. *See generally* 31 U.S.C. § 1342. This has stymied public code contributions in the past. To mitigate this concern, project documentation should unambiguously declare the license under which the project is distributed (e.g, GPL, MIT) and that any code publicly posted in association with the project (e.g., pull requests, code comments) must be licensed under the same terms (not uncommon in normal open source projects as "terms of contribution"). 

Under such a model, the individual contributor will retain the copyright, and the publicly distributed code becomes legally indistinguishable from other publicly distributed code already used regularly by the government under the same type of open-source license (e.g., Drupal, WordPress, Apache), thus giving us legal authority to accept pull requests and other citizen-generated code.

## Procurement

\[ This is a place holder. Please [feel free to contribute](how-to-contribute/). \]

For now, see [Frequently Asked Questions regarding Open Source Software (OSS) and the Department of Defense (DoD)](http://dodcio.defense.gov/OpenSourceSoftwareFAQ.aspx)

## Contributing to this document

Federal employees and members of the public are encouraged to contribute to the project. Please see [how to contribute](how-to-contribute/) for more information.

## Additional Resources

1. Producing Open Source Software – Karl Fogel (Practical)
2. The Cathedral and the Bazar – Eric S. Raymond (Theoretical)
3. Understanding Open Source and Free Software Licensing – Andrew M St. Laurent (O'Reilly)
4. [How to Contribute](how-to-contribute/)
5. [Example Readme](example-readme/)
6. [Licenses](licenses/)
7. [Civic Commons Open Source Guidelines](http://wiki.civiccommons.org/Open_Source_Development_Guidelines)
8. [EPA GitHub HowTo](http://www2.epa.gov/webguide/github-guidance)

<div style="text-align: center" markdown="1">

[![Creative Commons License](http://i.creativecommons.org/l/by-sa/3.0/88x31.png)](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)

&copy; 2012 [Benjamin J. Balter](http://ben.balter.com)

Licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/deed.en_US)

</div>

[^1]: Theoretically, even though the government's contributed code, as a whole, would be bound by the copyleft license, individual blocks of code entirely independent from the parent work, may be removed by the public and used in another project free of restriction. This is an edge case and would only arise in the event of conflict.