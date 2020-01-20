$(function(){
  function appendOption(category){
    var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendOption_size(size){
    var html = `<option value="${size.name}" data-size="${size.id}">${size.name}</option>`;
    return html;
  }
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<select class="select-default js-append" id="child_category" name="category_id">
                         <option value="---" data-category="---">---</option>
                           ${insertHTML}
                         <select>`;
    $('.category-views').append(childSelectHtml);
  }
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<select class="select-default js-append" id="grandchild_category_new" name="category_id">
                              <option value="---" data-category="---">---</option>
                                ${insertHTML}
                            <select>`;
    $('.category-views').append(grandchildSelectHtml);
  }
  function appendSizeBox(insertHTML){
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div id="size_category">
                      <label>サイズ<span class="form-require">必須</span></label>
                      <div class="select-wrap">
                      <select class="select-default js-append" name="product[size]">
                        <option value=>---</option>
                          ${insertHTML}
                        <select></div></div>`;
    $('.size-group').append(sizeSelectHtml);
  }
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value;
    if (parentCategory != "---"){
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#child_category').remove();
        $('#grandchild_category_new').remove()
        $('#size_category').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#child_category').remove();
      $('#grandchild_category_new').remove()
      $('#size_category').remove();
    }
  });
  $('.category-views').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category');
    if (childId != "---"){
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchild_category_new').remove();
          $('#size_category').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchild_category_new').remove();
      $('#size_category').remove();
    }
  });
  $('.category-views').on('change', '#grandchild_category_new', function(){
    var grandchildId = $('#grandchild_category_new option:selected').data('category');
    console.log(grandchildId)
    if (grandchildId != "---"){
      $.ajax({
        url: 'get_size',
        type: 'GET',
        data: { grandchild_id: grandchildId },
        dataType: 'json'
      })
      .done(function(sizes){
        if (sizes.length != 0) {
          $('#size_category').remove();
          var insertHTML = '';
          sizes.forEach(function(size){
            insertHTML += appendOption_size(size);
          });
          appendSizeBox(insertHTML);
        }
      })
      .fail(function(){
        alert('サイズ取得に失敗しました');
      })
    }else{
      $('#size_category').remove();
    }
  });

  //edit用
  $('.category-views').on('change', '#grandchild_category_new', function(){
    var gchildId = $('#grandchild_category_new option:selected').data('category');
    $('#grand_child_result_id').attr("value", gchildId)
  });
});
