Varkek.Admin.Views.Cards ||= {}

class Varkek.Admin.Views.Cards.IndexCard extends Backbone.Marionette.ItemView
	template: JST['backbone/templates/admin/cards/index_card']

  className: 'list-item'
  tagName: 'tr'
