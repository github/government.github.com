---
title: Who's using GitHub?
layout: support-page
description: Government agencies at the national, state, and local level use GitHub to share and collaborate. If you don't see your organization on this list, follow the instructions below to add it!
permalink: /community/
---
<div id="to-top" class="container">
<div class="">
  <div class="">
  <div class="search-section">
  <h3><input id="filter" type="text" class="form-control" placeholder="Type to search..."> or jump to <a href="#civichackers">Civic Hackers</a> list.</h3></div>
    <h2 id="governments">Governments</h2>
    <h6 class="govtable no-matches" style="display: none;">No matches.</h6>
      <table class="govtable table">
        <tbody class="searchable">
          <tr class="govtable table-header"><th>Avatar</th><th>Account</th><th>Affiliation</th></tr>
          {% for type_hash in site.data.governments %}
          <tr class="type-block" id="{{ type_hash[0] | downcase | replace: ' ','_' }}">
            {% assign count=type_hash[1] | size %}
            <td><h3>{{ type_hash[0] }} <span class="count">— {{ count}} org{% unless count == 1 %}s{% endunless %}</span></h3></td><td></td><td></td>
          </tr>
          {% for org in type_hash[1] %}
          <tr>
            <td>
              <a href="https://github.com/{{ org }}" title="{{ org }}">
              <img src="https://github.com/{{ org }}.png" width="40" height="40" alt="{{ org }}"></a>
            </td>
            <td>
              <p><a href="https://github.com/{{ org }}" title="{{ org }}">{{ org }}</a></p>
            </td>
            <td>
              <p class="dim-affiliation">{{ type_hash[0] }}</p>
            </td>
          </tr>
        {% endfor %}
        {% endfor %}
      </tbody>
    </table>
  </div>
</div>

<div class="">
  <div class="mini-section">
    <h3 id="civichackers" class="search-section">Return to <a href="#to-top">top</a>.</h3>
    <h2>Civic Hackers</h2>
    <h6 class="civictable no-matches" style="display: none;">No matches.</h6>
    <table class="civictable table">
      <tbody class="searchable">
        <tr class="civictable table-header"><th>Avatar</th><th>Account</th><th>Affiliation</th></tr>
        {% for type_hash in site.data.civic_hackers %}
        {% unless type_hash[0] == "Civic Hackers" %}
        {% endunless %}
        <tr class="type-block" id="{{ type_hash[0] | downcase | replace: ' ','_' }}">
          <td><h3>{{ type_hash[0] }} ({{ type_hash[1] | size }})</h3></td><td></td><td></td>
          </tr>
          {% for org in type_hash[1] %}
          <tr>
            <td>
              <a href="https://github.com/{{ org }}" title="{{ org }}">
              <img src="https://github.com/{{ org }}.png" width="40" height="40" alt="{{ org }}"></a>
            </td>
            <td>
              <p><a href="https://github.com/{{ org }}" title="{{ org }}">{{ org }}</a></p>
            </td>
            <td>
              <p class="dim-affiliation">{{ type_hash[0] }}</p>
            </td>
          </tr>
          {% endfor %}
        {% endfor %}
      </tbody>
    </table>
  </div>
</div>


  <div id="add-org" class="row-fluid mini-section">
    <div class="span6" markdown="1">

## Add An Organization to the List

This website is [open source](https://github.com/github/government.github.com), therefore anyone in the community can submit edits through pull requests. If your agency isn't on this list, but should be, please add it:

1. Log in to [GitHub](https://github.com){:target="_blank"}.
2. Go to [this repository](https://github.com/github/government.github.com) and fork it (button to the top right of the page).
3. In your forked version, click the branch dropdown and in the "Find or create a branch..." field, create a new branch (for example, "adding myagencyname").
4. Still in your forked version, click on the `_data/governments.yml` file or `_data/civic_hackers.yml` depending on where your organization fits.
5. At the top of the file is a list of the organizations populating this page. Click edit, near the top right, and then add your organization's GitHub account name just like the others: `- GroupGithubOrg`.
6. Click Commit Changes at the bottom of the page.
7. Visit the [original repository](https://github.com/github/government.github.com) and select Compare & pull request.
8. Fill out the form and click Send pull request!



</div>


    <div class="span6" markdown="1">

## Guidelines

While there are many many interesting government-related projects, we are limiting the list above to [GitHub organizations](https://help.github.com/articles/user-organization-and-project-pages) with projects on GitHub, who are:

* Official government institutions, listed under their country or level of government
* Non-profits or groups focused on government, listed under "Civic Hackers"
<br><br>

## Legalese

Neither the inclusion of a logo or seal above nor the fact that a particular government entity may have a presence on GitHub.com should be construed to imply that GitHub's products or services are endorsed, sponsored or recommended by the government entity, nor that they are considered by that entity to be superior to any other products or services. If you have any questions, or if would like your agency's logo removed from the list above, please [let us know](https://github.com/github/government.github.com/issues/new){: data-proofer-ignore="true"}.

</div>
