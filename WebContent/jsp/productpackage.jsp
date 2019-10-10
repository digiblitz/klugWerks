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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.*" %>
<%@ page import="com.hlchorse.form.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Profile Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/validate.js" type="text/javascript" ></script>
<script src="js/cscombo_new.js" type="text/javascript" ></script>
<script src="js/frmMembRegi.js" type="text/javascript" ></script>
<script src="js/EditMemberUserReg.js" type="text/javascript" ></script>
<script type="text/javascript">
<!-- Include JS File Here-->
window.onload = function() {
// Onload event of Javascript
// Initializing timer variable
var x = 5;
var y = document.getElementById("timer");
// Display count down for 20s
setInterval(function() {
if (x <= 6 && x >= 1) {
x--;
y.innerHTML = '' + x + '';
if (x == 1) {
x = 6;
}
}
}, 200);
// Form Submitting after 20s
var auto_refresh = setInterval(function() {
submitform();
}, 3333);
// Form submit function
function submitform() {

//alert('Form is submitting.....');
document.getElementById("loginForm1").submit();

}
// To validate form fields before submission

};</script>
</head>
<%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
<style>
    .vertical-line {
        width: 0;
        border: 1px solid #000000;
        height: 1px
		 
    }
</style>

<style type="text/css">
	   
	   .divtext{
      height: 22px;
    width: 610px;
    padding: 15px 0 15px 0;
    margin: 0 auto;
	
	}
	
	.labeltext{
	   float:left;
	   font-size:18px;
	}
	.submitlabeltext{
	   float:none;
	   font-size:18px;
	}
	.spantext{
	   float:right
	}
	.container_12{
		width:1170px!important;
		margin:0 auto;
		position:relative;
	}
	.container_12 .grid_12 {
    	width: 1170px!important;
		    padding: 10px 0;
	}
	.container_12 .grid_6 {
		width: 565px!important;
		float: left;
	}
	.bg1 {
    position: relative;
    background: url(../images/bg1.jpg) 0 0 repeat;
    padding: 30px 0!important;
}
	button.btn {
    background: green;
    outline: mediumaquamarine;
    border: none;
    padding: 8px 10px;
}
	button.btn1 {
    background: red;
    outline: mediumaquamarine;
    border: none;
    padding: 8px 10px;
}
	.box{    width: 350px!important;
    padding: 7px!important;
    border: none;
    border-radius: 4px;
    box-shadow: 0 1px 7px #ccc;
	margin:0!important;
	text-align:left!important;}
	
	.boxx{    width: 363px!important;
    padding: 7px -1px!important;
    border: none;
    border-radius: 4px;
    box-shadow: 0 1px 7px #ccc;
	margin:0!important;
	color:#FFFFFF;
	text-align:center!important;
	background-color:lightslategray}
	   </style>


<body>

<header>
<%@ include file = "../../include/HeaderProcess.jsp" %>
</header>
<div><%@ include file = "../../include/infobar.jsp" %></div>

<!--=======content================================-->
<div class="bg1" align="center">

<!--=======content================================-->


            <div class="container_12">
                <div class="grid_12 center" style="border:thin;border-style:groove;">
				
				<form action="masterAccount.html?profileCmd=updateproductppackage&email=<%=nullCheck((String)request.getAttribute("e_mail"))%>" method="post" name="uploadfile">
               <hidden name="hidplan_type" value="<%=nullCheck((String)request.getAttribute("Productplan"))%>"/>
                <hidden name="hidsubs_type" value="<%=nullCheck((String)request.getAttribute("subscription_plan"))%>"/>
                 <hidden name="hidpay_history" value="<%=nullCheck((String)request.getAttribute("amount"))%>"/>
                  <hidden name="hidSubs_expiry" value="<%=nullCheck((String)request.getAttribute("difference"))%>"/>
			
                  <div class="divtext"  align="center" >
						<h2>Product Package Details</h2>
						
					</div>
					<div class="divtext"  align="center" >
					
						<label class="labeltext">Plan Type: </label>
						<span class="spantext" ><input  type="text" name="plan_type" style="width:250px; height:20px;"  
value="<%=nullCheck((String)request.getAttribute("Productplan"))%>" class="box" readonly></span>
						
					</div>
					<div class="divtext"  align="center" >
						<label class="labeltext">Subscription Type: </label>
						<span class="spantext" ><input  type="text" name="subs_type" style="width:250px; height:20px;"  
