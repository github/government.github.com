#models
class Application.Models.Organization extends Backbone.Model
  url: ->
    "https://api.github.com/orgs/" + @id + "?client_id={{site.client_id}}&client_secret={{site.client_secret}}"

  initialize: ->
    @view = new Application.Views.Organization model: @
    @on "change:public_repos", @collection.renderMeta  

class Application.Collections.Organizations extends Backbone.Collection
  model: Application.Models.Organization

  initialize: (models, options) ->
    @view = new Application.Views.Organizations( id: options.type).render()
    @on "add", (model) ->
      @view.$('.organizations').append model.view.el
      model.fetch()

  import: (orgs) ->
    for id in orgs
      @add { id: id }
    @

  public_repos: ->
    _.reduce @pluck("public_repos"), (memo, num) -> 
      return 0 unless num?
      memo + num
    , 0

  renderMeta: =>
    @view.$('.meta .count').html @length
    @view.$('.meta .public_repos').html @public_repos()

# Views
class Application.Views.Community extends Backbone.View
  el: ".community"

  render: ->
    $.getJSON "{{ site.root }}organizations.json", (data) =>
      @$el.html ''
      for type, orgs of data
        Application.data[type] = new Application.Collections.Organizations(false, type: type).import orgs
    @

class Application.Views.Organization extends Backbone.View
  tagName: "li"
  className: "organization"
  attributes: ->
    id: @model.get 'id'

  initialize: ->
    @model.on "change", @render

  render: (foo) =>
    compiled = _.template $("#organization").html()
    @$el.html compiled @model.toJSON()
    @

class Application.Views.Organizations extends Backbone.View
  className: "type"
  attributes: ->
    id: @id

  humanize: ->
    @id.replace(/_/g, ' ').replace /(\w+)/g, (match) ->
      match.charAt(0).toUpperCase() + match.slice(1)

  render: =>
    compiled = _.template $("#organizations").html()
    @$el.html compiled id: @id, name: @humanize()
    @

  initialize: ->
    $('.community').append @$el

jQuery(document).ready ($) ->
  Application.instance = new Application.Views.Community()
  Application.instance.render()