$(function() {
  //$('.slider').slick();
  $('.slider').slick({
    prevArrow:'<i class="fa fa-angle-left arrow-left"></i>',
    nextArrow:'<i class="fa fa-angle-right arrow-right"></i>',
    dots: true,
    autoplay: true,
    autoplaySpeed: 4000,
    speed: 800,
  });
});