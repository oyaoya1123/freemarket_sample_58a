$(function() {
  $('#button_next').on('click', function() {
    num = $(".through").size();
    console.log(num);
    switch (num) {
      case 0:
        $('li').eq(0).removeClass('active');
        $('li').eq(0).addClass('through');
        $('li').eq(1).addClass('active');
        break;
      case 1:
        $('li').eq(1).removeClass('active');
        $('li').eq(0).addClass('through');
        $('li').eq(1).addClass('through');
        $('li').eq(2).addClass('active');
        break;
      case 2:
        $('li').eq(2).removeClass('active');
        $('li').eq(0).addClass('through');
        $('li').eq(1).addClass('through');
        $('li').eq(2).addClass('through');
        $('li').eq(3).addClass('active');
        break;
      case 3:
        $('li').eq(3).removeClass('active');
        $('li').eq(0).addClass('through');
        $('li').eq(1).addClass('through');
        $('li').eq(2).addClass('through');
        $('li').eq(3).addClass('through');
        $('li').eq(4).addClass('active');
        break;
    }
  });
  $('#button_prev').on('click', function() {
    num = $(".through").size();
    console.log(num);
    switch (num) {
      case 1:
        $('li').eq(0).removeClass('through');
        $('li').eq(1).removeClass('active');
        $('li').eq(0).addClass('active');
        break;
      case 2:
        $('li').eq(1).removeClass('through');
        $('li').eq(2).removeClass('active');
        $('li').eq(0).addClass('through');
        $('li').eq(1).addClass('active');
        break;
      case 3:
        $('li').eq(2).removeClass('through');
        $('li').eq(3).removeClass('active');
        $('li').eq(0).addClass('through');
        $('li').eq(1).addClass('through');
        $('li').eq(2).addClass('active');
        break;
      case 4:
        $('li').eq(3).removeClass('through');
        $('li').eq(4).removeClass('active');
        $('li').eq(0).addClass('through');
        $('li').eq(1).addClass('through');
        $('li').eq(2).addClass('through');
        $('li').eq(3).addClass('active');
        break;
    }
  });
});