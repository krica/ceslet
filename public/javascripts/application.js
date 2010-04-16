jQuery(document).ready(function() {
   changeLink(); 
   hideNotice();
   datePicker();
});

function datePicker(){
  jQuery(".datepicker").datepicker();
}
function changeLink(){
    jQuery(".to-btn").button();
}

function hideNotice() {
  setTimeout("jQuery('#flash-notice').hide('slow')", 5000);
}

