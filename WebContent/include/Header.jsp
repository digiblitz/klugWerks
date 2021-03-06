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
 <link rel="stylesheet" href="css/Style1.css">
    <meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="images/favicon.ico" type="image/x-icon">
     <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
     <link rel="stylesheet" href="css/camera.css"> 
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
     <script src="js/camera.js"></script>  
     <script src="js/sForm.js"></script> 
     <!--[if (gt IE 9)|!(IE)]><!-->
     <script src="js/jquery.mobile.customized.min.js"></script>
	   <script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>

     <!--<![endif]-->
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
                jQuery('#camera_wrap').camera({
                    loader: true,
                    pagination: true,
                    minHeight: '200',
                    thumbnails: false,
                    height: '50%',
                    caption: true,
                    navigation: false,
                    fx:  'mosaic'
                });
                /*Back to Top*/
                $().UItoTop({ easingType: 'easeOutQuart' });
             });
        </script>
     </head>
<script type="text/javascript">
//-------------------------------- User status validation Ajax Script ------------------------------------------------

var httpRequest;

function usrStat()
{

if(document.loginform.textfield.value!="" && document.loginform.textfield.value.indexOf(' ')!=0)
	{

   var chsUserName=document.loginform.textfield.value;

   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
        url= "UsrSignupAjax.html?cmd=checkusrnam&chsUserName="+chsUserName; 

        if (window.ActiveXObject) 
        { 
            httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
        } 
        else if (window.XMLHttpRequest) 
        { 
            httpRequest = new XMLHttpRequest(); 
        } 
     
        httpRequest.open("GET", url, true); 
        
        httpRequest.onreadystatechange =processUser; 
        httpRequest.send(null); 
   } 
   }
   
   
   
    /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
    function processUser() 
    { 
   
        if (httpRequest.readyState == 4) 
        { 
            if(httpRequest.status == 200) 
            { 
                //get the XML send by the servlet 
                 var salutationXML = httpRequest.responseXML.getElementsByTagName("userstatus")[0]; 
                 var salutationText = salutationXML.childNodes[0].nodeValue; 
     
                //Update the HTML 
                updateHTML(salutationXML); 
            } 
            else 
            { 
                alert("Error loading page\n"+ httpRequest.status +":"+ httpRequest.statusText); 
            } 
        } 
    } 
        
   /** 
    * This function parses the XML and updates the  
    * HTML DOM by creating a new text node is not present 
    * or replacing the existing text node. 
    */ 
    function updateHTML(salutationXML) 
    { 
        //The node valuse will give actual data 
        var salutationText = salutationXML.childNodes[0].nodeValue; 

		if(salutationText == "false")
		{
			alert("User Name doesn't Exists!");
			document.loginform.textfield.value="";
			document.loginform.textfield.focus();
		}
		      
    } 
   </script>
   <script type="text/javascript">
