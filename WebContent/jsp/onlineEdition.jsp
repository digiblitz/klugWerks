#-------------------------------------------------------------------------------
# * Copyright: 2019 digiBlitz Foundation
#  * 
#  * License: digiBlitz Public License 1.0 (DPL) 
#  * Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
#  * 
#  * Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
#  * 
#  * Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
#  * 
#  * "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
#-------------------------------------------------------------------------------
<!---
Copyright: 2019 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
     <title>OnlineEdition</title>
     <link rel="stylesheet" href="css/form.css">   
<script src="js/cscombo_new.js" type="text/javascript" >
      </script>
      
	  
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
   
        <script src="js/html5shiv.js"></script>
          <script src="js/jquery.min.js">
      </script>
  
      
	<script type="text/javascript">
    $(document).ready(function(){
      
      $('#plan').click(function(event) {
         var oneTimeCost;
		 var totalCost;
        if($('#plan').val()=="monthly"){
         
          var a = parseInt($('#amo').val());
		   oneTimeCost = parseInt($('#oneTimeCost').val());
          
          var productPrice=a*1;
          
          $("#dp1").show();
          $("#dp2").hide();
          $("#dp3").hide();
        }
        
        $("#fee").val(Math.round(productPrice));
		
		$("#oneTimeSetupPrice").val(oneTimeCost);
		totalCost = productPrice+oneTimeCost;
		$("#total").val(Math.round(totalCost));
      }
                      );
      
      $('#plan1').click(function(event) {
        var totalCost;
        if($('#plan1').val()=="quarterly"){
          var a = parseInt($('#amo').val());
		   var oneTimeCost = parseInt($('#oneTimeCost').val());
         
          var n=a*3;
          var m=n*10/100;
          var productPrice=n-m;
          $("#dp1").hide();
          $("#dp2").show();
          $("#dp3").hide();
        }
        
        $("#fee").val(Math.round(productPrice));
		
		$("#oneTimeSetupPrice").val(oneTimeCost);
		totalCost = productPrice+oneTimeCost;
		$("#total").val(Math.round(totalCost));
		
      }
                       );
      $('#plan2').click(function(event) {
        var totalCost;
        if($('#plan2').val()=="annual"){
          var a = parseInt($('#amo').val());
		     var oneTimeCost = parseInt($('#oneTimeCost').val());
          
          var n=a*12;
          var m=n*25/100;
          var productPrice=n-m;
          //alert(productPrice);
          $("#dp1").hide();
          $("#dp2").hide();
          $("#dp3").show();
        }
        
        $("#fee").val(Math.round(productPrice));
		
		$("#oneTimeSetupPrice").val(oneTimeCost);
		totalCost = productPrice+oneTimeCost;
		$("#total").val(Math.round(totalCost));
      }
                       );
   
					 
	//prabhu working here
	
	
	

      
      $('#Productplan').click(function(event) {
           var productPrice=null;
		  var subtype = null;
		  var feePrice = null;
		  var totalCost;
        if($('#Productplan').val()=="Basic"){
		var a = 99;
          productPrice=99;
		var oneTimeCost = 0;
		  if($("input[type='radio'].radioBtnClass").is(':checked')) {
    subtype = $("input[type='radio'].radioBtnClass:checked").val();
    //alert(subtype);
}
		  if(subtype=="monthly"){
		  //alert("basic monthly");
		 feePrice = a*1;
		 
		  } else if(subtype=="quarterly"){
		  	  //alert("basic quarterly");
		  var n=a*3;
          var m=n*10/100;
          feePrice=n-m;
		
		  }
		  else if(subtype=="annual"){
		  //alert("basic annual");
		      var n=a*12;
          var m=n*25/100;
          feePrice=n-m;
		 
		  }
		
        }
        $("#fee").val(Math.round(feePrice));
		 $("#amo").val(productPrice);
		 $("#oneTimeCost").val(oneTimeCost);
		 $("#oneTimeSetupPrice").val(oneTimeCost);
		 totalCost = feePrice+oneTimeCost;
		 $("#total").val(Math.round(totalCost));
      }
                      );
					  
					  
      
      $('#Productplan1').click(function(event) {
              var productPrice=null;
		   var subtype = null;
		  var feePrice = null;
		  var totalCost;
        if($('#Productplan1').val()=="Silver"){
		  var a = 299;
          productPrice=299;
		  var oneTimeCost = 999;

		  if($("input[type='radio'].radioBtnClass").is(':checked')) {
    subtype = $("input[type='radio'].radioBtnClass:checked").val();
    //alert(subtype);
}
		  if(subtype=="monthly"){
		  //alert("Silver monthly");
		 feePrice = a*1;
		 
		  } else if(subtype=="quarterly"){
		  	  //alert("Silver quarterly");
		  var n=a*3;
          var m=n*10/100;
          feePrice=n-m;
		 
		  }
		  else if(subtype=="annual"){
		  //alert("Silver annual");
		      var n=a*12;
          var m=n*25/100;
          feePrice=n-m;
		  
		  }
        }
        $("#fee").val(Math.round(feePrice));
		 $("#amo").val(productPrice);
		 $("#oneTimeSetupPrice").val(oneTimeCost);
		  $("#oneTimeCost").val(oneTimeCost);
		   totalCost = feePrice+oneTimeCost;
		 $("#total").val(Math.round(totalCost));
      }
                       );
					   
					   
      $('#Productplan2').click(function(event) {
             var productPrice=null;
		   var subtype = null;
		  var feePrice = null;
		  var totalCost;
        if($('#Productplan2').val()=="Gold"){
         var a = 1249;
	var oneTimeCost = 3999;
          productPrice=1249;

		  if($("input[type='radio'].radioBtnClass").is(':checked')) {
    subtype = $("input[type='radio'].radioBtnClass:checked").val();
    //alert(subtype);
}
		  if(subtype=="monthly"){
		  //alert("Gold monthly");
		 feePrice = a*1;
		
		  } else if(subtype=="quarterly"){
		  	  //alert("Gold quarterly");
		  var n=a*3;
          var m=n*10/100;
          feePrice=n-m;
		
		  }
		  else if(subtype=="annual"){
		  //alert("Gold annual");
		      var n=a*12;
          var m=n*25/100;
          feePrice=n-m;
		  
		  }
            }
        
        $("#fee").val(Math.round(feePrice));
		 $("#amo").val(productPrice);
		 $("#oneTimeSetupPrice").val(oneTimeCost);
		  $("#oneTimeCost").val(oneTimeCost);
		   totalCost = feePrice+oneTimeCost;
		 $("#total").val(Math.round(totalCost));
      }
                       );
					   

		$('#Productplan3').click(function(event) {
            var productPrice=null;
		   var subtype = null;
		  var feePrice = null;
		  var totalCost;
        if($('#Productplan3').val()=="Platinum"){
		var a = 4999;
	var oneTimeCost = 14999;
          productPrice=4999;

		  if($("input[type='radio'].radioBtnClass").is(':checked')) {
    subtype = $("input[type='radio'].radioBtnClass:checked").val();
    //alert(subtype);
}
		  if(subtype=="monthly"){
		  //alert("Platinum monthly");
		 feePrice = a*1;
		
		  } else if(subtype=="quarterly"){
		  	  //alert("Platinum quarterly");
		  var n=a*3;
          var m=n*10/100;
          feePrice=n-m;
		
		  }
		  else if(subtype=="annual"){
		  //alert("Platinum annual");
		      var n=a*12;
          var m=n*25/100;
          feePrice=n-m;
		  
		  }
        }
        $("#fee").val(Math.round(feePrice));
		 $("#amo").val(productPrice);
		 $("#oneTimeSetupPrice").val(oneTimeCost);
		  $("#oneTimeCost").val(oneTimeCost);
		   totalCost = feePrice+oneTimeCost;
		 $("#total").val(Math.round(totalCost));
      }
                       );
		
		  $('#coupon').click(function(event) {
		        var sports = $("#couponcode").val();
		    	var spo = $("#total").val();
		    	var txt_wrong = "Invalid Coupon Code!";
		    	
		    	$.get('user.html?cmd=couponname', {
		        	prog : sports,
		    		cost : spo
		        }, function(response) {
		        	if(response != null && response !="" && response != "null"){
		        		 $("#total").val(response);
		    			// $( "#total" ).focus();
						 var a = document.getElementById('total');
							a.style.border = '1px solid green';
		        	     
		        	}else{
		    			
		    			$("#total").val(spo);
		    			//alert(txt_wrong);  
						// $( "#total" ).focus();
						  var a = document.getElementById('total');
							a.style.border = '1px solid red';
						
						 document.getElementById("coupon_error").innerHTML="Invalid Coupon Code!";
						
							
		        	}       
		        });
		        });
		  
			  });
					 
    
  </script>
 <script type="text/javascript">
    
    function onValidate()
    {
       var x = document.forms["insert"]["firstname"].value;
      if (x == null || x == "")  {
        //alert("firstname must be filled out");
      //document.getElementById("nihalfirst").innerHTML = "";
      document.getElementById("nihalfirst").innerHTML="Enter the first name";
      document.forms["insert"]["firstname"].focus();
      return false;
    } else if(!x.match(/^\w+((\s\w+)?\s\w+)?$/)){
		document.getElementById("nihalfirst").innerHTML="Enter the valid first name ";
		document.forms["insert"]["firstname"].focus();
		return false;
	}else{
	document.getElementById("nihalfirst").innerHTML = "";
	}
 var y = document.forms["insert"]["lastname"].value;
  if (y == null || y == "") {
    //  alert("lastname must be filled out");
    document.getElementById("nihalfirst").innerHTML = "";
    document.getElementById("nihallast").innerHTML="Enter the Last name ";
    document.forms["insert"]["lastname"].focus();
    return false;
   } else if(!x.match(/^\w+((\s\w+)?\s\w+)?$/)){
		document.getElementById("nihallast").innerHTML="Enter the valid last name ";
		document.forms["insert"]["lastname"].focus();
		return false;
	}else{
	document.getElementById("nihallast").innerHTML = "";
	}
  var z = document.forms["insert"]["email"].value;
  var atpos=email.value.indexOf("@");
  var dotpos=email.value.lastIndexOf(".");
  if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
  {
    //alert("email must be filled out");
    document.getElementById("nihallast").innerHTML = "";
    document.getElementById("Nemail").innerHTML="Enter the Valid Email ID";
    document.forms["insert"]["email"].focus();
    return false;
   }else{
	  document.getElementById("Nemail").innerHTML = "";
  }
  
  //----------------------------Mobile Validation-----------------------------------------------------------------------------------------------
  
  var a = document.forms["insert"]["mobileno"].value;
  var aw=document.insert.mobileno.value;

  //alert(aw.length);

  //  if (a.length<10) {
  //    //alert("mobileno must be filled out");
  //document.getElementById("Nemail").innerHTML = "";
  //document.getElementById("Nmobileno").innerHTML="Enter Valid mobileno. ";
  //document.forms["insert"]["mobileno"].focus();
  //return false;
  // }
  
  
  if (a==""){
    
    document.getElementById("Nemail").innerHTML = "";
    document.getElementById("Nmobileno").innerHTML = "Mobile must be filled out";
    document.forms["insert"]["mobileno"].focus() ;
    return false;
 }else if(!a.match(/^\w+((\s\w+)?\s\w+)?$/)){
	   document.getElementById("Nemail").innerHTML = "";
    document.getElementById("Nmobileno").innerHTML = "Enter the valid Mobile Number";
    document.forms["insert"]["mobileno"].focus() ;
    return false;
  }else{
	   document.getElementById("Nmobileno").innerHTML = "";
  }
  if (isNaN(a)){
    
    document.getElementById("Nmobileno").innerHTML = "Only Digits allowed.";
    document.forms["insert"]["mobileno"].focus() ;
    return false;
  }
  if (a.length >10){
    
    document.getElementById("Nmobileno").innerHTML = "Mobile Number must be 10 digit";
    document.forms["insert"]["mobileno"].focus() ;
    return false;
  }
  
  
  //-------------------------------------------Mobile valid end here----------------------------------------------------------------------------
  var b = document.forms["insert"]["institutionName"].value;
  if (b == null || b == "") {
    //alert("institutionName must be filled out");
    document.getElementById("Nmobileno").innerHTML = "";
    document.getElementById("NinstitutionName").innerHTML="Instution Name is must";
    document.forms["insert"]["institutionName"].focus();
    return false;
  }else if(!b.match(/^\w+((\s\w+)?\s\w+)?$/)){
	 document.getElementById("Nmobileno").innerHTML = "";
    document.getElementById("NinstitutionName").innerHTML="Enter the valid Institution Name";
    document.forms["insert"]["institutionName"].focus();
    return false;
  }else{
	  document.getElementById("NinstitutionName").innerHTML = "";
  }
  var c = document.forms["insert"]["country"].value;
 if ( c == null || c == "---Select---") {
    //alert("country must be filled out");
    document.getElementById("NinstitutionName").innerHTML = "";
    document.getElementById("Ncountry").innerHTML="Select Country";
    document.forms["insert"]["country"].focus();
    return false;
    }else{
		 document.getElementById("Ncountry").innerHTML = "";
	}
  var d = document.forms["insert"]["state"].value;
   if (d == null || d == "---Select---") {
    //alert("state must be filled out");
    document.getElementById("Ncountry").innerHTML = "";
    document.getElementById("Nstate").innerHTML="Select State";
    document.forms["insert"]["state"].focus();
    return false;
 }else{
	   document.getElementById("Nstate").innerHTML = "";
  }
  var e = document.forms["insert"]["city"].value;
  if (e == null || e == "") {
    //alert("city must be filled out");
	document.getElementById("NinstitutionName").innerHTML = "";
    document.getElementById("Nstate").innerHTML = "";
    document.getElementById("Ncity").innerHTML="Enter City Name";
    document.forms["insert"]["city"].focus();
	
      return false;
    }else if(!e.match(/^\w+((\s\w+)?\s\w+)?$/)){
		document.getElementById("Nstate").innerHTML = "";
		document.getElementById("Ncity").innerHTML="Enter the valid City Name";
		document.forms["insert"]["city"].focus();
		return false;
	}else{
		 document.getElementById("Ncity").innerHTML = "";
	}
  var f = document.forms["insert"]["credit_card_type"].value;
  if (f == null || f == "") {
    //alert("credit_card_type must be filled out");
    document.getElementById("Ncity").innerHTML = "";
    document.getElementById("Ncredit").innerHTML="Credit_card_type must be checked";
	//	document.forms["insert"]["credit_card_type"].focus();
      
      return false;
    }else{
		 document.getElementById("Ncredit").innerHTML = "";
	}
  var g = document.forms["insert"]["credit_card_no"].value;
  if (g == null || g == "") {
    //alert("credit_card_no must be filled out");
    document.getElementById("Ncredit").innerHTML = "";
    document.getElementById("Ncreditno").innerHTML="Credit_card_no. must be filled out";
    document.forms["insert"]["credit_card_no"].focus();
    
    return false;
  }else if(!g.match(/^\w+((\s\w+)?\s\w+)?$/)){
	  document.getElementById("Ncredit").innerHTML = "";
    document.getElementById("Ncreditno").innerHTML="Enter the valid Credit Card Number";
	document.getElementById("Ncreditno").style.color="red";
    document.forms["insert"]["credit_card_no"].focus(); 
    return false;
  }else{
	  document.getElementById("Ncreditno").innerHTML = "";
  }
  var hw = document.forms["insert"]["cvv_no"].value;
  var h=document.insert.cvv_no.value;
  if (h.length<3 ) {
    // alert("cvv_no must be filled out");
    document.getElementById("Ncreditno").innerHTML = "";
    document.getElementById("Ncvv").innerHTML="Enter Valid cvv No.";
    document.forms["insert"]["cvv_no"].focus();
    return false;
  }else if(!h.match(/^\w+((\s\w+)?\s\w+)?$/)){
	  document.getElementById("Ncreditno").innerHTML = "";
    document.getElementById("Ncvv").innerHTML="Enter the Valid cvv No";
    document.forms["insert"]["cvv_no"].focus();
    return false;
  }else{
	   document.getElementById("Ncvv").innerHTML = "";
  }
  if (isNaN(hw)) {
    //alert("expiry_month must be filled out");
    document.getElementById("Ncreditno").innerHTML = "";
    document.getElementById("Ncvv").innerHTML="Only Digits allowed ";
    document.forms["insert"]["cvv_no"].focus();
    return false;
  }
  
  
  var l = document.forms["insert"]["name_on_card"].value;
  if (l == null || l == "") {
    //    alert("Name must be filled out");
      document.getElementById("Ncvv").innerHTML = "";
      document.getElementById("Namec").innerHTML="Enter Name Printed On Card ";
      document.forms["insert"]["name_on_card"].focus();
      
      return false;
   }else if(!l.match(/^\w+((\s\w+)?\s\w+)?$/)){
		document.getElementById("Ncvv").innerHTML = "";
      document.getElementById("Namec").innerHTML="Enter the valid Name";
      document.forms["insert"]["name_on_card"].focus();
      
      return false;
	}else{
		document.getElementById("Namec").innerHTML = "";
	}
  //--------------------------------------month validation-------------------------------------------------//
  var i = document.forms["insert"]["expiry_month"].value;
  var iw=document.insert.expiry_month.value;
  var man=13;
  if (i==null||i=='') {
    //alert("expiry_month must be filled out");
    document.getElementById("Namec").innerHTML = "";
    document.getElementById("Nexp").innerHTML="Enter Expiry Month ";
    document.forms["insert"]["expiry_month"].focus();
    return false;
 }else if(!i.match(/^\w+((\s\w+)?\s\w+)?$/)){
	  document.getElementById("Namec").innerHTML = "";
    document.getElementById("Nexp").innerHTML="Please avoid the double space!";
    document.forms["insert"]["expiry_month"].focus();
    return false;
  }else{
	  document.getElementById("Nexp").innerHTML = "";
  }
  
  if (iw.length<2) {
    //alert("expiry_month must be filled out");
    document.getElementById("Namec").innerHTML = "";
    document.getElementById("Nexp").innerHTML="Month should be in MM  ";
    document.forms["insert"]["expiry_month"].focus();
    return false;
  }
  
  if (isNaN(i)) {
    //alert("expiry_month must be filled out");
    document.getElementById("Namec").innerHTML = "";
    document.getElementById("Nexp").innerHTML="Only Digits allowed ";
    document.forms["insert"]["expiry_month"].focus();
    return false;
  }
  
  
  
  //------------------------------------month validation end here-------------------------------------------------------//
  
  //------------------------------------------year validation-----------------------------------------------------/./
  
  
  var j = document.forms["insert"]["expiry_year"].value;
  var jw=document.insert.expiry_year.value;
  if (jw.length<4) {
    //alert("expiry_year must be filled out");
    document.getElementById("Nexp").innerHTML = "";
    document.getElementById("Nexpy").innerHTML="Expiry Date should be yyyy";
    document.forms["insert"]["expiry_year"].focus();
    return false;
  }
  if (isNaN(j)) {
    //alert("expiry_year must be filled out");
    document.getElementById("Nexp").innerHTML = "";
    document.getElementById("Nexpy").innerHTML="Only Digits allowed";
    document.forms["insert"]["expiry_year"].focus();
    return false;
  }
  //------------------------------year validation end here-------------------------------------------------------------//
  

  // -------------------terms and condition ------------------------//
  
if(!document.insert.accept.checked){
document.insert.accept.focus();
document.getElementById("Nselect").innerHTML="Please reaad the above T&C and Check the agree condition!";
 return false;

 }
 else{
document.insert.accept.focus();
document.getElementById("Nselect").innerHTML="";
} 

  var k = document.forms["insert"]["agree"].value;
  var kv = document.insert.agree.checked
  if (k == null || k == "" || !kv) {
    //  alert("agree must be checked out");
	document.forms["insert"]["agree"].focus();
    document.getElementById("Nagree").innerHTML="You Must accept the declaration statement!";
      return false;
    }else{
document.insert.agree.focus();
document.getElementById("Nagree").innerHTML="";
} 
  

}
  function OnScrollDiv (div) {
			//alert("you must read condition fully");
            //info.innerHTML = "Horizontal: " + div.scrollLeft
                    //       + "px<br/>Vertical: " + div.scrollTop + "px";
				// document.getElementById("info").disabled= true;
				// document.getElementById("info").innerHTML="you must read condition fully";
				  //document.getElementById("info").innerHTML = "x";
        //document.getElementById("info").innerHTML = "scroll fully";
		//document.form.check.disabled="false";
		    if(div.scrollTop >= 3600){
			        var x = document.getElementById ("check").disabled = false ;
			}
		}
		//document.getElementById("checkbox").addEventListener("click", enable);
 
  </script>
  
	
	 
     </head>
