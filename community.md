---
title: Who's using GitHub?
layout: support-page
description: Government agencies at the national, state, and local level use GitHub to share and collaborate. If you don't see your organization on this list, follow the instructions below to add it!
permalink: /community/
---
<div id="to-top" class="container">

<h4><input id="filter" type="text" class="" placeholder="Type to search..."> or jump to the <a href="#civic_hackers">civic hackers</a> or <a href="#research">research</a> lists.</h4></div>

{% include org-table.html orgs=site.data.governments id="governments" name="Governments" %}

{% include org-table.html orgs=site.data.civic_hackers id="civic_hackers" name="Civic Hackers" %}

{% include org-table.html orgs=site.data.research id="research" name="Government-funded Research" %}

  <div id="add-org" class="row-fluid mini-section">
    <div class="col-md-6" markdown="1">

## Add An Organization to the List

This website is [open source](https://github.com/github/government.github.com), therefore anyone in the community can submit edits through pull requests. If your agency isn't on this list, but should be, please add it:

1. Navigate to the appropriate organization list:
  * [`_data/governments.yml`](https://github.com/github/government.github.com/blob/gh-pages/_data/governments.yml) for government organizations,
  * [`_data/civic_hackers.yml`](https://github.com/github/government.github.com/blob/gh-pages/_data/civic_hackers.yml) for non-government, civic hacking organizations, or
  * [`_data/research.yml`](https://github.com/github/government.github.com/blob/gh-pages/_data/research.yml) for government-funded research organizations
2. Click the edit (pencil) icon in the top right corner.
3. Add your organization to the list in the appropriate section
4. Click "propose file change" at the bottom of the page
5. Click "create pull request"
6. Provide a brief description of what you're proposing
7. Click "Create pull request"

</div>


    <div class="col-md-6" markdown="1">

## Guidelines

While there are many many interesting government-related projects, we are limiting the list above to [GitHub organizations](https://help.github.com/articles/user-organization-and-project-pages) with projects on GitHub, who are:

* Official government institutions, listed under their country or level of government
* Non-profits or groups focused on government, listed under "Civic Hackers"
<br><br>

## Legalese

Neither the inclusion of a logo or seal above nor the fact that a particular government entity may have a presence on GitHub.com should be construed to imply that GitHub's products or services are endorsed, sponsored or recommended by the government entity, nor that they are considered by that entity to be superior to any other products or services. If you have any questions, or if would like your agency's logo removed from the list above, please [let us know](https://github.com/github/government.github.com/issues/new).

</div>
