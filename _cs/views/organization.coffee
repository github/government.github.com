class Application.Views.Organization extends Backbone.View
  tagName: "li"
  className: "organization"
  attributes: ->
    id: @model.get 'id'

  initialize: ->
    @model.on "change", @render

  render: (foo) =>
    @$el.html Application.Templates.organization @model.toJSON()
    @