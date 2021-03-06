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
<%@ page import="java.util.*"%>

<%@ page import="java.io.*"%>

<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="javascripts/basic.js" type="text/javascript" ></script>
 <script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" media="screen" 
        href="styles/menuExpandable.css" />    
    <script type="text/javascript" src="scripts/menuExpandable.js"></script>
<script language="javascript">

 $(document).ready(     function() { 
	   var url1=document.getElementById("url1").value;
		/*https://98.172.19.186:8443/partymgr/control/main
		https://98.172.19.186:8443/projectmgr/control/main
		https://98.172.19.186:8443/myportal/control/main
		https://98.172.19.186:8443/finance/control/main
		https://98.172.19.186:8443/humanres/control/main
		var url1="https://98.172.19.186:8443/projectmgr/control/login?USERNAME=:1&PASSWORD=:2";*/
		//alert(url1);
		 if(url1.indexOf(":1")!==-1){
		
        var username=document.getElementById("username").value;
        var password=document.getElementById("userpassword").value;
       url1= url1.replace(":1",username);
       url1 =url1.replace(":2",password);
      
       url=encodeURI(url1);
	 
	    //document.getElementById("ifrm").height = ($(window).height() * 2);
		//document.documentElement.style.overflow = 'hidden';
		document.getElementById("ifrm").height = "550";
        document.getElementById("ifrm").src=url;
		
        //document.getElementById("ifrm").height = document.frames[ifr].document.body.scrollHeight;
       }
        else{
        	//  document.getElementById("ifrm").height = ($(window).height() * 2);
			//alert($(window).height());
			document.documentElement.style.overflow = 'hidden';
        	 url=encodeURI(url1);
             document.getElementById("ifrm").src=url;
        }
     
       
    }); 

</script>
</head>
<%String url1=(String)request.getAttribute("url");
String userName=(String)session.getAttribute("userName");
String userPassword=(String)session.getAttribute("userPassword");
String urlName=(String)request.getAttribute("urlName");


System.out.println("url1=================>"+url1);
System.out.println("url1=================>"+urlName);
%>


<body>

<header id="header">
<%@ include file = "../../include/HeaderProcess.jsp" %>
</header>

<table width=100% height="350" border="1" cellpadding="0" cellspacing="0"  class="content_new" align="center">
    <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>
    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
<!--=======content================================-->
    
       
      
	 
	  <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" height="490px">
	  <tr>
          <td width="100%" height="100%">
          <input type="hidden" value=<%=userName %> id="username"/>
<input type="hidden" value=<%=userPassword %> id="userpassword"/>	
<input type="hidden" value=<%=url1%> id="url1"/>

