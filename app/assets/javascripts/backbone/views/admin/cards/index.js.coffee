Varkek.Admin.Views.Cards ||= {}

class Varkek.Admin.Views.Cards.Index extends Backbone.View
	template: JST['backbone/templates/admin/cards/index']

	className: 'list'

	initialize: () ->
    @options.cards.bind('reset', @addAll)

	addAll: () =>
		@options.cards.each(@addOne)

	addOne: (model) =>
		view = new Varkek.Admin.Views.Cards.IndexCard({ model: model })
		$(@el).append(view.render().el)

	render: =>
		$(@el).html(@template(cards: @options.cards.toJSON() ))
		@addAll()

		return this


