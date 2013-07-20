class Varkek.Admin.Models.Card extends Backbone.Model
	# paramRoot: 'card'

class Varkek.Admin.Collections.CardsCollection extends Backbone.Collection
  model: Varkek.Admin.Models.Card
  url: '/admin/cards'