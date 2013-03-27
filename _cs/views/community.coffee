class Application.Views.Community extends Backbone.View
  el: ".community"

  render: ->
    $.getJSON "{{ site.root }}organizations.json", (data) =>
      @$el.html ''
      for type, orgs of data
        Application.data[type] = new Application.Collections.Organizations(false, type: type).import orgs
    @
