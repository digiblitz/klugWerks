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
<html lang="en">
     <head>
     <title>Privacy Policy</title>
     <meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="images/favicon.ico" type="image/x-icon">
     <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
     <link rel="stylesheet" href="css/camera.css"> 
     <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="css/font-awesome.css">
     <link rel="stylesheet" href="css/stuck.css">
	 <link rel="stylesheet" href="css/skeleton.css">
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
		<style>
	.high{
	}
	
   
    .Heading
    {
        display: table-row;
        font-weight: bold;
        text-align: center;
    }
	
    
	
	.grid_3 p{ text-align:justify;}
		</style>
     </head>
<body id="top">

<!--==============================header=================================-->

<header id="header">
    <%@ include file = "../../include/Header.jsp" %>
</header>


<div class="bg1">

<div class="slider_wrapper">
        <div id="camera_wrap">
           <div data-src="images/slide1.jpg">
                <div class="camera_caption">
                    <div class="container_12" style="width:1070px">                 
                            <div class="title-2">A Manufacturing Business Digital Transformation</div>
                            <div class="title-2">& Process Automation <span>System</span></div>
							<p >&nbsp;</p>
							<a href="signUp.html?signUpProcess=getStarted" class="newastyle" style="margin-left:331px">Get Started</a>
							&nbsp;<p class="newpstyle">&nbsp;&nbsp;or</p>
							<a href="signUp.html?signUpProcess=preaskcoupon" class="newastyle">Start a free 30-day trail</a>
                        </div>                  
                    
                </div>
           </div>
            <div data-src="images/slide2.jpg">
                <div class="camera_caption">
                    <div class="container_12" style="width:1070px">
                        
                            <div class="title-2">Reduce Complexities In Production Management</div>
                            <div class="title-2" style="margin-top:4px;">& Process Accomplishments  </div>
							<p >&nbsp;</p>
							<a href="signUp.html?signUpProcess=getStarted" class="newastyle" style="margin-left:331px">Get Started</a>
							&nbsp;<p class="newpstyle">&nbsp;&nbsp;or</p>
							<a href="signUp.html?signUpProcess=preaskcoupon" class="newastyle">Start a free 30-day trail</a>
                        </div>                  
                    
                </div>
           </div>
            <div data-src="images/slide3.jpg">
                <div class="camera_caption">
                    <div class="container_12" style="width:1070px">
                        
                            <div class="title-2">Use State-Of-The-Art Compliance Frameworks <br>To Raise The Bar Of Excellence </div>
							<p >&nbsp;</p>
							<a href="signUp.html?signUpProcess=getStarted" class="newastyle" style="margin-left:331px">Get Started</a>
							&nbsp;<p class="newpstyle">&nbsp;&nbsp;or</p>
							<a href="signUp.html?signUpProcess=preaskcoupon" class="newastyle">Start a free 30-day trail</a>
                            
                        </div>                  
                   
                </div>
           </div>
        </div>
    </div>
    <div class="clear"></div>

<!--=======content================================-->

    <div id="content" class="p23" style="width:1170px; position: relative;
  background: url(../images/bg1.jpg) 0 0 repeat; margin:0px auto;">
        <div class="container_12 center">
         <h1 class="high">PRIVACY POLICY</h1>
		<div class="container-12">
			<h2 style="text-align:left; margin-top:30px; color:#000; font-size: 24px;"><strong>1.Declaration on Data Protection</strong></h2>
			<div style="text-align:justify; font-size:14px">
			<p>
			<div class="gridd gridd1">
			digiBlitz appreciates your visit to our website and thank you for your interest in our company, our products and our services. Protection of your privacy and personal data is an important matter for us. In order to guarantee you a high level of transparency and security, our declaration on data protection as set forth below will inform you as to the nature, scope and purpose of any collection, use and processing of information and data recorded by us.  In this respect, please keep in mind that this declaration on data protection refers only to the publicly accessible websites with the following Internet addresses/URLs of digiBlitz's Product sites:
			<div>&nbsp;</div>
			(I)<a> oe.smartlehren.com</a> 
			<br>
			(II)<a> https://www.digiblitzonline.com:18443/smartlehren</a>
			<br>
			(III)<a> oe.guildkraft.com</a>
			<br>
			(IV)<a> http://www.digiblitzonline.com:8680/guildKraft</a>
			<br>
			(V)<a> oe.menschforce.com</a>
			<br>
			(VI)<a> http://www.digiblitzonline.com:8843/menschForce</a>
			<br>
			(VII)<a> oe.klugwerks.com</a>
			<br>
			(VIII)<a> http://www.digiblitzonline.com:8843/KlugWerks</a>
      			</p>
				
				<div>&nbsp;</div>
				<p>Our website also makes reference to third parties. As a rule, these are identified by stating the relevant Internet address or the company/product logo. digiBlitz has no influence whatsoever on the contents and design of sites of other providers and therefore cannot extend the warranties under this declaration on data protection to such sites. Nor does the fact that we refer to such sites mean that we adopt their contents as our own.</p> 
				
				<h2 style="text-align:left; margin-top:30px; color:#000; font-size: 24px;"><strong>2.Cookies </strong></h2>
				 
