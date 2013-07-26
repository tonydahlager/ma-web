Varkek.Admin.Views.Cards ||= {}

class Varkek.Admin.Views.Cards.Index extends Backbone.Marionette.CollectionView
	template: JST['backbone/templates/admin/cards/index']

	className: 'list'
	el: '#cards'

	# itemView: Varkek.Admin.Views.Cards.IndexCard
	getItemView: () ->
		return Varkek.Admin.Views.Cards.IndexCard
