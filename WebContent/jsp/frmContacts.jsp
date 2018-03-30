<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
     <head>
     <title>Contacts</title>
     <meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="images/favicon.ico" type="image/x-icon">
     <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
     <link rel="stylesheet" href="css/style.css">
	 <link rel="stylesheet" href="css/Style1.css">
     <link rel="stylesheet" href="css/form.css">
     <link rel="stylesheet" href="css/font-awesome.css">
     <link rel="stylesheet" href="css/stuck.css">    
	  <link rel="stylesheet" href="css/skeleton.css">
	  <link rel="stylesheet" href="css/camera.css"> 
	  <link rel="stylesheet" href="css/reset.css"> 
	  <link rel="stylesheet" href="css/superfish.css"> 
	    <link rel="stylesheet" href="css/contact-form.css"> 
	  
     <script src="js/jquery.js"></script>    
     <script src="js/jquery-migrate-1.2.1.js"></script>
     <script src="js/jquery.easing.1.3.js"></script>
     <script src="js/script.js"></script>
     <script src="js/jquery.equalheights.js"></script>
     <script src="js/jquery.ui.totop.js"></script>     
     <script src="js/superfish.js"></script>
     <script src="js/tmStickUp.js"></script>
     <script src="js/jquery.mobilemenu.js"></script>
     <script src="js/sForm.js"></script>
     <script src="js/TMForm.js"></script>  
	 <link rel="stylesheet" href="css/contact-form.css">    
     <!--[if lt IE 8]>
        <link rel="stylesheet" type="text/css" media="screen" href="css/ie.css">

       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
         </a>
      </div>
    <![endif]-->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="css/ie.css">
    <![endif]-->
        <script>
            $(document).ready(function(){
                /*Back to Top*/
                $().UItoTop({ easingType: 'easeOutQuart' });
             });
        </script>
		<script type="text/javascript">
		
function ValidateEmail(inputText)
{
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
if(inputText.value.match(mailformat))
{
document.form1.email.focus();
return true;
}
else
{
//alert("You have entered an invalid email address!");
document.getElementById("emailError").innerHTML="You have entered an invalid email address!";
document.form1.email.focus();
return false;
}
}
</script>
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
document.getElementById("contactForm").submit();

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
<body id="top">

<!--==============================header=================================-->

<header id="header">
    <%@ include file = "../../include/Header.jsp" %>
</header>
<%	String name = (String) request.getAttribute("name");
		String email = (String) request.getAttribute("email");
		String phone = (String) request.getAttribute("phone");
		String company = (String) request.getAttribute("company");
		String message = (String) request.getAttribute("message");
	%>
	
