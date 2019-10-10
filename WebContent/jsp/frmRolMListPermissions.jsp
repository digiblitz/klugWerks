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

</head>


<body>

<header id="header">
<%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</header>
  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0"  class="content_new" align="center">
        <tr><td><%@ include file = "../../include/infobar.jsp" %><br /></td></tr>

	<tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg">
	  
	 
	  
	  
	  <table width="630" height="100" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab" style="border:thin;border-style:groove;">
        <tr>
          <td width=100% valign="top" class="subDeptTablePad"><!-- CONTENTS START HERE -->
              <table  border="0" cellpadding="0" cellspacing="0"  align="center" class="formLayout">
                <tr >
                  <td colspan="5" class="tblMainHead"><img src="images/list-icon1.jpg" alt="" width="20px" height="20px" /> <strong>&nbsp;Roles &amp; Privileges: Permission Listings </strong><div class="divider3"></div></td>
                </tr>
                <tr>
                  <td height="55" colspan="5" valign="middle" class="tblDescrp">                  &nbsp;You are viewing the list of <strong>Permissions</strong> created by you. To	edit	a permission click on the <strong>Edit</strong> button beside each record. To deactivate a &nbsp;permission click on the <strong>'Deactivate'</strong> button beside the corresponding record. </td>
                </tr>
                <tr>
                  <td><table border="0" cellpadding="3" align="center" cellspacing="1" class="formLayout" width="630">
                      <tr>
                        <td colspan="4" style="border-bottom:1px solid #999;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            
                        </table></td>
                      </tr>
                      <tr >
                        <td width="621" height="25" class="tblRowHead"><div class="divider3"></div><strong>&nbsp;Name of Permission </strong><div class="divider3"></div></td>
                        <td width="251" class="tblRowHead"><div class="divider3"></div><strong>Edit</strong><div class="divider3"></div></td>
                      </tr>
                      <%  
					   ArrayList roleList = (ArrayList) request.getAttribute("allPermList");
      					 if(roleList!=null && roleList.size()!=0){
							Iterator it = roleList.iterator();
							while(it.hasNext()){
								String[] s = (String[])it.next();
								//String privilegeId = s[0];
								String permissionId = s[0];
								String permissionName = s[1];
							%>
                      <form name="frmRolMListPermissions" id="myform" action="roles.html" onsubmit="return myvalidate(this);">
                        <input name="roleProcess" type="hidden" value="initEditPerm" />
                        <input type="hidden" name="permissionId" value="<%=permissionId%>">
                        <tr style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#FFFFFF">
                          <td height="26" valign="middle" class="listCellBg">&nbsp;<%=permissionName%></td>
                          <td valign="middle" class="listCellBg"><label><img src="images/edit-icon-button.png" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="Submit2" type="submit" class="button-add" value="Edit" /></label></td>
                        </tr>
                      </form>
                    <!--
					  		<tr>
							<td height="25" colspan="5"  bgcolor="#ffffff" class="alignRight">
								<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
							<a href="#" class="linkThree">Prev</a> | <a href="#" class="linkThree">Next</a>			</td>
						   </tr>
						 -->
                      <tr>
                        <%
					   } 
					   }
					    else {
						%>
                      </tr>
                    <tr>
                      <td colspan="2" align="center" class="listCellBg"><strong>There is no Record available</strong></td>
                    </tr>
                      <% } %>
                      
                    </table>
                  </form>                  </td>
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
