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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
     <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
     <link rel="stylesheet" href="css/camera.css"> 
     <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="css/font-awesome.css">
     <link rel="stylesheet" href="css/stuck.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<script type="text/javascript">
$(function(){
  $('#popup1').submit(function(e){
    return true;
  });
  
 // $('#chattrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
});
</script>

<style type="text/css">
a.hov {
    color: #fff;
}
a.hov:hover {
    color: red;
}

</style>
<style>
	.box1 {
  width: 40%;
  margin: 0 auto;
  background: rgba(255,255,255,0.2);
  //border: 2px solid #fff;
  border-radius: 20px/50px;
  background-clip: padding-box;
  text-align: center;
}

.button {
  font-size: 1.5em!important;
    padding: 8px 0px 26px 2px;
    color: #fff;
    border: 2px solid #06D85F;
    text-decoration: none;
    cursor: pointer;
    transition: all 0.3s ease-out;
    position: fixed;
    width: 70px;
    height: 26px;
    top: 300px;
    transform: rotate(90deg);
    z-index: 1000;
    right: -18px!important;
    background: #06d85f;
    font-family: 'Open Sans', sans-serif!important;
    right: 0;
    font-weight: bold;
    border-radius: 15%;

}
.button:hover {
  border:2px solid #06D85F;
  color:#06D85F; 
  background:#fff;
}



a.hov {
    color: #fff;
}
a.hov:hover {
    color: red;
}
/** modal window styles **/
#lean_overlay {
    position: fixed;
    z-index:100;
    top: 0px;
    left: 0px;
    height:100%;
    width:100%;
    background: #000;
    display: none;
}



@media screen and (max-width: 700px){
  .box1{
    width: 70%;
  }
  .popup{
    width: 70%;
  }
</style>
<script type="text/javascript">
$(function(){
  $('#popup1').submit(function(e){
    return true;
  });
  
  $('#chattrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
});
</script>
<body>
<footer id="footer">
<!--div class="box1">
		<!--a href="ViewChatBox.html?cmd=openChatBox" class="button" id="chattrigger">Chat</a>
	</div>-->

	<div id="popup1" style="display:none">
		
		<!--  -->%@ include file = "../jsp/myChatApp/LavitaFullwindowChatBox.jsp" %>-->
			
	</div>

    <div class="container_12">
        <div class="grid_2">
           <a href="user.html?cmd=initHome"><img src="images/DBLogo-new.png" alt="Logo" style="width:50%; height:50%"></a>
        </div>
        <div class="grid_4">
            <h5>Address</h5>
            <p style="color:#FFFFFF">13241 WOODLAND PARK ROAD, SUITE 110,</p>
			<p style="color:#FFFFFF">HERNDON, VIRGINIA 20171, USA</p>
			<p>Sales - <a class="hov" href="mailto:sales@klugwerks.com">sales@klugwerks.com</a></p>
			<p>Billing & Finance - <a class="hov" href="mailto:billing@klugwerks.com">billing@klugwerks.com</a></p>
			<p>Customer Service - <a class="hov" href="mailto:support@klugwerks.com">support@klugwerks.com</a></p>
			<p></p>
        </div>   
		<div class="grid_3" >
		<div class="copy" style="padding-top:45px;"><span id="copyright-year"></span>&nbsp;&copy;&nbsp;
            <a href="http://www.digiblitz.com/" target="_blank">Powered by</a> <a style="margin-left:5px;" href="https://www.digiblitz.com/" target="_blank">digiBlitz</a>
			<br>
			<a href="user.html?cmd=initPrivacy">Privacy Policy</a>
			<br>
			<!--a id='__imgButtonClickToCall' href='#'  onclick="window.open('https://acctmgr.evoice.com/AcctMgr/ClickToCall/ClickToConnectSession.aspx?key=b59128d0-265b-421f-bd3e-99ace9ae1773','','width=520,height=240, left=40, top=100, resizable=no,scroll=yes,status=no,titlebar=no,toolbar=no,addressbar=no,copyhistory=no,navigationtoolbar=no')"  style='cursor:pointer;border:none'><img  src='https://acctmgr.evoice.com/AcctMgr/Brands/eVoice/Images/ClickToCall/SystemImages1_h.jpg' alt='Click to open call me page' id='__imgClickToCall' style='border:0px;' />&nbsp;+1 703-439-2650</a>-->
			<a href="ViewChatBox.html?cmd=openChatBox" id="chat" style="font-size:larger;font-weight:800;padding:10px 0px 0px 0px;" class="hov" >
			<img src="jsp/LavlitaChatApp/images/Lavlita-AI_verysmall.jpg" style="border-radius:50%;height:35px;width:35px;margin-top: -2px;">
			Chat with Lavlita.AI</a>
			</div>
		</div>     
        <div class="grid_4">
            <h5>Follow us</h5>
            <ul class="socials">
                <li><a href="https://twitter.com/digiBlitz" target="_blank" class="col1"><i class="fa fa-twitter"></i></a></li>
                <li><a href="https://www.facebook.com/KlugWerks-734701153228288/" target="_blank" class="col2"><i class="fa fa-facebook"></i></a></li>
                <li><a href="https://www.linkedin.com/company/digiblitz-technologies" target="_blank" class="col3"><i class="fa fa-linkedin"></i></a></li>
              	<li><a href="https://www.xing.com/companies/digiblitzeuropegmbh" target="_blank" class="col3"><i class="fa fa-xing"></i></a></li>
            </ul>
            
        </div>
		
    </div>
</footer>
</body>
</html>
