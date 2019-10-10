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
<!DOCTYPE html>
<html lang="en">
<head>
    <title>sign up success</title>
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
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
document.getElementById("sucessForm").submit();

}
// To validate form fields before submission
function validate() {
// Storing Field Values in variables
var name = document.getElementById("name").value;
var email = document.getElementById("email").value;
var contact = document.getElementById("contact").value;
// Regular Expression For Email
var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
// Conditions
if (name != '' && email != '' && contact != '') {
if (email.match(emailReg)) {
if (document.getElementById("male").checked || document.getElementById("female").checked) {
if (contact.length == 10) {
return true;
} else {
alert("The Contact No. must be at least 10 digit long!");
return false;
}
} else {
alert("You must select gender.....!");
return false;
}
} else {
alert("Invalid Email Address...!!!");
return false;
}
} else {
alert("All fields are required.....!");
return false;
}
}
};</script>   
</head>

<body>

<!--========================================================
                          HEADER
=========================================================-->

<div id="header">
<!-- HEADER STARTS HERE -->
<%@ include file = "../../include/Header.jsp" %>
  <!-- HEADER ENDS HERE -->
</div>
<!--========================================================
                          CONTENT
						  
=========================================================-->

<%String firstname=(String)request.getAttribute("fName"); 
System.out.println("FNAME.............."+firstname);%>
<%String lastname=(String)request.getAttribute("lName");
System.out.println("lastname.............."+lastname); %>
<%String e_mail=(String)request.getAttribute("emailId");
 System.out.println("e_mail.............."+e_mail);%>
