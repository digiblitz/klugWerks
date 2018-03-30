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
 <link rel="stylesheet" type="text/css" media="screen" 
        href="styles/menuExpandable.css" />    

    <script type="text/javascript" src="scripts/menuExpandable.js"></script>

<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>


<body>

<header id="header">
<%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</header>
  <table width=100% border="1" cellpadding="0" cellspacing="0" height="350" class="content_new" align="center">
        <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>

    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
	  <table width="630px" height="300" border="0" align="center" cellpadding="0" cellspacing="0" id="centerTab" style="border:thin;border-style:groove;">
        <tr>
          <td colspan="2" valign="top" class="cenTablePad"><!-- Welcome Tab Starts Here -->
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="welcomeTab">
			  <tr><td> <img src="images/change-pwd.png" alt="" width="20px" height="20px" /><strong>Change Password Confirmation</strong><div class="divider3"></div></td>
			  </tr>
              
                <tr>
                  
                  <td rowspan="2" class="loginTabLeft"><span class="styleBoldTwo"> </span><br />
                      <br />
                      <br />
                      <!-- Descrip Tab Starts Here -->
                      <table width="410" border="0" align="center" cellpadding="0" cellspacing="0" id="welcomeTab">
                        <tr>
                          <td class="loginTabLftTopCrnr"></td>
                          <td class="loginDescBg"></td>
                          <td class="loginTabRghtTopCrnr"></td>
                        </tr>
                        <tr>
                          <td class="loginTabLft">&nbsp;</td>
                          <td class="loginDescBg"><span class="textBold">Dear User</span>,<br />
                              <%
								String stat=(String)request.getAttribute("status");
				
								if(stat!=null)
								{
								if(stat.equalsIgnoreCase("fail"))
								{%>
                              <br />
                            Your request for changing the Password <strong>failed.</strong> Please give the right current Password ! <br />
                            <br />
                            <%}}else{%>
                            <br />
                            Your request for changing the Password <strong>successful</strong> for your Username! Please Re-Login to make your new Password effective ! <br />
                            <br />
                            <%}%>
                            Thank You,<br />
                            <span class="styleBoldOne">Klugwerks TEAM</span> </td>
                          <td class="loginTabRght">&nbsp;</td>
                        </tr>
                        <tr>
                          <td class="loginTabLftBotCrnr"></td>
                          <td class="loginTabBot"></td>
                          <td class="loginTabRghtBotCrnr"></td>
                        </tr>
                      </table>
                    <!-- Descrip Tab Ends Here -->                  </td>
                </tr>
                
                
              </table>
            <!-- Welcome Tab Ends Here -->
          </td>
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
