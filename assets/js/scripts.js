
jQuery(document).ready(function() {

  // Background slideshow
  $('.coming-soon').backstretch([
    'assets/img/backgrounds/1.jpg',
    // 'assets/img/backgrounds/2.jpg',
    // 'assets/img/backgrounds/3.jpg'
  ], {duration: 3000, fade: 750});


  // Countdown initializer
  var now = new Date();
  var countTo = new Date('2014-09-15');
  $('.timer').countdown(countTo, function(event) {
    $(this).find('.days').text(event.offset.totalDays);
    $(this).find('.hours').text(event.offset.hours);
    $(this).find('.minutes').text(event.offset.minutes);
    $(this).find('.seconds').text(event.offset.seconds);
  });
});
