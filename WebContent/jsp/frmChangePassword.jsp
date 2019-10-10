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
<script src="js/changePassword.js" type="text/javascript" ></script>

 <script language="javascript" />

function remloadVal(){

if(document.changePassword.currPwd.value!=null){
document.changePassword.currPwd.value="";

}else{

document.changePassword.currPwd.value="";
}
return true;
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
	
      <td  align="center" valign="middle" class="tableCommonBg"><table width="631px" height="280" border="1" cellpadding="0" cellspacing="0" style="border:thin;border-style:groove;">
        <tr>
          <td  align="center" valign="middle" class="tableCommonBg" ><form name="changePassword" id="myform" method="post" action="user.html?cmd=chngPwd" onsubmit="return myvalidate(this);" >
              <table height="280" border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout" width="630"  >
                <tr >
                  <td height="19" colspan="2" class="tblMainHead"><img src="images/change-pwd.png" alt="" width="20px" height="20px" /><strong>Membership: Change Password </strong>
                      <div class="divider3"></div></td>
                </tr>
                <tr>
                  <td colspan="2" class="tblDescrp"><br />
                    &nbsp;You can change your account Password right here. </td>
                </tr>
                <tr>
                  <td align="center"><table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout" width="600">
                      <tr>
                        <td colspan="2" valign="middle" class="tblRowHead"><strong>Change Password</strong></td>
                      </tr>
                      <tr>
                        <td height="26" valign="middle" class="tableLeft">Current Password:</td>
                        <td valign="middle" class="tableRight"><input type="password" name="currPwd" id="currPwd" class="textboxOne" size="18" />
                            <span class="asterisk">*</span> </td>
                      </tr>
                      <tr>
                        <td height="25" valign="middle" class="tableLeft">New Password:</td>
                        <td valign="middle" class="tableRight"><input type="password" name="newPwd" id="newPwd" class="textboxOne" size="18" />
                            <span class="asterisk">*</span> </td>
                      </tr>
                      <tr>
                        <td height="26" valign="middle" class="tableLeft">Re-Type New Password:</td>
                        <td valign="middle" class="tableRight"><input type="password" name="reNewPwd" id="reNewPwd" class="textboxOne" size="18" />
                            <span class="asterisk">*</span> </td>
                      </tr>
                      <tr>
                        <td height="27" valign="middle" class="tableLeft">&nbsp;</td>
                        <td valign="middle" class="tableRight"><input name="submit" type="submit" class="gradBtn" value="Change" />
                          &nbsp;
                          <input name="button" type="button" class="gradBtn" onclick="javascript:history.back(-1);" value="cancel" />
                        </td>
                      </tr>
                  </table></td>
                </tr>
                <tr> </tr>
              </table>
          </form></td>
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
