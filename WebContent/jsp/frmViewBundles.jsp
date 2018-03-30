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
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
 <link rel="icon" href="images/favicon.ico" type="image/x-icon">
 <script language="javascript">

//window.onload=call();
 function popitup(url) {
	 if(confirm('This is a governed WebService. \n Please raise a request approval to modify.'))
	 {
		newwindow=window.open(url,'name','height=450,width=800,scrollbars=no,resizable=no,top=300,left=500,toolbar=no,menubar=no,dialog=yes');
                        if (window.focus) {newwindow.focus()}
                        return false;
	 }
	 else
	 {
		 return;
	 }

}
 
function callEdit(status,artiUid,lifecycleId,processname,proceDesc){
	 
	
	 
	 
	  if(status!='Pending'){

	 if(confirm('This is a governed Web service. \n Please raise a request to modify.'))
	 {
	strURL = "./SysMgmt.html?process=callBundlesEdit&status="+status+"&artUid="+artiUid+"&lifecycleId="+lifecycleId+"&artifactName="+processname+"&description="+proceDesc;
		window.location.href = strURL;
	 }
	 else
	 {
		 return;
	 }
	 }
	 else
		 {
		 alert ("This process has a modify request pending. Please wait until the current request is processed.");
		 
		 }
	       }



	 </script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>


<body>

<header id="header">
<%@ include file = "../../include/HeaderProcess.jsp" %>
</header>
  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0"  class="content_new" align="center">
        <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>

    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
	  <table width="887" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab"  style="border:thin;border-style:groove;min-height:60px">
        <tr>
          <td valign="top" class="tableCommonBg">
		  <table width="100%" height="" border="0" align="center" cellpadding="0" cellspacing="0" id="centerTab">
              <tr >
                <td height="20"><!-- INFO BAR STARTS HERE -->
                  <img src="images/services_logo.png" alt="" width="20px" height="20px" /><strong>View Web Services</strong>                  <!-- INFO BAR ENDS HERE -->                </td>
              </tr>
              <%String success=(String)request.getAttribute("success");
  
  if(success!=null&&success.equalsIgnoreCase("success")){%>
              <tr>
                <td><!-- INFO BAR STARTS HERE -->
                    <h3><font color="blue">Request Submitted Successfully to the Systinet.</font></h3>
                  <!-- INFO BAR ENDS HERE -->
                </td>
              </tr>
              <%}%>
              <tr>
                <td><table width="100%" border="1" align="center" cellpadding="" cellspacing="" id="centerTab">
                    <tr>
                      <td><table  border="1" cellpadding="0" cellspacing="0" width="100%" align="left" >
                          <tr>
                            <td colspan="7" class="tblMainHead" ></td>
                          </tr>
                          <tr >
                            <td width="35" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Id</strong><div class="divider3"></div></td>
                            <td width="181" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Name</strong><div class="divider3"></div></td>
                            <td width="60" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Version</strong><div class="divider3"></div></td>
                            <td width="134" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Category</strong><div class="divider3"></div></td>
                            <td width="106" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Production Status</strong><div class="divider3"></div></td>
                            <td width="140" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Governance Status</strong><div class="divider3"></div></td>
                            <td width="71" height="27" class="tblRowHeadTwo"><div class="divider3"></div><strong>Action</strong><div class="divider3"></div></td>
                          </tr>
                          <%
  ArrayList BundlesData=(ArrayList)request.getAttribute("BundlesData");
    //System.out.println  ("artifactData"+artifactData.size());                                           
                                                 
   if (BundlesData != null && BundlesData.size() != 0) {  
                                                            
   Iterator iter = BundlesData.iterator();
                                                                //String [] userType = {ID, name };
                                                                while (iter.hasNext()) {
                                                                	
                                                                	
                                                                	String [] artiType=(String[])iter.next();
                                                                	String id=artiType[0];
                                                                	String name=artiType[1]; 
                                                                	String version=artiType[2];
                                                                	String status=artiType[3];
                                                                	String artiUid=artiType[4];
                                                                	String lifecycleId=artiType[5];
																	String proceDesc=artiType[6];

                                                %>
                          <tr>
                            <td><%=id%></td>
                            <td align="left"><%=name%></td>
                            <td align="left"><%=version%></td>
                            <td>webservice process</td>
                            <td>Active</td>
                            <%if(status.equalsIgnoreCase("Pending")){%>
                            <td>Modify Request <%=status%></td>
                            <%}else{%>
                            <td>Active</td>
                            <%}%>
                            <td width="134"><a href="#" onclick="callEdit('<%=status%>','<%=artiUid%>','<%=lifecycleId%>','<%=name%>','<%=proceDesc%>')" style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#66CCFF;color:#3366FF;"><strong>Move Lifecycle Stage</strong></a></td>
                          </tr>
                          <%
                                                 
                                               
                                                                   
                                                                }
   }
   else{
	   %>
                          <tr>
                            <td colspan="6" align="center"><strong>No DATA </strong></td>
                          </tr>
                          <%
   }
                                                %>
                          <!-- CONTENTS START HERE -->
                      </table></td>
                    </tr>
                  </table>
                    <!-- CONTENTS END HERE -->
                </td>
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