$(function(){
  $('#loginform').submit(function(e){
    return true;
  });
  
  $('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
});
</script>

<script  type="text/javascript">

//-------------function for doublespace validation -----------------------------
var str="";
function Dospace(str){
if(str.indexOf("  ")!=-1)
{return true;}
else {return false;}
}

function myvalidateon()
{

if(document.loginform.textfield.value=="")
{alert("User Name can't be empty");
 document.loginform.textfield.focus();
 return false;}
 
 if(Dospace(document.loginform.textfield.value))
     { alert("Enter Valid Username");
       document.loginform.textfield.focus();
   return false; }

if(document.loginform.textfield2.value=="")
{alert("Password can't be empty");
 document.loginform.textfield2.focus();
 return false;}
 
 if(Dospace(document.loginform.textfield2.value))
     { alert("Enter Valid Password");
       document.loginform.textfield2.focus();
   return false; }
   
   
  
return true;
 
 }
</script>

		

 <%
	   
  String sessLogId = (String) session.getAttribute("sessionId");
  String chkLogout = (String) request.getAttribute("logout");
    

 

  
  System.out.println("chkLogout==="+chkLogout);
  
  if(sessLogId!=null){
   session.removeAttribute("sessionId");
            session.removeAttribute("userId");
            session.removeAttribute("userCode");
            session.removeAttribute("firstName");
            session.removeAttribute("userTypeName");
            session.removeAttribute("emailId");
            session.removeAttribute("memberId");
   response.setHeader("Cache-Control", "no-cache");
  response.sendRedirect("login.jsp"); 
  }
  
  
  %>
  
   <script>
			$(function() {
			 var pgurl = window.location.href.substr(window.location.href
		.lastIndexOf("/")+1);
			 $("nav ul li a").each(function(){
				  if($(this).attr("href") == pgurl || $(this).attr("href") == '' )
				  $(this).addClass("active");
				   
			 })
		});

		</script>

		<style type="text/css">
/** resets **/
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
  outline: none;
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
html { height: 101%; }
body { 
  background: #f0f0f0; 
  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
  color: #313131;
  font-size: 62.5%; 
  line-height: 1; 
}

::selection { background: #a4dcec; }
::-moz-selection { background: #a4dcec; }
::-webkit-selection { background: #a4dcec; }

::-webkit-input-placeholder { /* WebKit browsers */
  color: #ccc;
  font-style: italic;
}
:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
  color: #ccc;
  font-style: italic;
}
::-moz-placeholder { /* Mozilla Firefox 19+ */
  color: #ccc;
  font-style: italic;
}
:-ms-input-placeholder { /* Internet Explorer 10+ */
  color: #ccc !important;
  font-style: italic;  
}

br { display: block; line-height: 2.2em; } 

article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }
ol, ul { list-style: none; }

input, textarea { 
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  outline: none; 
}

blockquote, q { quotes: none; }
blockquote:before, blockquote:after, q:before, q:after { content: ''; content: none; }
strong { font-weight: bold; } 

table { border-collapse: collapse; border-spacing: 0; }
img { border: 0; max-width: 100%; }

#topbar {
  background: #4f4a41;
  padding: 10px 0 10px 0;
  text-align: center;
}

#topbar a {
  color: #fff;
  font-size:1.3em;
  line-height: 1.25em;
  text-decoration: none;
  opacity: 0.5;
  font-weight: bold;
}

#topbar a:hover {
  opacity: 1;
}

/** typography **/
h1 {
  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
  font-size: 2.5em;
  line-height: 1.5em;
  letter-spacing: -0.05em;
  margin-bottom: 20px;
  padding: .1em 0;
  color: #444;
	position: relative;
	overflow: hidden;
	white-space: nowrap;
	text-align: center;
}
h1:before,
h1:after {
  content: "";
  position: relative;
  display: inline-block;
  width: 50%;
  height: 1px;
  vertical-align: middle;
  background: #f0f0f0;
}
h1:before {    
  left: -.5em;
  margin: 0 0 0 -50%;
}
h1:after {    
  left: .5em;
  margin: 0 -50% 0 0;
}
h1 > span {
  display: inline-block;
  vertical-align: middle;
  white-space: normal;
}

p {
  display: block;
  font-size: 1.35em;
  line-height: 1.5em;
  margin-bottom: 22px;
}

.center { display: block; text-align: center; }


/** page structure **/
#w {
  display: block;
  width: 750px;
  margin: 0 auto;
  padding-top: 30px;
}

#content {
  display: block;
  width: 100%;
  background: #fff;
  padding: 25px 20px;
  padding-bottom: 35px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
}


.flatbtn {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  display: inline-block;
  outline: 0;
  border: 0;
  color: #f3faef;
  text-decoration: none;
  background-color: #6bb642;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  font-size: 1.2em;
  font-weight: bold;
  padding: 12px 22px 12px 22px;
  line-height: normal;
  text-align: center;
  vertical-align: middle;
  cursor: pointer;
  text-transform: uppercase;
  text-shadow: 0 1px 0 rgba(0,0,0,0.3);
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  -webkit-box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
  -moz-box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
  box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
}
.flatbtn:hover {
  color: #fff;
  background-color: #73c437;
}
.flatbtn:active {
  -webkit-box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.1);
  -moz-box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
  box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
}

