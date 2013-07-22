class Varkek.Admin.Models.Card extends Backbone.Model
  paramRoot: 'card'

  defaults:
    title: ''
    description: ''


class Varkek.Admin.Collections.CardCollection extends Backbone.Collection
  model: Varkek.Admin.Models.Card
  url: '/admin/cards'
