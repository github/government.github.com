---
layout: nil
---

{% include js/vendor/bootstrap.js %}
{% include js/vendor/underscore.js %}
{% include js/vendor/backbone.js %}
window.Application = {
  Models: {},
  Collections: {},
  Views: {},
  Router: {},
  Templates: {}
};
{% include js/templates.js %}
{% include js/app.js %}

Backbone.history.start({ pushState: true, root: "{{ site.root }}" });