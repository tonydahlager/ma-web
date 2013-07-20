Varkek.Admin.Views.Cards ||= {}

class Varkek.Admin.Views.Cards.Card extends Backbone.View
	template: JST['backbone/templates/admin/cards/card']

	tagName: 'tr'

	className: 'list-item'

	render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
