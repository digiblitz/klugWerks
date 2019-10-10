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
  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0" class="content_new" align="center">
        <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>

    <tr>
	
      <td  align="center" valign="middle" class="tableCommonBg" >
	  <table width="630" height="100" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab" style="border:thin;border-style:groove;">
        <tr>
          <td width="500" valign="top" class="subDeptTablePad">
		  <table border="0" cellpadding="0" align="center" cellspacing="0" class="tblInnerContainer" width="630">
              <tr >
                <td colspan="2" class="tblMainHead"><strong> Membership</strong><div class="divider3"></div></td>
              </tr>
              <%
  	String source = (String) request.getAttribute("source");
	String eventTypeId = (String)request.getAttribute("eventTypeId");
	String compYear = (String)request.getAttribute("compYear");
	String regBtn = "";
	String noBtn = "";
	if(source!=null && source.equalsIgnoreCase("fromEventEntry")){
		regBtn = "MemberUsrSignUp.do?process=usrReg&source=fromEventEntry&eventTypeId="+eventTypeId+"&compYear="+compYear;
		noBtn = "MemberUsrSignUp.do?process=view&source=fromEventEntry&eventTypeId="+eventTypeId+"&compYear="+compYear;
	}else{
		//regBtn = "MemberUsrSignUp.do?process=usrReg";
		regBtn = "MemberUsrSignUp.do?process=usrEmpReg";
		noBtn = "MemberUsrSignUp.do?process=view";
	}
  %>
              <tr>
                <td height=100% colspan="2" class="tblDescrp" style="padding:10px;"><strong> No match is found in our system. Please search again or register as a new member.</strong><br />
                    <br />
                    <span class="asterisk"> IMPORTANT </span> -- If you are a previous or current member, do not create a new member account.
                  If you need help logging in, please contact us at <span class="textTwo"> <a href="mailto:anandv@digiblitz.com">info@digiblitz.com</a> </span> <br />
                  or call (xxx) xxx-xxxx
                  </p>
                  <br />
                  <br />
                  <span>
                    <input name="button" type="button" class="gradBtn" value="Yes, Register Me" onclick="location.href='<%=regBtn%>'" />
                    &nbsp;
                    <input name="button2" type="button" class="gradBtn" value="No, Try Again" onclick="location.href='<%=noBtn%>'" />
                    </span><br />
                  </strong></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
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