<p>Our websites use so-called session cookies. These cookies deposit data for purposes of technical regulation in your browser's memory. However, they do not contain any personal data and are deleted after your browser is closed.  We do deposit cookies on your computer, which are not deleted after conclusion of the session. These make it possible to recognize your computer when the forums are next visited. Such cookies make it possible for us to adapt the website to your interests. For U.S.-based visitors, we may also use cookies to present banners to you across the Internet based on your interest. With your consent, we store your password so that you do not have to re-enter it each time. 
Moreover, it is possible for you to set your browser such that cookies are rejected or you are informed prior to storage thereof.  Flash-Cookies or Local Shared Objects (LSO) will not be used by digiBlitz. Also Session Storage or DOM Storage will not be used.</p> 


<h2 style="text-align:left; margin-top:30px; color:#000; font-size: 24px;"><strong>3.Communication-related and Use-related Data</strong></h2>
         
<p>Generally speaking, you may visit digiBlitz Partnership's website without us finding out who you are. Only for statistical and internal system-related purposes do we record the access time, the quantity of data transferred, the pages of ours that you visited, the page from which you accessed our website and the browser that you use (log files), in addition to you IP address. To the extent that such information might enable conclusions in relation to personal data, these are naturally subject to the relevant statutory data protection provisions. The data is not personalized. The data is deleted following statistical evaluation.</p>


<h2 style="text-align:left; margin-top:30px; color:#000; font-size: 24px;"><strong>4.Collection of Personal Data</strong></h2>
 
<p>In order to be able to utilize the offers made on our website, in particular, downloads, online forums, online applications, individual enquiries, registrations for our courses or registrations for other services, it is necessary that we obtain personal data from you. The personal data entails individual statements concerning personal and material relations pertaining to you, such as your name, your address or your e-mail address. Such information is collected by us only if you provide it voluntarily and show us in this way that you agree to the use and processing thereof. In this respect, it goes without saying for us that such data is necessarily only collected where it is absolutely mandatory for implementation of the relevant offers. Where we request additional data, this occurs solely for purposes of, for example, facilitating communication with you or improving our service.</p>


<h2 style="text-align:left; margin-top:30px; color:#000; font-size: 24px;"><strong>5.Use and Processing of Personal Data </strong></h2>
 
<p>As a rule, digiBlitz uses and processes the personal data provided for purposes of contractual settlement and processing your enquiries and requests.  Data with personal content is processed and used to a limited extent for customer management and marketing purposes, provided the relevant statutory provisions permit this. Should you no longer agree to such use, you may, of course, object to further use at any time.  Moreover, your information provided to us may be combined with data on you that has already been stored by us. Such data combination has, inter alia, the advantage of keeping your customer data collected by us updated at all times, guaranteeing the accuracy of the collected information and being able to optimize our service to you.  We use and process your data outside these parameters only if you have expressly granted your prior consent thereto and only for purposes of which you have been advised. Thus, for example, you may stipulate in an online application whether we may review the application with respect to other positions in our company. Only in this event will we use such data for this purpose.</p>



<h2 style="text-align:left; margin-top:30px; color:#000; font-size: 24px;"><strong>6.Forwarding of Data</strong></h2>
 
