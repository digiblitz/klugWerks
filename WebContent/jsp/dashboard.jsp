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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="javascripts/basic.js" type="text/javascript" ></script>
 <link rel="stylesheet" type="text/css" media="screen" 
        href="styles/menuExpandable.css" />    
    <script type="text/javascript" src="scripts/menuExpandable.js"></script>
</head>

<style>
    .vertical-line {
        width: 0;
        border: 1px solid #000000;
        height: 1px
		 
    }
</style>
<body>


<div>
<%@ include file = "../../include/HeaderProcess.jsp" %>
 
<!--%@ include file = "../../include/infobar.jsp" %-->
</div>


<table width=100% height="350" border="1" cellpadding="0" cellspacing="0"  class="content_new" align="center">
    <tr>
	
      
     
      <td  align="center" valign="top" class="tableCommonBg" style="vertical-align:middle">
<!--=======content================================-->

  
       

				<table>
				<tr>
				<td>&emsp;</td>
				<td width="40%" valign="middle" style="vertical-align:middle"> 
				
                   <div class="labelcust"><img src="images/industry-icon.png" alt="" height="40px" width="40px"/><label>Welcome to klugWerks</label></div>
					<br />
                    <div align="justify" class="labelcust">
                 <label> klugWerks is a manufacturing compliance process automation system build with four major objectives, they are Aggregate your ad-hoc Chemistry, Order, FNA,HR and supply chain Management functions into effective automated business process for best practices & compliances, Achieve Just-In Time and Agile Manufacturing Practices, Meet Industry standards & Compliances.</label> </div></td>
				  <td>&nbsp;&nbsp;</td>
				<td width="50%">
				
		<div class="labelcust"><img src="images/available-services.png" alt="" height="40px" width="40px"/><label>Available Services:</label></div>
		 <div style="height:10px"></div>
		
		
		 <%
						ArrayList headEntityList = (ArrayList)session.getAttribute("DBEntityList");
						if(headEntityList!=null && headEntityList.size()!=0){
							Iterator itEntList = headEntityList.iterator();
							int i=1;
							while(itEntList.hasNext()){
							
								String strRolelist[]= (String[])itEntList.next();
								String heRoleId = strRolelist[1];
								String heRoleName = strRolelist[3];
								String heEntityId = strRolelist[2];
								String heEntityName = strRolelist[4];
								String heEntityUrl = strRolelist[5];							
					            
								if(heEntityUrl==null){	
								
							%>
		 
		 <div class="labelcust">
		
		      <a class="markered color_2 text_6 wrapper4-t" href="<%=request.getContextPath()%>/login.html?cmd=initIndex&entityId=<%=heEntityId%>&roleId=<%=heRoleId%>&UsrId=<%=userId%>" style="cursor:pointer"><img src="images/page1_img<%=i%>.png" alt="" height="40px" width="40px"/>&nbsp;<label style="margin-bottom:10px;cursor:pointer"><%=heEntityName%></label></a>
		       </div></div>
			   <div style="height:10px"></div>		 
		 <%
						  	}else{%>
						  		
						  		<li><a href="<%=request.getContextPath()+heEntityUrl%>"><span><%=heEntityName%></span></a></li>
						  	<%}
		 i++;}}%>
		 
		 
		 
			   
			   
		
		</td></tr></table>
		
		
		
		
		
		
		
		

      
        
        <div class="container_12">
            <div class="grid_12">
             
            </div>
        </div>
      
    </div>

</td></tr></table>


<!--=======footer=================================-->

<div>		 
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
</div>

</body>
</html>
