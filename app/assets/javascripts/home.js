$(document).on('turbolinks:load', function(){
  var showChar = 120;
  var ellipsestext = '...';
  var moretext = 'Show more';
  var lesstext = 'Show less';
  $('.more').each(function() {
    var content = $(this).html();
    if(content.length > showChar) {
      var c = content.substr(0, showChar);
      var h = content.substr(showChar, content.length - showChar);
      var html = c + '<span class="moreellipses">' + ellipsestext + '&nbsp;</span>' +
        '<span class="morecontent"><span>' + h +
        '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';
      $(this).html(html);
    }
  });

  $('.morelink').click(function(){
    if($(this).hasClass('less')) {
      $(this).removeClass('less');
      $(this).html(moretext);
    } else {
      $(this).addClass('less');
      $(this).html(lesstext);
    }
    $(this).parent().prev().toggle();
    $(this).prev().toggle();
    return false;
  });

  $('.datepicker').datepicker({
    format: 'yyyy-mm-dd',
    todayHighlight: true,
    autoclose: true,
    weekStart: 1,
    daysOfWeekHighlighted: [6,0]
  });

  $('.carousel').owlCarousel({
    autoPlay: 3000,
    stopOnHover: true,
    touchDrag: true,
    rewindNav: true,
    rewindSpeed: 600,
    pagination: false,
    navigation: false,
    items: 4,
    itemsDesktop: [1119,4],
    itemsDesktopSmall: [979, 3],
    itemsTablet: [768,2],
    itemsMobile: [479,1]
  });

  $('.carousel2').owlCarousel({
    autoPlay: 3000,
    stopOnHover: true,
    touchDrag: true,
    rewindNav: true,
    rewindSpeed: 600,
    pagination: false,
    navigation: false,
    items: 3,
    itemsDesktop: [1119,3],
    itemsDesktopSmall: [979, 2],
    itemsTablet: [768,2],
    itemsMobile: [479,1]
  });
});
