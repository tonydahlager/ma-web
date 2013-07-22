Varkek.Admin.Views.Cards ||= {}

class Varkek.Admin.Views.Cards.IndexCard extends Backbone.View
	template: JST['backbone/templates/admin/cards/index_card']

	events:
    "click .destroy" : "destroy"

  className: 'list-item'
  tagName: 'tr'

	destroy: () ->
    @model.destroy()
    this.remove()

    return false

	render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this


