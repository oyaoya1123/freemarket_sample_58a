$(function(){
  $('#select2 select[name="delivery"]').change(function() {
    
    if ($('select[name="delivery"] option:selected').val() == '1' || '2') $('#method').css('display','table-row');
    else $('#method').css('display','none');
  });
  
});