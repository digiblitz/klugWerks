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
 
  function approved() {
 //alert("approved");
	 
var chkBoxCnt = document.artifactlist.chk.length;
 
		 if(chkBoxCnt!=undefined && chkBoxCnt!='undefined')
			   {
			  // alert("approved 2");
					for(var i=0;i<chkBoxCnt;i++)
					{
//alert("approved 3");
						 	if(document.artifactlist.chk[i].checked==true)
						 {
						 //alert("approved 4");
								var StageValue= document.artifactlist.StageValue[i].value;
								var StageName= document.artifactlist.StageName[i].value;
								var ArtifactId= document.artifactlist.ArtifactId[i].value;
								var ProcessId= document.artifactlist.ProcessId[i].value;
								//alert("StageName"+StageName);
								var stageNo= document.artifactlist.StageNo[i].value;
								var ReqquestId= document.artifactlist.ReqquestId[i].value;
								//alert("StageName"+StageName);

								 strURL = "./SysMgmt.html?process=BPapproved&StageValue="+StageValue+"&StageName="+StageName+"&ArtifactId="+ArtifactId+"&ProcessId="+ProcessId+"&StageNo="+stageNo+"&RequestID="+ReqquestId;
                                 window.location.href = strURL;

						 }
						
					}
			   }


			   else{
		//	 alert("approved 5");
			   	if(document.artifactlist.chk.checked==true)
			{
//alert("approved 6");
var StageValue= document.artifactlist.StageValue.value;

								var StageName= document.artifactlist.StageName.value;
								var ArtifactId= document.artifactlist.ArtifactId.value;
								var ProcessId= document.artifactlist.ProcessId.value;
								var stageNo= document.artifactlist.StageNo.value;
                            var ReqquestId= document.artifactlist.ReqquestId.value;
								 strURL = "./SysMgmt.html?process=BPapproved&StageValue="+StageValue+"&StageName="+StageName+"&ArtifactId="+ArtifactId+"&ProcessId="+ProcessId+"&StageNo="+stageNo+"&RequestID="+ReqquestId;
                                 window.location.href = strURL;



			}
			}




	 
		
	}
 
  function denied() {
		
var chkBoxCnt = document.artifactlist.chk.length;
		 if(chkBoxCnt!=undefined && chkBoxCnt!='undefined')
			   {
					for(var i=0;i<chkBoxCnt;i++)
					{

						 	if(document.artifactlist.chk[i].checked==true)
						 {
								
var StageValue= document.artifactlist.StageValue[i].value;
								var StageName= document.artifactlist.StageName[i].value;
								var ArtifactId= document.artifactlist.ArtifactId[i].value;
								var ProcessId= document.artifactlist.ProcessId[i].value;
								var stageNo= document.artifactlist.StageNo[i].value;
								var ReqquestId= document.artifactlist.ReqquestId[i].value;
								 strURL = "./SysMgmt.html?process=BPdenied&StageValue="+StageValue+"&StageName="+StageName+"&ArtifactId="+ArtifactId+"&ProcessId="+ProcessId+"&StageNo="+stageNo+"&RequestID="+ReqquestId;
      window.location.href = strURL;


						 }
						
					}
			   }


			   else{
			   
			   	if(document.artifactlist.chk.checked==true)
			{
					
					var StageValue= document.artifactlist.StageValue.value;
								var StageName= document.artifactlist.StageName.value;
								var ArtifactId= document.artifactlist.ArtifactId.value;
								var ProcessId= document.artifactlist.ProcessId.value;
								var stageNo= document.artifactlist.StageNo.value;
								var ReqquestId= document.artifactlist.ReqquestId.value;

 strURL = "./SysMgmt.html?process=BPdenied&StageValue="+StageValue+"&StageName="+StageName+"&ArtifactId="+ArtifactId+"&ProcessId="+ProcessId+"&StageNo="+stageNo+"&RequestID="+ReqquestId;
      window.location.href = strURL;
			}
			   }


	 
	}


	
	 </script>
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
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg">
	  
	  
	   
	  
	  <table width="887" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" height="100" style="border:thin;border-style:groove;">
	  <tr><td height="19"><img src="images/BPM-icon.png" alt="" width="20px" height="20px" /><strong>Bussiness process Voting List:</strong>
	    <div class="divider3"></div></td></tr>
        <tr>
          <td valign="top" class="tableCommonBg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="centerTab">
              <tr>
                <td><table width="100%" border="1" align="center" cellpadding="" cellspacing="" id="centerTab">
                    <tr>
                      <form action="SysMgmt.html" name="artifactlist" id="artifactlist">
                        <td><table  border="1" cellpadding="0" cellspacing="0" width="100%" align="left" >
                            <tr >
                              <td width="62" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Serial Id</strong><div class="divider3"></div></td>
                              <td width="121" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Artifact Name</strong><div class="divider3"></div></td>
                              <td width="150" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Artifact Description</strong><div class="divider3"></div></td>
                              <td width="172" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Date of Request Raised</strong><div class="divider3"></div></td>
                              <td width="125" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Stage Name</strong><div class="divider3"></div></td>
                              <td width="125" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Actions</strong><div class="divider3"></div></td>
                              <td width="112" height="21" class="tblRowHeadTwo"><div class="divider3"></div><strong>Comments</strong><div class="divider3"></div></td>
                            
							</tr>
							
                            <%
   Map <Integer,String[]> artifactlist=(HashMap)request.getAttribute("BPvotinglist");
    //System.out.println  ("artifactData"+artifactData.size());                                           
                                                 
   if (artifactlist != null && artifactlist.size() != 0) {  
                                                            
   Iterator iter = artifactlist.entrySet().iterator();
                                                                //String [] userType = {ID, name };
                                                                while (iter.hasNext()) {
                                                                	Map.Entry mEntry = (Map.Entry) iter.next();
                                                                	
                                                                	String [] artiType=(String[])mEntry.getValue();
                                                                	int id=(Integer)mEntry.getKey();
                                                                	String ArtifactName=artiType[0];
                                                                	String ArtifactDescription=artiType[1];
                                                                	String DORequest=artiType[2]; 
                                                                	String StageName=artiType[3];
                                                                	String Comments=artiType[4];
                                                                	String ProcessId=artiType[5];
                                                                	String ArtifactId=artiType[6];
                                                                	String StageValue=artiType[7];
																	String StageNo=artiType[8];
																	 String reqId=artiType[9];
																	 
																	 if(Comments==null){
																	 Comments="NA";
																	 }

                                                %>
                            <tr style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#FFFFFF">
                              <td><input type="radio" name="chk" value="<%=id%>" /></td>
                              <td><%=ArtifactName%></td>
                              <td align="left"><%=ArtifactDescription%></td>
                              <td align="left"><%=DORequest%></td>
                              <td><%=StageName%></td>
                              <td><input name="button" type="button" onclick="approved()" value="Approve" class="button-add" style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#66CCFF;color:#3366FF;"/>
                                  <input name="button" type="button" onclick="denied()" value="Deny" class="button-add" style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#66CCFF;color:#3366FF;"/>
                                  <input type="hidden" value="<%=reqId%>" name="ReqquestId"/>
                                  <input type="hidden" value="<%=StageName%>" name="StageName"/>
                                  <input type="hidden" value="<%=StageNo%>" name="StageNo"/>
                                  <input type="hidden" value="<%=StageValue%>" name="StageValue"/>
                                  <input type="hidden" value="<%=ArtifactId%>"  name="ArtifactId"/>
                                  <input type="hidden" value="<%=ProcessId%>" name="ProcessId"/></td>
                              <td><%=Comments%></td>
                            </tr>
                            <%
                                                 
                                               
                                                                   
                                                                }
   }
   else{
	   %>
                            
							<tr>
                              <td colspan="7" align="center"><br /><strong>No DATA </strong></td>
                            </tr>
                            <%
   }
                                                %>
                            <!-- CONTENTS START HERE -->
                        </table></td>
                      </form>
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
