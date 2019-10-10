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

<%
    String rolename=(String)request.getAttribute("roleNameValue");
    String fname=(String)request.getAttribute("firstName");
    String lname =(String)request.getAttribute("lastName");
    String name=(String)request.getAttribute("userNameList");
%>
	
  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0"  class="content_new" align="center">
        <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>

    <tr>
	
      <td  align="center" valign="middle" class="tableCommonBg" >
	  
	
	  
	  <table width="630" height="100" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab" style="border:thin;border-style:groove;">
        <tr>
          <td width="887" valign="top" class="subDeptTablePad"><!-- CONTENTS START HERE -->
              <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="formLayout">
                <tr >
                  <td height="19" colspan="2" class="tblMainHead"><strong>Confirmation:</strong><div class="divider3"></div></td>
                </tr>
                <tr>
                  <td height="163" colspan="2" align="center" class="tblDescrp"><br />
                      <strong>You have successfully assigned <%=name%> to <%= fname%> <%=lname%></strong><br />
                  <br /></td>
                </tr>
                <tr>
                  <td colspan="2">&nbsp;</td>
                </tr>
				
				
					  
                <tr>
                  <td colspan="2" align="center" class="alignCenter"><!--input type="submit" value="Back to List" class="gradBtn" onclick="location.href='SearchList.do?searchProcess=bckToSearchList';"/-->
                      <input name="submit" type="submit" class="gradBtn" onclick="location.href='SearchList.html?searchProcess=initViewDet'" value="Back to Search"/>                  </td>
                </tr>
                <tr>
                  <td colspan="2">&nbsp;</td>
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
