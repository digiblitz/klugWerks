<!---
Copyright: 2018 digiBlitz Foundation

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
<title>Klugwerks</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/frmAdvertise.js" type="text/javascript" ></script>
</head>


<body>

<header id="header">
<!-- HEADER STARTS HERE -->
<%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</header>

  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0"  class="content_new" align="center">
    
    <tr>
	
      <td  align="center" valign="middle" class="tableCommonBg" >
	  
	    <%
                        String uname=(String)request.getAttribute("usrname");
                        String pwd=(String)request.getAttribute("cpwd");
			System.out.print("uname :"+uname +" "+ "pwd :"+pwd);
                    %>
	  
	  <table width="630" height="100" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" style="border:thin;border-style:groove;">
        <%if(uname=="" && uname==null){%>
        
        
        <%}else{%>
    
        <%}%>
        <tr>
          <td class="tableCommonBg">
		  
		  <table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
              <tr>
             
                <%
				String source = (String)request.getAttribute("source");
				String eventTypeId = (String)request.getAttribute("eventTypeId");
				String compYear = (String)request.getAttribute("compYear");
				String action = "";
				if(source!=null && source.equalsIgnoreCase("fromEventEntry")){
					action = "OEELogin.do";
				}else{
					action = "MemberLogin.do";
				}
			%>
                <form action="<%=action%>" method="post" name="confrm" id="confrm"/>
                <input type="hidden" name="cmd" value="checkLogin" />
                <input type="hidden" name="eventTypeId" id="eventTypeId" value="<%=eventTypeId%>" />
                <input type="hidden" name="compYear" id="compYear" value="<%=compYear%>" />
                <input type="hidden" name="textfield" value="<%=uname%>" />
                <input type="hidden" name="textfield2" value="<%=pwd%>" />
                <%if(uname=="" && uname==null){%>
                <td valign="top"  class="subDeptTablePad">
				
				<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer">
                    <tr >
                      <td height="19" colspan="2" class="tblMainHead"><strong> Membership: <span class="styleBoldTwo">Confirmation</span></strong><div class="divider3"></div></td>
                    </tr>
                    <tr>
                      <td colspan="2" align="center" class="tblDescrp" style="padding:10px;"><strong> You have successfully updated your profile </strong> <br />
                          <br />
                        Login now to access your information. <br />
                        <br />
                        <span>
                          <input name="button" type="submit" class="gradBtn" value=" Login " />
                          &nbsp;</span><br />                      </td>
                    </tr>

                    <tr>
                      <td></form></td>
                    </tr>
                  </table>
                    <!-- CONTENTS END HERE -->                </td>
                <%}else{%>
                <%}%>
              </tr>
          </table></td>
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
