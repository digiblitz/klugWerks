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
     <title>Home</title>
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
     </head>
<body id="top">

<!--==============================header=================================-->

<header id="header">
    <%@ include file = "../../include/Header.jsp" %>
</header>

<form id="form1" name="form1" method="post" action="">
<div class="bg1">

<!--=======slider================================-->

    <div class="slider_wrapper">
        <div id="camera_wrap">
           <div data-src="images/slide1.jpg">
                <div class="camera_caption">
                    <div class="container_12" style="width:1070px">
                       
                            <div class="title-2">A manufacturing Compliance</div>
                            <div class="title-2">& Best-Practices Automation <span>System</span></div>
                                          
                    </div>
                </div>
           </div>
            <div data-src="images/slide2.jpg">
                <div class="camera_caption">
                    <div class="container_12" style="width:1070px">
                       
                            <div class="title-2">A manufacturing Compliance</div>
                            <div class="title-2">& Best-Practices Automation<span>System</span></div>
                                          
                    </div>
                </div>
           </div>
            <div data-src="images/slide3.jpg">
                <div class="camera_caption">
                    <div class="container_12" style="width:1070px">
                        
                            <div class="title-2">A manufacturing Compliance</div>
                            <div class="title-2">& Best-Practices Automation<span>System</span></div>
                                        
                    </div>
                </div>
           </div>
        </div>
    </div>
    <div class="clear"></div>

<!--=======content================================-->

    <div id="content" class="p23" style="width:1024px; position: relative;
  background: url(../images/bg1.jpg) 0 0 repeat; margin:0 auto;">
        <div class="container_12 center">
            
                <h2 style="    background: #000;
    color: #fff;
    padding: 12px 0;">What is klugWerks?</h2>
				<div class="block">
                        <img src="images/manufacturingSmall.jpg" alt="">
                <p style="text-align: justify;">klugWerks reduces your complexities in dealing with Production management, Process accomplishments and compliance to  various global practices. We use state-of-the-art Processes, Production Management Methodologies and Compliance frameworks to raise the bar of excellence of our practice.</p>
   
                <p style="text-align: justify;">klugWerks helps your organization in Business Automation using BPM & SOA technologies. It is powered by dB-ELMT (Enterprise Landscape Management Transformation) platform which helps you to successfully implement your Business-Technology Landscape transformation projects. The solution is specifically tailor made for manufacturing industry.</p> 
			    <p style="text-align: justify;">dB-EID (Enterprise Integrated Dashboard) provides the front end presentation/facade portal for your business-technology transformation architecture and dB-ELMT helps to successfully implement ongoing transformation initiatives. In klugWerks, selected components of dB ELMT and dB EID are put together to build a best in class Manufacturing Framework. </p>
				
				<p style="text-align: justify;">klugWerks is offered as both SAAS under a private or public cloud (or combination of both) as well as under Enterprise License in your server.</p>
				
           </div>
	       
			</div>
	

        <div class="container_12 center">
		
			<h2 style="padding: 15px;
    background: #000;
    color: #fff;
    margin: 20px 0 0 0;">How is your business optimised with klugWerks?</h2>
                <div class="grid_6">
                    <div class="box1">
                        <!--<a href="#" class="circle col5"><i class="fa fa-gears"></i></a>-->
                        <div class="gridd">
							<h5>Manufacturing Best Practice</h5>
							<ul>
								<li><a>Conduct Evidence-Based Best Practices through our search manufacturing practice framework component</a></li>
								<li><a>Perform Promising Practices by connective with Industry Reference Architecture.</a> </li>
								<li><a>Outcome Based Practice.</a></li>
								<li><a>Document Management.</a></li>
								<li><a>Artifacts / Assets Management.</a></li>
								<li><a>Seamless Integration between various silos and BUs.</a></li>
							</ul>
						</div>
                        
                    </div>
                </div>
                
                <div class="grid_6">
                    <div class="box1">
                       <!-- <a href="#" class="circle col7"><i class="fa fa-globe glb"></i></a>-->
                         <div class="gridd">
							<h5>Risk Management</h5>
							<ul>
								<li><a>Risk Management.</a></li>
								<li><a>Risk Assessment processes.</a> </li>
								<li><a>Risk Prognosis process.</a></li>
								<li><a>Risk Management Processes.</a></li>
								<li><a>Credential s & Review Audit Processes.</a></li>
								<li><a>Rules based Potential Malpractice Detection & control.</a></li>
								
							</ul>
						</div>
                    </div>
                </div>
           
		</div>
        
		
		
		
		<div class="container_12 center">
            <h2 style="    background: #000;
    color: #fff;
    padding: 12px 0;">What's powering klugWerks?</h2>
			<ul style="text-align:left;">
				<li><i class="fa fa-check" style="padding:3px 7px;"></i><a>Active Engagement between Manufacturing Execution Systems (MES), Business Services and ERP.</a></li>
				<li><i class="fa fa-check" style="padding:3px 7px;"></i><a>Good Manufacturing Practice(GMP) guidelines.</a></li>
				<li><i class="fa fa-check" style="padding:3px 7px;"></i><a>Material & Safety - Data Sheet Compliance</a></li>
				<li><i class="fa fa-check" style="padding:3px 7px;"></i><a>Control / Mitigate Risk & 100% preparedness for Audit</a></li>
				<li><i class="fa fa-check" style="padding:3px 7px;"></i><a>OAGis & XML Data Standards.</a></li>
			
			</ul>
        </div>
		
		
		
		
        <!--<div class="container_12">
            <div class="grid_12">
                <div class="divider"></div>
                <div class="center">
                    <h3>Work smarter with our company!</h3>
                    <h3>We provide innovative and cost-effective industrial solutions!</h3>
                </div>
                <div class="divider"></div>
            </div>
        </div>-->
       
	   
	    <!--<div class="container_12">
            <div class="grid_12">
                <div class="center">
                    <h3>Our partners</h3>
                </div>
            </div>
        </div>-->
        <!--<div class="container_12">
            <div class="grid_2 alpha">
                <div class="item">
                    <div><img src="images/page1_ico1.png" alt=""></div>
                    <a href="#">company name</a>
                    <p>Lorem ipsum dolor set</p>
                </div>
            </div>
            <div class="grid_2">
                <div class="item">
                    <div><img src="images/page1_ico2.png" alt=""></div>
                    <a href="#">company name</a>
                    <p>Lorem ipsum dolor set</p>
                </div>
            </div>
            <div class="grid_2">
                <div class="item">
                    <div><img src="images/page1_ico3.png" alt=""></div>
                    <a href="#">company name</a>
                    <p>Lorem ipsum dolor set</p>
                </div>
            </div>
            <div class="grid_2">
                <div class="item">
                    <div><img src="images/page1_ico4.png" alt=""></div>
                    <a href="#">company name</a>
                    <p>Lorem ipsum dolor set</p>
                </div>
            </div>
            <div class="grid_2">
                <div class="item">
                    <div><img src="images/page1_ico5.png" alt=""></div>
                    <a href="#">company name</a>
                    <p>Lorem ipsum dolor set</p>
                </div>
            </div>
            <div class="grid_2 omega">
                <div class="item">
                    <div><img src="images/page1_ico6.png" alt=""></div>
                    <a href="#">company name</a>
                    <p>Lorem ipsum dolor set</p>
                </div>
            </div>   
			</div>-->                                                         
        </div>
    </div>
</div>
</form>

<!--=======footer=================================-->

 <footer>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/Footer.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </footer>
</body>
</html>
