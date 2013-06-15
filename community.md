---
title: "Who's using GitHub?"
layout: default
permalink: /community/
---

<div class="page-header">
  <h1>{{ page.title }}</h1>
</div>

<p class="lead">Government agencies at the national, state, and local level use GitHub to share and collaborate. Don't see your organization's name on this list? <a href="/getting-started/">Get started today</a>.</p>

<div class="community">
{% for type_hash in site.organizations %}
  <div class="type" id="{{ type_hash[0] }}">
    <h2>{{ type_hash[0] }}</h2>
    <ul class="organizations">
    {% for org in type_hash[1] %}
      <li class="organization">
        <a href="http://github.com/{{ org }}" title="{{ org }}">
          <img class="avatar" src="https://github.com/{{ org }}.png" alt= "{{ org }}" target="_blank"/>
        </a>
      </li>
    {% endfor %}
    </ul>
  </div>
{% endfor %}
</div>

*Know a project that's not on this list but should be? This list is open source. [Help improve it](#).*