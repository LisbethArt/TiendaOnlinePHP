$(function() {

    var owner = $('#owner');
    var cardNumber = $('#cardNumber');
    var cardNumberField = $('#card-number-field');
    var CVV = $("#cvv");
    var mastercard = $("#mastercard");
    var confirmButton = $('#confirm-purchase');
    var visa = $("#visa");
    var amex = $("#amex");

    // Use the payform library to format and validate
    // the payment fields.

    cardNumber.payform('formatCardNumber');
    CVV.payform('formatCardCVC');

    cardNumber.on('input', function() {
        var value = cardNumber.val().replace(/\s+/g, '').replace(/[^0-9]/gi, '');
        var formattedValue = '';
        for (var i = 0; i < value.length; i++) {
            if (i > 0 && i % 4 === 0) {
                formattedValue += ' ';
            }
            formattedValue += value[i];
        }
        cardNumber.val(formattedValue);

        amex.removeClass('transparent');
        visa.removeClass('transparent');
        mastercard.removeClass('transparent');

        if ($.payform.validateCardNumber(cardNumber.val().replace(/\s+/g, '')) == false) {
            cardNumberField.addClass('has-error');
        } else {
            cardNumberField.removeClass('has-error');
            cardNumberField.addClass('has-success');
        }

        var cardType = $.payform.parseCardType(cardNumber.val().replace(/\s+/g, ''));
        if (cardType == 'visa') {
            mastercard.addClass('transparent');
            amex.addClass('transparent');
        } else if (cardType == 'amex') {
            mastercard.addClass('transparent');
            visa.addClass('transparent');
        } else if (cardType == 'mastercard') {
            amex.addClass('transparent');
            visa.addClass('transparent');
        }
    });

    confirmButton.click(function(e) {
        e.preventDefault();

        var isCardValid = $.payform.validateCardNumber(cardNumber.val().replace(/\s+/g, ''));
        var isCvvValid = $.payform.validateCardCVC(CVV.val());

        if(owner.val().length < 5){
            alert("Wrong owner name");
        } else if (!isCardValid) {
            alert("Wrong card number");
        } else if (!isCvvValid) {
            alert("Wrong CVV");
        } else {
            // Everything is correct. Add your form submission code here.
            alert("Everything is correct");
        }
    });
});