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
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/frmrRolePrevilageValidate.js" type="text/javascript" ></script>
<!--//Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->

<script>
    function cancelAddRole(privName,accessName)
    {
        if(confirm("Do you want to Cancel and go back to List Page?"))
	{
        strURL = "./roles.html?roleProcess=roleList&navPrivName="+privName +"&navAccessName="+accessName;
	window.location.href = strURL;
        }
	else
	{
		return;
	}
    }
</script>
</head>


<body>


<header id="header">
<%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</header>
  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0"  class="content_new" align="center">
            <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>

    <tr>
	
      <td  align="center" valign="middle" class="tableCommonBg" >
	  
	 
	  
	  
	  <table width="630" height="100" border="0" align="center" cellpadding="0" cellspacing="0" id="centerTab" style="border:thin;border-style:groove;" >
        <tr>
          <!--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
         
          <!--Ends:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
          <td width=100% valign="top" class="subDeptTablePad"><!-- CONTENTS START HERE -->
              <table border="1" cellpadding="0" align="center" cellspacing="0" class="formLayout" width="630">
                <tr >
                  <td colspan="2"  class="tblMainHead"><img src="images/create-icon.jpg" alt="" width="20px" height="20px" /> <strong>&nbsp;Create a Role:</strong><div class="divider3"></div></td>
                </tr>
                <tr>
                  <td height="35" colspan="2" valign="middle" class="tblDescrp"><!--<img src="images/usea_logo.jpg" class="imgFloatLeft" />-->
                    <strong>Create</strong> a <strong>New Roles</strong> for all members and non-members.</td>
                </tr>
                <tr>
                  <td><!--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                      <!--<form name="frmRoleMgtRolePrev" id="frmRoleMgtRolePrev" action="" onsubmit="return myvalidate();">-->
                      <form name="frmRoleMgtRolePrev" id="frmRoleMgtRolePrev" action="" onsubmit="return formValidate(this);">
                        <!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                        <input type="hidden" name="roleProcess" value="createRole"/>
                        <table width="630" border="0" align="center" cellpadding="0" cellspacing="0" class="formLayout">
                          <tr>
                            <td height="34"  colspan="2" valign="middle" class="tblDescrp"> &nbsp;<font color="#FF0000">Fields marked with an asterisk (<span class="asterisk">*</span>) are required. </font></td>
                          </tr>
                          <%
						  	String err = request.getParameter("err");
						  	if(err!=null) {
						  %>
                          <tr>
                            <td height="24" colspan="2" class="styleError"><strong>&nbsp;Role already exist</strong></td>
                          </tr>
                          <%
						  }
						  %>
                          <tr>
                            <td width="275" height="26" valign="middle" class="tableLeft"> &nbsp;&emsp;&emsp;Role:</td>
                            <td valign="middle" class="tableRight"><!--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                <!--<input name="rolename" id="rolename" type="text" class="textboxOne" size="25"/></td>-->
                                <input name="rolename" id="rolename" type="text" class="textboxOne" size="25" maxlength = "100"/>
                            <font color="#FF0000">*</font> </td>
                            <!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                          </tr>
                          <%--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011--%>
                          <tr>
                            <td height="26" valign="middle" class="tableLeft">&nbsp;&emsp;&emsp;Description:</td>
                            <td valign="middle" class="tableRight"><!--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                <!--<input name="roledesc" id="roledesc" type="text" class="textboxOne" size="25" /></td>-->
                                <input name="roledesc" id="roledesc" type="text" class="textboxOne" size="25" maxlength = "100"/>
                            <font color="#FF0000">*</font> </td>
                            <!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                          </tr>
                          <tr>
                            <td height="26" valign="middle" class="tableLeft">&nbsp;&emsp;&emsp;Status:</td>
                            <td  width="612" valign="middle" class="tableRight" td="td" ><!--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                <input type="radio" name="status" value="1"  id="status1"/>
                              Active
                              <input type="radio" name="status" value="0"  id="status2" />
                            Inactive  <font color="#FF0000">*</font> </td>
                            <!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                          </tr>
                          <%--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011--%>
						  
						  <% 
						String privName=(String)session.getAttribute("navPrivName");
					    String accessName=(String)session.getAttribute("navAccsName");
					  
					  %>
					 
                          <tr>
                            <!--<td class="tableLeft"> &nbsp</td>-->
                    <td colspan="2" style="text-align:center" height="33"><label><img src="images/create-button.jpg" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="submit" type="submit" class="button-add" value="Create" /></label>
                              &nbsp;&nbsp;
                              <!--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                              <label><img src="images/clear-icon.png" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="button" type="button" class="button-add" value="Clear" onclick = "clearFields(this.form)"/></label>
                              &nbsp;&nbsp;
                              <!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                            <label><img src="images/cancel-icon-button.png" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="button" type="button" class="button-add" value="Cancel" onclick ="cancelAddRole('<%=privName%>','<%=accessName%>')" /></label>
                         
                        </table>
                      </form></td>
                </tr>
                <tr>
                  <td height="20">&nbsp;
                      <!-- DO NOT DELETE THIS ROW --></td>
                </tr>
              </table>
            <!-- CONTENTS END HERE -->          </td>
        </tr>
      </table></td>
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
