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

<!--LINK HREF="../../css/core-ie.css" TYPE="text/css" REL="stylesheet" /--> 
</head>


<body>

<header id="header">
<%@ include file = "../../include/HeaderProcess.jsp" %>
</header>
  <table width=100% border="1" cellpadding="0" cellspacing="0" height="500px" class="content_new" align="center">
    
    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
	  <table width="887"  border="1" align="center" cellpadding="0" cellspacing="0" id="mainTab" style="border:thin;border-style:groove;">
          <td width="887" height="28" ><img src="images/register_icon.png" alt="" width="20px" height="20px" /><strong>&nbsp;Register for SignIn</strong></td>
        </tr>
        <tr>
          <td align="center" valign="middle"><div class="divider2"></div>
		  		  <form name="memberUsrSgnUp" id="myform" method="post" action="user.html?cmd=initUsr" onsubmit="return myvalidate(this);" >

              <table width="887" border="1" cellspacing="0" cellpadding="0">
                <tr>
                  <td colspan="2" align="center">Please create an account in our new system by clicking <strong>Register</strong> button. Already having account click <strong>SignIn</strong>!!</td>
                </tr>
                <tr>
                  <td colspan="2" align="center">&nbsp;</td>
                </tr>
                <tr>
                  <td width="254" height="29" align="right"><a href="user.html?cmd=initUsrReg" ><img src="images/register_button.jpg" alt="" width="20px" height="20px"/>&nbsp;<strong>Register</strong></a>
                    &emsp;</td>
                  <td width="252" align="left">&nbsp;
					  <a href="login.html?cmd=initLogin" ><img src="images/signIn_icon.jpg" alt="" width="20px" height="20px"/>&nbsp;<strong>Sign In</strong></a>
					  </td>
                </tr>
              </table>
			  </form>
            </td>
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