<%				if(urlName!=null && (urlName.equalsIgnoreCase("AnalyzeBP") || urlName.equalsIgnoreCase("CreateBP"))){

%>
					<iframe src="https://www.digiblitzonline.com:8943/oryx/editor;bpmn2.0?stencilset=/stencilsets/bpmn2.0/bpmn2.0.json" height="110%" width="100%" id="ifrm" name="ifrm" frameborder="0" style="margin-top:-45px;margin-left:0px;margin-bottom:0px">
</iframe>
				<!--iframe src="http://localhost:8180/backend/poem/repository" height="108%" width="100%" frameborder="0" style="margin-top:-30px;margin-left:0px;margin-bottom:0px">
</iframe-->
				<%
				}else if(urlName.equalsIgnoreCase("DeployBP")){
				
				%>
					<iframe src="https://www.digiblitzonline.com:8943/ode" height="110%" width="100%" id="ifrm" name="ifrm" frameborder="0" style="margin-top:-50px;margin-left:0px;margin-bottom:20px">
</iframe>
			<!--iframe src="http://localhost:8180/drools-guvnor/org.drools.guvnor.Guvnor/Guvnor.jsp?" height="112%" width="100%" frameborder="0" style="margin-top:-60px;margin-left:0px;margin-bottom:30px">
</iframe-->
					
			<%
				}else if(urlName!=null && urlName.equalsIgnoreCase("BpDesigner")){
				%>
				<iframe src="https://www.digiblitzonline.com:8943/oryx/editor;bpmn2.0?stencilset=/stencilsets/bpmn2.0/bpmn2.0.json"  id="ifrm" name="ifrm" height="110%" width="100%"  frameborder="0" style="margin-top:-45px;margin-left:0px;margin-bottom:0px;">
</iframe>

				<!--iframe src="http://localhost:8180/oryx/editor;bpmn2.0?stencilset=/stencilsets/bpmn2.0/bpmn2.0.json"  name="ifrm" height="135%" width="100%"  frameborder="0" style="margin-top:-105px;margin-left:0px;margin-bottom:0px;">
</iframe-->
			<!--iframe src="http://demo.bpmn.io/new" height="115%" width="130%"  frameborder="0" style="margin-top:-20px;margin-left:0px;margin-bottom:0px;margin-right:-50px">
</iframe-->

<!-- Without using iframe -->
<!--object type="text/html" data="http://demo.bpmn.io/new" style="width:100%; height:100%">
<p>backup content</p>
</object-->
				
				<%
				}else if(urlName!=null && urlName.equalsIgnoreCase("MonitorBP")){
				%>
				<iframe src="https://www.digiblitzonline.com:8943/backend/poem/repository" height="110%" width="100%" id="ifrm" name="ifrm" frameborder="0" style="margin-top:-45px;margin-left:0px;margin-bottom:20px">
</iframe>
				<!--iframe src="http://localhost:8180/jbpm-console" height="112%" width="100%" frameborder="0" style="margin-top:-49px;margin-left:0px;margin-bottom:30px">
</iframe-->
				<%
				}else if(urlName!=null && urlName.equalsIgnoreCase("FM")){
				%>
<iframe src="https://www.digiblitzonline.com:7443/myportal/control/login?USERNAME=<%=session.getAttribute("userName")%>&PASSWORD=<%=session.getAttribute("userPassword")%>" height="108%" id="ifrm" name="ifrm" width="100%" frameborder="0" style="margin-top:-30px;margin-left:0px;margin-bottom:0px">
</iframe>

<!--iframe src="https://localhost:7443/myportal/control/login?USERNAME=<%=session.getAttribute("userName1")%>&PASSWORD=<%=session.getAttribute("userPassword1")%>" height="108%" width="100%" frameborder="0" style="margin-top:-30px;margin-left:0px;margin-bottom:0px">
</iframe-->
				<%
				}else if(urlName!=null && urlName.equalsIgnoreCase("VMSApp")){
				%>
				<iframe src="" height="110%" width="100%" id="ifrm" name="ifrm" frameborder="0"  style="margin-top:-38px;margin-left:0px;margin-bottom:0px">
</iframe>
					<%
				}else if(urlName!=null && urlName.equalsIgnoreCase("FinanceApp")){
					%>
					<iframe src="https://www.digiblitzonline.com:7443/finance/control/login?USERNAME=<%=session.getAttribute("userName")%>&PASSWORD=<%=session.getAttribute("userPassword")%>" name="ifrm" id="ifrm" height="108%" width="100%" frameborder="0" style="margin-top:-38px;margin-left:0px;margin-bottom:0px">
	</iframe>
	
					<%
					}else if(urlName!=null && urlName.equalsIgnoreCase("ESSApp")){
						%>
						<iframe src="https://www.digiblitzonline.com:7443/accounting/control/login?USERNAME=<%=session.getAttribute("userName")%>&PASSWORD=<%=session.getAttribute("userPassword")%>" name="ifrm" id="ifrm" height="108%" width="100%" frameborder="0" style="margin-top:-38px;margin-left:0px;margin-bottom:0px">
		</iframe>
		
						<%
						}else if(urlName!=null && urlName.equalsIgnoreCase("ProjectMgmt")){
							%>
							<iframe src="https://www.digiblitzonline.com:7443/projectmgr/control/login?USERNAME=<%=session.getAttribute("userName")%>&PASSWORD=<%=session.getAttribute("userPassword")%>" name="ifrm" id="ifrm" height="108%" width="100%" frameborder="0" style="margin-top:-38px;margin-left:0px;margin-bottom:0px">
			</iframe>
			
							<%
							}else if(urlName!=null && urlName.equalsIgnoreCase("HRApp")){
								%>
								<iframe src="https://www.digiblitzonline.com:7443/humanres/control/login?USERNAME=<%=session.getAttribute("userName")%>&PASSWORD=<%=session.getAttribute("userPassword")%>" name="ifrm" id="ifrm" height="108%" width="100%" frameborder="0" style="margin-top:-38px;margin-left:0px;margin-bottom:0px">
				</iframe>
				
								<%
								}else if(urlName!=null && urlName.equalsIgnoreCase("CRMApp")){
									%>
									<iframe src="https://www.digiblitzonline.com:7443/partymgr/control/login?USERNAME=<%=session.getAttribute("userName")%>&PASSWORD=<%=session.getAttribute("userPassword")%>" name="ifrm" id="ifrm" height="108%" width="100%" frameborder="0" style="margin-top:-38px;margin-left:0px;margin-bottom:0px">
					</iframe>
					
									<%
									}
				%>
</td>
        </tr>
        
      </table>
	  
           
      
   
</td>
</tr>
</table>
<!--=======footer=================================-->
 <footer>			 
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </footer>

</body>
</html>
