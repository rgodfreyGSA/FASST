$(function() {

 
  /*** Bootstrap popover demo ***/

  // initialize column selector using default settings
  // note: no container is defined!
  $(".bootstrap-popup").tablesorter({
    theme: 'blue',
    widgets: ['zebra', 'columnSelector', 'stickyHeaders']
  });

  // call this function to copy the column selection code into the popover
  $.tablesorter.columnSelector.attachTo( $('.bootstrap-popup'), '#popover-target');

  $('#popover')
    .popover({
      placement: 'right',
      html: true, // required if content has HTML
      content: $('#popover-target')
    });

});