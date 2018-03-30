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
          
     <link rel="stylesheet" href="css/font-awesome.css">
     <link rel="stylesheet" href="css/stuck.css">    
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
     </head>
<body id="top">

<!--==============================header=================================-->

<header id="header">
    <%@ include file = "../../include/Header.jsp" %>
</header>

<div class="bg1">

<!--=======content================================-->

    <div id="content">
        <div class="p44">
            <div class="container_12">
                <div class="grid_12 center">
                    <h2>contact information</h2>
                    <div class="map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3107.3588922383606!2d-77.30654168531886!3d38.84714105751134!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89b64e93db5fdbf5%3A0xd911516b41c73b60!2sdigiBlitz+Technologies+Pvt+Ltd!5e0!3m2!1sen!2sin!4v1448686781779" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe> 
                    </div>
                </div>
            </div>
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
						<dd>Sales - <a class="" href="mailto:sales@menschforce.com">sales@menschforce.com</a></dd>
			<dd>Billing & Finance - <a class="" href="mailto:billing@menschforce.com">billing@menschforce.com</a></dd>
			<dd>Customer Service - <a class="" href="mailto:support@menschforce.com">support@menschforce.com</a></dd>
						
                    </dl>
                    </address>
					    
                </div>
				<%String dbStatus = (String)request.getAttribute("status");
				System.out.println("inside jsp::::::::::::::::::::::");%>
				<%
				if(dbStatus.equalsIgnoreCase("success")){%>
				
				<div>You Query was reached to us Successfully</div>
				<%}else if(dbStatus.equalsIgnoreCase("fails")){%>
				<div>You Query was faild</div>
				<%} else if(dbStatus.equalsIgnoreCase("init")){%>
				<div></div>
				<%}%>
                <div class="grid_7">
                    <form id="contact-form" action="user.html?cmd=eConfig" method="post" name="form1" onSubmit="return(ValidateEmail(document.form.email));">             
                    
                    <label class="name">
                        <input type="text" placeholder="Name" data-constraints="@Required @JustLetters" name="name"  value=""/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid name.</span>
                    </label>                  
                    <label class="email">
                        <input type="text" placeholder="E-mail" name="email"  value=""/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid email.</span>
                    </label>
                    <label class="phone">
                        <input type="text" placeholder="Phone" data-constraints="@Required @JustNumbers" name="phone"  value=""/>
                        <span class="empty-message">*This field is required.</span>
                        <span class="error-message">*This is not a valid phone.</span>
                    </label>
                    <label class="message">
                        <textarea placeholder="Message" data-constraints='@Required @Length(min=20,max=999999)' name="message"></textarea>
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
