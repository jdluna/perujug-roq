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
      
      // Close all other dropdowns and submenus
      $('.dropdown-content').removeClass('show');
      $('.submenu-content').removeClass('show');
      
      // Toggle current dropdown
      dropdown.toggleClass('show');
      
      console.log('Dropdown toggled:', target);
    });
    
    // Submenu implementation
    $('.submenu-trigger').on('click', function(e) {
      e.preventDefault();
      e.stopPropagation();
      
      var target = $(this).data('target');
      var submenu = $('#' + target);
      
      // Close all other submenus
      $('.submenu-content').removeClass('show');
      
      // Toggle current submenu
      submenu.toggleClass('show');
      
      console.log('Submenu toggled:', target);
    });
    
    // Hover functionality for submenus
    $('.submenu-container').on('mouseenter', function() {
      var submenu = $(this).find('.submenu-content');
      $('.submenu-content').removeClass('show');
      submenu.addClass('show');
      console.log('Submenu hovered:', submenu.attr('id'));
    });
    
    $('.submenu-container').on('mouseleave', function() {
      var submenu = $(this).find('.submenu-content');
      submenu.removeClass('show');
      console.log('Submenu left:', submenu.attr('id'));
    });
    
    // Close dropdown when clicking outside
    $(document).on('click', function(e) {
      if (!$(e.target).closest('.dropdown-trigger, .dropdown-content, .submenu-trigger, .submenu-content').length) {
        $('.dropdown-content').removeClass('show');
        $('.submenu-content').removeClass('show');
      }
    });
    
    // Close dropdown when pressing Escape
    $(document).on('keydown', function(e) {
      if (e.key === 'Escape') {
        $('.dropdown-content').removeClass('show');
        $('.submenu-content').removeClass('show');
      }
    });

  }); // end of document ready
})(jQuery); // end of jQuery name space