class Router extends Backbone.Router

  routes:
    "community/": "community"
    
  community: ->
    new Application.Views.Community().render()
    
Application.router = new Router()