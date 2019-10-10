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
 
 <script language="javascript">

//window.onload=call();
 
  function popitup(url) {
	
		newwindow=window.open(url,'name','height=170,width=350,scrollbars=no,resizable=no,top=300,left=500,toolbar=no,menubar=no,dialog=yes');
                        if (window.focus) {newwindow.focus()}
                        return false;
	}
 
  function callAdd(id,name,version,govStat){

		 
		strURL = "./SysMgmt.html?process=webserviceProce&id="+id+"&wsName="+name+"&wsVersion="+version+"&txtName=Add BPEL"+"&govStat="+govStat;
			window.location.href = strURL;
					
		       }
  
  function callEndGov(fwd,artiId,govStat){

		 
		strURL = "./SysMgmt.html?process=callEndGov&fwd="+fwd+"&name=ws"+"&artifactId="+artiId+"&govstatus="+govStat;
				window.location.href = strURL;
					
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
	  
	  
	  
	  
	  
	  <table width="800" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" height="100" style="border:thin;border-style:groove;">
        <tr>
          <td valign="top" class="tableCommonBg"><table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="centerTab">
              <tr >
                <td height="19">
                  <img src="images/services_logo.png" alt="" width="20px" height="20px" /><strong>&nbsp;View Web Service Artifact List</strong><div class="divider3"></div></td>
              </tr>
              <%
		  String gov=(String)request.getAttribute("stopGov");
		  String id=(String)request.getAttribute("id");
		   String ErrorMsg=(String)request.getAttribute("ErrorMsg");
		  
		  if(ErrorMsg!=null){%>
              <tr>
                <td height="28"><font color="#FF0000"><strong><%=ErrorMsg%></strong></font></td>
                <%
		  }else{	  
		  ErrorMsg="";
		  }
		  if(id==null)id="";
		  if(gov==null)gov="";
		  System.out.println("gov==="+gov+"==id=="+id);
		  %>
              </tr>
            <tr>
                <td valign="top"><table width="100%" border="1" align="center" cellpadding="" cellspacing="" id="centerTab">
                    <tr>
                      <form action="SysMgmt.html" name="frmWSArti" id="frmWSArti">
                        <input type="hidden" name="process" value="callArtifactWSList"/>
                        <td>
						<table  border="1" cellpadding="0" cellspacing="0" width="100%" align="left" >
                            <tr >
                              <td width="199" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>&nbsp;Name</strong><div class="divider3"></div></td>
                              <td width="85" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Version</strong><div class="divider3"></div></td>
                              <td width="132" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Consumable</strong><div class="divider3"></div></td>
                              <td width="131" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Owner</strong><div class="divider3"></div></td>
                              <td width="155" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Domain</strong><div class="divider3"></div></td>
                              <td width="167" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Governance</strong><div class="divider3"></div></td>
                            </tr>
                            <%
              ArrayList list=(ArrayList)request.getAttribute("list");
    //System.out.println  ("artifactData"+artifactData.size());                                           
                                                 
   if (list != null && list.size() != 0) {  
                                                            
   Iterator iter = list.iterator();
                                                                //String [] userType = {ID, name };
                                                                while (iter.hasNext()) {
                                                                	 
                                                                	
                                                                	String [] artiType=(String[])iter.next();
                                                                	//String id=artiType[0];
                                                                	String artId=artiType[0];
                                                                	String name=artiType[1]; 
                                                              
                                                                	String version=artiType[2];
                                                                	System.out.println("Inside frmViewWSArtifact jsp version of BS is ====>>>> "+version);
String govStat=artiType[3];
                                                                	if(version==null)version="";
                                                                	

                                                %>
                            <tr style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#FFFFFF">
                              <td height="25" align="left" valign="middle">&nbsp;<%=name%></td>
                              <td height="25" align="left" valign="middle"><%=version%></td>
                              <td height="25" align="left" valign="middle"></td>
                              <td height="25" valign="middle"></td>
                              <td height="25" valign="middle"></td>
                              <td height="25" valign="middle"><%if(govStat.equalsIgnoreCase("Start")){%>
                                  <label><img src="images/start-icon-button.png" alt="" width="20px" height="20px"/><input name="button" type="button" onclick="callAdd('<%=artId%>','<%=name%>','<%=version%>','<%=govStat%>')" value="Start Governance"  class="button-add" /></label>
                                  <%}else if(govStat.equalsIgnoreCase("End")){ %>
                                  <label><img src="images/end-icon-button.png" alt="" width="20px" height="20px" /><input name="button" type="button" onclick="callEndGov('callArtiWsList','<%=artId%>','<%=govStat%>')" value="End Governance "  class="button-add" /></label>
                              <%}%></td>
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
                      </form>
                    </tr>
                </table></td>
            </tr>
            </table>
              <!-- CONTENTS END HERE -->
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
