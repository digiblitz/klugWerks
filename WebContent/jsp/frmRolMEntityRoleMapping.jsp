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
<script language="javascript">

function checkAll() {
     el = document.forms['frmRoleEnt'].elements;
     for (i=0; i < el.length; i++) {
       if(el[i].type == "checkbox") {
          if(el[i].checked== true && el[i].value== "ChkAll") {
            //alert("ok");
            for (j=0; j < el.length; j++) {
               if(el[j].type == "checkbox") {
                  void(el[j].checked=1);
               }
            }
            break;
          }
          if(el[i].checked== false && el[i].value== "ChkAll") {
            //alert("uncheck");
            for (j=0; j < el.length; j++) {
               if(el[j].type == "checkbox") {
                  void(el[j].checked=0);
               }
            }
          }   
       }
     }
 }
 
function DelAll(){
	var chkValue = "";
	e = document.forms['frmRoleEnt'].elements;
	var count =0;
	for(i=0 ; i< e.length; i++){
		if(e[i].type == "checkbox"){
			 if(e[i].checked == true && e[i].value != "ChkAll") {
				 count++;
				 chkValue +=  e[i].value + "#";
			}
		}
	}
		//alert(chkValue);
		document.frmRoleEnt.entityIds.value = chkValue;
}

function entPrivValidate(){
	if(document.frmRoleEnt.roleId.value==""){
		alert("Select any one Role.");
		document.frmRoleEnt.roleId.focus();
		return false;
	}
	DelAll();
	return true;
}
	
	
function postData(){
	if(document.frmRoleEntSelect.roleId.value!=""){
		document.frmRoleEntSelect.roleProcess.value = "roleEntSelect";
		//alert(frmRewalList.eventProcess.value);
		document.frmRoleEntSelect.method="post";
		document.frmRoleEntSelect.action="roles.html";
		document.frmRoleEntSelect.submit();
	}
	else{
		alert("Select any one Role");
		document.frmRoleEntSelect.roleId.focus();
	}
}


