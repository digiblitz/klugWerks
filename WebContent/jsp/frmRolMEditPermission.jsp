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
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/frmRolMCreatePermissionValidate.js" type="text/javascript" ></script>
<script>
    function cancelEditRole()
    {
        if(confirm("Do you want to Cancel and go back to List Page?"))
	{
        strURL = "./roles.html?roleProcess=permissionList";
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
	  
	  
	 
	  
	  
	  <table width="630" height="100" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab" style="border:thin;border-style:groove;">
        <tr>
          <td width=100% valign="top" class="subDeptTablePad"><!-- CONTENTS START HERE -->
              <table width="630" border="0" align="center" cellpadding="0" cellspacing="0" class="formLayout">
                <tr >
                  <td colspan="2" class="tblMainHead"><img src="images/edit-list-icon.png" alt="" width="20px" height="20px" /> <strong>&nbsp;Roles &amp; Privileges:  Edit Permission </strong><div class="divider3"></div> </td>
                </tr>
                <tr>
                  <td height="28" colspan="2" valign="middle" class="tblDescrp"> &nbsp;You can <strong>Edit/Update</strong> the <strong> Permission </strong> created by you as given below. </td>
                </tr>
                <tr>
                  <td><%  
							String permissionId = "";
							String permissionName = ""; 
							String[] s = (String[])request.getAttribute("permDetails");
							//out.print("Role Details:" + s);
							if(s!=null){
								permissionId = s[0];
								permissionName = s[1]; 
							}
						  %>
                    <form name="frmRolMEditPermission" id="myform" action="roles.html" onsubmit="return myvalidate1();"><input name="roleProcess" type="hidden" value="editPerm" />
                      <input name="permissionId" type="hidden" value="<%=permissionId%>" />
                      <table width="630" border="0" align="center" cellpadding="0" cellspacing="0" class="formLayout">
                          <tr >
                            <td colspan="2" class="tblRowHead"><div class="divider3"></div><strong> &nbsp;Edit This Permission : </strong><div class="divider3"></div></td>
                          </tr>
                          <%
						  	String err = request.getParameter("err");
						  	if(err!=null) {
						  %>
                          <tr>
                            <td height="24" colspan="2" valign="middle" class="tableLeft">&nbsp;This Permission Name Already Exist</td>
                          </tr>
                          <%
						  }
						  %>
                          <tr>
                            <td width="328" height="27" valign="middle" class="tableLeft"> &nbsp;Permission Name:</td>
                            <td width="559" valign="middle" class="tableRight"><input name="permissionName" type="text" id="permissionName" class="textboxOne" value="<%=permissionName%>" size="25"></td>
                          </tr>
						  
						
						 
                          <tr>
                            <td height="29" colspan="2" align="center" valign="middle" class="alignCenter"><label><img src="images/update-icon-button.jpg" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="submit" type="submit" class="button-add" value="Update" /></label>&emsp;&emsp;
                            <label><img src="images/cancel-icon-button.png" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="button" type="button" class="button-add" value="Cancel" onclick ="cancelEditRole()"/></label></td>
                          </tr>
						  					  					 					 
						 
                          <tr>
                            <td colspan="2" class="alignCenter">&nbsp;
                                <!-- DO NOT DELETE THIS ROW --></td>
                          </tr>
                      </table>
                    </form></td>
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
