/*global WOW:true*/
var wow = new WOW(
  {
    boxClass: 'wow',
    animateClass: 'animated',
    offset: 0,
    mobile: true,
    live: true,
    scrollContainer: null
  }
);
wow.init();

$(document).on('click', '.edit-pass', function() {
  $('#edit_pass_show').toggleClass('edit-pass-content-hide', 'edit-pass-content-show');
});
$(document).on('click', '#searchclear', function(){
  $('#searchinput').val('');
});

$(document).on('click', '#btn-find-table', function() {
  var val_cap = $('#capacity_field').val();
  var val_date = $('#date_field').val();
  var val_time = $('#time_field').val();
  var val_id = $('#chosen_table_value').val();
  $('#btn-summit-table').css('display','inline-block');
  $.ajax({
    type:'GET',
    url: '/tables',
    dataType: 'json',
    data: {
      table: {
        capacity_gteq: val_cap,
        orders_day_eq: val_date,
        orders_time_in_eq: val_time,
        id: val_id
      }
    }
  }).done(  function(data) {
    for(var i=0;i<19;i++) {
      $('#btn-'+ i).removeClass('btn-maru').removeClass('btn-choose').addClass('btn-batsu');
    }
    $.each(data, function (index, element) {
      $('#btn-' + element.code).addClass('btn-maru').removeClass('btn-batsu');
    });
  });
});

$(document).ready(function(){
  $('.datepicker2').datepicker({
    dateFormat: 'yy-mm-dd',
    defaultDate: 0,
    firstDay: 1,
    gotoCurrent: true,
    minDate: 0
  });
});

$(document).ready(function(){
  $('.btn-table').click(function(){
    $('.btn-table').removeClass('btn-choose');
    $(this).addClass('btn-choose');
  });
});

$(document).on('click', '#btn-summit-table', function(e) {
  e.preventDefault();
  var a = 0;
  var val_cap = $('#capacity_field').val();
  var val_date = $('#date_field').val();
  var val_time = $('#time_field').val();
  if(val_cap == '' || val_date == '' || val_time == '') {
    a = 1;
    $('#popup1').removeClass('hide');
    $('.alert1').removeClass('hide');
    $('.alert2').addClass('hide');
  } else if (!$('.btn-table').hasClass('btn-choose')) {
    a = 2;
  }
  if(a == 0) {
    $('#guest-popup').css('display','block');
  } else if(a == 2) {
    $('#popup1').removeClass('hide');
    $('.alert2').removeClass('hide');
    $('.alert1').addClass('hide');
  }
});

$(document).on('click','.close', function(){
  $('#myModal').css('display','none');
  $('#guest-popup').css('display','none');
});

$(document).on('click','#btn-submit-guest', function() {
  $(this).hide();
  $('#btn-submit-order').show();
  $('#guest-info').hide();
  $('#hide-after-guest-info').hide();
  var val_name = $('#name-guest').val();
  var val_phone = $('#phone-guest').val();
  var val_email = $('#email-guest').val();
  $.ajax({
    type:'POST',
    url: '/guests',
    dataType: 'json',
    data: {
      guest: {
        name: val_name,
        email: val_email,
        phone_num: val_phone,
      }
    }
  }).success(function(){
    book_table();
  });
});

$(document).on('click','#register-guest-code', function() {
  $('#myModal').css('display','block');
});

function book_table (){
  var val_date = $('#date_field').val();
  var val_time = $('#time_field').val();
  var id_table = $('.btn-table.btn-choose').text();
  $('#myModal').css('display','none');
  $('#guest-popup').css('display','none');
  $.ajax({
    type:'POST',
    url: '/orders',
    dataType: 'json',
    data: {
      day: val_date,
      time_in: val_time,
      table_id: id_table
    }
  }).success(function(d){
    location.replace(d.path);
  });
}

$(document).on('click', '#btn-submit-guest-code',function(){
  var guest_code = $('#code-guest').val();
  $.ajax({
    type:'GET',
    url: '/guests',
    dataType: 'json',
    data: {
      guest: {
        code: guest_code,
      }
    }
  }).success(function(){
    book_table();
  });
});

$(document).on('click','#close-alert', function(){
  $('#popup1').addClass('hide');
});

$(document).ready(function(){
  $('.home-overlay').bgswitcher({
    images: [
      'http://i.imgur.com/WVDh6N2.jpg',
      'http://i.imgur.com/gQGFY9C.jpg',
      'http://i.imgur.com/ITUizuk.jpg',
      'http://i.imgur.com/4MzLYrL.jpg',
      'http://i.imgur.com/g8AiwIu.jpg',
      'http://i.imgur.com/oryEB6Z.jpg',
      'http://i.imgur.com/YRk2lI7.jpg',
      'http://i.imgur.com/7uO7iFA.jpg'],
    effect: 'fade',
    interval: 5000,
    loop: true,
    shuffle: true,
    duration: 500,
    easing: 'linear'
  });
});
