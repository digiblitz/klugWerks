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
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/frmMeeEduActRecap.js" type="text/javascript" ></script>
<script src="js/frmrRolePrevilageValidate.js" type="text/javascript" ></script>

<script>
    function cancelAddArtifact(mainArtiId)
    {
        if(confirm("Do you want to Cancel and go back to List Page?"))
	{
        strURL = "./artifactMapping.html?artiMapProcess=artifactList&mapId="+mainArtiId;
	window.location.href = strURL;
        }
	else
	{
		return;
	}
    }
	
	function clearFields(obj)
{

	for(var i=0;i<obj.elements.length;i++)
	{
		if(obj.elements[i].type=='text')
		{
			obj.subArtiName.value = "";
		}

		
	}
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
	
      <td  align="center" valign="middle" class="tableCommonBg" >
	  <table border="1" cellpadding="0" align="center" cellspacing="0" class="formLayout" style="border:thin;border-style:groove;">
        <tr>
          <td colspan="2"  class="tblMainHead"> Sub Artifact: <span  class="styleBoldTwo"> Create </span></td>
        </tr>
        <tr>
          <td colspan="2" class="tblDescrp"> You can <strong>create</strong> a <strong>New Sub Artifact</strong> for all members and non-members Online Services Dashboard, right here! <br />
          </td>
        </tr>
        <% 
			 String mainArtiId="";
			 String mainArtifactName=(String) request.getAttribute("mainArtifactName");
				   mainArtiId=(String) request.getAttribute("mainArtiId");%>
        <table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
          <form name="frmRoleMgtRolePrev" id="frmRoleMgtRolePrev" action="artifactMapping.html" onsubmit="return formValidate(this);">
            <input type="hidden" name="artiMapProcess" value="createArtifact"/>
            <input type="hidden" name="mainArtiId" value="<%=mainArtiId%>"/>
            <tr>
              <td  colspan="2" class="tblDescrp"> Fields marked with an asterisk (<span class="asterisk">*</span>) are required. </td>
            </tr>
            <%
						  	String err = request.getParameter("err");
						  	if(err!=null) {
							 //mainArtiId=(String) request.getAttribute("mainArtiId");
						  %>
            <tr>
              <td class="styleError" colspan="2"><strong>Sub Artifact already exist</strong></td>
            </tr>
            <%
						  }
						  %>
            <tr>
              <td class="tableLeft"> Main Artifact:</td>
              <td class="tableRight"><input name="mainArtiname" id="mainArtiname" type="text" class="textboxOne" size="25" maxlength = "100" readonly="true" value="<%=mainArtifactName%>"/>
                  <span class="asterisk">*</span> </td>
            </tr>
            <tr>
              <td class="tableLeft">Sub Artifact:</td>
              <td class="tableRight"><input name="subArtiName" id="subArtiName" type="text" class="textboxOne" size="25" maxlength = "100"/>
                  <span class="asterisk">*</span></td>
            </tr>
            <tr>
              <td colspan="2" style="text-align:center" height="25" class="tableLeft"><input name="submit" type="submit" class="gradBtn" value="Create" />
                &nbsp;&nbsp;
                <input name="button" type="button" class="gradBtn" value="Clear" onclick = "clearFields(this.form)"/>
                &nbsp;&nbsp;
                <input name="button" type="button" class="gradBtn" value="Cancel" onclick ="cancelAddArtifact('<%=mainArtiId%>')" />
              </td>
            </tr>
          </form>
        </table>
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
