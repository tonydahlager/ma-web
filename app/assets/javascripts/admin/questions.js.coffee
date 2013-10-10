# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  
  $('.draggable').draggable(
    start: (event, ui) -> 
      $(this).css('z-index', 1000);
  )
  
  $('.lane').droppable()
  
  $(document).on 'drop', '.lane', (event, ui) ->
    new_context = $(@).data('context')
    box = $(ui.draggable[0]).children('.attributes')
    console.log box
    object  = $(box).data('object')    
    id      = $(box).data('id')
    update_context(object, id, new_context)
  
  update_context = (object, id, context_int) ->
    topic_id    = window.location.pathname.split('/')[3]
    question_id = window.location.pathname.split('/')[5]
    
    console.log object 
    console.log id
    
    url = "/admin/topics/" + topic_id + "/questions/" + question_id + "/" + object +  "s/" + id
    
    crsf_token = $('meta[name="csrf-token"]').attr('content')
    
    data_hash = {}
    data_hash["authenticity_token"] = crsf_token
    data_hash[object] = { context: context_int }    
    
    $.ajax(
      type: 'PUT'
      url: url
      dataType: 'JSON'
      data: data_hash
    )
  
  
