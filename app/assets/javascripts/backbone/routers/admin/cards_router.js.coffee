class Varkek.Admin.Routers.CardsRouter extends Backbone.Router
  initialize: (options) ->
    @cards = new Varkek.Admin.Collections.CardCollection()
    @cards.reset options.cards

  routes:
    "new"      : "new"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"       : "index"

  new: ->
    @view = new Varkek.Admin.Views.Cards.New(collection: @cards)
    $("#cards").html(@view.render().el)

  index: ->
    @view = new Varkek.Admin.Views.Cards.Index(cards: @cards)
    $('#cards').html(@view.render().el)

  show: (id) ->
    card = @cards.get(id)
    @view = new Varkek.Admin.Views.Cards.Show(model: card)
    $("#cards").html(@view.render().el)

  edit: (id) ->
    card = @cards.get(id)
    @view = new Varkek.Admin.Views.Cards.Edit(model: card)
    $("#cards").html(@view.render().el)
