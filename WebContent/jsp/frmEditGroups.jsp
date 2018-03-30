<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="com.hlcmrm.util.HLCBreedVO"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/validate.js" type="text/javascript" ></script>
<script>

function validate()
{
	
	var vFlag = false;
	var obj=document.frmAddListgroups;

	if(obj.masterId.selectedIndex==0 )
    {
		alert("Please select any one of the Group");
		return false;
    }
	if(obj.groupDet.value=="" )
    {
		alert("Details cannot be empty");
		return false;
    }

	for(var i=0;i<obj.elements.length;i++)
	{
		if(obj.elements[i].type=='text')
		{
			if((obj.elements[i].value.indexOf('	') == 0) || (obj.elements[i].value.lastIndexOf('	') == (obj.elements[i].value.length-1)) ||
				(obj.elements[i].value.indexOf(' ') == 0) || (obj.elements[i].value.lastIndexOf(' ') == (obj.elements[i].value.length-1)))
			{
				obj.elements[i].value = obj.elements[i].value.trim();
				//obj.elements[i].focus();
				vFlag = true;
			}
		}
	}

	if(vFlag==true)
	{
		alert("Leading and Trailing spaces will be trimmed. Please Submit again");
		return false;
	}
	
}

function cancelGroup()
{
	var masterId=document.frmAddListgroups.groupId.value;
	   strURL = "./artifactMapping.html?artiMapProcess=searchList&masterId="+masterId;
    window.location.href = strURL;	
	}


</script>
<style type="text/css">
<!--
.style1 {font-weight: bold}
-->
</style>
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
                        <td height="21" colspan="4" valign="middle" class="tblMainHead style1"> Group - Details: <span class="styleBoldTwo"> Edit</span></td>
                      </tr>
                      <tr>
                        <td height="21" colspan="4" valign="middle" class="tblDescrp">You can <strong>Edit</strong> a <strong> Group - Detail</strong> for all users.</td>
                      </tr>
                      <tr>
                        <td><table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout" width="100%">
                            <form name="frmAddListgroups" id="frmAddListgroups" method="post" action="artifactMapping.html" onsubmit="return validate();">
                              <input type="hidden" name="artiMapProcess" value="createGroups" />
                              <%
String groupIdObj=(String)request.getAttribute("groupId");
    		String layerValue=(String)request.getAttribute("layerValue");
%>
                              <input type="hidden" name="groupId" value="<%=groupIdObj%>" />
                              <tr>
                                <td height="21" colspan="4" valign="middle" class="tblDescrp">Fields marked with an asterisk (<span class="asterisk">*</span>) are required.</td>
                              </tr>
                              <% String statuscheck = (String)request.getAttribute("status");
					if(statuscheck!=null && statuscheck.equals("error")){
					%>
                              <tr>
                                <td height="21" colspan="4" valign="middle" class="styleError"><strong> Detail already exist </strong></td>
                              </tr>
                              <%
					}
					%>
                              <tr valign="middle">
                                <td height="21" colspan="2" class="tableLeft"><strong>Groups:</strong></td>
                                <td height="21" colspan="2" class="tableRight"><select name="masterId" class="selectboxOne"  >
                                    <option  selected="selected" value="">Select One</option>
                                    <%
                                                ArrayList viewGroupList = (ArrayList)request.getAttribute("groupList");
           									 if(viewGroupList!=null && viewGroupList.size()!=0){
           							Iterator it = viewGroupList.iterator();
           							while(it.hasNext()){
           								String[] groupList = (String[])it.next();
           								String group_id = groupList[0];
           								String group_name = groupList[1];
           							   if (group_id.equals(groupIdObj)){
                                                                                            
										%>
                                    <option  value="<%=group_id%>" selected="selected" ><%=group_name%></option>
                                    <%
											}
											else{
											%>
                                    <option  value="<%=group_id%>" ><%=group_name%></option>
                                    <%
											}
										}
           									 }									
								%>
                                  </select>
                                <span class="asterisk">*</span></td>
                              </tr>
                              <tr valign="middle">
                                <td height="21" colspan="2" class="tableLeft"><strong>Detail:</strong></td>
                                <td height="21" colspan="2" class="tableRight"><input name="groupDet" type="text" class="textboxOne" value="<%=layerValue%>" />
                                <span class="asterisk">*</span></td>
                              </tr>
                              <tr>
                                <!--<td class="tableLeft">&nbsp;</td>-->
                                <td height="25" colspan="4" valign="middle" style="text-align:center">
								<label><img src="images/update-icon-button.jpg" alt="" width="20px" height="20px" style="cursor:pointer"/>
								<input type="submit" name="submit" class="button-add" value="Update" /></label>
                                  &nbsp;&nbsp;
                                   <label><img src="images/clear-icon.png" alt="" width="20px" height="20px" style="cursor:pointer"/>
								   <input name="Clear"  type = "button" class="button-add" value="Clear" onclick = "clearFields(this.form)"/></label>
                                  &nbsp;&nbsp;
                                   <label><img src="images/cancel-icon-button.png" alt="" width="20px" height="20px" style="cursor:pointer"/>
								   <input name="Cancel"  type = "button" class="button-add" value="Cancel" onclick = "cancelGroup();"/></label>
                                &nbsp;&nbsp; </td>
                              </tr>
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
<!--=======footer=================================-->
 <footer>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </footer>
</body>
</html>
