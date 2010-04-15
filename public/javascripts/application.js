jQuery(document).ready(function() {
   changeLink(); 
   hideNotice();
});

function changeLink(){
    jQuery(".to-btn").button();
}

function hideNotice() {
  setTimeout("jQuery('#flash-notice').hide('slow')", 5000);
}

