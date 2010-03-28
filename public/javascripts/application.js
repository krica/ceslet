jQuery(document).ready(function() {
   changeLink(); 
   hideNotice();
});

function changeLink(){
    jQuery(".to-button").button();
}

function hideNotice() {
  setTimeout("jQuery('#flash-notice').hide('slow')", 3000);
}

