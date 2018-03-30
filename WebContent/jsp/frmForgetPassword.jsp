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
    <%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Klugwerks</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script type="text/javascript">
<!-- Include JS File Here-->
window.onload = function() {
// Onload event of Javascript
// Initializing timer variable
var x = 5;
var y = document.getElementById("timer");
// Display count down for 20s
setInterval(function() {
if (x <= 6 && x >= 1) {
x--;
y.innerHTML = '' + x + '';
if (x == 1) {
x = 6;
}
}
}, 200);
// Form Submitting after 20s
var auto_refresh = setInterval(function() {
submitform();
}, 3333);
// Form submit function
function submitform() {

//alert('Form is submitting.....');
document.getElementById("forgotUserPassword").submit();

}
// To validate form fields before submission

};</script>

<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/forgotPassword.js" type="text/javascript" ></script>

 <script language="javascript" />
function dispQDiv(){

	document.getElementById('secretQuest').style.display = "";
document.getElementById('chkEmail').style.display="none";
		}
		
		function submitform(paramValue)
{

if(paramValue!=null && paramValue!="null"){
document.getElementById('chkEmail').style.display="block";
}
}
</script>


</head>


<body onload="dispQDiv();">

<header id="header">
<!-- HEADER STARTS HERE -->
 <%@ include file = "../../include/Header.jsp" %>
  <!-- HEADER ENDS HERE -->
</header>

