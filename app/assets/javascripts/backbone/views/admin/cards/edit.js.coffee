Varkek.Admin.Views.Cards ||= {}

class Varkek.Admin.Views.Cards.Edit extends Backbone.View
  template: JST['backbone/templates/admin/cards/edit']

  events :
    "submit #edit-card" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (card) =>
        @model = card
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))
    this.$("form").backboneLink(@model)
    return this
