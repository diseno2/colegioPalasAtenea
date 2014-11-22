function ShowQueryForm(){$( "#query" ).dialog("open" );}

$(function() {
	var dialog, form,
		emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
		name = $( "#name" ),
		email = $( "#email" ),
		password = $( "#password" ),
		allFields = $( [] ).add( name ).add( email ).add( password ),
		tips = $( ".queryForm" );
 
	function updateTips( t ) {
		tips
        	.text( t )
        	.addClass( "ui-state-highlight" );
		setTimeout(function() {
			tips.removeClass( "ui-state-highlight", 1500 );
		}, 500 );
    }
	
    function checkLength( o, n, min, max ) {
    	if ( o.val().length > max || o.val().length < min ) {
    		o.addClass( "ui-state-error" );
    		updateTips( "Length of " + n + " must be between " +
    				min + " and " + max + "." );
    		return false;
    	} else {
    		return true;
    	}
    }
 
    function checkRegexp( o, regexp, n ) {
      if ( !( regexp.test( o.val() ) ) ) {
        o.addClass( "ui-state-error" );
        updateTips( n );
        return false;
      } else {
        return true;
      }
    }
 
    function buscar(){
    	location.href = "Lista.jsp";
    }
    
    dialog = $( "#query" ).dialog({
      autoOpen: false,
      height: 300,
      width: 350,
      modal: true,
      buttons: {
        "Buscar": buscar,
        "Cancelar": function() {
          dialog.dialog( "close" );
        }
      },
      close: function() {
        form[ 0 ].reset();
        allFields.removeClass( "ui-state-error" );
      }
    });
 
    form = dialog.find( "form" ).on( "submit", function( event ) {
      event.preventDefault();
      addUser();
    });
});