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
<%@ page import="java.lang.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/frmrRolePrevilageValidate.js" type="text/javascript" ></script>

<script>
    function cancelEditRole()
    {
        if(confirm("Do you want to Cancel and go back to List Page?"))
	{
        strURL = "./roles.html?roleProcess=roleList";
	window.location.href = strURL;
        }
       else
	{
		return;
	}
    }
	function clearField(obj)
{

	for(var i=0;i<obj.elements.length;i++)
	{
		if(obj.elements[i].type=='text')
		{
			obj.roledesc.value = "";
		}

		if(obj.elements[i].type=='radio')
		{
			obj.elements[i].checked = false;
		}
	}
}

</script>
<!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
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
          <!--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
          
          <!--Ends:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
          <td width=100% valign="top" class="subDeptTablePad"><!-- CONTENTS START HERE -->
              <table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout" width="630">
                <tr >
                  <td colspan="2"  class="tblMainHead"><img src="images/edit-list-icon.png" alt="" width="20px" height="20px" /><strong> &nbsp;Maintain Roles: <span  class="styleBoldTwo">Edit </span></strong><div class="divider3"></div> </td>
                </tr>
                <tr>
                  <td height="32" colspan="2" valign="middle" class="tblDescrp"><!--<img src="images/usea_logo.jpg" class="imgFloatLeft" />-->
                    &nbsp;<strong>Edit/Update</strong> the <strong> Role</strong>. </td>
                </tr>
                <tr>
                  <td><!--%--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011--%-->
                      <%
							String roleId = "";
							String rolName = "";
                                                        String roledesc = "";
                                                         String status = "";

							String[] s = (String[])request.getAttribute("roleDetails");
							System.out.print("Role Details:" + s);
							if(s!=null){
								roleId = s[0];
								rolName = s[1];
                                                                roledesc= s[2];
                                                                status =s[3];
							}
						%>
                      <!--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                      <!--<form name="frmRoleMgtRoleEdit" id="frmRoleMgtRoleEdit" method="post" action="roles.do" onsubmit=" return myvalidate();">-->
                      <form name="frmRoleMgtRoleEdit" id="frmRoleMgtRoleEdit" method="post" action="roles.html" onsubmit="return formValidate(this);">
                        <!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                        <input type="hidden" name="roleProcess"	value="editRole"/>
                        <input type="hidden" name="roleId" value="<%=roleId%>"/>
                        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" class="formLayout" >
                          <tr>
                            <td height="25"  colspan="2" class="tblDescrp"> &nbsp;<font color="#FF0000">Fields marked with an asterisk (<span class="asterisk">*</span>) are required.</font></td>
                          </tr>
                          <%
						  	String err = request.getParameter("err");
						  	if(err!=null) {
						  %>
                          <tr >
                            <td height="25" colspan="2" class="styleError"><strong>&nbsp;Role already exist</strong></td>
                          </tr>
                          <%
							  rolName=(String)request.getAttribute("rolname");
						  }
				         %>
                          <tr>
                            <td width="183" height="27" class="tableLeft"> &nbsp;Role:</td>
                            <td class="tableRight"><!--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                <!--<input name="rolname" id="rolname" type="text" class="textboxOne" value="<%=rolName%>" size="25" /></td>-->
                                <input name="rolename" id="rolename" type="text" class="readOnly" value="<%=rolName%>" size="25" maxlength = "100" readonly="true"/>
                                <!--<span class="asterisk">*</span>--></td>
                            <!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                          </tr>
                          <%--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011--%>
                          <tr>
                            <td height="28" class="tableLeft">&nbsp;Description:</td>
                            <td class="tableRight"><!--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                                <!--<input name="roledesc" id="roledesc" type="text" class="textboxOne" value="<%=roledesc%>" size="25" /></td>-->
                                <input name="roledesc" id="roledesc" type="text" class="textboxOne" value="<%=roledesc%>" size="25" maxlength = "100"/>
                                 <font color="#FF0000">*</font> </td>
                            <!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                          </tr>
                          <tr>
                            <td height="28" class="tableLeft">&nbsp;Status:</td>
                            <%

                                                                        if(Integer.parseInt(status)==1)
                                                                        {
                                                                            %>
                            <td  width="530" class="tableRight" ><input type="radio" name="status" id="status1" value="1" checked="checked" />
                              Active
                              <input type="radio" name="status" id="status2" value="0" />
                            Inactive  <font color="#FF0000">*</font> </td>
                            <%
                                                                            }
                                                                else
                                                                    {
                                                                    %>
                            <td width="174" class="tableRight" ><input type="radio" name="status" id="status1" value="1" />
                              Active
                              <input type="radio" name="status" id="status2" value="0" checked="checked"/>
                            Inactive  <font color="#FF0000">*</font> </td>
                            <% } %>
                          </tr>
                          <%--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011--%>
						  
						
					  
                          <tr>
                            <!--<td class="tableLeft"> &nbsp</td>-->
                            <td colspan="2" style="text-align:center" height="25"><label><img src="images/update-icon-button.jpg" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="submit" type="submit" class="button-add" value="Update" /></label>
                              &nbsp;
                              <!--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                              <label><img src="images/clear-icon.png" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="button" type="button" class="button-add" value="Clear" onclick = "clearField(this.form)"/></label>
                              &nbsp;
                              <!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                              <label><img src="images/cancel-icon-button.png" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="button" type="button" class="button-add" value="Cancel" onclick ="cancelEditRole()"/></label></td>
                          </tr>
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
