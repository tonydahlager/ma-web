class Varkek.Admin.Models.Paragraph extends Backbone.Model
	paramRoot: 'paragraph'

class Varkek.Admin.Collections.ParagraphCollection extends Backbone.Collection
	model: Varkek.Admin.Models.Paragraph
	url: '/admin/cards'