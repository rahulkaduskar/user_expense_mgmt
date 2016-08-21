
$(document).ready(function () {
	  
});



function init_typehead(){
  $('.typeahead').each(function(){
    $this = $(this);
    $this.typeahead({
      source: function (query, process) {
        $.ajax({
          url:' /users/search',
          type: 'POST',
          dataType: 'JSON',
          data: 'query=' + query,
          success: function(data) {
            //console.log(data);
            process(data);
          }
        });
      },
      afterSelect: function(item) {
        $this.val(item.name);
        $this.closest('div').find("[type='hidden']").val(item.id);
      },
    });
  });
}

function add_user(){
	var url = $("#add_user_link").attr("href");
 	$.ajax({
	 		url: url,
			type: 'GET',
	    success: function(data) {
	      $("#add_user_form").append(data);
	      init_typehead();
	    }
	  }
 	);
  return false;
}

function add_payment(){
	var url = $("#add_payment_link").attr("href");
  $.ajax({
	 		url: url,
			type: 'GET',
	    success: function(data) {
	      $("#add_payment_form").append(data);
	      init_typehead();
	    }
	  }
 	);
  return false;
}