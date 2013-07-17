---
title: Story Archive
layout: page
description: All the news that's fit to blog
permalink: /archive/
---

<div id="story-archive" class="container">
<!--   <p> Testing out ideas...</p>
  <div id="story-key">
    <div class="category Open Government">Open Government</div>
    <div class="category Open Data">Open Data</div>
    <div class="category Open Source">Open Source</div>
  </div> -->
{% for post in site.posts offset:0 %}
  <div class="meta">{{ post.date | date: "%B %d, %Y"}}</div>
  <!-- <div class="category {{ post.category}}">{{ post.category }}</div> -->
  <h6><a class="title-link" href="{{ post.url }}">{{ post.title }}</a></h6>
{% endfor %}
</div>
