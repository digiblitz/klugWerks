<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<link rel="stylesheet" href="css/style.css">
</head>
<script language="javascript">

function checkAll() {
     el = document.forms['frmRoleEntPriv'].elements;
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
	e = document.forms['frmRoleEntPriv'].elements;
	
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
		//return chkValue;
		document.frmRoleEntPriv.privilegeIds.value=chkValue;
}

function entPrivValidate(){
	if(document.frmRoleEntPriv.entityId.value==""){
		alert("Select any one Entity.");
		document.frmRoleEntPriv.entityId.focus();
		return false;
	}
	DelAll();
	return true;
}
	
	
	
function postData(){
	if(document.frmRoleSelectEntPriv.entityId.value!=""){
		document.frmRoleSelectEntPriv.roleProcess.value = "entPrivSelect";
		//alert(frmRewalList.eventProcess.value);
		document.frmRoleSelectEntPriv.method="post";
		document.frmRoleSelectEntPriv.action="roles.html";
		document.frmRoleSelectEntPriv.submit();
	}
	else{
		alert("Select any one Entity");
		document.frmRoleSelectEntPriv.entityId.focus();
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
<body>

<header id="header">
  <%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</header>
<%
	String entityId = (String) request.getAttribute("entityId");
	if(entityId==null){
		entityId = "";
	}
	//String privId = "";

%>
  <table width="100%" height="350" border="1" cellpadding="0" cellspacing="0"  class="content_new" align="center">
        <tr><td><%@ include file = "../../include/infobar.jsp" %><br /></td></tr>

	<tr>
      
      <td  align="center" valign="middle" class="tableCommonBg" >
	  

	  
	  <table width="630" height="200" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab" style="border:thin;border-style:groove;">
        <tr>
          <td width="630" valign="top" class="subDeptTablePad"><!-- CONTENTS START HERE -->
              <table width="630" height="200" border="0" align="center" cellpadding="0" cellspacing="0" class="formLayout">
                <tr >
                  <td colspan="2" class="tblMainHead"><img src="images/mapping-icon.jpg" alt="" width="20px" height="20px" />&nbsp;<strong> Map: <span class="styleBoldTwo"> Privilege Entity Mapping </span> </strong>
                    <div class="divider3"></div></td>
                </tr>
                <tr>
                  <td height="24" colspan="2" valign="middle" class="tblDescrp"><!--<img src="images/usea_logo.jpg" class="imgFloatLeft" />-->
                  &nbsp;You can map a <strong>Privilege</strong> or Multiple Privileges for a given Entity as shown below. </td>
                </tr>
                <tr>
                  <td><table width="630" border="0" align="center" cellpadding="0" cellspacing="0" class="formLayout">
                      <tr >
                        <td colspan="2" class="tblRowHead"></td>
                      </tr>
                      <form name="frmRoleSelectEntPriv" id="frmRoleSelectEntPriv">
                        <input type="hidden" name="roleProcess" value="" />
                        <tr>
                          <td width="111" height="35" valign="middle" class="tableLeft">&nbsp;Select an Entity :</td>
                          <td width="519" valign="middle" class="tableRight"><span class="alignLeft">
                            <select name="entityId" id="entityId" class="selectboxOne" onchange="postData();">
                              <option selected="selected" value="">Select One</option>
                              <%
									ArrayList arrayEntityList = (ArrayList)request.getAttribute("enityDetails");
									if(arrayEntityList!=null && arrayEntityList.size()!=0){
										Iterator itEntList = arrayEntityList.iterator();
										while(itEntList.hasNext()){
											String[] entList = (String [])itEntList.next();
											//String[] entList = {entityId, entityName};
											String entId = entList[0];
											String entityName = entList[1];
											if(entityId.equals(entId)){
											%>
                              <option value="<%=entId%>" selected="selected"><%=entityName%></option>
                              <%
											 }
											 
											 else{
											 %>
                              <option value="<%=entId%>"><%=entityName%></option>
                              <%
											 }
										}
									}
							%>
                            </select>
                          </span></td>
                        </tr>
                      </form>
                    <form name="frmRoleEntPriv" id="frmRoleEntPriv" method="post" action="roles.html" onsubmit="return entPrivValidate();">
                        <input type="hidden" name="roleProcess" value="mappingEntPriv" />
                        <input type="hidden" name="privilegeIds" value="" />
                        <input type="hidden" name="entityId" value="<%=entityId%>" />
                        <tr>
                          <td height="25" colspan="2"class="tableLeftTxtArea"><strong> &nbsp;Available Privileges:</strong></td>
                        </tr>
                        <tr style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#FFFFFF">
                          <td height="22" colspan="2"class="tableLeftTxtArea">&nbsp;
                            <input  type="checkbox" name="chkAll" value="ChkAll" alt="Select or Deselect All" onclick="checkAll();">
                          Select All </td>
                        </tr>
                        <%
									ArrayList arrayPrivList = (ArrayList)request.getAttribute("privillegeDetails");
									if(arrayPrivList!=null && arrayPrivList.size()!=0){
										Iterator itPrivList = arrayPrivList.iterator();
										while(itPrivList.hasNext()){
											String[] priList = (String [])itPrivList.next(); //{privilegeId, privilegeName, privilegePath};
											String privilegeId = priList[0];
											String privilegeName = priList[1];
											boolean privIdStatus = false;
											ArrayList arrayMapEntPrivList = (ArrayList)request.getAttribute("mapDetails");
											if(arrayMapEntPrivList!=null && arrayMapEntPrivList.size()!=0){
												Iterator itEntPrivList = arrayMapEntPrivList.iterator();
												while(itEntPrivList.hasNext()){
													String[] mapPriList = (String [])itEntPrivList.next(); //{privilegeId, privilegeName, privilegePath};
													String privId = mapPriList[2];
													if(privilegeId.equals(privId)){
														privIdStatus = true;
														break;
													}
													//{mapPrivilegeId, entityIdVal, privilegeId, entityName, privilegeName};
												}
											}
											if(privIdStatus==true){
											%>
                        <tr style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#FFFFFF">
                          <td height="22" colspan="2" valign="middle" class="tableLeftTxtArea">&nbsp;
                            <input type="checkbox" name="checkbox5" value="<%=privilegeId%>" checked="checked" />
                          <%=privilegeName%> </td>
                        </tr>
                        <%
											 }
											 else{
											 %>
                        <tr style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#FFFFFF">
                          <td colspan="2" class="tableLeftTxtArea">&nbsp;
                            <input type="checkbox" name="checkbox5" value="<%=privilegeId%>" />
                          <%=privilegeName%> </td>
                        </tr>
                        <%
											 }
										}
									}
							%>
                        <tr>
                          <td height="24" colspan="2" align="center" valign="middle" class="alignCenter"><label><img src="images/submit-icon.png" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="submit" type="submit" value="Submit" class="button-add"/></label>&emsp;&emsp;
                          <label><img src="images/clear-icon.png" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="button" type="button" class="button-add" value="Clear" onclick = "clearField(this.form)"/></label></td>
                        </tr>
                        <tr>
                          
                        </tr>
                      </form>
                  </table></td>
                </tr>
              </table>
            <!-- CONTENTS END HERE -->          </td>
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
