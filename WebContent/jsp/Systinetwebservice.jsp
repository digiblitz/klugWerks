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
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/calendar2.js" type="text/javascript"></script>

 
 <script language="javascript">

function submit(){
	
	 document.forms["requestIns"].submit();


}
function goBack(){
	strURL = "./SysMgmt.html?process=callArtifactWSList";
	window.location.href = strURL;
}

function callpopupDoc(url) {

	document.getElementById("pop").style.display = 'none'; 
	document.getElementById("popDoc").style.display = 'block'; 
	
}

function callpopup() {
	
	document.getElementById("pop").style.display = 'block'; 

	document.getElementById("popDoc").style.display = 'none';


}
function validate(){
	if(document.requestIns.name.value==""){
		alert("Please enter a name");
		document.requestIns.name.focus();
		return false;
		}
	return true;
}

     </script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>


<body>

<header id="header">
<%@ include file = "../../include/HeaderProcess.jsp" %>
</header>
  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0" class="content_new" align="center">
        <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>

    <tr>
	
      <td  align="center" valign="middle" class="tableCommonBg" >
	  <table width="630" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" height="200" style="border:thin;border-style:groove;">
        <tr>
          <td valign="top" class="tableCommonBg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="centerTab">
              <tr>
                <td><table width="100%" border="1" align="center" cellpadding="" cellspacing="" id="centerTab">
                    <tr>
                      <td height="333"><!-- CONTENTS START HERE -->
                          <div class="cmmnForm">
                            <div class="colspan" ><img src="images/services_logo.png" alt="" width="20px" height="20px" /><strong> &nbsp;Business Service:<span class="styleBoldTwo"> Initiate Governance for Business Service </span> </strong><div class="divider3"></div></div>
                            <%String id=(String)request.getParameter("id");
			String name=(String)request.getParameter("wsName");
			String version=(String)request.getParameter("wsVersion");
			String govStatus=(String)request.getParameter("govStatus");	
   %>
                            <form name="requestIns" id="requestIns"   method="post" action="SysMgmt.html?process=webserviceProcesubmit" class="formcss">
                              <input type="hidden" name="method" value="insertrequest"/>
                              <input type="hidden" name="id" value="<%=id%>"/>
                              <input type="hidden" name="gov" value="stopGov"/>
                              <input type="hidden" name="govStatus" value="<%=govStatus%>"/>
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr >
                                  <td colspan="2"><div class="rowHead"><strong>&nbsp;Business Service:</strong></div></td>
                                </tr>
                                <div class="row">
                                  <tr>
                                    <td height="28"><span class="label">&nbsp;Name:<span class="asterisk">*</span></span></td>
                                    <td><input
												type="text" name="name" id="name" class="textboxOne" size="20" value="<%=name%>" readonly="readonly"/></td>
                                  </tr>
                                </div>
                                <div class="row">
                                  <tr>
                                    <td height="71"><span class="label">&nbsp;Description:</span></td>
                                    <td><span>
                                      <textarea rows="4" cols="20" name="textarea"></textarea>
                                    </span></td>
                                  </tr>
                                </div>
                                <div class="row">
                                  <tr>
                                    <td height="26"><span class="label">&nbsp;Version:</span></td>
                                    <td><span class="formX">
                                      <input
												type="text" name="version"  class="textboxOne" size="20" value="<%=version%>" readonly="readonly"/>
                                    </span></td>
                                  </tr>
                                </div>
                                <div class="row">
                                  <tr>
                                    <td height="28"><span class="label">&nbsp;Criticality:</span></td>
                                    <td><span class="formX">
                                      <select  id="select2" name="criticality" class="selectboxOne">
                                        <option selected="selected" value="">Select One</option>
                                        <option value="high">High</option>
                                        <option value="medium">Medium</option>
                                        <option value="low">Low</option>
                                      </select>
                                      &nbsp; </span></td>
                                  </tr>
                                </div>
                                <div class="row">
                                  <tr>
                                    <td height="25"><span class="label">&nbsp;Consumable:</span></td>
                                    <td><span class="formX">
                                      <input
												type="checkbox" name="cons" class="textboxOne" size="20" />
                                    </span></td>
                                  </tr>
                                </div>
                                <div class="row"> </div>
                                <div class="row"> </div>
                                <div class="row"> </div>
                                <tr>
                                  <td height="29" colspan="2" ><div class="row"> <span class="label">
                                      &nbsp;<label><img src="images/add-icon-button.jpg" alt="" width="20px" height="20px" /><input type="button" value="Add WSDL" class="button-add" name="method2"  onclick="callpopup()"/></label>
                                    &nbsp;&nbsp;
                                    <label><img src="images/add-icon-button.jpg" alt="" width="20px" height="20px" /><input type="button" value="Add Document" class="button-add" name="method2"  onclick="callpopupDoc()"/></label>
                                  </span> <span class="formX"> </span> </div></td>
                                </tr>
                                <tr>
                                  <td colspan="2" align="center"><div class="row"> <span class="label">&nbsp;</span> <span class="formX">
                                      <label><img src="images/save-icon.png" alt="" width="20px" height="20px" /><input type="button" value="Save" class="button-add" name="method2" onclick="validate();submit()" /></label>
                                      <label><img src="images/cancel-icon-button.png" alt="" width="20px" height="20px" /><input name="button" type="button" class="button-add" onclick="goBack();" value="Cancel" /></label>
                                      <br />
                                  </span> </div></td>
                                </tr>
                              </table>
                            </form>
                        </div></td>
                    </tr>
                  </table>
                    <!-- CONTENTS END HERE -->                </td>
              </tr>
          </table></td>
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
