class Varkek.Admin.Models.Card extends Backbone.Model
  defaults:
    title: ''


class Varkek.Admin.Collections.CardCollection extends Backbone.Collection
  model: Varkek.Admin.Models.Card
  url: '/admin/cards'
