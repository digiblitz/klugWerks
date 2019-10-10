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
<%@page import="com.hlccommon.util.HLCMenuListVO"%>
<%@ page import="java.util.*"%>
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
		.onclick-menu {
    position: relative;
    display: inline-block;
}
.onclick-menu:before {
    content: "click to save!";
}
.onclick-menu:focus .onclick-menu-content {
    display: block;
}
.onclick-menu-content {
    position: absolute;
    z-index: 1;

    display: none;
}
		</style>
       

<script language="javascript">
	
	  function noBack() {  
		 
		window.history.forward(); }

    noBack();
    window.onload = noBack;
    window.onpageshow = function (evt) { if (evt.persisted) noBack(); }
    window.onunload = function () { void (0); }
  </script>

     </head>
<body>

<header id="header">

    <div id="stuck_container_menuBar">
	
            <div class="grid_12">
                <nav>
                   				
					 <ul class="sf-menu" style="margin-top:-23px">
					 <li><a href="#">My Profile</a><ul>
					<li><a href="user.html?cmd=edit">Edit Profile</a></li>
					<li><a href="user.html?cmd=initchgPwd">Change Password</a></li>
					<!--li><a href="ExterApp.html?process=processList">Process List</a></li-->
					</ul></li>
					
					
					<%
						ArrayList headEntityList = (ArrayList)session.getAttribute("privList");
						if(headEntityList!=null && headEntityList.size()!=0){
							Iterator itEntList = headEntityList.iterator();
							
							while(itEntList.hasNext()){
							
								String strRolelist[]= (String[])itEntList.next();
								String heRoleId = strRolelist[1];
								String heRoleName = strRolelist[3];
								String heEntityId = strRolelist[2];
								String heEntityName = strRolelist[4];
								String heEntityUrl = strRolelist[5];
								String privName= strRolelist[6];
					            String priviId = strRolelist[7];
					            
								if(heEntityUrl==null){	
								//System.out.println(heEntityName);
							%>
                        <li><a href="frmHome.jsp"><%=privName%></a>
                            <ul>
							
							<%
						ArrayList headAllList = (ArrayList)session.getAttribute("DBAllList");
						if(headAllList!=null && headAllList.size()!=0){
							Iterator itAllList = headAllList.iterator();
							
							while(itAllList.hasNext()){
							
								String strAlllist[]= (String[])itAllList.next();
								
								String allEntityId = strAlllist[2];
								String allEntityName = strAlllist[4];
								
								String hePrivName = strAlllist[6];
								String hePrivId = strAlllist[7];
								String accessName = strAlllist[8];
								String accessUrl = strAlllist[9];
								
								//System.out.println("accessUrl in jsp::"+accessUrl);
								
								String tempAccesURL="";
								
								boolean tempURL = accessUrl.contains("viewMaster.do?process");
								//System.out.println("Result : "+tempURL);
								if(tempURL == true){
									tempAccesURL=accessUrl.replace("viewMaster.do?process","artifactMapping.html?artiMapProcess");
									}
									else{
									tempAccesURL=accessUrl.replaceAll("do","html");
									}

									System.out.println("tempAccesURL in jsp::"+tempAccesURL);
						if(hePrivId.equals(priviId)){	
									  			
						%>
							
                            <li><a href="<%=tempAccesURL%>"><span><%=accessName%></span></a>
															
									
								</li>

								
								
						<%
						
							} %>
						
							<%
							}}%>		
								
								
								
                           </ul>
                        </li>
						
							<%
						  	}else{%>
						  		
						  		<li><a href="<%=request.getContextPath()+heEntityUrl%>"><span><%=heEntityName%></span></a></li>
						  	<%}
						
							}} %>	
							<% String urlName1=(String)request.getAttribute("urlName");
							System.out.println("urlName1 : "+urlName1);
							
							if(urlName1!=null && (urlName1.equalsIgnoreCase("BpDesigner"))){
							%>
			
					
<li><a href="ExterApp.html?process=upLoadButton">UpLoad File</a></li>
<li></li>



				<%}%>	
				
                    </ul>
						
                </nav>
				
            </div>
    </div>
  
</header>






</body>
</html>