<p>digiBlitz does business globally. To this extent, in order to better process your matter, it might be necessary to forward your data to local subsidiaries or to local distribution partners, whose registered office might also be located in states outside the EU. However, such transmission takes place only within the group and only for the aforementioned purposes.  Naturally we do not forward your data to other third parties, unless we are obliged to do so by virtue of statutory provisions or judicial order.  In particular, your personal data shall not be sold, leased or exchanged.</p>


<h2 style="text-align:left; margin-top:30px; color:#000; font-size: 24px;"><strong>7.E-mail Contact</strong></h2>
 
<p>Should you provide us with your e-mail address, we will also communicate with you by e-mail. Should you no longer desire such information, it is naturally possible for you at any time to revoke your consent. In this case, please send us a short message to the given postal or e-mail address.</p>


<h2 style="text-align:left; margin-top:30px; color:#000; font-size: 24px;"><strong>8.Participation in Forums </strong></h2>
 
<p>On our "digiBlitz Community" website, we offer you the possibility of participating in online forums. To this end, we require sufficient information in order to be able to clearly identify you so that, where applicable, we can meet our duty to subsequently identify authors of illegal content. Your personal data is not disclosed to other forum participants unless you have consented thereto in your user profile. Please keep in mind that the texts published by you may be viewed in part by everyone without limitation on the Internet. To this extent, please observe our Terms of Use when registering for our online forums. Technical administration and hosting of the forums is conducted on our behalf and is controlled by us, in part, outside the EU as well.</p>


<h2 style="text-align:left; margin-top:30px; color:#000; font-size: 24px;"><strong>9.Data Protection for Minors </strong></h2>

<p>The offers on this website are not directed at children. We therefore assume that we will not become aware of any personal data pertaining to children.</p>


<h2 style="text-align:left; margin-top:30px; color:#000; font-size: 24px;"><strong>10.Technical and Organizational Data Protection  </strong></h2>
 
<p>Naturally, digiBlitz takes those technical and organizational measures appropriate given the respective purpose of the data protection in order to protect the information provided by you against abuse and loss. Such data is stored in a secure operating environment that is not accessible to the public. In addition, each of our employees is naturallyinstructed on data protection and obliged to enter into a confidentiality covenant.</p>


<h2 style="text-align:left; margin-top:30px; color:#000; font-size: 24px;"><strong>11.E-Mails to digiBlitz</strong></h2>

<p>Because of tax requirements digiBlitz has to archive e mails for ten years in some countries. The e mail system of digiBlitz and other members of the digiBlitz Group are intended to be used only for business purposes.</p>


<h2 style="text-align:left; margin-top:30px; color:#000; font-size: 24px;"><strong>12.Modification of the Declaration on Data Protection  </strong></h2>

<p>As a result of the ongoing development of the Internet, it will be necessary to adapt this declaration on data protection to changing conditions on an ongoing basis. Timely notice of such modification shall be given on this page.</p>

<h2 style="text-align:left; margin-top:30px; color:#000; font-size: 24px;"><strong>13.Procedural List</strong></h2>

<p>You may obtain a general overview of the purpose for which and the group of persons on which digiBlitz collects, processes and uses personal data in the public Procedural List shown on this website.</p>


<h2 style="text-align:left; margin-top:30px; color:#000; font-size: 24px;"><strong>14.Information and Other Rights, Contact</strong></h2>
 
<p>Upon written request, our data protection officer would be happy to provide you with information as to whether – and if so, which – personal data we store in relation to you. Should your personal data be incorrect, you may have this rectified immediately. Naturally any such information or modification is free of charge.  Moreover, you are entitled to revoke your consent to use of data in the future, in whole or in part. Should you desire this, we will delete or block your relevant data.  In order to assert such rights, please contact digiBlitz data protection officer. Naturally, you may contact digiBlitz data protection officer directly at any time should you have questions, comments or complaints in connection with this declaration on data protection: digiBlitz Data Protection Officer Saravanan Kailasam
<div>&nbsp;</div> 
<a>digiBlitz Inc.</a>
<br>
<a>13241 WOODLAND PARK ROAD,</a>
<br>
<a>SUITE 110, HERNDON,</a>
<br>
<a>VIRGINIA 20171, USA.</a>

</p>

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
