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
<%@ page import="java.util.*" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<!--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
<script language="javascript">
 function addRow()
{
	strURL = "./roles.html?roleProcess=initCreateRole";
	window.location.href = strURL;
}

function editRow(tableID)
{
	var roleId;
	var chkCnt=0;
	var vFlag = false;
	var chkBoxCnt = document.frmRoleMgtListRole.chk.length;

    if(chkBoxCnt!=undefined && chkBoxCnt!='undefined' && chkBoxCnt > 1)
	{
		for(var i=0;i<chkBoxCnt;i++)
		{
			if(document.frmRoleMgtListRole.chk[i].checked==true)
			{
				   roleId = document.frmRoleMgtListRole.chk[i].value;
				   chkCnt++;
			}

		}
	}
	else
	{
			if(document.frmRoleMgtListRole.chk.checked==true)
			{
				   roleId = document.frmRoleMgtListRole.chk.value;
				   chkCnt++;
			}

	}
//Starts for checkbox
                if(chkCnt>1)
                {
                    for(var j=0;j<chkBoxCnt;j++)
                    {
                        vFlag = true;
                        document.frmRoleMgtListRole.chk[j].checked = false;
                        document.frmRoleMgtListRole.chkAll.checked = false;
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

                strURL = "./roles.html?roleId="+roleId+"&roleProcess=initeditRole&Submit2=Edit";
		window.location.href = strURL;
}
    function deleteRow(tableID) {

	var roleId;
	var chkCnt=0;
	var vFlag = 0;
	var cannotDelete=0;
	var canDelete = 0;
	var chkBoxCnt = document.frmRoleMgtListRole.chk.length;
	if(chkBoxCnt!=undefined && chkBoxCnt!='undefined' && chkBoxCnt > 1)
	{
		for(var i=0;i<chkBoxCnt;i++)
		{
			if(document.frmRoleMgtListRole.chk[i].checked==true)
			{
				   if(document.frmRoleMgtListRole.flag[i].value==0)
				   {
					cannotDelete++;
					document.frmRoleMgtListRole.chk[i].checked = false;
                                         //For Debug Starts
                                document.frmRoleMgtListRole.chkAll.checked = false;
                                //For Debug Ends
				   }

				   if(document.frmRoleMgtListRole.flag[i].value==1)
				   {
					canDelete++;
				   }
			}

			if(cannotDelete > 0 && canDelete > 0)
			{
							vFlag = 1;
			}
			else if(cannotDelete > 0 && canDelete == 0)
			{
							vFlag = 2;
			}
			else if(cannotDelete == 0 && canDelete == 0)
			{
							vFlag = 3;
			}
			else if(cannotDelete == 0 && canDelete > 0)
			{
							vFlag = 4;

			}
		}
	}
	else
	{
			if(document.frmRoleMgtListRole.chk.checked==true)
			{
				   if(document.frmRoleMgtListRole.flag.value==0)
				   {
					cannotDelete++;
					document.frmRoleMgtListRole.chk.checked = false;
                                          //For Debug Starts
                                document.frmRoleMgtListRole.chkAll.checked = false;
                                //For Debug Ends
				   }

				   if(document.frmRoleMgtListRole.flag.value==1)
				   {
					canDelete++;
				   }
			}

			if(cannotDelete > 0 && canDelete == 0)
			{
							vFlag = 2;
			}
			else if(cannotDelete == 0 && canDelete == 0)
			{
							vFlag = 3;
			}
			else if(cannotDelete == 0 && canDelete > 0)
			{
							vFlag = 4;

			}

	}

	if(vFlag == 1)
	{
		confirm("Only the checked records will be deleted. Click the Delete button again");
	}

	if(vFlag == 2)
	{
	   alert("Checked records cannot be deleted as it is being referred or mapped.");
	}

	if(vFlag == 3)
	{
		alert("Please check the record(s) to be deleted");
	}

	if(vFlag == 4)
	{
		if(confirm("Only the checked records will be deleted. \nAre you sure you want to delete these records?"))
		{
			 document.frmRoleMgtListRole.roleProcess.value = 'deleteRole';
			 document.frmRoleMgtListRole.submit();
		}
	}

}

/*function multiChkBoxValidation(tableID)
{
            var table = document.getElementById(tableID);
            var rowCount = table.rows.length;
            var chkCnt = 0;

            for(var i=0; i<rowCount; i++) {
                var row = table.rows[i];
                var chkbox = row.cells[0].childNodes[0];
                var rolename = row.cells[1].childNodes[0];
                var roledesc = row.cells[2].childNodes[0];
                var activeradio = row.cells[3].childNodes[0];
                var inactiveradio = row.cells[4].childNodes[0];

                if(null != chkbox && true == chkbox.checked)
                {

					if(document.frmRoleMgtListRole.chk.checked==true)
					{
						alert("First enter the details for new Role and click Save button");
						chkbox.checked = false;
						return;

					}

                }
				else{

						rolename.disabled =true;
						roledesc.disabled =true;
						activeradio.disabled=true;
						inactiveradio.disabled =true;

				}


            }
}*/

function checkAll()
{

		var chkBoxCnt = document.frmRoleMgtListRole.chk.length;
		if(chkBoxCnt!=undefined && chkBoxCnt!='undefined' && chkBoxCnt > 1)
		{
			for(var i=0;i<chkBoxCnt;i++)
			{
				 if(document.frmRoleMgtListRole.chkAll.checked==true)
				 {
					 document.frmRoleMgtListRole.chk[i].checked = true;
				 }
				 else
				 {
					document.frmRoleMgtListRole.chk[i].checked = false;
				 }
			}
		}
		else
		{
				 if(document.frmRoleMgtListRole.chkAll.checked==true)
				 {
					 document.frmRoleMgtListRole.chk.checked = true;
				 }
				 else
				 {
					document.frmRoleMgtListRole.chk.checked = false;
				 }

		}



}

    </script>
<!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
<title>Klugwerks</title>
</head>

<body>
<header id="header">
  <%@ include file = "../../include/HeaderProcess.jsp" %>
</header>
  <table width="100%" height="350" border="1" cellpadding="0" cellspacing="0"  class="content_new" align="center">
    <tr><td><%@ include file = "../../include/infobar.jsp" %><br /></td></tr>

	<tr>
      
      <td  align="center" valign="middle" class="tableCommonBg" >
	  
	   <table width="751" height="267" style="border:thin;border-style:groove;">
	   	<tr>
			<td>
	  
	  <table width="750" height="266" border="0"  align="center" cellpadding="0" cellspacing="0" class="formLayout" >
        <tr>
          <td height="19" colspan="5" align="left" valign="middle" class="tblMainHead" ><img src="images/list-icon1.jpg" alt="" width="20px" height="20px" /><strong> &nbsp;Maintain Roles:<span class="styleBoldTwo">Listings </span></strong><div class="divider3"></div></td>
        </tr>
        <!--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
        <tr>
          <td colspan="5" class="tblDescrp">&nbsp;You are viewing the list of Roles created by you.<br/>
            &nbsp;To create a Role click <strong>Add</strong> button.<br/>
            &nbsp;To edit a Role select the checkbox before each record and then click on the <strong>Edit</strong> button.<br/>
            &nbsp;To delete Roles select the checkbox(s) before each record and then click on the <strong>Delete</strong> button.</td>
        </tr>
        <tr height="20">
          <td height="33" align="center" valign="middle"><label><img src="images/add-icon-button.jpg" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="button" type="button" onclick="addRow()" value="Add" align="right" class="button-add" /></label>
            &emsp;
            <label><img src="images/edit-icon-button.png" alt="" width="18px" height="18px" style="cursor:pointer"/><input name="button2" type="button" class="button-add" onclick="editRow('dataTable')" value="Edit" align="right"/></label>
            &emsp;
            <label><img src="images/delete-icon-button.png" alt="" width="18px" height="18px" style="cursor:pointer"/><input type="submit" value="Delete" onclick="deleteRow('dataTable')" class="button-add" align="right" name="del"/></label>
          </td>
        </tr>
        <!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
        <tr>
          <!--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" class="formLayout">
              <tr>
                <td><table id="dataTable" width="100%" border="0" align="center" cellpadding="0" cellspacing="1" class="formLayout" style='table-layout:fixed'>
                    <!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                    <!--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                    <tr>
                      <td width="24" height="27" class="tblRowHead">&nbsp;</td>
                      <td colspan="2" class="tblRowHead">&nbsp;</td>
                    </tr>
                    <form name="frmRoleMgtListRole" id="frmRoleMgtListRole" action="roles.do" >
                      <input type="hidden" name="roleProcess" value="initeditRole" />
                      <tr >
                        <td width="24" class="tblRowHeadTwo" valign="middle"><div class="divider3"></div><input type="checkbox" name="chkAll" onclick = "checkAll()" /><div class="divider3"></div>                        </td>
                        <td width="258" height="27" align="left" valign="middle" class="tblRowHeadTwo"><div class="divider3"></div><strong>Role </strong><div class="divider3"></div></td>
                        <td width="271" height="27" valign="middle" class="tblRowHeadTwo"><div class="divider3"></div><strong>Description </strong><div class="divider3"></div></td>
                        <td width="20" height="27" valign="middle" class="tblRowHeadTwo"><div class="divider3"></div>
                          <strong>Active</strong><div class="divider3"></div></td>
                        <td width="20" height="27" valign="middle" class="tblRowHeadTwo"><div class="divider3"></div><strong>Inactive</strong>
                          <div class="divider3"></div></td>
                      </tr>
                      <!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                      <%
						 ArrayList roleList = (ArrayList) request.getAttribute("allRoleList");
          					 if(roleList!=null && roleList.size()!=0){
							Iterator it = roleList.iterator();
							while(it.hasNext()){
								String[] s = (String[])it.next();
								String roleId = s[0];
								String rolName = s[1];
							//Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011
                                                                String roledesc=s[2];
                                                                String status=s[3];
                                                                String flag=s[4];
                                                                int chkBoxIndex = 0;
							//End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011

		                %>
                      <input type="hidden" name="roleId" value="<%=roleId%>" />
                      <tr  style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#FFFFFF">
                        <!--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                        <!--%--<td height="26" class="listCellBg"></td>-->
                        <!--<td colspan="2" class="listCellBg"><input name="Submit2" type="submit" class="oneBtn" value="Edit" /></td>-->
                        <!--<td class="listCellBg"><input name="Submit2" type="submit" class="twoBtn" value="Deactivate" /></td> -->
                        <td valign="middle"  class="listCellBg"><input type="checkbox" name="chk" value ="<%=roleId%>" /></td>
                        <td height="26" valign="middle" class="listCellBg" style = "word-wrap: break-word;" ><%=rolName%></td>
                        <td height="26" valign="middle" class="listCellBg" style = "word-wrap: break-word;" ><%=roledesc%></td>
                        <%

                                                                        if(Integer.parseInt(status)==1)
                                                                        {																																															
																		
                                                                            %>
																			
                        <td  width="20" align="left" valign="middle" class="listCellBg" ><input type="radio" name="<%=roleId%>" value="1" checked="checked" disabled="disabled" /></td>
                        <td width="20" align="left" valign="middle" class="listCellBg" ><input type="radio" name="<%=roleId%>" value="0"  disabled="disabled" /></td>
                        <%
                                                                            }
                                                                else
                                                                    {
                                                                    %>
                        <td width="20" valign="middle" class="listCellBg"><input type="radio" name="<%=roleId%>" value="1"  disabled="disabled" /></td>
                        <td width="20" valign="middle" class="listCellBg" ><input type="radio" name="<%=roleId%>" value="0" checked="checked" disabled="disabled"></td>
                        <% } %>
                        <input type ="hidden" name ="flag" value ="<%=flag%>"/>
                        <!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
                      </tr>
                      <%
                                                //Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011
                                                chkBoxIndex++;
                                                //End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011
                                                        }
					 }
					  else {%>
                      <tr></tr>
                      <tr>
                        <td colspan="5" height="27" align="center" class="tblRowHeadTwo"> No Records are found</td>
                      </tr>
                      <% } %>
                    </form>
                </table></td>
              </tr>
              <!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
          </table></td>
        </tr>
      </table>
	  </td>
	  </tr>
	  </table>
	  </td>
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
