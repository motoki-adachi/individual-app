$(function(){
    $('#v-pills-profile-tab').on('click', function(){
        $('.piechart-hidden').show();
        $('.barchart-hidden').hide();
    })

    $('#v-pills-home-tab').on('click', function(){
        $('.indexchart-hidden').show();
        $('.piechart-hidden').hide();
    })

    $('#v-pills-messages-tab').on('click', function(){
        $('.piechart-hidden').show();
        $('.indexchart-hidden').hide();
    })

});