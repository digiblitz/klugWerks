<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/validate.js" type="text/javascript" ></script>
<script>


function search()
{
	
			var masterId=document.frmSearchListgroups.masterId.value;
			   strURL = "./artifactMapping.html?artiMapProcess=searchList&masterId="+masterId;
               window.location.href = strURL;
			
		
	
	}
	
	function AddGroups()
	{
		
		var masterId=document.frmSearchListgroups.masterId.value;
		   strURL = "./artifactMapping.html?artiMapProcess=AddGroups&masterId="+masterId;
           window.location.href = strURL;
	}
	function EditGroups()
	{
	
	var layer_value_id;
	var chkCnt=0;
	var vFlag = false;
	var masterId=document.frmSearchListgroups.masterId.value;
	var chkBoxCnt = document.frmSearchListgroups.chk.length;

    if(chkBoxCnt!=undefined && chkBoxCnt!='undefined' && chkBoxCnt > 1)
	{
		for(var i=0;i<chkBoxCnt;i++)
		{
			if(document.frmSearchListgroups.chk[i].checked==true)
			{
				layer_value_id = document.frmSearchListgroups.chk[i].value;
				   chkCnt++;
			}

		}
	}
	else
	{
			if(document.frmSearchListgroups.chk.checked==true)
			{
				layer_value_id = document.frmSearchListgroups.chk.value;
				   chkCnt++;
			}

	}
//Starts for checkbox
                if(chkCnt>1)
                {
                    for(var j=0;j<chkBoxCnt;j++)
                    {
                        vFlag = true;
                        document.frmSearchListgroups.chk[j].checked = false;
                        document.frmSearchListgroups.chkall.checked = false;
                    }

                }
                //Ends for checkbox
		if(chkCnt==0){

			 alert("Please check one record to edit");
			return;
		}

			if(vFlag == true)
			{
				alert("Only one record can be edited.Please check one record to edit.");
                                return;
			}
				
			strURL = "./artifactMapping.html?artiMapProcess=EditGroups&layer_value_id="+layer_value_id+"&masterId="+masterId;
		window.location.href = strURL;
}
	
	  function deleteGroups() {
			 var checkId=document.getElementById('chk');

			var chkCnt=0;					
					
						var canDelete = 0;
						var chkBoxCnt = document.frmSearchListgroups.chk.length;
						//alert("chkBoxCnt---"+chkBoxCnt);

						if(chkBoxCnt!=undefined && chkBoxCnt!='undefined' && chkBoxCnt > 1)
						{
							for(var i=0;i<chkBoxCnt;i++)
							{
								if(document.frmSearchListgroups.chk[i].checked==true)
								{
									canDelete++;
								}

							}
						}
						else
						{
								if(document.frmSearchListgroups.chk.checked==true)
								{
									canDelete++;
								}

						}

						if(canDelete == 0)
						{
							alert("Please check the record(s) for Delete.");
						}

						if(canDelete > 0)
						{
							if(confirm("Only selected records will be deleted.Are you sure you want to delete the same?"))

							{
									//alert("canDelete---"+canDelete);
								document.frmSearchListgroups.artiMapProcess.value ='deleteGroups';
								document.frmSearchListgroups.submit();

							}
						}
				 }
</script>
</head>

