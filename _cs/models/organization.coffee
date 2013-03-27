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