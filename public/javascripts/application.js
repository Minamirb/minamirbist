// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery(function($) {
  $("a[data-popup='true']").live('click', function(e) {
    window.open($(this).attr('href'));
    e.preventDefault();
  });
});