function clearField(obj)
{

	for(var i=0;i<obj.elements.length;i++)
	{
		
		if(obj.elements[i].type=='checkbox')
		{
			obj.elements[i].checked = false;
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
<%
	String roleRoleId = (String) request.getAttribute("roleId");
	if(roleRoleId==null){
		roleRoleId = "";
	}
	//String privId = "";

%>


  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0"  class="content_new" align="center">
    <tr><td><%@ include file = "../../include/infobar.jsp" %><br /></td></tr>
    <tr>
	
      
     
      <td  align="center" valign="top" class="tableCommonBg" >
	  
	
	  
	  <table width="630" height="350" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab" style="border:thin;border-style:groove;">
        <tr>
         
          <td width="630" valign="top" class="subDeptTablePad"><!-- CONTENTS START HERE -->
              <table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout" width="630">
                <tr >
                  <td colspan="2" class="style2 tblMainHead"><img src="images/mapping-icon.jpg" alt="" width="20px" height="20px" />&nbsp;<strong>Map: <span class="styleBoldTwo"> Role Entity Mapping </span> </strong> <div class="divider3"></div></td>
                </tr>
                <tr>
                  <td height="26" colspan="2" valign="middle" class="tblDescrp"><!--<img src="images/usea_logo.jpg" class="imgFloatLeft" />-->
                  &nbsp;You can map an<strong> Entity</strong> or Multiple Entities for a given role as given below. </td>
                </tr>
                <tr>
                  <td>
				  <table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout" width="630">
                      <tr > 
                        <td colspan="2" class="tblRowHead"></td>
                      </tr>
					  <br/>
                      <form name="frmRoleEntSelect" id="frmRoleEntSelect" >
                        <input type="hidden" name="roleProcess" value="" />
                        <tr>
                          <td width="218" height="27" valign="middle" class="tableLeft"> &nbsp;&emsp;&emsp;&emsp;&emsp;Select a Role :</td>
                          <td width="412" valign="middle" class="tableRight"><span class="alignLeft">
                            <select name="roleId" id="roleId" class="selectboxOne" onchange="postData();">
                              <option selected="selected" value="">Select One</option>
                              <%
									ArrayList arrayRoleList = (ArrayList)request.getAttribute("roleDetails");
									if(arrayRoleList!=null && arrayRoleList.size()!=0){
										Iterator itRoleList = arrayRoleList.iterator();
										while(itRoleList.hasNext()){
											String[] rRoleList = (String [])itRoleList.next();
											//String[] roleList = {roleId, roleName};
											String rRolId = rRoleList[0];
											String roleRoleName = rRoleList[1];
											if(rRolId.equals(roleRoleId)){
											%>
                              <option value="<%=rRolId%>" selected="selected"><%=roleRoleName%></option>
                              <%
											 }
											 
											 else{
											 %>
                              <option value="<%=rRolId%>"><%=roleRoleName%></option>
                              <%
											 }
										}
									}
							%>
                            </select>
                          </span></td>
                        </tr>
                      </form>
					  
                    <form name="frmRoleEnt" id="frmRoleEnt" onsubmit="return entPrivValidate();">
                        <input type="hidden" name="roleProcess" value="mappingRoleEnt" />
                        <input type="hidden" name="entityIds" value="sury" />
                        <input type="hidden" name="roleId" value="<%=roleRoleId%>" />
                        <tr>
                          <td height="80" class="tableLeftTxtArea" style="border-top-style:groove;border-top-width:thin;border-right-style:groove;border-right-width:thin;border-bottom-style:groove;border-bottom-width:thin;"> &nbsp;&emsp;&emsp;&emsp;&emsp;Accessible Entity(ies) :</td>
                          <td class="tableRight"><table width="100%" border="0" cellspacing="1" cellpadding="0">
                              <tr style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#FFFFFF">
                                <td height="22" colspan="2" valign="middle" style="border-top-style:groove;border-top-width:thin;"><input  type="checkbox" name="chkAll" value="ChkAll" alt="Select or Deselect All" onclick="checkAll();">
                                Select All </td>
                              </tr>
                              <%
									ArrayList arrayEntityList = (ArrayList)request.getAttribute("enityDetails");
									if(arrayEntityList!=null && arrayEntityList.size()!=0){
										Iterator itEntList = arrayEntityList.iterator();
										while(itEntList.hasNext()){
											String[] entList = (String [])itEntList.next();
											//String[] entList = {entityId, entityName};
											String roleEntityId = entList[0];
											String roleEntityName = entList[1];
											boolean entIdStatus = false;
											ArrayList arrayMapRoleEntList = (ArrayList)request.getAttribute("mapDetails");
											if(arrayMapRoleEntList!=null && arrayMapRoleEntList.size()!=0){
												Iterator itRoleEntList = arrayMapRoleEntList.iterator();
												while(itRoleEntList.hasNext()){
													String[] mapEntList = (String [])itRoleEntList.next();
													//{mapEntityId, roleIdVal, entityId, roleName, entityName};
													String entId = mapEntList[2];
													if(roleEntityId.equals(entId)){
														entIdStatus = true;
														break;
													}
												}
											}
											if(entIdStatus==true){
											%>
                              <tr style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#FFFFFF">
                                <td height="22" colspan="2" valign="middle" class="tableLeftTxtArea"><input type="checkbox" name="checkbox5" checked="checked" value="<%=roleEntityId%>" />
                                <%=roleEntityName%> </td>
                              </tr>
                              <%
											 }
											 else{
											 %>
                              <tr style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#FFFFFF">
                                <td height="22" colspan="2" valign="middle" class="tableLeftTxtArea"><input type="checkbox" name="checkbox5" value="<%=roleEntityId%>" />
                                <%=roleEntityName%> </td>
                              </tr>
                              <%
											 }
										}
									}
									%>
                          </table></td>
                        </tr>
                        <tr>
                          <td height="24" colspan="2" align="center" valign="middle" class="alignCenter"><label><img src="images/submit-icon.png" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="submit" type="submit" class="button-add" value="Submit" /></label>&emsp;&emsp;
                          <label><img src="images/clear-icon.png" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="button" type="button" class="button-add" value="Clear" onclick = "clearField(this.form)"/></label></td>
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