<!-- 
<%
								String infuStatusSuccess=(String)request.getAttribute("status");
                                                                System.out.println("idstatus from jsp :" +infuStatusSuccess);
																
								String usrPass = (String)request.getAttribute("password");
								String usrEmail = (String)request.getAttribute("usrEmail");
								String usrname = (String)request.getAttribute("usrname");
									
								if(infuStatusSuccess!=null)
								{
									if(infuStatusSuccess.equalsIgnoreCase("PasswordSuccess"))
									{
									
									%>




<form accept-charset="UTF-8" action="https://ho192.infusionsoft.com/app/form/process/0a4d656de043c977898004145a92d908" class="infusion-form" method="POST" id="forgotUserPassword" 
 style="display:none;" name="Forget password
kw" onsubmit="var form = document.forms[0];
var resolution = document.createElement('input');
resolution.setAttribute('id', 'screenResolution');
resolution.setAttribute('type', 'hidden');
resolution.setAttribute('name', 'screenResolution');
var resolutionString = screen.width + 'x' + screen.height;
resolution.setAttribute('value', resolutionString);
form.appendChild(resolution);
var pluginString = '';
if (window.ActiveXObject) {
    var activeXNames = {'AcroPDF.PDF':'Adobe Reader',
        'ShockwaveFlash.ShockwaveFlash':'Flash',
        'QuickTime.QuickTime':'Quick Time',
        'SWCtl':'Shockwave',
        'WMPLayer.OCX':'Windows Media Player',
        'AgControl.AgControl':'Silverlight'};
    var plugin = null;
    for (var activeKey in activeXNames) {
        try {
            plugin = null;
            plugin = new ActiveXObject(activeKey);
        } catch (e) {
            // do nothing, the plugin is not installed
        }
        pluginString += activeXNames[activeKey] + ',';
    }
    var realPlayerNames = ['rmockx.RealPlayer G2 Control',
        'rmocx.RealPlayer G2 Control.1',
        'RealPlayer.RealPlayer(tm) ActiveX Control (32-bit)',
        'RealVideo.RealVideo(tm) ActiveX Control (32-bit)',
        'RealPlayer'];
    for (var index = 0; index &lt; realPlayerNames.length; index++) {
        try {
            plugin = new ActiveXObject(realPlayerNames[index]);
        } catch (e) {
            continue;
        }
        if (plugin) {
            break;
        }
    }
    if (plugin) {
        pluginString += 'RealPlayer,';
    }
} else {
    for (var i = 0; i &lt; navigator.plugins.length; i++) {
        pluginString += navigator.plugins[i].name + ',';
    }
}
pluginString = pluginString.substring(0, pluginString.lastIndexOf(','));
var plugins = document.createElement('input');
plugins.setAttribute('id', 'pluginList');
plugins.setAttribute('type', 'hidden');
plugins.setAttribute('name', 'pluginList');
plugins.setAttribute('value', pluginString);
form.appendChild(plugins);
var java = navigator.javaEnabled();
var javaEnabled = document.createElement('input');
javaEnabled.setAttribute('id', 'javaEnabled');
javaEnabled.setAttribute('type', 'hidden');
javaEnabled.setAttribute('name', 'javaEnabled');
javaEnabled.setAttribute('value', java);
form.appendChild(javaEnabled);">
<input name="inf_form_xid" type="hidden" value="0a4d656de043c977898004145a92d908" /><input name="inf_form_name" type="hidden" value="Forget password
kw" /><input name="infusionsoft_version" type="hidden" value="1.49.0.36" />
<div class="default beta-base beta-font-b" id="mainContent" style="height:100%">
<table cellpadding="10" cellspacing="0" class="background" style="width: 100%; height: 100%">
<tbody>
<tr>
<td align="center" valign="top">
<table bgcolor="#FFFFFF" cellpadding="20" cellspacing="0" class="bodyContainer webFormBodyContainer" width="100%">
<tbody>
<tr>
<td bgcolor="#FFFFFF" class="body" sectionid="body" valign="top">
<div class="text" id="webformErrors" name="errorContent">
</div>
<div>
<div>
<div class="title" style="text-align:left">
<div class="title" contentid="title" style="text-align: center;">
<div>
<span style="">Forget password</span> 
<br clear="none" />
<span class="yui-button yui-menu-button inf-button menu-button" style=""><span class="first-child" style=""></span></span>
</div>
</div>
</div>
</div>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_Username">Username *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_Username" name="inf_field_Username" type="text" value="<%=usrname%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_Password">Password *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_Password" name="inf_field_Password" type="password" value="<%=usrPass%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_Email">Email *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_Email" name="inf_field_Email" type="text" value="<%=usrEmail%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<div style="height:15px; line-height:15px;">
&nbsp;
</div>
</div>
<div>
<div class="infusion-submit" style="text-align:center;">
<button style="background-color:#F5F5F5; color:#000000; font-size:15px; font-family:Helvetica; border-color:#000000; border-style:Solid; border-width:1px; -moz-border-radius:3px;border-radius:3px;" type="submit" value="Ok. Proceed">Ok. Proceed</button>
</div>
</div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</form>
<%}}%>

	   <%
								String idstatus2=(String)request.getAttribute("status1");
                                                                System.out.println("idstatus from jsp :" +idstatus2);
																
																String usrEmail1 = (String)request.getAttribute("usrEmail");
								String usrname1 = (String)request.getAttribute("usrName");
									
								if(idstatus2!=null)
								{
									if(idstatus2.equalsIgnoreCase("UserNameSuccess"))
									{%>
<form accept-charset="UTF-8" action="https://ho192.infusionsoft.com/app/form/process/b720501349d41b7e161ad7cc926c3e0b" class="infusion-form" method="POST" id="forgotUserPassword" 
style="display:none" name="forget username
kw" onsubmit="var form = document.forms[0];
var resolution = document.createElement('input');
resolution.setAttribute('id', 'screenResolution');
resolution.setAttribute('type', 'hidden');
resolution.setAttribute('name', 'screenResolution');
var resolutionString = screen.width + 'x' + screen.height;
resolution.setAttribute('value', resolutionString);
form.appendChild(resolution);
var pluginString = '';
if (window.ActiveXObject) {
    var activeXNames = {'AcroPDF.PDF':'Adobe Reader',
        'ShockwaveFlash.ShockwaveFlash':'Flash',
        'QuickTime.QuickTime':'Quick Time',
        'SWCtl':'Shockwave',
        'WMPLayer.OCX':'Windows Media Player',
        'AgControl.AgControl':'Silverlight'};
    var plugin = null;
    for (var activeKey in activeXNames) {
        try {
            plugin = null;
            plugin = new ActiveXObject(activeKey);
        } catch (e) {
            // do nothing, the plugin is not installed
        }
        pluginString += activeXNames[activeKey] + ',';
    }
    var realPlayerNames = ['rmockx.RealPlayer G2 Control',
        'rmocx.RealPlayer G2 Control.1',
        'RealPlayer.RealPlayer(tm) ActiveX Control (32-bit)',
        'RealVideo.RealVideo(tm) ActiveX Control (32-bit)',
        'RealPlayer'];
    for (var index = 0; index &lt; realPlayerNames.length; index++) {
        try {
            plugin = new ActiveXObject(realPlayerNames[index]);
        } catch (e) {
            continue;
        }
        if (plugin) {
            break;
        }
    }
    if (plugin) {
        pluginString += 'RealPlayer,';
    }
} else {
    for (var i = 0; i &lt; navigator.plugins.length; i++) {
        pluginString += navigator.plugins[i].name + ',';
    }
}
pluginString = pluginString.substring(0, pluginString.lastIndexOf(','));
var plugins = document.createElement('input');
plugins.setAttribute('id', 'pluginList');
plugins.setAttribute('type', 'hidden');
plugins.setAttribute('name', 'pluginList');
plugins.setAttribute('value', pluginString);
form.appendChild(plugins);
var java = navigator.javaEnabled();
var javaEnabled = document.createElement('input');
javaEnabled.setAttribute('id', 'javaEnabled');
javaEnabled.setAttribute('type', 'hidden');
javaEnabled.setAttribute('name', 'javaEnabled');
javaEnabled.setAttribute('value', java);
form.appendChild(javaEnabled);">
<input name="inf_form_xid" type="hidden" value="b720501349d41b7e161ad7cc926c3e0b" /><input name="inf_form_name" type="hidden" value="forget username
kw" /><input name="infusionsoft_version" type="hidden" value="1.49.0.36" />
<div class="default beta-base beta-font-b" id="mainContent" style="height:100%">
<table cellpadding="10" cellspacing="0" class="background" style="width: 100%; height: 100%">
<tbody>
<tr>
<td align="center" valign="top">
<table bgcolor="#FFFFFF" cellpadding="20" cellspacing="0" class="bodyContainer webFormBodyContainer" width="100%">
<tbody>
<tr>
<td bgcolor="#FFFFFF" class="body" sectionid="body" valign="top">
<div class="text" id="webformErrors" name="errorContent">
</div>
<div>
<div>
<div class="title" style="text-align:left">
<div class="title" contentid="title" style="text-align: center;">
<div>
Forget Username
</div>
</div>
</div>
</div>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_Username">Username *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_Username" name="inf_field_Username" type="text" value="<%=usrname1%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_Email">Email *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_Email" name="inf_field_Email" type="text" value="<%=usrEmail1%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<div style="height:15px; line-height:15px;">
&nbsp;
</div>
</div>
<div>
<div class="infusion-submit" style="text-align:center;">
<button style="background-color:#F5F5F5; color:#000000; font-size:15px; font-family:Helvetica; border-color:#000000; border-style:Solid; border-width:1px; -moz-border-radius:3px;border-radius:3px;" type="submit" value="Ok. Proceed">Ok. Proceed</button>
</div>
</div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</form>
<%}}%>
-->
<!-- infusion soft code ends here -->
  <table width=100% border="1" cellpadding="0" cellspacing="0" height="350" class="content_new" align="center">
    
    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
	 
	  <table width="630" height="350" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" style="border:thin;border-style:groove;">
	  <tr><td valign="middle"><img src="images/signIn-problem-icon.jpg" alt="" width="16px" height="16px" /><strong>Sign-In Problems</strong>
	    <div class="divider3"></div></td></tr>
        
        <tr>
          <td valign="middle" class="tableCommonBg"><!-- CENTER TABLE STARTS HERE -->
              <table width="630" height="350" border="0" align="center" cellpadding="0" cellspacing="0" id="centerTab">
                <tr>
                  <td colspan="2" class="cenTablePad"><!-- Welcome Tab Starts Here -->
                        
                <tr>
                          <td rowspan="2" class="welTabLft">&nbsp;</td>
                          <td width="500" rowspan="2" class="loginTabLeft"><span class="styleBoldTwo"></span>                            If   you've forgotten your Password, you can retrieve it by filling in your username and answering to the secret question you had given during your Registration Process. If you've forgotten the USERNAME to your account,   please enter your  e-Mail ID. Your USERNAME would be mailed to this ID. <br />
                            <br />
                            <!-- Descrip Tab Starts Here -->
                            <table width="509" border="0" align="left" cellpadding="0" cellspacing="0" id="welcomeTab">
                              <tr>
                                <td width="10" class="loginTabLftTopCrnr"></td>
                                <td width="489" class="loginDescBg"></td>
                                <td width="10" class="loginTabRghtTopCrnr"></td>
                              </tr>
                              <tr>
                                <td class="loginTabLft">&nbsp;</td>
                                <td class="loginDescBg">
								<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" id="loginTab">
                                  <tr>
                                    <td height="25" colspan="2" class="styleBoldWel"><img src="images/forget-pw_icon.png" alt="" width="18px" height="18px" /><strong>FORGOT Password? </strong></td>
                                  </tr>
                    <form name="frmForgetPwd1" id="frmForgetPwd1" action="user.html?cmd=User" method="post" onsubmit="return myvalidate(this);" />
                                  
                                  <%
								String idstatus=(String)request.getAttribute("idstatus");
                                                                System.out.println("idstatus from jsp :" +idstatus);
									
								if(idstatus!=null)
								{
									if(idstatus.equalsIgnoreCase("PasswordFail"))
									{%>
                                  <tr>
                                    <td height="25" colspan="2" class="styleError"><font color="#FF0000">Sorry, your details does not match!</font></td>
                                  </tr>
                                  <%}
								
								}    %>
                                  <tr>
                                    <td width="42%" height="28" class="textBold">&nbsp;Username:</td>
                                    <td width="58%"><input name="usrname" id="usrname" type="text" class="textboxOne" onblur="usrStatForget();" />
                                    &nbsp;<font color="#FF0000"><span class="asterisk">*</span></font></td>
                                  </tr>
                                  <tr>
                                    <td colspan="2"><div id="secretQuest">
                                      <table width="104%" border="0" align="left" cellpadding="0" cellspacing="0">
                                        <tr>
                                          <td width="40%" height="28" class="textBold">&nbsp;Your Secret Question:</td>
                                          <td width="60%">&nbsp;<input name="sAnswer2" id="sAnswer2" type="text" readonly="readonly" class="textboxOne" size="35" />                                          </td>
                                        </tr>
                                        <tr>
                                          <td width="40%" height="28" class="textBold"><span class="label">&nbsp;Enter Your Answer:</span></td>
                                          <td width="60%">&nbsp;<input name="sAnswer" type="text" class="textboxOne" id="sAnswer" size="35" />
                                            &nbsp;<font color="#FF0000"><span class="asterisk">*</span></font></td>
                                        </tr>
                                        <tr>
                                          <td>&nbsp;</td>
                                          <td height="25">&nbsp;<input name="log" type="submit" class="gradTwoBtn" value="Send My Password" /></td>
                                        </tr>
                                      </table>
                                    </div></td>
                                  </tr>
                                  <tr>
                                    <td colspan="2"><div id="noSecretQuest">
                                      <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                                        <%
								String idstatus1=(String)request.getAttribute("status");
                                                                System.out.println("idstatus from jsp :" +idstatus1);
									
								if(idstatus1!=null)
								{
									if(idstatus1.equalsIgnoreCase("PasswordSuccess"))
									{%>
									    <tr>
                                          <td width="33%" height="30" class="styleBoldWel"><font color="#009933"> Congrats! Your Username matches. Your Password will be sent to your e-Mail matching this username.</font> </td>
                                        </tr>
										<tr>
										<td align="center">
										<a href="login.html?cmd=initLogin" ><img src="images/signIn_icon.jpg" alt="" width="20px" height="20px"/>&nbsp;<strong>Sign In</strong></a>										</td>
										</tr>
										 <%}
								
								}    %>
                                      </table>
                                    </div></td>
                                  </tr>
								   </form> 
                                </table>
                                </td>
                                <td class="loginTabRght">&nbsp;</td>
                              </tr>
                              <tr>
                                <td class="loginTabLftBotCrnr"></td>
                                <td class="loginTabBot"></td>
                                <td class="loginTabRghtBotCrnr"></td>
                              </tr>
                            </table>
                          <!-- Descrip Tab Ends Here -->                          </td>
                          
                          <td rowspan="2" class="divider4">&nbsp;</td>
          <td height="350" valign="middle"  class="">
		  
		  <!-- Login Tab Starts Here -->
                              <table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="welcomeTab">
                                <tr>
                                  <td width="266" height="97" align="left" >&nbsp;</td>
                                  
                                </tr>
                                <tr>
                                  
                                  <td class="loginCommonBg"><table width="250" border="0" align="left" cellpadding="0" cellspacing="0" id="loginTab">
                                      <tr>
                                        <td height="25" colspan="2" class="styleBoldWel"><strong><img src="images/forget-usrname_icon.jpg" alt="" width="18px" height="18px" />FORGOT Username?</strong> </td>
                                      </tr>
                                      <form action="user.html?cmd=Password" method="post" name="frmForgetPwd2" id="frmForgetPwd2" onsubmit="return myvalidate2(this);" />
                                     
                                    <%
									String status1=(String)request.getAttribute("status");
                                                                        System.out.println("status from jsp :" +status);
                                                                        
									if(status1!=null)
									{
										if(status1.equalsIgnoreCase("UserNameFail"))
										{%>
                                      <tr>
                                        <td height="25" colspan="2" class="styleError"><font color="#FF0000">Sorry, your details does not match!</font></td>
                                      </tr>
                                      <%}
									}%>
									
                                      <tr>
                                        <td width="23%" class="textBold">e-Mail:</td>
                                        <td width="77%"><input name="usrname2" type="text" class="textboxOne" onblur="submitform(this.value);"/>
                                       <font color="#FF0000"><span class="asterisk">*</span></font></td>
                                      </tr>
                                      <tr>
                                        <td height="25" colspan="2">For example: <span class="styleBoldWel"><strong>person</strong>@domainname.com</span></td>
                                      </tr>
									  <div>
									  <tbody id="chkEmail" style="width:100%;position:absolute;">
                                      <tr>
                                        <td colspan="2" align="center">&emsp;&emsp;&emsp;&emsp;<input name="log" type="submit" class="gradTwoBtn" value="Send My Username" /></td>
                                      </tr>
									 </tbody>
									 </div>
									   <%
								String idstatus3=(String)request.getAttribute("status1");
                                                                System.out.println("idstatus from jsp :" +idstatus3);
																
																String pw=(String)request.getAttribute("password");
																System.out.println("password from jsp :" +pw);
									
								if(idstatus3!=null)
								{
									if(idstatus3.equalsIgnoreCase("UserNameSuccess"))
									{%>
									    <tr>
										<td height="30" colspan="2"><font color="#009933"> Congrats! Your e-Mail matches. Your username will be sent to your e-Mail.<br /></font>										</td>
                                        </tr>
										<tr>
										<td height="30" colspan="2" align="center">
										<a href="login.html?cmd=initLogin" ><img src="images/signIn_icon.jpg" alt="" width="20px" height="20px"/>&nbsp;<strong>Sign In</strong></a>										</td>
										</tr>
										 <%}
								
								}    %>
									  </form>
									  
                                    </table>
                                      
                                  </td>
                                  
                                </tr>
                                <tr>
                                  <td class="loginTabLftBotCrnr"></td>
                                  <td class="loginTabBot"></td>
                                  <td class="loginTabRghtBotCrnr"></td>
                                </tr>
                    </table>
                            <!-- Login Tab Starts Here -->
                          
                  
                    <!-- Welcome Tab Ends Here -->
                  </td>
                </tr>
            </table>
            <!-- CENTER TABLE ENDS HERE -->
          </td>
        </tr>
        <tr>
          <td class="footerBg"><!-- FOOTER STARTS HERE --><!-- FOOTER ENDS HERE -->          </td>
        </tr>
      </table>
	  <br />
	  </td>
      
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
