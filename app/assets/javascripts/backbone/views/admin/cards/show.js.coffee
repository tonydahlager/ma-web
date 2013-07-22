Varkek.Admin.Views.Cards || {}

class Varkek.Admin.Views.Cards.Show extends Backbone.View
  template: JST['backbone/templates/admin/cards/show']

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
