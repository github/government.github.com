---
title: Who's using GitHub?
layout: support-page
description: Government agencies at the national, state, and local level use GitHub to share and collaborate. If you don't see your organization on this list, follow the instructions below to add it!
permalink: /community/
---
<div class="container">
  <div class="row">
    <div class="span8" id="org-avatars">
    <div><a href="#" id="view-list">View List</a></div>
    {% for type_hash in site.data.organizations %}
    <div class="type-block" id="{{ type_hash[0] | downcase | replace: ' ','_' }}"><p>{{ type_hash[0] }}</p></div>
      {% for org in type_hash[1] %}
        <div class="organization">
          <a href="https://github.com/{{ org }}" title="{{ org }}">
            <img class="avatar" src="https://github.com/{{ org }}.png" width="80" height="80" alt="{{ org }}">
          </a>
        </div>
      {% endfor %}
    {% endfor %}
    </div>
    <div class="span8" id="org-list" style="display: none;">
    <div><a href="#" id="view-avatar">View Avatars</a></div>
    {% for type_hash in site.data.organizations %}
      <div id="{{ type_hash[0] | downcase | replace:" ","_" }}">
        <h2>
          {{ type_hash[0] }}
       </h2>
      </div>
      <ul>
      {% for org in type_hash[1] %}
        <li>
          <a href="http://github.com/{{ org }}" title="{{ org }}">
            <img class="avatar img-polaroid" src="https://github.com/{{ org }}.png" alt= "{{ org }}" target="_blank"/>
          </a>
          <h3>
            <a href="http://github.com/{{ org }}" title="{{ org }}">{{ org }}</a>
          </h3>
        </li>
      {% endfor %}
     </ul>
    {% endfor %}
    </div>

  </div>

  <div class="row section">
    <div class="span6" markdown="1">

## Add An Organization to the List

This website is [open source](https://github.com/github/government.github.com), therefore anyone in the community can submit edits through pull requests. If your agency isn't on this list, but should be, please add it:

* Log in to [GitHub](https://github.com){:target="_blank"}.
* Go to [this repository](https://github.com/github/government.github.com) and fork it (button to the top right of the page).
* In your forked version, click the branch dropdown and in the "Find or create a branch..." field, create a new branch (for example, "adding myagencyname").
* Still in your forked version, click on the `_data/organizations.yml` file.
* At the top of the file is a list of the organizations populating this page. Click edit, near the top right, and then add your organization's GitHub account name just like the others: `- myagencysname`.
* Click Commit Changes at the bottom of the page.
* Visit the [original repository](https://github.com/github/government.github.com) and select Compare & pull request.
* Fill out the form and click Send pull request!

### Guidelines

While there are many many interesting government-related projects, we are limiting the list above to [GitHub organizations](https://help.github.com/articles/user-organization-and-project-pages) with projects on GitHub, who are:

* Official government institutions, listed under their country or level of government
* Non-profits or groups focused on government, listed under "Civic Hackers"

</div>
</div>

  <div class="row section">
    <div class="span6 fine-print">
      <small markdown="1">
Neither the inclusion of a logo or seal above nor the fact that a particular government entity may have a presence on GitHub.com should be construed to imply that GitHub's products or services are endorsed, sponsored or recommended by the government entity, nor that they are considered by that entity to be superior to any other products or services. If you have any questions, or if would like your agency's logo removed from the list above, please [let us know](https://github.com/github/government.github.com/issues/new){: data-proofer-ignore="true"}.
      </small>
    </div>
  </div>
</div>

<script type="text/javascript">
  var viewListLnk = document.getElementById("view-list");
  var viewAvatarLnk = document.getElementById("view-avatar"); 
  var orgList = document.getElementById("org-list");
  var orgAvatar = document.getElementById("org-avatars");
 
  viewListLnk.onclick = function() {
    orgAvatar.style.display = 'none'; 
    orgList.style.display = 'block'; 
  }

  viewAvatarLnk.onclick = function() {
    orgAvatar.style.display = 'block';
    orgList.style.display = 'none';
  }
</script>
