class Router extends Backbone.Router

  routes:
    "": "home"
    
  home: ->
    new Application.Views.Home().render()
    
Application.router = new Router()