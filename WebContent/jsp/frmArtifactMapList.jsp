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
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
 <script>
function loadSec(){

	document.getElementById('showLobs').style.display = "none";
	document.getElementById('showViews').style.display="none";
	document.getElementById('showGrps').style.display="none";
	document.getElementById('showProDom').style.display="none";

	}
	
</script>
<script src="js/frmArtifactMapList.js" type="text/javascript" ></script>

</head>


<body onload="loadSec();">
<header id="header">
<%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</header>
  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0"  class="content_new" align="center">
            <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>

    <tr>
	
      <td  align="center" valign="middle" class="tableCommonBg" >
	  <table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab" style="border:thin;border-style:groove;">
        <tr>
          <td width="100%" class="subDeptTablePad"><!-- CONTENTS START HERE -->
              <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                <tr style="border-bottom-style:groove;border-bottom-width:thin">
                  <td colspan="5" class="tblMainHead"> <strong>Manage Artifact Mapping:</strong></td>
                </tr>
                <%
	 String errorMsg="";
	 if(request.getAttribute("errorMsg")!=null){
	 
	  errorMsg="Error while Mapping";
	
	
	 
	 %>
                <tr>
                  <td colspan="5" class="tblMainHead"><font color="#FF0000"><%=errorMsg%></font></td>
                </tr>
                <%}%>
                <form name="frmArtifactMap" id="frmArtifactMap" action="artifactMapping.html?artiMapProcess=mapArtiDets" method="post" onsubmit="return myValidate();" enctype="multipart/form-data" commandName="uploadForm">
                  <input type="hidden" name="artiMapProcess" value="mapArtiDets" />
                  <tr>
                    <td width="100%" align="center">
					<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
					
                        <tr class="tableInner">
                          <td width="30%" height="23" class="tableLeft"><strong>View Points:</strong></td>
                          <td width="70%" height="23" class="tableRight"><select name="viewPntId" id="viewPntId" class="selectboxOne" onchange="retrieveURL('lobsList',this);">
                              <option selected="selected" value="">Select One</option>
                              <%
									 ArrayList viewPntList = (ArrayList) request.getAttribute("viewPntList");
          					 if(viewPntList!=null && viewPntList.size()!=0){
							Iterator itvPnt = viewPntList.iterator();
							while(itvPnt.hasNext()){
								String[] sVPnt = (String[])itvPnt.next();
								String viewPntId = sVPnt[0];
								String viewPntName = sVPnt[1];		
								
											

											 %>
                              <option value="<%=viewPntId%>"><%=viewPntName%></option>
                              <%
											 }
										}
									


							%>
                          </select></td>
                        </tr>
						
                        <tr id="showLobs">
                          <td height="23"><strong>LOBs:</strong></td>
                          <td height="23" class="tableRight"><select name="lobId" id="lobId" class="selectboxOne" onchange="retrieveURLs('viewGrpList',this);">
                              <option selected="selected" value="">Select One</option>
                          </select></td>
                        </tr>
                        <tr class="tableInner" id="showViews">
                          <td height="23" class="tableLeft"><strong>Views:</strong></td>
                          <td height="23" class="tableRight"><select name="viewId" id="viewId" class="selectboxOne">
                              <option selected="selected" value="">Select One</option>
                          </select></td>
                        </tr>
                        <tr class="tableInner" id="showGrps">
                          <td height="23" class="tableLeft"><strong>Groups:</strong></td>
                          <td height="23" class="tableRight"><select name="grpId" id="grpId" class="selectboxOne" onchange="retrieveURL('processDomainList',this);">
                              <option selected="selected" value="">Select One</option>
                          </select></td>
                        </tr>
                        <tr class="tableInner" id="showProDom">
                          <td height="23" class="tableLeft"><strong>Domains/Processes:</strong></td>
                          <td height="23" class="tableRight"><select name="domProcId" id="domProcId" class="selectboxOne">
                              <option selected="selected" value="">Select One</option>
                          </select></td>
                        </tr>
                        <tr class="tableInner">
                          <td height="23" class="tableLeft"><strong>Artifacts:</strong></td>
                          <td height="24" valign="middle" class="tableRight"><%
									 ArrayList cntList = (ArrayList) request.getAttribute("cntList");
          					 if(cntList!=null && cntList.size()!=0){
							 int j=0;
							Iterator itcnt = cntList.iterator();
							while(itcnt.hasNext()){
								String[] scnt = (String[])itcnt.next();
								String layerCntId = scnt[0];
								String layerCntName = scnt[1];	
								String masterCntId = scnt[2];
								String masterCntName = scnt[3];		
					
											 %>
                              <br />
                              <input type="checkbox" name="artiFact<%=j%>" id="artiFact<%=j%>" value="<%=layerCntId%>" onclick="retrieveURLD('MappingDetExists',this);"/>
                            <%=layerCntName%>
                             &nbsp; <input name="uploads[<%=j%>]" type="file" id="uploads<%=j%>" multiple="muliple" required/>
                              <%
											 j++;}
										}
		
							%>
                              <input type="hidden" name="artiCnt" id="artiCnt" value="<%=cntList.size()%>"/>
                          </td>
                        </tr>
                        <tr>
                          <td colspan="5" align="center" class="alignCenter">
						  <br />
						  <label>
                         <img src="images/mapping-icon.jpg" alt="" width="20px" height="20px" style="cursor:pointer"/>
                            <input name="submit" type="submit" class="button-add" value="Map Artifact" align="middle" />
                         
                          </label></td>
                        </tr>
                    </table></td>
                  </tr>
                </form>
            </table></td>
        </tr>
        <!-- Based on id -->
        <tr>
          <td></td>
        </tr>
        <!--end of the file-->
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