<%String instituteName=(String)request.getAttribute("instituteName"); %>
<%String instituteID=(String)request.getAttribute("instituteID"); 
String transactionId = (String)request.getAttribute("transactionId");
String pay_subscriptionType=(String)request.getAttribute("pay_subscriptionType"); 
String pay_productPlan = (String)request.getAttribute("pay_productPlan");
String registrationId = (String)request.getAttribute("registrationId");
String CustomerUserName = (String)request.getAttribute("CustomerUserName");
String Customerpassword = (String)request.getAttribute("Customerpassword");
String coupon_code = (String)request.getAttribute("coupon_code");
%>
<%if(coupon_code != null){%>
<form accept-charset="UTF-8" action="https://ho192.infusionsoft.com/app/form/process/2e07d74054665270702feb52a3a38543" class="infusion-form" method="POST" style="display:none;" id ="sucessForm">
    <input name="inf_form_xid" type="hidden" value="2e07d74054665270702feb52a3a38543" />
    <input name="inf_form_name" type="hidden" value="Coupon Code Applied Scenario" />
    <input name="infusionsoft_version" type="hidden" value="1.56.0.67" />
    <div class="infusion-field" style="display:none">
        <label for="inf_field_FirstName">First Name</label>
        <input class="infusion-field-input-container" id="inf_field_FirstName" name="inf_field_FirstName" type="text" value="<%=firstname%>"/>
    </div>
	<%if(lastname != null){%>
    <div class="infusion-field" style="display:none">
        <label for="inf_field_LastName">Last Name</label>
        <input class="infusion-field-input-container" id="inf_field_LastName" name="inf_field_LastName" type="text" value="<%=lastname%>"/>
    </div>
	<%}else{ %>
	<div class="infusion-field" style="display:none">
        <label for="inf_field_LastName">Last Name</label>
        <input class="infusion-field-input-container" id="inf_field_LastName" name="inf_field_LastName" type="text" value="N/A"/>
    </div>
	<%}%>
    <div class="infusion-field" style="display:none">
        <label for="inf_field_Username">Username *</label>
        <input class="infusion-field-input-container" id="inf_field_Username" name="inf_field_Username" type="text" value="<%=CustomerUserName%>"/>
    </div>
    <div class="infusion-field" style="display:none">
        <label for="inf_field_Password">Password *</label>
        <input class="infusion-field-input-container" id="inf_field_Password" name="inf_field_Password" type="password" value="<%=Customerpassword%>"/>
    </div>
    <div class="infusion-field" style="display:none">
        <label for="inf_field_Email">Email *</label>
        <input class="infusion-field-input-container" id="inf_field_Email" name="inf_field_Email" type="text" value="<%=e_mail%>"/>
    </div>
	<%if(instituteName != null){%>
    <div class="infusion-field" style="display:none">
        <label for="inf_field_Company">Institution Name</label>
        <input class="infusion-field-input-container" id="inf_field_Company" name="inf_field_Company" type="text" value="<%=instituteName%>"/>
    </div>
	<%}else{ %>
	<div class="infusion-field" style="display:none">
        <label for="inf_field_Company">Institution Name</label>
        <input class="infusion-field-input-container" id="inf_field_Company" name="inf_field_Company" type="text" value="N/A"/>
    </div>
	<%}%>
    <div class="infusion-field" style="display:none">
        <label for="inf_custom_CustomerID0">Customer ID</label>
        <input class="infusion-field-input-container" id="inf_custom_CustomerID0" name="inf_custom_CustomerID0" type="text" value="<%=instituteID%>"/>
    </div>
    <div class="infusion-submit" style="display:none">
        <input type="submit" value="Ok. Proceed" style="display:none"/>
    </div>
</form>
<%}else{ %>
<form accept-charset="UTF-8" action="https://ho192.infusionsoft.com/app/form/process/5be5384ebf774e4d582690bbd491d862" class="infusion-form" method="POST" style="display:none;" id ="sucessForm" name="Payment Success" onSubmit="var form = document.forms[0];
var resolution = document.createElement('input');
resolution.setAttribute('id', 'screenResolution');
resolution.setAttribute('type', 'hidden');
resolution.setAttribute('name', 'screenResolution');
var resolutionString = screen.width + 'x' + screen.height;
resolution.setAttribute('value', resolutionString);
form.appendChild(resolution);
var pluginString = '';
if (window.ActiveXObject) {
    var activeXNames = {'AcroPDF.PDF':'Adobe Reader',
        'ShockwaveFlash.ShockwaveFlash':'Flash',
        'QuickTime.QuickTime':'Quick Time',
        'SWCtl':'Shockwave',
        'WMPLayer.OCX':'Windows Media Player',
        'AgControl.AgControl':'Silverlight'};
    var plugin = null;
    for (var activeKey in activeXNames) {
        try {
            plugin = null;
            plugin = new ActiveXObject(activeKey);
        } catch (e) {
            // do nothing, the plugin is not installed
        }
        pluginString += activeXNames[activeKey] + ',';
    }
    var realPlayerNames = ['rmockx.RealPlayer G2 Control',
        'rmocx.RealPlayer G2 Control.1',
        'RealPlayer.RealPlayer(tm) ActiveX Control (32-bit)',
        'RealVideo.RealVideo(tm) ActiveX Control (32-bit)',
        'RealPlayer'];
    for (var index = 0; index &lt; realPlayerNames.length; index++) {
        try {
            plugin = new ActiveXObject(realPlayerNames[index]);
        } catch (e) {
            continue;
        }
        if (plugin) {
            break;
        }
    }
    if (plugin) {
        pluginString += 'RealPlayer,';
    }
} else {
    for (var i = 0; i &lt; navigator.plugins.length; i++) {
        pluginString += navigator.plugins[i].name + ',';
    }
}
pluginString = pluginString.substring(0, pluginString.lastIndexOf(','));
var plugins = document.createElement('input');
plugins.setAttribute('id', 'pluginList');
plugins.setAttribute('type', 'hidden');
plugins.setAttribute('name', 'pluginList');
plugins.setAttribute('value', pluginString);
form.appendChild(plugins);
var java = navigator.javaEnabled();
var javaEnabled = document.createElement('input');
javaEnabled.setAttribute('id', 'javaEnabled');
javaEnabled.setAttribute('type', 'hidden');
javaEnabled.setAttribute('name', 'javaEnabled');
javaEnabled.setAttribute('value', java);
form.appendChild(javaEnabled);">
<input name="inf_form_xid" type="hidden" value="5be5384ebf774e4d582690bbd491d862" /><input name="inf_form_name" type="hidden" value="Payment Success" /><input name="infusionsoft_version" type="hidden" value="1.49.0.36" />
<div class="default beta-base beta-font-b" id="mainContent" style="height:100%">
<table cellpadding="10" cellspacing="0" class="background" style="width: 100%; height: 100%">
<tbody>
<tr>
<td align="center" valign="top">
<table bgcolor="#FFFFFF" cellpadding="20" cellspacing="0" class="bodyContainer webFormBodyContainer" width="100%">
<tbody>
<tr>
<td bgcolor="#FFFFFF" class="body" sectionid="body" valign="top">
<div class="text" id="webformErrors" name="errorContent">
</div>
<div>
<div class="text">
<div class="text" contentid="paragraph">
<div style="text-align: center;">
<span style="color: #000080; font-size: 12pt;"><span style="color: #000080; font-size: 12pt;">Welcome to&nbsp;klugWerks</span></span><span style="color: #000080; font-size: 12pt;">.</span>
</div>
<div style="text-align: center;">
<span style="color: #000080; font-size: 12pt;">we wish you happy days ahead with our product.</span>
</div>
</div>
</div>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_FirstName">First Name</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_FirstName" name="inf_field_FirstName" type="text" value="<%=firstname%>"/>
</td>
</tr>
 <%if(lastname != null){%>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_LastName">Last Name</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_LastName" name="inf_field_LastName" type="text" value="<%=lastname%>"/>
</td>
</tr>
<%}else{ %>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_LastName">Last Name</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_LastName" name="inf_field_LastName" type="text" value="N/A"/>
</td>
</tr>
<%}%>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_Email">Email *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_Email" name="inf_field_Email" type="text" value="<%=e_mail%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_Username">Username</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_Username" name="inf_field_Username" type="text" value="<%=CustomerUserName%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_Password">Password</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_Password" name="inf_field_Password" type="password" value="<%=Customerpassword%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<%if(instituteName != null){%>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_Company">Institution Name</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_Company" name="inf_field_Company" type="text" value="<%=instituteName%>"/>
</td>
</tr>
<%}else{ %>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_Company">Institution Name</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_Company" name="inf_field_Company" type="text" value="N/A"/>
</td>
</tr>
<%}%>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_custom_CustomerID0">Customer ID</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_custom_CustomerID0" name="inf_custom_CustomerID0" type="text" value="<%=instituteID%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_custom_Subscriptiontype">Subscription Type</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_custom_Subscriptiontype" name="inf_custom_Subscriptiontype" type="text" value="<%=pay_subscriptionType%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_custom_PaymentPlan">Payment Plan</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_custom_PaymentPlan" name="inf_custom_PaymentPlan" type="text" value="<%=pay_productPlan%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<div style="height:15px; line-height:15px;">
&nbsp;
</div>
</div>
<div>
<div class="infusion-submit" style="text-align:center;">
<button style="background-color:#F5F5F5; color:#000000; font-size:15px; font-family:Helvetica; border-color:#000000; border-style:Solid; border-width:1px; -moz-border-radius:3px;border-radius:3px;" type="submit" value="Ok. Proceed">Ok. Proceed</button>
</div>
</div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</form>
<%}%>
<section id="content">
<div class="content">
    
	
	
	
	<div class="thumb-box10">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-5">
                    <div class="wow fadeInUp clearfix">
                        <div class="box1 maxheight2">
                            <p class="title">Congrats &nbsp;<%=firstname %>!</p>
                            <p class="description">You're ready to start using KlugWerks Online Edition</p>
							<p class="description">We'll send you a welcome email shortly with some quick tips to get started easily.</p>
                            <p><strong>Login Details</strong></p>
                            <ul class="list2-1">
                               <%if(lastname != null){%>
                                <li><strong>Name: </strong><a href="#"><%=firstname %>&nbsp;<%=lastname %></a></li>
                                <%}else{ %>
                                <li><strong>Name: </strong><a href="#"><%=firstname %></a></li>
                                <%} %>
                                <li><strong>E-mail: </strong><a href="#"><%=e_mail %></a></li>
                                <p><strong>Institution Information</strong></p>
                                <li><strong>User Name: </strong><a href="#"><%=CustomerUserName%></a></li>
                                <li><strong>password:</strong><a href="#">Password will be send to your e-mail</a></li>
                                <li><strong>Registration Id: </strong><a href="#"><%=registrationId%></a></li>
                                <%if(instituteName != null){%>
                                <li><strong>Institution Name: </strong><a href="#"><%=instituteName%></a></li>
                                <%}else{%>
                                <li><strong>Institution Name: </strong><a href="#">N/A</a></li>
                                <%} %>
								<li><strong>Institution ID: </strong><a href="#"><%=instituteID%></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
        <em></em>
    </div>
	
	
    </div>

</section>


<!--========================================================
                          FOOTER
=========================================================-->
<div>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/Footer.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </div>

</body>

   


</html>