value="<%=nullCheck((String)request.getAttribute("subscription_plan"))%>" class="box" readonly></span>
						
					</div>
					<div class="divtext"  align="center" >
						<label class="labeltext">Payment History: </label>
						<span class="spantext" ><input  type="text" name="pay_history"   style="width:250px; height:20px;"
value="<%=nullCheck((String)request.getAttribute("amount"))%>" class="box"></span>
						
					</div>
					
					<div class="divtext"  align="center" >
						<label class="labeltext">Subscription Expiry</label>
						<span class="spantext" ><input type="text" name="Subs_expiry" id="Subs_expiry" style="width:250px; height:20px;"  
  value="<%=nullCheck((String)request.getAttribute("difference"))%>" class="box" readonly ></span>
						
					</div>
					<div class="divtext"  align="center" >
						<label class="labeltext">Renew Subscription: </label>
						<span class="spantext" ><input  type="button" name="renew_subs" id="renew_subs" style="width:250px; height:20px;cursor:pointer"
  value="Renew"  onClick="location.href='Pricing.jsp'" class="boxx"></span>
						
					</div>
					<div class="divtext"  align="center" >
					
						<label class="submitlabeltext"><img src="images/update.jpg"   alt="" width="20" height="20" style="cursor:pointer"/>
				<input type="submit" name="Insert" value="Update" style=" background-color: transparent; border:none; cursor:pointer; "></label>
						
						<label class="submitlabeltext"><img src="images/Cancel.png"  width="20" height="20" style="cursor:pointer"/>
				<input name="button" type="button" class="gradBtn" style=" background-color: transparent; border:none; cursor:pointer;" onClick="javascript:history.back(-1);" value="Cancel" ></label>
						
					</div>
					</form> 
					<div class="divtext"  align="center" >
						<label class="labeltext">Alter Plan and Bundle:</label>
						<span class="spantext">
						
						
						<%String jsessionID= (String)request.getAttribute("jsessionId");
System.out.println("jsessionID:::::::::::::::::::::::::"+jsessionID);
String originalPass= (String)request.getAttribute("originalPass");
String usrEmail= (String)request.getAttribute("usrEmail");
System.out.println("jsessionID::::::::::::inside if condition:::::::::::::"+jsessionID);%>

<form class="form-horizontal" id="loginForm1" method="post" target='_blank' action="http://74.208.110.192:8480/yes-shop/login;jsessionid=<%=jsessionID%>IFormSubmitListener-authView-loginForm"><div style="width:0px;height:0px;position:absolute;left:-100px;top:-100px;overflow:hidden"><input type="hidden" name="loginForm1_hf_0" id="loginForm1_hf_0" /></div>
<input type="hidden" value="" name="restorePassword"/>
<div class="login-title" style="display:none">
<h2>Login</h2>
</div>
<div class="form-group" style="display:none">
<label for="loginEmail" class="control-label col-xs-12 col-sm-3" style="display:none">
E-mail
</label>
<div class="col-xs-12 col-sm-8" style="display:none">
<input type="text" class="form-control" id="loginEmail" value="<%=usrEmail%>" name="email" placeholder="E-mail">
</div>
</div>
<div class="form-group" id="InlineEnclosure_02" style="display:none">
<label for="loginPassword" class="control-label col-xs-12 col-sm-3" style="display:none">
Password
</label>
<div class="col-xs-12 col-sm-8" style="display:none">
<input type="password" class="form-control" id="loginPassword" value="<%=originalPass%>" name="password" placeholder="Password" style="display:none">
</div>
</div>
<div class="form-group" >
<div class="col-xs-offset-3 col-xs-8 buttons">


<input type="submit" class="boxx" name="loginBtn" id="loginBtn3" value="Purchase" style="width:250px; height:20px;cursor:pointer"/>

</div>
</div>
<div class="form-group" style="display:none">

</div>
</form>


						<!-- input  type="button" name="alt_plan" style="width:250px; height:20px;cursor:pointer"  
value="Purchase" onClick="location.href='masterAccount.html?profileCmd=yesaction'" class="boxx" target="_blank"-->
</span>
						
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

</body>

</html>