/** custom login button **/
.flatbtn-blu { 
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  display: inline-block;
  outline: 0;
  border: 0;
  color: #edf4f9;
  text-decoration: none;
  background-color: #4f94cf;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  font-size: 1.3em;
  font-weight: bold;
  padding: 12px 26px 12px 26px;
  line-height: normal;
  text-align: center;
  vertical-align: middle;
  cursor: pointer;
  text-transform: uppercase;
  text-shadow: 0 1px 0 rgba(0,0,0,0.3);
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
  -moz-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
}
.flatbtn-blu:hover {
  color: #fff;
  background-color: #519dde;
}
.flatbtn-blu:active {
  -webkit-box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.1);
  -moz-box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
  box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
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


#loginmodal {
  width: 300px;
  padding: 15px 20px;
 
  -webkit-border-radius: 6px;
  -moz-border-radius: 6px;
  border-radius: 6px;
  -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
  -moz-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
  box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
}

#loginform { /* no default styles */ }

#loginform label { display: block; font-size: 1.1em; font-weight: bold; color: #7c8291; margin-bottom: 3px; }


.txtfield { 
  display: block;
  width: 100%;
  padding: 6px 5px;
  margin-bottom: 15px;
  font-family: 'Helvetica Neue', Helvetica, Verdana, sans-serif;
  color: #7988a3;
  font-size: 1.4em;
  text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.8);
  background-color: #fff;
  background-image: -webkit-gradient(linear, left top, left bottom, from(#edf3f9), to(#fff));
  background-image: -webkit-linear-gradient(top, #edf3f9, #fff);

  background-image: -moz-linear-gradient(top, #edf3f9, #fff);
  background-image: -ms-linear-gradient(top, #edf3f9, #fff);
  background-image: -o-linear-gradient(top, #edf3f9, #fff);
  background-image: linear-gradient(top, #edf3f9, #fff);
  border: 1px solid;
  border-color: #abbce8 #c3cae0 #b9c8ef;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(255, 255, 255, 0.4);
  -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(255, 255, 255, 0.4);
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(255, 255, 255, 0.4);
  -webkit-transition: all 0.25s linear;
  -moz-transition: all 0.25s linear;
  transition: all 0.25s linear;
}

.txtfield:focus {
  outline: none;
  color: #525864;
  border-color: #84c0ee;
  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec;
  -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec;
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec;
}

nav#nav ul li a {
    padding: 25px 13px;
    margin-top: 15px;
    color: #fff;
    font-size: 15px;
	font-family: sans-serif;
}

nav#nav ul li a.active {
    color:#E39500;
	font-weight:600;
}


</style>
</head>


<footer id="footer">
		<div class="container_12">
		 <div class="grid_4">
           <a href="user.html?cmd=initHome"><img src="images/klug_Logo.png" alt=""></a>
        </div>
			<div class="grid_9" style="text-align:right">
				<p style="color:#ffffff"><i class="fa fa-map-marker" style="margin-left:10px"></i>13241 WOODLAND PARK ROAD, SUITE 110, HERNDON, VIRGINIA 20171, USA</p>
				<a href="user.html?cmd=demorequest" class="hov">CLICK FOR DEMO REQUEST!</a>
				&emsp;&emsp;
				<a href="ViewChatBox.html?cmd=openChatBox" style="font-size:larger;font-weight:800;padding:10px 10px;" class="hov" ><img src="jsp/LavlitaChatApp/images/Lavlita-AI_verysmall.jpg" style="border-radius:50%;height:35px;width:35px;margin-top: -2px;">Chat with Lavlita.AI</a>

				 <!--a id='__imgButtonClickToCall' href='#'  onclick="window.open('https://acctmgr.evoice.com/AcctMgr/ClickToCall/ClickToConnectSession.aspx?key=b59128d0-265b-421f-bd3e-99ace9ae1773','','width=570,height=280, left=40, top=100, resizable=no,scroll=yes,status=no,titlebar=no,toolbar=no,addressbar=no,copyhistory=no,navigationtoolbar=no')"  style='cursor:pointer;border:none;' class="hov"><i class="fa fa-phone"></i> CLICK TO CALL +1 703-439-2650</a>-->
				 <p>
					<a href="https://www.facebook.com/KlugWerks-734701153228288/" target="_blank" style="color:#ffffff"><i class="fa fa-facebook"></i></a>
						&nbsp;
					<a href="https://www.linkedin.com/company/digiblitz-technologies" target="_blank" style="color:#ffffff"><i class="fa fa-linkedin"></i></a>
						&nbsp;
					<a href="https://www.twitter.com/digiblitz" target="_blank"><i class="fa fa-twitter" style="color:#ffffff"></i></a>
						&nbsp;
					<a href="https://www.xing.com/companies/digiblitzeuropegmbh" target="_blank"><i class="fa fa-xing-square" style="color:#ffffff"></i></a>
			   </p>
			</div>
           
		</div>
    <div class="container_12">
       
        <div class="grid_12" align="right">
            <nav>
                    <ul class="sf-menu">
                        <li class="current"><a href="user.html?cmd=initHome">Home</a></li>
                        <li><a href="user.html?cmd=initwhyPoweringKlugWerks">What's Powering It?</a></li>
						<li><a href="user.html?cmd=initwhyKlugWerks">Why klugWerks?</a></li>
						<li><a href="user.html?cmd=initCompellingFeatures">Compelling Features</a></li>
						<li><a href="signUp.html?signUpProcess=getStarted">Pricing</a></li>
                        <li><a href="https://www.digiblitz.com/support/?cat=8" target="_blank">Support</a></li>
                        <li><a href="https://digiblitz.com/community" target="_blank">Community</a></li>
                        <li><a href="user.html?cmd=initConfig">Contact Us</a></li>
						<li><a href="#loginmodal" id="modaltrigger">Sign In</a></li>
                    </ul>
                </nav>
        </div>        
        
    </div>

	<div id="loginmodal" style="display:none;" class="bg1">
  <label style="size:25px"><h1>User Login</h1></label>
      <form id="loginform" name="loginform" method="post" action="login.html?cmd=initDash">
	 	  
    <div align="left" style="size:25px">Username:
	
	  <%
			String status = (String) request.getAttribute("status");
            if (status != null) {
                if (status.equals("fail")) {%>
				
	<div class="styleError">Invalid Login! Try logging in again.</div>
	<%} else if (status.equals("expired")) {%>
	<div class="styleError">License Expired.</div>
	 <% } else if (status.equals("conFailed")) {%>
	 <div class="styleError">Connection Problem ! Please Login Again.</div>
	 <% } else if (status.equals("users")) {%>
	 <div class="styleError">Licensed Users Exceeded.</div>
	 <% } } %>
	 
	</div>
      <input type="text" name="textfield" id="textfield" class="txtfield" tabindex="1" onBlur="usrStat();">
      
        <div align="left"  style="size:25px">Password:</div>
      <input type="password" name="textfield2" id="textfield2" class="txtfield" tabindex="2">
      
      <div class="center"><label><img src="images/register_button.jpg" alt="" width="20px" height="20px" style="cursor:pointer"/><input type="submit" name="Submit" id="loginbtn"  value="Sign In" tabindex="3" class="button-add"></label></div>
	
	  
	  <div align="center" style="margin-top:10px"><a href="user.html?cmd=initUsrReg" style="color:#0000FF">New user signup</a>  <a href="user.html?cmd=view" style="color:#0000FF">&emsp;&emsp;&emsp;&emsp;Forget password?</a></div> 

    </form>
  </div>
</footer>
</body>
</html>
