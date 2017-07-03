$(document).on('click','#btn-add-dish',function(){
  var order_id = $('.order-id').text();
  $.get('/admin/orders/'+ order_id +'/order_dishes/new', function(data){
    $('#new-dish-row').append(data);
  });
});

$(document).on('click','#btn-add-combo',function(){
  var order_id = $('.order-id').text();
  $.get('/admin/orders/'+ order_id +'/order_combos/new', function(data){
    $('#new-dish-row').append(data);
  });
});

$(document).on('change', '.select-in-order', function(){
  var dish_id = $(this).val();
  $(this).parent().parent().parent().data('id' + dish_id);
});

$(document).on('click', '#dish-delete', function(){
  $(this).parent().remove();
});

$(document).on('click', '.close', function(){
  $('.modal').hide();
});

$(document).on('click','#btn-save-order',function(){
  $('#save-order-modal').show();
});
