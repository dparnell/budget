$(document).ready(function() {
    $.datepicker.setDefaults({dateFormat: 'yy-mm-dd'});

    $('.balance-detail').click(function(event) {
        $.ajax($(this).attr('href')).done(function(data) {
            $('#details').html(data);
        });
        event.preventDefault();
        event.stopPropagation();
    });

    $('#purchase_purchase_date').datepicker();
    $('#purchase_entered_by').autocomplete({source: 'auto_complete_for_purchase_entered_by.json'});
    $('#purchase_description').autocomplete({source: 'auto_complete_for_purchase_description.json'});

});
