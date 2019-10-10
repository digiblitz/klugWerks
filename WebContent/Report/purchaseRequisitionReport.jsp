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
<%@ page import="java.util.*" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-base.css" />
<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-topbar.css" />
<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-sidebar.css" />


<link rel="stylesheet" type="text/css" href="css/EAframe.css" />
<link rel="stylesheet" type="text/css" href="css/Usermenu.css" />
<link rel="stylesheet" type="text/css" href="css/table.css" />
<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-base.css" />
<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-topbar.css" />
<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-sidebar.css" />
<script src="js/basic.js" type="text/javascript" ></script>

</head>


<body onload="searchSec()">

<header id="header">
<%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</header>
  <table width=100% border="1" cellpadding="0" cellspacing="0" class="content_new" align="center"  height="350">



        <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>

    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
	  <table width="700" border="1" align="center" cellpadding="0" cellspacing="5" id="centerTab">
	  <tr>
    	<td bgcolor="#eeeeee" class="bg" height="25">
	 		<span class="text8">Purchase Requisition Report</span>
		</td>
  		</tr>
        <tr>
          <!-- LEFT MENU STARTS HERE -->
          <!-- <%@ include file = "ADV_MappingRoleLeftBar.html" %> -->
          <!-- LEFT MENU ENDS HERE -->
          <td  class="subDeptTablePad"><!-- CONTENTS START HERE -->
              <table border="1" cellpadding="0" align="center" cellspacing="0" class="formLayout" width="100%">
                <tr>
                  <td height="61" colspan="2" bgcolor="#e2eaf2" class="tblDescrp"><strong> You can select Purchase Requisition Report  as given below. </strong><br />
                      <br />
                  </td>
                </tr>
                <tr>
                  <td><table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
                      <tr>
                        <td colspan="2" class="tblRowHead"><a href="showPurchaseRequisitionReport.do?type=purchaseRequisitionPeriodWise" >Purchase Requisition Status Wise for Particular Period </a> </td>
                      </tr>
                      <tr>
                        <td colspan="2" class="tblRowHead"><a href="showPurchaseRequisitionReport.do?type=purchaseRequisitionParticularStatus" >Purchase Requisition For a Particular Status</a> </td>
                      </tr>
                      <tr>
                        <td colspan="2" class="alignCenter">&nbsp;
                            <!-- DO NOT DELETE THIS ROW --></td>
                      </tr>
                  </table></td>
                </tr>
              </table>
            <!-- CONTENTS END HERE --></td>
        </tr>
      </table></td>
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
