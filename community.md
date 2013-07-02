---
title: "Who's using GitHub?"
layout: page
permalink: /community/
---

<p>Government agencies at the national, state, and local level use GitHub to share and collaborate. Don't see your organization's name on this list? <a href="/getting-started/">Get started today</a>.</p>

<div class="community">
{% for type_hash in site.organizations %}
  <div class="type-block"><p>{{type_hash[0]}}</p></div>
    {% for org in type_hash[1] %}
      <div class="organization">
        <a href="http://github.com/{{ org }}" title="{{ org }}">
          <img class="avatar" src="https://github.com/{{ org }}.png" alt= "{{ org }}" target="_blank"/>
        </a>
      </div>
    {% endfor %}
{% endfor %}
</div>

<!-- previous one for backup for now 
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
</div> -->

<small style="clear: both;">Know a project that's not on this list but should be? This list is open source. <a href="#">Help improve it</a>.</small>