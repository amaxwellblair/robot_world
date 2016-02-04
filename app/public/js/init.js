(function($){
  $(function(){

    $('.button-collapse').sideNav();
    $('.datepicker').pickadate({
      selectMonths: true, // Creates a dropdown to control month
      selectYears: 30 // Creates a dropdown of 15 years to control year
    });
    $(document).ready(function() {
      $('select').material_select();
    });


  }); // end of document ready
})(jQuery); // end of jQuery name space
