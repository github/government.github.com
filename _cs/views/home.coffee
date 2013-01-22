class Application.Views.Home extends Backbone.View
  el: "#content"
  
  render: ->
    @$el.html Application.Templates.home()