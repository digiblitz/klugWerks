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
       
<style type="text/css">
.dropdown span{
color:#FFFFFF;
}
.dropdown span:hover{
background-color:#FFFFFF;
color:#0099FF;
}
.dropdown ul:hover{
border-style:groove;
border-width:thin;
}
.dropdown ul>li:hover{
background-color:#CCCCCC;
}

#header {}
</style>
     </head>
<body id="top">

<!--==============================header=================================-->

<%String fstnam=(String)session.getAttribute("firstName");
String lstnam=(String)session.getAttribute("lastName");
//System.out.println("last name : "+lstnam);
String imagedata=(String)session.getAttribute("imagedata");

String roleName=(String)session.getAttribute("roleName");
String fullName=fstnam+" "+lstnam;

System.out.println("fstnam::::"+fullName);

String userId=(String)session.getAttribute("userId");
System.out.println("UserId in headerProcess : "+userId);

String userName1=(String)session.getAttribute("userName");
String userPassword1=(String)session.getAttribute("userPassword");

session.setAttribute("userName",userName1);
session.setAttribute("userPassword",userPassword1);

System.out.println("username&password in the headerprocess::::"+userName1+"" +userPassword1);
System.out.println("roleName in the headerprocess::::"+roleName);

%>

<header id="header" style="background:#000!important; height:67px; padding-top:31px; margin-top:-27px">
    <div id="stuck_container"> 
	<div class=".container_12 ">
            <div class="grid_12">
                <nav>
                    <ul class="sf-menu">
										<li><a href="user.html?cmd=initHome"><img src="images/klug_Logo.png" alt="Logo" width="150px" height="46px" style="margin:-9px 7px; float:left; margin-left:22px"></a></li>
							<!--li class="current"><a href="user.html?cmd=initHome">Home</a></li-->
			
					 <li></li> <li></li> <li></li> <li></li> <li></li> <li></li> <li></li> <li></li> <li></li> <li></li> <li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li>

                       <%if(!(fullName.equalsIgnoreCase("NULL NULL"))){%>	
                        
						<li><a href="user.html?cmd=homeDash"><img src="images/home (1).png" alt="" width="30px" height="25px"></a></li>
						
						<li class="current"><a href="#"><img src="data:image/jpeg;base64,<%=imagedata %>" alt="" width="30px" height="25px">
							<%=fullName%></a>                   				
                            <!--ul>
                                <li><a href="user.html?cmd=edit">My profile</a></li>
                                <li><a href="user.html?cmd=initchgPwd">Change your password</a></li>                              
							</ul-->						
						</li>
						
						<li><a href="#">Current Role: <%=roleName%></a></li>
						<li><a href="logout.html?cmd=logout">Sign out</a></li><%}%>
                    </ul>
                </nav>
            </div>
			</div>
    </div>
    <!--div class="container_12">
        <div class="grid_12">
            <h1><a href="frmHome.jsp"><img src="images/logo3.jpg" alt=""></a></h1>
        </div>     
    </div-->
</header>






</body>
</html>