<!-- infusion soft code start here -->
<%String dbinitStatus = null;
dbinitStatus = (String)request.getAttribute("status");
System.out.println("dbinitStatus inside jsp ::::::::::::::::"+dbinitStatus);
if(!(dbinitStatus.equalsIgnoreCase("init"))){

%>
	<form accept-charset="UTF-8" action="https://ho192.infusionsoft.com/app/form/process/32beebf439a538357aa87db2d2e1e6be" class="infusion-form" method="POST" id="contactForm" style="display:none"name="Contact us" onSubmit="var form = document.forms[0];
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
<input name="inf_form_xid" type="hidden" value="32beebf439a538357aa87db2d2e1e6be" /><input name="inf_form_name" type="hidden" value="Contact us" /><input name="infusionsoft_version" type="hidden" value="1.49.0.36" />
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
<div>
<div class="title" style="text-align:left">
<div class="title" contentid="title" style="text-align: left;">
<div>
<span style="color: #993300;">Get in Touch</span>
</div>
</div>
</div>
</div>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_FirstName">Name *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_FirstName" name="inf_field_FirstName" type="text" value="<%=name%>"/>
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
<label for="inf_field_Email">Email *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_Email" name="inf_field_Email" type="text" value="<%=email%>" />
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
<label for="inf_field_Phone1">Phone *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_Phone1" name="inf_field_Phone1" type="text" value="<%=phone%>"/>
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
<label for="inf_field_Company">Company *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_Company" name="inf_field_Company" type="text" value="<%=company%>"/>
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
<label for="inf_custom_DescriptionOfNeed">Brief description of your requirement *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_custom_DescriptionOfNeed" name="inf_custom_DescriptionOfNeed" type="text" value="<%=message%>"/>
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
<button style="" type="submit" value="Submit">Submit</button>
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
<div class="bg1">

<!--=======content================================-->

    <div id="content">
        <div class="p44">
            <div class="container_12">
                <div class="grid_12 center">
                    <h2>contact information</h2>
                    <div class="map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3102.759171003148!2d-77.40540988471282!3d38.952329851309486!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89b6479363b7080d%3A0xf0ba0347f9e7a599!2s13241+Woodland+Park+Rd+%23110%2C+Herndon%2C+VA+20171%2C+USA!5e0!3m2!1sen!2sin!4v1463140827940" width="1100" height="500" frameborder="0" style="border:0" allowfullscreen></iframe> 
                    </div>
                </div>
            </div>
			&nbsp;&nbsp;
            <div class="container_12">
			

                <div class="grid_6">
                    <address class="address">
					<p>Address:</p>
					
                    <p>13241 WOODLAND PARK ROAD, SUITE 110, HERNDON, VIRGINIA 20171, USA.</p>
					
                    <dl>
                        <dt></dt>
                        <!--dd><span>Freephone: </span>+1 800 559 6580</dd-->
                        <!--dd>Telephone: +1-571-297-2288</dd-->
                        <!--dd><span>FAX:</span>+1 504 889 9898</dd-->
                        <!--dd><span>E-mail:&nbsp;</span><a href="#">mail@demolink.org</a></dd-->
						<dd>Sales - <a class="" href="mailto:sales@menschforce.com">sales@klugwerks.com</a></dd>
			<dd>Billing & Finance - <a class="" href="mailto:billing@menschforce.com">billing@klugwerks.com</a></dd>
			<dd>Customer Service - <a class="" href="mailto:support@menschforce.com">support@klugwerks.com</a></dd>
						
                    </dl>
                    </address>
					    
                </div>
				<%String dbStatus = (String)request.getAttribute("status");
				System.out.println("inside jsp::::::::::::::::::::::");%>
				<%
				if(dbStatus.equalsIgnoreCase("success")){%>
				
				<div></div>
				<%}else if(dbStatus.equalsIgnoreCase("fails")){%>
				<div>Please try again!</div>
				<%} else if(dbStatus.equalsIgnoreCase("init")){%>
				<div></div>
				<%}%>
                <div class="grid_6">
                    <form id="contact-form" action="user.html?cmd=eConfig" method="post"  onSubmit="return(ValidateEmail(document.form1.email));" name="form1">             
                    
                    <label class="name">
                        <input type="text" placeholder="Name" data-constraints="@Required @JustLetters" name="name"  value="" required/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label>                  
                    <label class="email">
                        <input type="text" placeholder="E-mail" name="email"  value="" required/>
                        <span class="empty-message">*This field is required.</span>
                         <span id="emailError" style="color:#FF0000"></span>
                    </label>
                    <label class="phone">
                        <input type="text" placeholder="Phone" data-constraints="@Required @JustNumbers" name="phone"  value="" required/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid phone.</span>
                    </label>
					<label class="company name">
                        <input type="text" placeholder="Company Name" data-constraints="@Required @JustLetters" name="company"  value="" required/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label>
                    <label class="message">
                        <textarea placeholder="Message" data-constraints='@Required @Length(min=20,max=999999)' name="message"  required></textarea>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*The message is too short.</span>
                    </label>
                    <div class="clear"></div> 
                       <div>
                             <input type="submit" value="submit" name="submit" class="btn-default btn3"/>
                            </div>
                </form>
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

</body>
</html>
