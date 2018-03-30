<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script language="javascript">
function callMapList(viewPointId) 
{
	
	strURL = "./artifactMapping.html?artiMapProcess=searchMappedGroup&viewPoint="+viewPointId;
	window.location.href = strURL;
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
	  <table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab" style="border:thin;border-style:groove;">
        <tr>
          <td width="100%" class="subDeptTablePad"><!-- CONTENTS START HERE -->
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer">
                <tr style="border-bottom-style:groove;border-bottom-width:thin">
                  <td colspan="4" class="tblMainHead"> &nbsp;<strong>View Point: <span class="styleBoldTwo">Search Mapped Groups List </span></strong></td>
                </tr>
                <tr>
                  <td colspan="2" class="tblDescrp" align="justify"><font size="-1">&nbsp;<strong>Please choose the any one of the view point in order to view the mapped group list</strong></font></td>
                </tr>
                <form name="frmSearchMappedViewPoint" action="artifactMapping.html"  method="post" onsubmit="return myValidate();">
                  <input type="hidden" name="artiMapProcess" value="searchMappedGroup">
                  <tbody id="showSearchCrite">
                    <tr>
                      <td colspan="4"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="formLayout">
                          <%String viewPointId = (String)request.getAttribute("viewPointId");
				
				 %>
                          <tbody id="memShow" class="tableInner">
                            <tr class="tableInner">
                              <td class="tableLeft">&nbsp;<strong>View Point:</strong></td>
                              <td class="tableRight"><select name="viewPoint" id="viewPoint" class="selectboxOne" onchange="callMapList(this.value);">
                                  <option selected="selected" value="">Select One</option>
                                  <%
									 ArrayList viewList = (ArrayList) request.getAttribute("viewList");
          					 if(viewList!=null && viewList.size()!=0){
							Iterator it = viewList.iterator();
							while(it.hasNext()){
								String[] s = (String[])it.next();
								String viewId = s[0];
								String viewName = s[1];		
								
											

											
											if (viewId.equals(viewPointId)){
													System.out.println(" View Name : "+viewName);

											 %>
                                  <option value="<%=viewId%>" selected="selected"><%=viewName%></option>
                                  <%
											 }
								 
					           else{
					           %>
                                  <option  value="<%=viewId%>" ><%=viewName%></option>
                                  <%
					           }
											 
											 }
										}
									


							%>
                              </select></td>
                            </tr>
                          </tbody>
                          <tr>
                            <td colspan="5" align="center" class="alignCenter">
                              <label><img src="images/search-icon-button.png" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="submit" type="submit" class="button-add" value="Search" align="middle" /></label>                            </td>
                          </tr>
                      </table></td>
                    </tr>
                  </tbody>
                </form>
                <form action="artifactMapping.html" name="frmMappedViewPoint">
                  <input type="hidden" name="artiMapProcess" value="">
                  <table border="0" cellpadding="0" align="center" cellspacing="1" class="formLayout" width="100%">
                    <tr style="border-bottom-style:groove;border-bottom-width:thin;border-top-style:groove;border-top-width:thin">
                      <td width="103" class="tblRowHeadTwo">&nbsp;<strong>View Point</strong></td>
                      <td width="34" class="tblRowHeadTwo"><strong>LOB</strong></td>
                      <td width="104" class="tblRowHeadTwo"><strong>Views</strong></td>
                      <td width="94" class="tblRowHeadTwo"><strong>Groups</strong></td>
                      <td width="88" class="tblRowHeadTwo"><strong>Process/Domain</strong></td>
                    </tr>
                    <%ArrayList userMapPointList = (ArrayList)request.getAttribute("userMapPointList");
           									 if(userMapPointList!=null && userMapPointList.size()!=0){
           							Iterator ituserMapPoint = userMapPointList.iterator();
           							while(ituserMapPoint.hasNext()){
           								String[] viewPointUser = (String[])ituserMapPoint.next();
           								String viewPoint = viewPointUser[0];
           								String lob = viewPointUser[1];
           								String view = viewPointUser[2];
           								String group = viewPointUser[3];
           								String processdDom = viewPointUser[4];
           		if(lob!=null && view!=null && group !=null && processdDom !=null){						
		   %>
                    <tr>
                      <td  height="26" class="alignCenter">&nbsp;<%=viewPoint%></td>
                      <td  height="26" class="alignCenter"><%=lob%></td>
                      <td  height="26" class="alignCenter"><%=view%></td>
                      <td  height="26" class="alignCenter"><%=group%></td>
                      <td  height="26" class="alignCenter"><%=processdDom%></td>
                    </tr>
                    <%}}
           							}else{ %>
                    <tr>
                      <td height="26" colspan="5" class="alignCenter"><strong>No Records were Found !</strong></td>
                      <%} %>
                    </tr>
                  </table>
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
             
	<tr><td> <footer>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </footer></td></tr>
  </table>
<!--=======footer=================================-->

</body>
</html>
