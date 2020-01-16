$(function() {
  var id = $('section').attr('id');
  console.log( id );

  switch (id) {
    case "signupregistration":
      $('li').eq(0).removeClass('through');
      $('li').eq(1).removeClass('active');
      $('li').eq(0).addClass('active');
      break;
    case "signupsmscon":
      $('li').eq(0).removeClass('active');
      $('li').eq(0).removeClass('through');
      $('li').eq(1).removeClass('through');
      $('li').eq(2).removeClass('active');
      $('li').eq(0).addClass('through');
      $('li').eq(1).addClass('active');
      break;
    case "signup_adress_input":
      $('li').eq(0).removeClass('through');
      $('li').eq(1).removeClass('active');
      $('li').eq(0).removeClass('through');
      $('li').eq(1).removeClass('through');
      $('li').eq(2).removeClass('through');
      $('li').eq(3).removeClass('active');
      $('li').eq(0).addClass('through');
      $('li').eq(1).addClass('through');
      $('li').eq(2).addClass('active');
      break;
    case "card_payment":
      $('li').eq(0).removeClass('through');
      $('li').eq(1).removeClass('through');
      $('li').eq(2).removeClass('active');
      $('li').eq(0).removeClass('through');
      $('li').eq(1).removeClass('through');
      $('li').eq(2).removeClass('through');
      $('li').eq(3).removeClass('through');
      $('li').eq(4).removeClass('active');
      $('li').eq(0).addClass('through');
      $('li').eq(1).addClass('through');
      $('li').eq(2).addClass('through');
      $('li').eq(3).addClass('active');
      break;
    case "complete":
      $('li').eq(0).removeClass('through');
      $('li').eq(1).removeClass('through');
      $('li').eq(2).removeClass('through');
      $('li').eq(3).removeClass('active');
      $('li').eq(0).addClass('through');
      $('li').eq(1).addClass('through');
      $('li').eq(2).addClass('through');
      $('li').eq(3).addClass('through');
      $('li').eq(4).addClass('active');
      break;
  }
});