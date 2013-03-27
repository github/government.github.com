class Application.Views.Organizations extends Backbone.View
  className: "type"
  attributes: ->
    id: @id

  humanize: ->
    @id.replace(/_/g, ' ').replace /(\w+)/g, (match) ->
      match.charAt(0).toUpperCase() + match.slice(1)

  render: =>
    @$el.html Application.Templates.organizations id: @id, name: @humanize()
    @

  initialize: ->
    $('.community').append @$el