---
title: Story Archive
layout: page
permalink: /archive/
---

<div id="story-archive">
  <p> Testing out ideas...</p>
  <div id="story-key">
    <div class="category Open Government">Open Government</div>
    <div class="category Open Data">Open Data</div>
    <div class="category Open Source">Open Source</div>
  </div>
{% for post in site.posts limit:5 offset:0 %}
  <div class="meta">{{ post.date | date: "%B %d, %Y"}}</div>
  <h6><div class="category {{ post.category}}">{{ post.category }}</div><a href="{{ post.url }}">{{ post.title }}</a></h6>
{% endfor %}
</div>
