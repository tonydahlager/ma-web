class Varkek.Admin.Routers.CardsRouter extends Backbone.Router
  initialize: (options) ->
    @cards = new Varkek.Admin.Collections.CardCollection()
    @cards.reset options.cards

  routes:
    "new"      : "newCard"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newCard: ->
    # @view = new Bbex.Views.Posts.NewView(collection: @posts)
    # $("#posts").html(@view.render().el)

  index: ->
    @view = new Varkek.Admin.Views.Cards.Index(cards: @cards)
    $('#cards').html(@view.render().el)

  show: (id) ->
    # post = @posts.get(id)
    # @view = new Bbex.Views.Posts.ShowView(model: post)
    # $("#posts").html(@view.render().el)

  edit: (id) ->
    # post = @posts.get(id)

    # @view = new Bbex.Views.Posts.EditView(model: post)
    # $("#posts").html(@view.render().el)
