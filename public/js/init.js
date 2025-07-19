(function($){
  $(function(){

    $('.button-collapse').sideNav();
    $('.carousel').carousel();
    $('.parallax').parallax();
    
    // Custom dropdown implementation
    $('.dropdown-trigger').on('click', function(e) {
      e.preventDefault();
      e.stopPropagation();
      
      var target = $(this).data('target');
      var dropdown = $('#' + target);
      
      // Close all other dropdowns
      $('.dropdown-content').removeClass('show');
      
      // Toggle current dropdown
      dropdown.toggleClass('show');
      
      console.log('Dropdown toggled:', target);
    });
    
    // Close dropdown when clicking outside
    $(document).on('click', function(e) {
      if (!$(e.target).closest('.dropdown-trigger, .dropdown-content').length) {
        $('.dropdown-content').removeClass('show');
      }
    });
    
    // Close dropdown when pressing Escape
    $(document).on('keydown', function(e) {
      if (e.key === 'Escape') {
        $('.dropdown-content').removeClass('show');
      }
    });

  }); // end of document ready
})(jQuery); // end of jQuery name space