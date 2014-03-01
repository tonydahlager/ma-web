$(document).on('ready', function(){
  
  $('.panel').on('click', function(e){
    var clickedAnswerBody = $(e.target).parents('.panel').children('.collapse');
    clickedAnswerBody.toggle();
  });  
  
});
