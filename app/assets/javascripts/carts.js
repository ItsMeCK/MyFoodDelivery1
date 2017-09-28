function updateOrderLink(control) {
  var $MAIN_PARENT = control.closest('.order_addresses');
  var address_id = $MAIN_PARENT.find('#address_id').val();
  var slot_id = $MAIN_PARENT.find('#slot_id').val();
  var place_order_url = '/orders/place?address_id=' + address_id + '&slot_id=' + slot_id;
  $MAIN_PARENT.find('.place_order').attr('href', place_order_url);
}
