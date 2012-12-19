jQuery(document).ready(function() {
  jQuery("#contactform").validate({
	errorElement:'div',
	rules: {
		"contact[name]":{
					  required: true
					 },
	 
	  "contact[email]":{
						required: true,
						email :true
					   },
				 
	  "contact[subject]":{
							  required: true,
						     },		
	  "contact[message]":{
					required:true
					}
		},
	messages: {
		"contact[name]":{
		    		 required:  "Please enter the  name"
                     },
 		"contact[email]":{
		   				 required: "Please enter email"
					     },
		"contact[subject]":{
		                       required:  "Please enter subject"
							   },
		 "contact[message]":{
						required: "Please enter message",
						
					   }
		}
	});
	
	
	
});
	