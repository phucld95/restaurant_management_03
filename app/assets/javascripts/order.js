function addComboToCart(combo) {
  var id = '#quantity-combo-order' + order_combo
  var quantity = $(id).val();
  var url = '/order_combos';
  $.ajax({
    type:'POST',
    url: url,
    data: {
      order_combo: {
        quantity: quantity,
        combo_id: combo
      }
    }
  }).success(function(){
    $('#cart-text').load(document.URL + ' #order-card-text');
  });
}

function updateQuantityComboInCart(order_combo) {
  var idQuantityOrderComboField = '#quantity-of-order-combo-' + order_combo
  var idOrderComboRow = '#order-combo-row-' + order_combo
  var idOrderComboTotalPrice = ' #order-order-total-price-' + order_combo
  var quantity = $(idQuantityOrderComboField).val();
  var url = '/order_combos/' + order_combo

  $.ajax({
    type:'PATCH',
    url: url,
    data: {
      order_combo: {
        quantity: quantity,
        id: order_combo
      }
    }
  }).success(function(){
    $(idOrderComboRow).load(document.URL + idOrderComboTotalPrice)
  });
}

function quantityComboInCart(order_combo) {
  var url = '/order_combos/' + order_combo;
  $.ajax({
    type:'DELETE',
    url: url,
    data: {
      order_combo: {
        id: order_combo
      }
    }
  }).success(function(){
    $('#cart-text').load(document.URL + ' #order-card-text');
    $('#cart-content').load(document.URL + ' #cart-content-list')
  });
}

function addDishToCart(dish) {
  var id = '#quantity-dish-order-' + dish
  var quantity = $(id).val();
  var url = '/order_dishes';
  $.ajax({
    type:'POST',
    url: url,
    data: {
      order_dish: {
        quantity: quantity,
        dish_id: dish
      }
    }
  }).success(function(){
    $('#cart-text').load(document.URL + ' #order-card-text');
  });
}

function updateQuantityDishInCart(order_dish) {
  var idQuantityOrderDishField = '#quantity-of-order-dish-' + order_dish
  var idOrderDishRow = '#order-dish-row-' + order_dish
  var idOrderDishTotalPrice = ' #order-dish-total-price-' + order_dish
  var quantity = $(idQuantityOrderDishField).val();
  var url = '/order_dishes/' + order_dish;
  $.ajax({
    type:'PATCH',
    url: url,
    data: {
      order_dish: {
        quantity: quantity,
        id: order_dish
      }
    }
  }).success(function(){
    $(idOrderDishRow).load(document.URL + idOrderDishTotalPrice)
  });
}

function quantityDishInCart(order_dish) {
  var url = '/order_dishes/' + order_dish;
  $.ajax({
    type:'DELETE',
    url: url,
    data: {
      order_dish: {
        id: order_dish
      }
    }
  }).success(function(){
    $('#cart-text').load(document.URL + ' #order-card-text');
    $('#cart-content').load(document.URL + ' #cart-content-list')
  });
}
