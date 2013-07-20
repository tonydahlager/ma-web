Varkek.Admin.Views.Paragraphs ||= {}

class Varkek.Admin.Views.Paragraphs.Index extends Backbone.View
	template: JST['/backbone/admin/views/paragraphs/index']

	className: 'paragraphs'

	initialize: () ->
		@options.paragraphs.bind('reset', @addAll)

	addAll: () => 
		@options.paragraphs.each(@addOne)

	addOne: (model) =>
		view = new Varkek.Views.Admin.Paragraphs.Paragraph(model: model)
		$(@el).append(view.render().el)

	render: =>
		$(@el).html(@template(paragraphs: @options.paragraphs.toJSON() ))
		@addAll()

		return this
		

