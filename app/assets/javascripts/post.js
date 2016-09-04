$('#button').on('click', function() {
  var comment = $('#youTubeUrl').val();

  return false;
});

$('#alex2').keypress(function(e){
      if(e.which == 13){
           $(this).closest('submit').submit();
       }
});