<body id="top">



<!--==============================header=================================-->


    <%@ include file = "../../include/Header.jsp" %>


<!--=======content================================-->

<div class="bg1">

<!--=======content================================-->
	  <%String user_id=(String)request.getAttribute("user_id"); %>
 <%String usrStat=(String)request.getAttribute("usrStat");
 String purchase=(String)request.getAttribute("purchase");
 String productPrice=(String)request.getAttribute("productPrice");
 
 String type=(String)request.getAttribute("type"); 
 System.out.println("purchase :::: "+purchase);
 
 String coupon_status = null;
	String coupon_value = null;
	String coupon_description = null;
	String coupon_valid = null;
	String coupon_code = null;


	coupon_status = (String)request.getAttribute("coupon_status");
	coupon_value = (String)request.getAttribute("coupon_value");
	coupon_description = (String)request.getAttribute("coupon_description");
	coupon_valid = (String)request.getAttribute("coupon_valid");
	coupon_code = (String)request.getAttribute("coupon_code");
 %>    
<div id="content">
        <div class="p44">
			<div class="container_12">
                <div class="grid_12 center">
                    <h2>Sign Up Form</h2>
                </div>
            </div>
            <div class="container_12">
			<% if(purchase.equalsIgnoreCase("try_now") && purchase != null && coupon_code != null){ %>
                <div class="grid_5">
                    <label class="labeltext" style="color:green">Congratulations! You can access our Product free upto 3 Months... Enjoy our Product...</label>
                </div>
			<%} else if(purchase.equalsIgnoreCase("try_now") && purchase != null && coupon_code == null){%>
				<div class="grid_5">
                    <label class="labeltext" style="color:green">Congratulations! You can access our Product free upto 30 days... Enjoy our Product...</label>
                </div>
			<%}else{%>
			<div class="grid_5">
                    <label class="labeltext" style="color:green">Congratulations! You can access our Product Now... Enjoy our Product...</label>
                </div>
			<%}%>
                <div class="grid_7">
                    <form id="form" name="insert" action="signUp.html?signUpProcess=signup" method="post" onSubmit="return onValidate();">
						<input type="hidden" name="amount" id="amo" value="<%=productPrice%>">
						<input type="hidden" name="coupon_status" value="<%=coupon_status%>"/>
                        <input type="hidden" name="coupon_value" value="<%=coupon_value%>"/>
                        <input type="hidden" name="coupon_description" value="<%=coupon_description%>"/>
                        <input type="hidden" name="coupon_valid" value="<%=coupon_valid%>"/>
                        <input type="hidden" name="coupon_code" value="<%=coupon_code%>"/>

					
                    <label class="name">
					<div id="nihalfirst" style="color:red" ></div>
                        <input type="text" placeholder="First Name" data-constraints="@Required @JustLetters" name="firstname" id="firstname"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 

					<%if (purchase.equalsIgnoreCase("try_now") && purchase != null && coupon_code != null){%>
					<%}else if (purchase.equalsIgnoreCase("try_now") && purchase != null && coupon_code == null){%>
                    <label class="name">
					<div id="nihallast" style="color:red" ></div>
                        <input type="text" placeholder="Last Name" data-constraints="@Required @JustLetters" name="lastname" id="lastname"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					<%}else{%>
					<label class="name">
					<div id="nihallast" style="color:red" ></div>
                        <input type="text" placeholder="Last Name" data-constraints="@Required @JustLetters" name="lastname" id="lastname"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					<%}%>
                    <label class="email">
					<div id="Nemail" style="color:red"></div>
                        <input type="text" placeholder="E-mail" data-constraints="@Required @Email" name="email" id="email"  value="" onChange="ValidateEmail('email');"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid email.</span>
                    </label>
					
					<%if (purchase.equalsIgnoreCase("try_now") && purchase != null && coupon_code != null){%>
					<%}else if (purchase.equalsIgnoreCase("try_now") && purchase != null && coupon_code == null){%>

                    <label class="phone">
					<div id="Nmobileno" style="color:red"></div>
                        <input type="text" placeholder="Phone" data-constraints="@Required @JustNumbers" name="mobileno" id="mobileno"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid phone.</span>
                    </label>
					
                    <label class="name">
					<div id="NinstitutionName" style="color:red" ></div>
                        <input type="text" placeholder="Institution Name" data-constraints="@Required @JustLetters" name="institutionName" id="institutionName"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					
                    <label class="name">
					<div id="street" style="color:red"></div>
                        <input type="text" placeholder="Street Name" name="street" id="street"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid phone.</span>
                    </label>
                    <label class="name">
					<div id="Ncity" style="color:red" ></div>
                        <input type="text" placeholder="City" data-constraints="@Required @JustLetters" name="city" id="city"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					<label class="name">
					<div style="font-weight:bold">
					Country:&nbsp;<div id="Ncountry" style="color:red" ></div>
                    </div>
                        <select name="country" id="country" onChange="FillState(document.insert.country, document.insert.state, '');"  class="selectboxOne boxx">
							<option selected="selected" value="selected">
							Select One
							</option>
							<option value="usa">
							United States of America
							</option>
						</select>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					
					
                    <label class="name">
					<div style="font-weight:bold">
					State:&nbsp;<div id="Nstate" style="color:red" ></div>
                    </div>
                        <select name="state" id="insert_state" class="selectboxOne boxx">
							 <option selected ="selected" value="selectd">
							   Select State
							 </option>
							 <option value="FL">
							   FL
							 </option>
							 <option value="VA">
							   VA
							 </option>
						</select>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
                    <label class="name">
					<div id="zipcode" style="color:red" ></div>
                        <input type="text" placeholder="Zip Code" data-constraints="@Required @JustNumbers" name="zipcode" id="zipcode"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					<%}else{%>
					<label class="phone">
					<div id="Nmobileno" style="color:red"></div>
                        <input type="text" placeholder="Phone" data-constraints="@Required @JustNumbers" name="mobileno" id="mobileno"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid phone.</span>
                    </label>
					
                    <label class="name">
					<div id="NinstitutionName" style="color:red" ></div>
                        <input type="text" placeholder="Institution Name" data-constraints="@Required @JustLetters" name="institutionName" id="institutionName"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					
                    <label class="name">
					<div id="street" style="color:red"></div>
                        <input type="text" placeholder="Street Name" name="street" id="street"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid phone.</span>
                    </label>
                    <label class="name">
					<div id="Ncity" style="color:red" ></div>
                        <input type="text" placeholder="City" data-constraints="@Required @JustLetters" name="city" id="city"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					<label class="name">
					<div style="font-weight:bold">
					Country:&nbsp;<div id="Ncountry" style="color:red" ></div>
                    </div>
                        <select name="country" id="country" onChange="FillState(document.insert.country, document.insert.state, '');"  class="selectboxOne boxx">
							<option selected="selected" value="selected">
							Select One
							</option>
							<option value="usa">
							United States of America
							</option>
						</select>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					
					
                    <label class="name">
					<div style="font-weight:bold">
					State:&nbsp;<div id="Nstate" style="color:red" ></div>
                    </div>
                        <select name="state" id="insert_state" class="selectboxOne boxx">
							 <option selected ="selected" value="selectd">
							   Select State
							 </option>
							 <option value="FL">
							   FL
							 </option>
							 <option value="VA">
							   VA
							 </option>
						</select>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
                    <label class="name">
					<div id="zipcode" style="color:red" ></div>
                        <input type="text" placeholder="Zip Code" data-constraints="@Required @JustNumbers" name="zipcode" id="zipcode"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					<%}%>
					<%
               if(purchase.equalsIgnoreCase("buy_now") && purchase != null)
               
               {
			   String productPlan=(String)request.getAttribute("productPlan");
               
               %>
					
                    <label class="name">
					<div style="font-weight:bold">
					Payment Plan:
                    </div>
                        <%  if(productPlan.equalsIgnoreCase("Basic") && productPlan != null)
               
               {%>
					<input type="radio" name="Productplan" id="Productplan" value="Basic"  checked="checked"/>
                     Basic
					 <input type="radio" name="Productplan" id="Productplan1" value="Silver" />
                     Silver
                     <input type="radio" name="Productplan" id="Productplan2" value="Gold" />
                     Gold 
					 <input type="radio" name="Productplan" id="Productplan3" value="Platinum" />
                     Platinum 
					 <%} else if(productPlan.equalsIgnoreCase("Silver") && productPlan != null){%>
					 <input type="radio" name="Productplan" id="Productplan" value="Basic" />
                     Basic
                     <input type="radio" name="Productplan" id="Productplan1" value="Silver" checked="checked"/>
                     Silver
                     <input type="radio" name="Productplan" id="Productplan2" value="Gold" />
                     Gold 
					 <input type="radio" name="Productplan" id="Productplan3" value="Platinum" />
                     Platinum 
					 <%}else if(productPlan.equalsIgnoreCase("Gold") && productPlan != null){%>
					  <input type="radio" name="Productplan" id="Productplan" value="Basic" />
                     Basic
                     <input type="radio" name="Productplan" id="Productplan1" value="Silver" />
                     Silver
                     <input type="radio" name="Productplan" id="Productplan2" value="Gold" checked="checked"/>
                     Gold 
					 <input type="radio" name="Productplan" id="Productplan3" value="Platinum" />
                     Platinum 
					 <%}else if(productPlan.equalsIgnoreCase("Platinum") && productPlan != null){%>
					 <input type="radio" name="Productplan" id="Productplan" value="Basic" />
                     Basic
                     <input type="radio" name="Productplan" id="Productplan1" value="Silver" />
                     Silver
                     <input type="radio" name="Productplan" id="Productplan2" value="Gold" />
                     Gold 
					 <input type="radio" name="Productplan" id="Productplan3" value="Platinum" checked="checked"/>
                     Platinum 
					 <%}%>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					<div id="Nstate" style="color:red" ></div>
                    <label class="name">
					<div style="font-weight:bold">
					Subscription Type:
                    </div>
                        <input type="radio" name="plan" id="plan" value="monthly" class="radioBtnClass">
                    Monthly
                     <input type="radio" name="plan" id="plan1" value="quarterly" checked="checked" class="radioBtnClass">
                     Quarterly(Save 10%)
                     <input type="radio" name="plan" id="plan2" value="annual" class="radioBtnClass">
                     Annual(Save 25%)  
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					<% if(productPrice != null){
				 String productPlan1 = (String)request.getAttribute("productPlan");
                 int ap = Integer.parseInt(productPrice);
				 System.out.println("ap:::::::::::::::::::in JSP :::"+ap);
				 String cost = null;
				 int intCost;
				 String totalCost = null;
                 int n=ap*3;
                 int m=n*10/100;
				
                 int am=n-m;
				 if(productPlan1 !=null && productPlan1.equalsIgnoreCase("Basic")){
				 cost = "0";
				 
				 }else if(productPlan1 !=null && productPlan1.equalsIgnoreCase("Silver")){
				 cost = "999";
				 
				 }else if(productPlan1 !=null && productPlan1.equalsIgnoreCase("Gold")){
				 cost = "3999";
				
				 }else if(productPlan1 !=null && productPlan1.equalsIgnoreCase("Platinum")){
				 cost = "14999";
				
				 }
                 productPrice=Integer.toString(am);
				 intCost = am + Integer.parseInt(cost);
				 totalCost=Integer.toString(intCost);
				  System.out.println("productPrice:::::::::::::::::::in JSP :::"+productPrice);
				  System.out.println("totalCost:::::::::::::::::::in JSP :::"+totalCost);
                 %>
					<input type="hidden" name="amount" id="oneTimeCost" value="<%=cost%>">
					
                    <label class="name">
					<div style="font-weight:bold">
					Subscription Cost:&nbsp;&#36;
                    </div>
                        <input type="text" placeholder="City" data-constraints="@Required @JustNumbers" name="productPrice1" id="fee" value="<%=productPrice%>"  readonly/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					
                    <label class="name">
					<div style="font-weight:bold">
					One Time Setup Cost:&nbsp;&#36;
                    </div>
                        <input type="text" placeholder="City" data-constraints="@Required @JustNumbers" name="oneTimeSetupPrice" id="oneTimeSetupPrice"  value="<%=cost%>"  readonly/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
                    
                    <label class="name">
					<div style="font-weight:bold">
					Coupon Code:
                    </div>
					<div id="coupon_error" style="color:red"></div>
                        <input type="text" placeholder="Apply Coupon Code here:" name="couponcode" id="couponcode"/>
                        <input type="button" name="coupon" id="coupon" value="Apply" class="gradBtn">
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					
                    <label class="name">
					<div style="font-weight:bold">
					Total Amount To be Charged:&nbsp;&#36;
                    </div>
                        <input type="text" placeholder="City" data-constraints="@Required @JustNumbers" name="productPrice" id="total"  value="<%=totalCost%>"  readonly/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					<% }else{%>
					
                    <label class="name">
					<div style="font-weight:bold">
					Total Amount To be Charged:&nbsp;&#36;
                    </div>
                        <input type="text" placeholder="City" data-constraints="@Required @JustNumbers" name="fee" id="productPrice"  value="<%=productPrice%>"  readonly/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					<%}%>
                    <%}%>
					<% if(purchase.equalsIgnoreCase("try_now") && purchase != null && coupon_code == null){%>
					<label class="name" style="color:green;" align="center">
					We won't charge up to end of the trial period.
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					
                    <label class="name">
					<div style="font-weight:bold">Card Type:&nbsp;<div id="Ncredit" style="color:red" ></div></div>
					<input type="radio" size="10" name="credit_card_type" value="visa" />
                             <img src="images/visa.png" id="visa" name="visa" height="35px" width="45px"/>
                             <input type="radio" size="10" name="credit_card_type" value="mastercard" />
                             <img src="images/master.png" id="master" name="master" height="35px" width="45px"/>
                             <input type="radio" size="10" name="credit_card_type" value="amex" />
                             <img src="images/american.png" id="american" name="american" height="35px" width="45px"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					
                    <label class="name">
					<div id="Ncreditno" style="color:red" ></div>
                        <input type="text" placeholder="Credit Card No" data-constraints="@Required @JustNumbers" name="credit_card_no" id="credit_card_no"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					
                    <label class="name">
					<div id="Ncvv" style="color:red" ></div>
                        <input placeholder="CVV No" data-constraints="@Required @JustNumbers" type="password" name="cvv_no" id="cvv_no"  maxlength="3" size="5"/>
						<!--img src="images/cvv.png" style="padding-left:15px" id="visa" name="visa" height="35px" width="65px"-->
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					
                    <label class="name">
					<div id="Namec" style="color:red" ></div>
                        <input type="text" placeholder="Name on Card" data-constraints="@Required @JustLetters" name="name_on_card" id="name_on_card"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					
                    <label class="name">
					<div id="Nexp" style="color:red" ></div>
                        <input type="text" placeholder="Expiry Month (MM)" data-constraints="@Required @JustNumbers" name="expiry_month" id="expiry_month"  maxlength="2" size="2"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					<label class="name">
					<div id="Nexpy" style="color: red;"></div>
                        <input type="text" placeholder="Expiry Year (YYYY)" data-constraints="@Required @JustNumbers" name="expiry_year" id="expiry_year"  maxlength="4" value="" size="4" />
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					<%}else if (purchase.equalsIgnoreCase("try_now") && purchase != null && coupon_code != null){%>
					<%}else{ %>
					<label class="name">
					<div style="font-weight:bold">Card Type:&nbsp;<div id="Ncredit" style="color:red" ></div></div>
					<input type="radio" size="10" name="credit_card_type" value="visa" />
                             <img src="images/visa.png" id="visa" name="visa" height="35px" width="45px"/>
                             <input type="radio" size="10" name="credit_card_type" value="mastercard" />
                             <img src="images/master.png" id="master" name="master" height="35px" width="45px"/>
                             <input type="radio" size="10" name="credit_card_type" value="amex" />
                             <img src="images/american.png" id="american" name="american" height="35px" width="45px"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					
                    <label class="name">
					<div id="Ncreditno" style="color:red" ></div>
                        <input type="text" placeholder="Credit Card No" data-constraints="@Required @JustNumbers" name="credit_card_no" id="credit_card_no"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					
                    <label class="name">
					<div id="Ncvv" style="color:red" ></div>
                        <input placeholder="CVV No" data-constraints="@Required @JustNumbers" type="password" name="cvv_no" id="cvv_no"  maxlength="3" size="5"/>
						<!--img src="images/cvv.png" style="padding-left:15px" id="visa" name="visa" height="35px" width="65px"-->
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					
                    <label class="name">
					<div id="Namec" style="color:red" ></div>
                        <input type="text" placeholder="Name on Card" data-constraints="@Required @JustLetters" name="name_on_card" id="name_on_card"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					
                    <label class="name">
					<div id="Nexp" style="color:red" ></div>
                        <input type="text" placeholder="Expiry Month (MM)" data-constraints="@Required @JustNumbers" name="expiry_month" id="expiry_month"  maxlength="2" size="2"/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					<label class="name">
					<div id="Nexpy" style="color: red;"></div>
                        <input type="text" placeholder="Expiry Year (YYYY)" data-constraints="@Required @JustNumbers" name="expiry_year" id="expiry_year"  maxlength="4" value="" size="4" />
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label> 
					 <%}%>
					 <%if (purchase.equalsIgnoreCase("try_now") && purchase != null && coupon_code != null){%>
					<%}else if (purchase.equalsIgnoreCase("try_now") && purchase != null && coupon_code == null){%>
					 <label class="name">
                        <div style="color:red">(*) Please Read the Terms & Conditions by Scrolling the way down</div>
                    </label> 
					<label class="name">
						<div class="divtext" style="border:1px solid; width:auto; height:300px; overflow-y:scroll; font-size:12px; text-align:justify;"  onscroll="OnScrollDiv (this)">
							<h1><strong>RETURN, REFUND AND EXCHANGE POLICY</strong></h1>

							<p>&nbsp;Please read the following policies carefully before using any of digiBlitz’s products or platform(s). The return policy is provided in addition to any legal return rights that you may have under law. digiBlitz Inc. will accept returns, refunds and exchanges within 15 days from the day of purchasing the product(s) or platform(s). digiBlitz Inc has rights to refuse any return or exchange if it fails to meet the norms.</p>
							&nbsp;
							<h1><strong>1.	TERMS OF USE AND RESALE</strong></h1>
							<p>&nbsp;THOUGH DIGIBLITZ INC. ALLOWS YOU TO ACCESS VARIOUS RESOURCES THROUGH ITS ONLINE (CLOUD) OR ENTERPRISE PRODUCT(S) & PLATFORM(S), WEBSITE, DB STORE, AND OTHER SELLABLE GOODS THAT MAY OR MAY NOT BE AVAILABLE FOR PURCHASE, OR DOWNLOAD, INFORMATION OF SOFTWARE, INCLUDING THE  SOFTWARE AND TOOLS (COLLECTIVELY "SERVICES") ARE SUBJECT TO THESE TERMS OF USE AND SALE ("TERMS OF USE AND RESALE" OR "CONTRACT").</p>
							&nbsp;
							<p>&nbsp;By using digiBlitz’s and its Products’ Website, Purchasing/ downloading products and services from the digiBlitz’s website,  its Products’  website, dB store or through any authorized reseller, you accept and agree to TERMS OF USE AND RESALE, DIGIBLITZ PRIVACY STATEMENT, and APPLICABLE TERMS AND CONDITIONS, policies or disclaimers found in the digiBlitz Inc. or referenced herein and accessible through the related hyperlinks. We allow you to read the digiBlitz Inc. Policies carefully.</p>
							&nbsp;

							<h1><strong>2.	TERMS RELATING TO YOUR USE OF THE DB STORE</strong></h1>

							&nbsp;<strong>2.1.	PERSONAL AND COMMERCIAL USE LIMITATION</strong>
							<p>&nbsp;Unless otherwise specified, the Products, Components Of dB store and Services are only for your personal and commercial use. You may not profitably distribute, circulate, license, or trade any information or services obtained from the Websites, Products, components of dB store and their respective Services.</p>
							&nbsp;
							&nbsp;
							<strong>2.2.	NOTICE SPECIFIC TO DOCUMENTS AVAILABLE ON THE WEBSITE OR SERVICES</strong>
							<p>&nbsp;Permission to use Documents and information (such as white papers, press releases, datasheets, Product literatures, Manuals of any kind and FAQs) from the Websites, Products, components of dB store and their respective Services is allowed for your personal and commercial use.</p>
							&nbsp;
							 <p>Use of such records from digiBlitz Inc. or Services is for informational and profitably or personal use only and will not be copied or posted on any network computer or make public in any media, unless permitted by freedom from a responsibility under applicable copyright </p>
							 &nbsp;
							<p>laws. You could however with prior permission from digiBlitz Inc., could use the information provided, the following Copyright notice: "© 2016 digiBlitz Inc., All rights reserved." appears in all copies and that both the copyright notice and this permission notice appear.</p>
							&nbsp;
							<p>Website: Any digiBlitz Inc. owned, operated, licensed or controlled website. Elements of digiBlitz Inc. websites, including the Website, are protected by trademark, unfair competition, and other laws and may not be copied or imitated in whole or in part. No logo, graphic, sound or image from any digiBlitz Inc. website, including the Website, may be copied, retransmitted or made available unless expressly permitted by digiBlitz Inc. or applicable law.</p>
							&nbsp;
							<p>The documents and related graphics published on any digiBlitz Inc. owned, operated, licensed or controlled website and dB Store or Services could include technical inaccuracies or typographical errors. Changes may be periodically added to the information without prior notice. digiBlitz Inc. and/or its respective suppliers may make improvements and/or changes in the product(s) and/or the platform(s) and/or dB store described herein at any time.</p>
							&nbsp;

							<strong>2.3.	MEMBER ACCOUNT, PASSWORD, AND SECURITY</strong>
							<p>If you want to open any account in any dB products, information should be complete, accurate, and current as required by the applicable registration form. Username and password may or may not be generated by digiBlitz Inc. depending upon the case. However, you are responsible for keeping your account information and password confidential and be responsible for all activity that occurs under your account. You agree to notify digiBlitz Inc. without delay of any unauthorized use of your account or any other breach of security.</p>
							&nbsp;

							<strong>2.4.	NO UNLAWFUL OR PROHIBITED USE</strong>
							<p>As a condition of your use of the Services, you pledge to us that you will not use the Services for any purpose that is against the law or disallowed by these terms, conditions, & notices. You may not use our product(s), platform(s) or component(s) of dB store which would cause damage, disable or crash any server, or the network(s) connected to any digiBlitz’s server, or interfere with any other party's use and enjoyment of any Services. You may not try to gain unauthorized access to any Services, computer systems or networks connected to any digiBlitz’s Server or to any of the Server. You may not use the services in a way that violate rights of third parties, carelessly harming a person or entity, including digiBlitz. digiBlitz has right to make any information public.</p>
							&nbsp;
							<strong>2.5.	MATERIALS PROVIDED TO digiBlitz Inc. PRODUCTS OR POST ON THE WEBSITE BY YOU</strong>
							<p>digiBlitz Inc does not claim ownership of the materials you provide to digiBlitz Inc. (including feedback, ratings, and suggestions) or post, upload, input or submit to any Product or its connected  services for review by the users, or by the members of any public or private area of people (each a "Submission" and collectively "Submissions"). However, digiBlitz Inc. shall be permitted to use your Submission, including your name, for the purpose for which it was submitted. No compensation will be paid for you Submission. digiBlitz Inc.  has rights to remove any Submission at any time in its own discretion.</p>
							&nbsp;

							<strong>2.6.	THIRD-PARTY LINKS IN OUR WEBSITE</strong>
							<p>The dB store or any product(s) or platform(s) may include links to third-party websites that allow you leave the digiBlitz Inc. Website. 
							The digiBlitz Inc is not responsible for any internal link or contents of third party website. These linked sites are not under the control of digiBlitz Inc. digiBlitz Inc. is providing these links only for your convenience. Your use of the third-party website may be subject to that third party’s terms and conditions.</p>

							<h1><strong>3.	3.	TERMS RELATING TO THE RESALE OF PRODUCTS TO YOU</strong></h1>
							&nbsp;
							<strong>3.1.	USERS</strong>
							<p>You must not be a reseller. Only the end users are allowed to buy our product.</p>
							&nbsp;

							<strong>3.2.	INFORMATION ABOUT BILLING AND ACCOUNT INFORMATION</strong>
							<p>The information provided to digiBlitz Inc. by you for all purchases should be accurate current and complete and .You agree to update your account and other information immediately, including your email address and credit card numbers and expiration dates, so that we can complete your transactions and contact you as needed.</p>
							&nbsp;

							<strong>3.3.	PRODUCT AVAILABILITY AND QUANTITY AND ORDER LIMITS</strong>

							<p>Pricing page of our product can be changed at any time without notice. digiBlitz Inc. may limit on the number that may be purchased per account, per person, per order,  per credit card, or per CPU and core. We have rights to refuse or reject any order at any time, refunding you any money you have paid for the order, for reasons which include, but are not limited to, you have follow the conditions specified at the time of the order, otherwise your payment cannot be processed. In case if we are unable to supply our product, we will contact you and we will make an alternative. If you do not choose to purchase the alternative product, we will cancel your order. If the product has some error, we reserve the right to correct the error and charge you the correct price. In that case will offer you the option of purchasing the product and also for cancelling the order. Credits or refunds will be made to the same method of payment and account used to place the order.</p>
							&nbsp;

							<strong>3.4.	SOFTWARE PURCHASES AND LICENSE TERMS</strong>
							<p>Any software made available to download or purchase from the website or dB store is the copyrighted work of digiBlitz Inc. When you purchase software, you are actually purchasing a license to use the software rather than purchasing the software itself. Software licenses purchased form any of digiBlitz’s owned or controlled website or from an authorized reseller are subject to the license agreement that accompanies the software (the "License Agreement"). You will be required to agree to the terms and conditions of the License Agreement when you install the software.</p>
							&nbsp;
							<p>Any reproduction or redistribution of software or merchandise not in accordance with the relevant License Agreement and applicable law is expressly prohibited and may result in severe civil and criminal penalties. Violators risk being prosecuted to the maximum extent possible.</p>
							&nbsp;

							<strong>3.5.	Refund</strong>
							<p>Refunds will be made in the same method as above. For refund the intimation should be given to digiBlitz Inc.by customer and it will be processed with 15 days.</p>

							<h1><strong>Terms and Condition</strong></h1>

							<strong>1.	Payment and pricing:</strong>
							<p>Pricing of all products are stated in digiBlitz’s relevant product or platform websites. Pricing page of our product(s) and platform(s) can be changed at any time without notice. digiBlitz Inc. may limit on the number that may be purchased per order, per account, per credit card, per person or per CPU. Pricing shown in the website will include all tax and charges of the product.</p>
							&nbsp;

							<strong>2.	AUTO RENEWAL OF THE PRODUCTS</strong>
							<p>All products of digiBlitz Inc.  will be renewed automatically at the end of each month on a prorate basis or depending up on the date of purchase (depending upon individual cases). We will also inform you about the renewal through email before the subscription of the product. Once we informed you about the auto renewal, we will charge automatically for the product. The intimation will be given before one week from the renewal to digiBlitz Inc. by the customer .We will provide you with instruction on cancelling the product service or for suspending the product. However, no intimation will be given to you for subscription renewal of any dB store components. You must cancel the services before the renewal date to avoid being billed for the renewal.</p>
							&nbsp;

							<strong>3.	Return, Refund and Exchange</strong>
							<p>The return policy is provided in addition to any legal return rights that you may have under law. digiBlitz Inc. will accept returns, refunds and exchanges within 30 day after purchasing of product. We have rights to refuse any refund, return or exchange if it fails to meet our norm. For Return, Refund and Exchange the intimation should be given before one week from the renewal to digiBlitz Inc. by the customer and it will be processed within 30 days. We may occasionally extend the 15-day return period during holiday or other periods. If a longer return period was advertised through a promotional campaign on the Website when you made your purchase, that applies within the clause mentioned in the promotional campaign.</p>
							&nbsp;

							<strong>4.	Trial-period</strong>
							<p>If you are taking part in any trial-period, you must cancel the service before the end of the trial period to avoid incurring new charges unless we notify you otherwise. Your trial subscription will be automatically upgraded to basic pack at the end of this free subscription period. This implies that your credit card will be charged for the basic pack. However, you could unsubscribe the product any time before the trial expiry through the Master account management link that is accessible when you login into the product.</p>

							<strong>5.	Customer support</strong>
							Please visit our Knowledge base site for Customer support and Assistance relating to the product.
							&nbsp;

							<strong>6.	CHANGING TERMS</strong>
							<p>digiBlitz Inc. may change the Terms of Return, Refund and Exchange at any time and without notice to you. The Terms of Return, Refund and Exchange in force at the time you place your order will govern your purchase and serve as the purchase contract between us. Before your next purchase, digiBlitz Inc. may change their policies. We advise you to visit the digiBlitz Inc. website, to review the current terms and condition, Refund and Return policy each time.</p>
							&nbsp;

							<strong>7.	PROTECTION OF INDIVIDUAL INFORMATION</strong>
							<p>Your privacy is important to us. We may use certain information for the purpose of your product according to your need.</p>
							&nbsp;

							<strong>8.	LIMITATION OF LIABILITY</strong>
							<p>In this section of Contract, digiBlitz Inc. is found liable to you for any loss or damage that arises out of or is in any way connected with your use of the dB Store, the Services, or any product or service offered, you agree that your exclusive remedy is to recover from digiBlitz Inc.  or any affiliates, and vendors direct damages up to (1) an amount equal to the price or fee for one month of any service or subscription or (2) US $100 if there was no service, subscription or similar fee.</p>
							&nbsp;
							<p>YOU AGREE THAT YOU CAN'T RECOVER ANY OTHER DAMAGES OR LOSSES, INCLUDING, WITHOUT LIMITATION, CONSEQUENTIAL, LOST PROFITS, SPECIAL, INDIRECT, INCIDENTAL, OR CONCERNING PUNISHMENT. THESE LIMITATIONS AND EXCLUSIONS APPLY EVEN IF YOU INCUR DAMAGES AND EVEN IF WE KNEW OR SHOULD HAVE KNOWN ABOUT THE POSSIBILITY OF THE DAMAGES. THESE LIMITATIONS AND EXCLUSIONS APPLY TO ANYTHING RELATED TO THE WEBSITE OWNED AND CONTROLLED BY DIGIBLITZ INC., ITS PRODUCT (S), PLATFORM(S) OR ANY COMPONENTS OF DB STORE, OR SERVICE OFFERED</p>
							&nbsp;

							<strong>9.	Interpreting the Contract</strong>
							<p>All parts of this Contract apply to the maximum extent permitted by the relevant law of the United States.</p>
							&nbsp;
								
							
							</div>
					</label>
					
					<label class="name">
					<div id="Nselect" style="color: red;"></div>
					<input type = "checkbox" name ="accept" disabled="disabled" id="check"/>I agree to the user License agreement and privacy policy
					</label>
					
					<!-- label class="name">
					<div id="Nagree" style="color: red;"></div>
					<input type="checkbox" name="agree"/>I Hereby Declare that all the Statements made by me in the Application from and Information sheet are true and complete to the best of my knowledge.
					</label-->
					<%}else{%>
					<label class="name">
                        <div style="color:red">(*) Please Read the Terms & Conditions by Scrolling the way down</div>
                    </label> 
					<label class="name">
						<div class="divtext" style="border:1px solid; width:auto; height:300px; overflow-y:scroll; font-size:12px; text-align:justify;"  onscroll="OnScrollDiv (this)">
							<h1><strong>RETURN, REFUND AND EXCHANGE POLICY</strong></h1>

							<p>&nbsp;Please read the following policies carefully before using any of digiBlitz’s products or platform(s). The return policy is provided in addition to any legal return rights that you may have under law. digiBlitz Inc. will accept returns, refunds and exchanges within 15 days from the day of purchasing the product(s) or platform(s). digiBlitz Inc has rights to refuse any return or exchange if it fails to meet the norms.</p>
							&nbsp;
							<h1><strong>1.	TERMS OF USE AND RESALE</strong></h1>
							<p>&nbsp;THOUGH DIGIBLITZ INC. ALLOWS YOU TO ACCESS VARIOUS RESOURCES THROUGH ITS ONLINE (CLOUD) OR ENTERPRISE PRODUCT(S) & PLATFORM(S), WEBSITE, DB STORE, AND OTHER SELLABLE GOODS THAT MAY OR MAY NOT BE AVAILABLE FOR PURCHASE, OR DOWNLOAD, INFORMATION OF SOFTWARE, INCLUDING THE  SOFTWARE AND TOOLS (COLLECTIVELY "SERVICES") ARE SUBJECT TO THESE TERMS OF USE AND SALE ("TERMS OF USE AND RESALE" OR "CONTRACT").</p>
							&nbsp;
							<p>&nbsp;By using digiBlitz’s and its Products’ Website, Purchasing/ downloading products and services from the digiBlitz’s website,  its Products’  website, dB store or through any authorized reseller, you accept and agree to TERMS OF USE AND RESALE, DIGIBLITZ PRIVACY STATEMENT, and APPLICABLE TERMS AND CONDITIONS, policies or disclaimers found in the digiBlitz Inc. or referenced herein and accessible through the related hyperlinks. We allow you to read the digiBlitz Inc. Policies carefully.</p>
							&nbsp;

							<h1><strong>2.	TERMS RELATING TO YOUR USE OF THE DB STORE</strong></h1>

							&nbsp;<strong>2.1.	PERSONAL AND COMMERCIAL USE LIMITATION</strong>
							<p>&nbsp;Unless otherwise specified, the Products, Components Of dB store and Services are only for your personal and commercial use. You may not profitably distribute, circulate, license, or trade any information or services obtained from the Websites, Products, components of dB store and their respective Services.</p>
							&nbsp;
							&nbsp;
							<strong>2.2.	NOTICE SPECIFIC TO DOCUMENTS AVAILABLE ON THE WEBSITE OR SERVICES</strong>
							<p>&nbsp;Permission to use Documents and information (such as white papers, press releases, datasheets, Product literatures, Manuals of any kind and FAQs) from the Websites, Products, components of dB store and their respective Services is allowed for your personal and commercial use.</p>
							&nbsp;
							 <p>Use of such records from digiBlitz Inc. or Services is for informational and profitably or personal use only and will not be copied or posted on any network computer or make public in any media, unless permitted by freedom from a responsibility under applicable copyright </p>
							 &nbsp;
							<p>laws. You could however with prior permission from digiBlitz Inc., could use the information provided, the following Copyright notice: "© 2016 digiBlitz Inc., All rights reserved." appears in all copies and that both the copyright notice and this permission notice appear.</p>
							&nbsp;
							<p>Website: Any digiBlitz Inc. owned, operated, licensed or controlled website. Elements of digiBlitz Inc. websites, including the Website, are protected by trademark, unfair competition, and other laws and may not be copied or imitated in whole or in part. No logo, graphic, sound or image from any digiBlitz Inc. website, including the Website, may be copied, retransmitted or made available unless expressly permitted by digiBlitz Inc. or applicable law.</p>
							&nbsp;
							<p>The documents and related graphics published on any digiBlitz Inc. owned, operated, licensed or controlled website and dB Store or Services could include technical inaccuracies or typographical errors. Changes may be periodically added to the information without prior notice. digiBlitz Inc. and/or its respective suppliers may make improvements and/or changes in the product(s) and/or the platform(s) and/or dB store described herein at any time.</p>
							&nbsp;

							<strong>2.3.	MEMBER ACCOUNT, PASSWORD, AND SECURITY</strong>
							<p>If you want to open any account in any dB products, information should be complete, accurate, and current as required by the applicable registration form. Username and password may or may not be generated by digiBlitz Inc. depending upon the case. However, you are responsible for keeping your account information and password confidential and be responsible for all activity that occurs under your account. You agree to notify digiBlitz Inc. without delay of any unauthorized use of your account or any other breach of security.</p>
							&nbsp;

							<strong>2.4.	NO UNLAWFUL OR PROHIBITED USE</strong>
							<p>As a condition of your use of the Services, you pledge to us that you will not use the Services for any purpose that is against the law or disallowed by these terms, conditions, & notices. You may not use our product(s), platform(s) or component(s) of dB store which would cause damage, disable or crash any server, or the network(s) connected to any digiBlitz’s server, or interfere with any other party's use and enjoyment of any Services. You may not try to gain unauthorized access to any Services, computer systems or networks connected to any digiBlitz’s Server or to any of the Server. You may not use the services in a way that violate rights of third parties, carelessly harming a person or entity, including digiBlitz. digiBlitz has right to make any information public.</p>
							&nbsp;
							<strong>2.5.	MATERIALS PROVIDED TO digiBlitz Inc. PRODUCTS OR POST ON THE WEBSITE BY YOU</strong>
							<p>digiBlitz Inc does not claim ownership of the materials you provide to digiBlitz Inc. (including feedback, ratings, and suggestions) or post, upload, input or submit to any Product or its connected  services for review by the users, or by the members of any public or private area of people (each a "Submission" and collectively "Submissions"). However, digiBlitz Inc. shall be permitted to use your Submission, including your name, for the purpose for which it was submitted. No compensation will be paid for you Submission. digiBlitz Inc.  has rights to remove any Submission at any time in its own discretion.</p>
							&nbsp;

							<strong>2.6.	THIRD-PARTY LINKS IN OUR WEBSITE</strong>
							<p>The dB store or any product(s) or platform(s) may include links to third-party websites that allow you leave the digiBlitz Inc. Website. 
							The digiBlitz Inc is not responsible for any internal link or contents of third party website. These linked sites are not under the control of digiBlitz Inc. digiBlitz Inc. is providing these links only for your convenience. Your use of the third-party website may be subject to that third party’s terms and conditions.</p>

							<h1><strong>3.	3.	TERMS RELATING TO THE RESALE OF PRODUCTS TO YOU</strong></h1>
							&nbsp;
							<strong>3.1.	USERS</strong>
							<p>You must not be a reseller. Only the end users are allowed to buy our product.</p>
							&nbsp;

							<strong>3.2.	INFORMATION ABOUT BILLING AND ACCOUNT INFORMATION</strong>
							<p>The information provided to digiBlitz Inc. by you for all purchases should be accurate current and complete and .You agree to update your account and other information immediately, including your email address and credit card numbers and expiration dates, so that we can complete your transactions and contact you as needed.</p>
							&nbsp;

							<strong>3.3.	PRODUCT AVAILABILITY AND QUANTITY AND ORDER LIMITS</strong>

							<p>Pricing page of our product can be changed at any time without notice. digiBlitz Inc. may limit on the number that may be purchased per account, per person, per order,  per credit card, or per CPU and core. We have rights to refuse or reject any order at any time, refunding you any money you have paid for the order, for reasons which include, but are not limited to, you have follow the conditions specified at the time of the order, otherwise your payment cannot be processed. In case if we are unable to supply our product, we will contact you and we will make an alternative. If you do not choose to purchase the alternative product, we will cancel your order. If the product has some error, we reserve the right to correct the error and charge you the correct price. In that case will offer you the option of purchasing the product and also for cancelling the order. Credits or refunds will be made to the same method of payment and account used to place the order.</p>
							&nbsp;

							<strong>3.4.	SOFTWARE PURCHASES AND LICENSE TERMS</strong>
							<p>Any software made available to download or purchase from the website or dB store is the copyrighted work of digiBlitz Inc. When you purchase software, you are actually purchasing a license to use the software rather than purchasing the software itself. Software licenses purchased form any of digiBlitz’s owned or controlled website or from an authorized reseller are subject to the license agreement that accompanies the software (the "License Agreement"). You will be required to agree to the terms and conditions of the License Agreement when you install the software.</p>
							&nbsp;
							<p>Any reproduction or redistribution of software or merchandise not in accordance with the relevant License Agreement and applicable law is expressly prohibited and may result in severe civil and criminal penalties. Violators risk being prosecuted to the maximum extent possible.</p>
							&nbsp;

							<strong>3.5.	Refund</strong>
							<p>Refunds will be made in the same method as above. For refund the intimation should be given to digiBlitz Inc.by customer and it will be processed with 15 days.</p>

							<h1><strong>Terms and Condition</strong></h1>

							<strong>1.	Payment and pricing:</strong>
							<p>Pricing of all products are stated in digiBlitz’s relevant product or platform websites. Pricing page of our product(s) and platform(s) can be changed at any time without notice. digiBlitz Inc. may limit on the number that may be purchased per order, per account, per credit card, per person or per CPU. Pricing shown in the website will include all tax and charges of the product.</p>
							&nbsp;

							<strong>2.	AUTO RENEWAL OF THE PRODUCTS</strong>
							<p>All products of digiBlitz Inc.  will be renewed automatically at the end of each month on a prorate basis or depending up on the date of purchase (depending upon individual cases). We will also inform you about the renewal through email before the subscription of the product. Once we informed you about the auto renewal, we will charge automatically for the product. The intimation will be given before one week from the renewal to digiBlitz Inc. by the customer .We will provide you with instruction on cancelling the product service or for suspending the product. However, no intimation will be given to you for subscription renewal of any dB store components. You must cancel the services before the renewal date to avoid being billed for the renewal.</p>
							&nbsp;

							<strong>3.	Return, Refund and Exchange</strong>
							<p>The return policy is provided in addition to any legal return rights that you may have under law. digiBlitz Inc. will accept returns, refunds and exchanges within 30 day after purchasing of product. We have rights to refuse any refund, return or exchange if it fails to meet our norm. For Return, Refund and Exchange the intimation should be given before one week from the renewal to digiBlitz Inc. by the customer and it will be processed within 30 days. We may occasionally extend the 15-day return period during holiday or other periods. If a longer return period was advertised through a promotional campaign on the Website when you made your purchase, that applies within the clause mentioned in the promotional campaign.</p>
							&nbsp;

							<strong>4.	Trial-period</strong>
							<p>If you are taking part in any trial-period, you must cancel the service before the end of the trial period to avoid incurring new charges unless we notify you otherwise. Your trial subscription will be automatically upgraded to basic pack at the end of this free subscription period. This implies that your credit card will be charged for the basic pack. However, you could unsubscribe the product any time before the trial expiry through the Master account management link that is accessible when you login into the product.</p>

							<strong>5.	Customer support</strong>
							Please visit our Knowledge base site for Customer support and Assistance relating to the product.
							&nbsp;

							<strong>6.	CHANGING TERMS</strong>
							<p>digiBlitz Inc. may change the Terms of Return, Refund and Exchange at any time and without notice to you. The Terms of Return, Refund and Exchange in force at the time you place your order will govern your purchase and serve as the purchase contract between us. Before your next purchase, digiBlitz Inc. may change their policies. We advise you to visit the digiBlitz Inc. website, to review the current terms and condition, Refund and Return policy each time.</p>
							&nbsp;

							<strong>7.	PROTECTION OF INDIVIDUAL INFORMATION</strong>
							<p>Your privacy is important to us. We may use certain information for the purpose of your product according to your need.</p>
							&nbsp;

							<strong>8.	LIMITATION OF LIABILITY</strong>
							<p>In this section of Contract, digiBlitz Inc. is found liable to you for any loss or damage that arises out of or is in any way connected with your use of the dB Store, the Services, or any product or service offered, you agree that your exclusive remedy is to recover from digiBlitz Inc.  or any affiliates, and vendors direct damages up to (1) an amount equal to the price or fee for one month of any service or subscription or (2) US $100 if there was no service, subscription or similar fee.</p>
							&nbsp;
							<p>YOU AGREE THAT YOU CAN'T RECOVER ANY OTHER DAMAGES OR LOSSES, INCLUDING, WITHOUT LIMITATION, CONSEQUENTIAL, LOST PROFITS, SPECIAL, INDIRECT, INCIDENTAL, OR CONCERNING PUNISHMENT. THESE LIMITATIONS AND EXCLUSIONS APPLY EVEN IF YOU INCUR DAMAGES AND EVEN IF WE KNEW OR SHOULD HAVE KNOWN ABOUT THE POSSIBILITY OF THE DAMAGES. THESE LIMITATIONS AND EXCLUSIONS APPLY TO ANYTHING RELATED TO THE WEBSITE OWNED AND CONTROLLED BY DIGIBLITZ INC., ITS PRODUCT (S), PLATFORM(S) OR ANY COMPONENTS OF DB STORE, OR SERVICE OFFERED</p>
							&nbsp;

							<strong>9.	Interpreting the Contract</strong>
							<p>All parts of this Contract apply to the maximum extent permitted by the relevant law of the United States.</p>
							&nbsp;
								
							
							</div>
					</label>
					
					<label class="name">
					<div id="Nselect" style="color: red;"></div>
					<input type = "checkbox" name ="accept" disabled="disabled" id="check"/>I agree to the user License agreement and privacy policy
					</label>
					
					<!-- label class="name">
					<div id="Nagree" style="color: red;"></div>
					<input type="checkbox" name="agree"/>I Hereby Declare that all the Statements made by me in the Application from and Information sheet are true and complete to the best of my knowledge.
					</label-->
					<%}%>
					<%if(purchase.equalsIgnoreCase("try_now") && purchase != null){%>
					<input type="hidden" id="payOption" name="payOption" value="<%=purchase%>" />
					<label class="name" align="center">
						<a class="btn color_3 text_3" href="">
						<input type="submit" name="Insert" value="Register" id="submit" onClick="return(onValidate());" style="background-color: transparent;border:none;cursor:pointer;font-weight:700">
						</a>
						<a class="btn color_3 text_3" href="">
						<input name="button" type="button" class="gradBtn" style=" background-color: transparent; border:none; cursor:pointer;font-weight:700"  onClick="javascript:history.back(-1);" value="Cancel" >
						</a>
					</label>
					<%} else if(purchase.equalsIgnoreCase("buy_now") && purchase != null){%>
					<input type="hidden" id="payOption" name="payOption" value="<%=purchase%>" />
					<label class="name" align="center">
						<a class="btn color_3 text_3" href="">
						<input  type="submit" name="Insert" value="Proceed" id="submit" onClick="return(onValidate());" style="background-color: transparent;border:none;cursor:pointer;font-weight:700">
						</a>
						<a class="btn color_3 text_3" href="">
						<input name="button" type="button" class="gradBtn" style=" background-color: transparent; border:none; cursor:pointer;font-weight:700"  onClick="javascript:history.back(-1);" value="Cancel" >
						</a>
					</label>
					<%}%>
					</form>
                </div>                                
            </div>   
			<div class="container_12">
                <div class="grid_12 center">
                   <a href="https://www.paypal.com/us/verified/pal=paypal%40digiblitz%2ecom" target="_blank"><img src="https://www.paypal.com/en_US/i/icon/verification_seal.gif" border="0" alt="Official PayPal Seal" style="width:80px;height:80px;"></a>
                   <a href="#" onClick="window.open('https://www.sitelock.com/verify.php?site=digiblitz.com','SiteLock','width=600,height=500,left=160,top=170');" >
                   <img alt="SiteLock" title="SiteLock" src="//shield.sitelock.com/shield/digiblitz.com" width="80px" height="40px"/>
                   </a>
                       &nbsp;
                   <span id="siteseal">
					<script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=rVTd0BptwwbkRS7ErqCst96o4A8qZWtbwmohz2yg6czXseVnRsCmqb4IHzw4">
                    </script>
                   </span>
                </div>
            </div>
        </div>
    </div>

</div>
	
				                              




<!--=======footer=================================-->
<footer>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/Footer.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </footer>
 <script language="javascript">
      FillCountry(document.insert.country, document.insert.state, 'USA' );
      FillState(document.insert.country, document.insert.state, '');
      
      FillCountry(document.insert.scountry_txt, document.insert.sstate_txt, 'USA' );
      FillState(document.insert.scountry_txt, document.insert.sstate_txt, '');
      
    </script>

</body>
</html>
