window.ST = window.ST || {};
(function(module) {
  var options;
  var sellerMessagePlaceholder;
  var disputeMessagePlaceholder;
  var sellerMessageLabel;
  var disputeMessageLabel;

  var onChangeCanceledFlow = function(selector) {
    switch(selector) {
      case '.js-confirm-radio-button':
      $('.confirm-description, .close-listing-radio-buttons').removeClass('hidden');
      $('.cancel-description').addClass('hidden');
      $('.send-message-description').addClass('hidden');
      $('.send-message-form').addClass('hidden');
      $('#do_give_feedback').prop('checked', true);
      break;
      case '.js-cancel-radio-button':
      $('#do_not_give_feedback').prop('checked', true);
      $('.cancel-description').removeClass('hidden');
      $('.send-message-description').addClass('hidden');
      $('.send-message-form').removeClass('hidden');
      $('#confirm-message-label').text(disputeMessageLabel);
      $('#message_content').attr("placeholder", disputeMessagePlaceholder);
      $('.confirm-description, .close-listing-radio-buttons').addClass('hidden');
      break;
      case '.js-send-message-radio-button':
        $('#do_not_give_feedback').prop('checked', true);
        $('.send-message-description').removeClass('hidden');
        $('.cancel-description').addClass('hidden');
        $('.send-message-form').removeClass('hidden');
        $('#confirm-message-label').text(sellerMessageLabel);
        $('#message_content').attr("placeholder", sellerMessagePlaceholder);
        $('.confirm-description, .close-listing-radio-buttons').addClass('hidden');
      break;
    }
  };

  var init = function(initOptions) {
    options = initOptions || {};
    sellerMessagePlaceholder = options.sellerMessagePlaceholder;
    disputeMessagePlaceholder = options.disputeMessagePlaceholder;
    sellerMessageLabel = options.sellerMessageLabel;
    disputeMessageLabel = options.disputeMessageLabel;
      ST.initializeRadioButtons({
      buttons: ['.js-confirm-radio-button', '.js-cancel-radio-button', '.js-send-message-radio-button'],
      input: '.js-confirmation-status',
      callback: onChangeCanceledFlow
    });
  };

  module.ConfirmConversation = {
    init: init,
  };
})(window.ST);
