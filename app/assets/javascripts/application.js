$(document).ready(function($) {
  $(document).on('turbolinks:load', function() {
    var cl = cloudinary.Cloudinary.new({cloud_name: "business-design-school"});
    cl.responsive();

    $('[data-toggle="tooltip"]').tooltip();
    $('.collapse').collapse();

    $('#q-minus').click(function() {
      if($('#line_item_quantity').val() > 1) {
        $('#line_item_quantity').val(parseInt($('#line_item_quantity').val()) - 1);
        $('#quantity-value').html($('#line_item_quantity').val());
        var totalPrice = $('#single-price').text();
        var newTotalPrice = $('#line_item_quantity').val() * Number(totalPrice.replace(/[^0-9.-]+/g,""));
        $('#total-price').html('$' + newTotalPrice + '.00');
      }
    });
    $('#q-plus').click(function() {
      // if($('#line_item_quantity').val() < 15) {
        $('#line_item_quantity').val(parseInt($('#line_item_quantity').val()) + 1);
        $('#quantity-value').html($('#line_item_quantity').val());
        var totalPrice = $('#single-price').text();
        var newTotalPrice = $('#line_item_quantity').val() * Number(totalPrice.replace(/[^0-9.-]+/g,""));
        $('#total-price').html('$' + newTotalPrice + '.00');
      // }
    });




    $("[id^=select-session-]").on('change', function() {
      var courseId = $("[id^=select-session]").attr('id').substring(15);
      $("#enrol-button").attr("href", "/carts/new?course=" + courseId + '&intake=' + this.value);
    });

    $("#enrol-modal-session-select").on('change', function() {
      var optionSelected = $(this).find("option:selected");
      var valueSelected  = optionSelected.val();
      if(valueSelected >= 1) {
        $('#confirm-button').css('display', 'inline-block');
        $('#add-ticket-button-1').show();
        $('.intake-id-field').val(valueSelected);
      }
      else {
        $('#confirm-button').hide();
        $('#add-ticket-button-1').hide();
        $('.intake-id-field').val("");
      }
    });
  });
});
