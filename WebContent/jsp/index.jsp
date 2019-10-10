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
<!--  %@ page import="java.util.*"%-->
<!--  %@ page import="java.sql.*"%-->

<!--  %@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %-->
<!--  >%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %-->
<!--  %@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %-->
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


</div>

 <table width=100% height="350" border="1" cellpadding="0" cellspacing="0"  class="content_new" align="center">
    <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>
    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg">
<!--=======content================================-->
    
       
	 
	  <table width="887"  border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab">
	  <tr>
          <td width="887" height="400" style="vertical-align:middle"> 
			<div align="center">
			  <table style="border:thin;border-style:groove;" border="1">
			  <tr>
			  	<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			  </tr>
			    <tr>
				<td>&nbsp;&nbsp;</td>
			      <td>
			        <strong>	Here each user can be granted privileges and permission for each role, giving them a tailored set of abilities.<br />
			          Roles define what actions the user can take, privileges specify the targets to which their roles apply.<br />
			          And you can view the permissions granted by each role.			          
					 </strong>			        
				  </td>
				  <td>&nbsp;&nbsp;</td>
				  </tr>
				  <tr>
				  	<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
		      </table>
	      </div></td>
        </tr>
      </table>
	  
           
   
</td>
</tr>
<tr><td>&nbsp;</td></tr>
</table>
<!--=======footer=================================-->
 <footer>			 
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </footer>
</body>
</html>