<body>
<header id="header">
<%@ include file = "../../include/HeaderProcess.jsp" %>
</header>
<table width="100%" border="1" cellpadding="0" cellspacing="0" height="500px" class="content_new" align="center">
<tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>
  <tr>
    <td  align="center" valign="middle" class="tableCommonBg" >
	<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" style="border:thin;border-style:groove;">
      <tr>
        <td class="tableCommonBg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
          <tr>
            <td width="100%" class="subDeptTablePad"><!-- CONTENTS START HERE -->
                    <table border="1" cellpadding="0" align="center" cellspacing="0" class="tblInnerContainer" width="100%">
                      <tr style="border-bottom-style:groove;border-bottom-width:thin">
                        <td height="23" colspan="2" valign="middle" class="tblMainHead"> <strong>Group - Details: </strong><span class="styleBoldTwo"><strong>List</strong></span><strong>&nbsp;</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label><img src="images/create-button.jpg" alt="" width="20px" height="20px" style="cursor:pointer"/><input type="button" name="add" class="button-add" value="Add" onclick="AddGroups();"/></label>
                            <label><img src="images/edit-icon-button.png" alt="" width="19px" height="19px" style="cursor:pointer"/><input type="button" name="edit" class="button-add" value="Edit" onclick="EditGroups();"/></label>
                        <label><img src="images/delete-icon-button.png" alt="" width="19px" height="19px" style="cursor:pointer"/><input type="button" name="delete" class="button-add" value="Delete" onclick="deleteGroups();"/></label>
						</td>
                      </tr>
                      <tr >
                        <td><table width="100%">
                            <form name="frmSearchListgroups" id="frmSearchListgroups" method="post" action="artifactMapping.html">
                              <input type="hidden" name="artiMapProcess" value="" />
                              <%
    		String groupIdObj=(String)request.getAttribute("groupId");
%>
                              <tr valign="middle" style="border-bottom-style:groove;border-bottom-width:thin">
                                <td height="23" colspan="2" class="tableLeft"><strong>Groups:</strong></td>
                                <td height="23" colspan="2" class="tableRight" valign="middle"><select name="masterId" class="selectboxOne" onchange="search(); ">
                                    <option  selected="selected" value="">Select One</option>
                                    <%
                                                ArrayList viewGroupSrchList = (ArrayList)request.getAttribute("groupList");
           									 if(viewGroupSrchList!=null && viewGroupSrchList.size()!=0){
           							Iterator itGprSrch = viewGroupSrchList.iterator();
           							while(itGprSrch.hasNext()){
           								String[] groupSrchList = (String[])itGprSrch.next();
           								String group_id_srch = groupSrchList[0];
           								String group_name_srch = groupSrchList[1];
           							   if (group_id_srch.equals(groupIdObj)){
                                                                                            
										%>
                                    <option  value="<%=group_id_srch%>" selected="selected" ><%=group_name_srch%></option>
                                    <%
											}
											else{
											%>
                                    <option  value="<%=group_id_srch%>" ><%=group_name_srch%></option>
                                    <%
											}
										}
           									 }									
								%>
                                  </select>
                                <span class="asterisk">*</span></td>
                              </tr>
                              <tr style="border-bottom-style:groove;border-bottom-width:thin">
                                <th align="left" class="tblRowHeadTwo">
                                  <input type="checkbox" name="chkall" value="" />
                                </th>
                                <th class="tblRowHeadTwo">Group</th>
                                <th class="tblRowHeadTwo">Details</th>
                              </tr>
                              <%
  ArrayList viewGroupAllList = (ArrayList)request.getAttribute("viewGroupList");
	 if(viewGroupAllList!=null && viewGroupAllList.size()!=0){
Iterator itViewGrp = viewGroupAllList.iterator();
while(itViewGrp.hasNext()){
String[] viewGroupAllStr = (String[])itViewGrp.next();
String layer_value_id = viewGroupAllStr[0];
String masterIdList = viewGroupAllStr[1];
String layer_value = viewGroupAllStr[2];
String masterNameList = viewGroupAllStr[3];
  %>
                              <tr>
                                <td><input type="checkbox" name="chk" value="<%=layer_value_id%>" />
                                </td>
                                <td align="center"><%=masterNameList%></td>
                                <td align="center"><%=layer_value%></td>
                              </tr>
                              <%}
}else{ %>
                              <tr>
                                <td colspan="4" align="center"><br />
                                    <strong>No Records Found</strong><br />
                                </td>
                              </tr>
                              <%}%>
                            </form>
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
 <footer>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </footer>
</body>
</html>
