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
<%@ page import = "java.math.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
   <script src="javascripts/validate.js" type="text/javascript" ></script>

        <script language="javascript">
            function postData(tableID){
                var table = document.getElementById(tableID);
                var rowCount = table.rows.length;

                for(var i=3; i<rowCount; i++) {
                    var row = table.rows[i];
                    var chkbox = row.cells[0].childNodes[0];
                    // var strmembershipId=new Array();
                    //  var i=0;
                    if(null != chkbox && true == chkbox.checked)
                    {
                        var memID=chkbox.value;
                        strURL = "./memberMaster.html?memProcess=memTyDelete";
                        window.location.href = strURL;

                    }
                }
            }

            function valid2() {
                var chkCnt=0;
                var vFlag = 0;
                var cannotDelete=0;
                var canDeleted = 0;
                var chkBoxCnt = document.viewEdit.select11.length;
                if(chkBoxCnt!='undefined' && chkBoxCnt > 1)
                {
                    for(var i=0;i<chkBoxCnt;i++)
                    {
                        if(document.viewEdit.select11[i].checked==true)
                        {
                            if(document.viewEdit.candelete[i].value=='No')
                            {
                                cannotDelete++;
                                document.viewEdit.select11[i].checked = false;
								//For Debug Starts
                                document.viewEdit.selectHead.checked = false;
                                //For Debug Ends
                            }

                            if(document.viewEdit.candelete[i].value=='Yes')
                            {
                                canDeleted++;
                            }
                        }

                        if(cannotDelete > 0 && canDeleted > 0)
                        {
                            vFlag = 1;
                        }
                        else if(cannotDelete > 0 && canDeleted == 0)
                        {
                            vFlag = 2;
                        }
                        else if(cannotDelete == 0 && canDeleted == 0)
                        {
                            vFlag = 3;
                        }
                        else if(cannotDelete == 0 && canDeleted > 0)
                        {
                            vFlag = 4;

                        }
                    }
                }
                else
                {
                    if(document.viewEdit.select11.checked==true)
                    {
                        if(document.viewEdit.candelete.value=='No')
                        {
                            cannotDelete++;
                            document.viewEdit.select11.checked = false;
						//For Debug Starts
                                document.viewEdit.selectHead.checked = false;
                                //For Debug Ends
                        }

                        if(document.viewEdit.candelete.value=='Yes')
                        {
                            canDeleted++;
                        }
                    }

                    if(cannotDelete > 0 && canDeleted == 0)
                    {
                        vFlag = 2;
                    }
                    else if(cannotDelete == 0 && canDeleted == 0)
                    {
                        vFlag = 3;
                    }
                    else if(cannotDelete == 0 && canDeleted > 0)
                    {
                        vFlag = 4;

                    }

                }

                if(vFlag == 1)
                {
                    confirm("Only checked records will be deleted, Click the Delete button again");
                    return false;
                }

                if(vFlag == 2)
                {
                    alert("Checked records cannot be deleted as it is being referred or mapped.");
                    return false;
                }

                if(vFlag == 3)
                {
                    alert("Please select the record(s) to be deleted");
                    return false;
                }

                if(vFlag == 4)
                {
                    if(confirm("Only the checked records will be deleted. \nAre you sure you want to delete these records?"))
                    {
                        document.viewEdit.memProcess.value = 'memTyDelete';
                        document.viewEdit.submit();
                    }
                }
            }

            function edit()
            {
                var memId;
                var chkCnt=0;
                var vFlag = false;
                var select11=document.getElementById('select11');
                if(select11==null)
                {
                    alert("No Records Found");
                    return;
                }
                var chkBoxCnt =document.viewEdit.select11.length;
                if(chkBoxCnt!=undefined && chkBoxCnt!='undefined')
                {
                    for(var i=0;i<chkBoxCnt;i++)
                    {
                        if(document.viewEdit.select11[i].checked==true)
                        {
                            document.viewEdit.memId.value = document.viewEdit.select11[i].value;
                            chkCnt++;
                        }
                    }
                }
                else
                {
                    if(document.viewEdit.select11.checked==true)
                    {
                        document.viewEdit.memId.value = document.viewEdit.select11.value;
                        chkCnt++;
                    }
                }
				 //Starts for checkbox
                if(chkCnt>1)
                {
                    for(var j=0;j<chkBoxCnt;j++)
                    {
                        vFlag = true;
                        document.viewEdit.selectHead.checked = false;
                        document.viewEdit.select11[j].checked = false;
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
                document.viewEdit.memProcess.value='initEdit';
                document.viewEdit.submit();
            }

            function checkAll(checkbox1)
            {
                var i,len = document.viewEdit.select11.length;

                if (checkbox1.checked)
                {
                    for(i=0;i<len;i++)
                    {
                        document.viewEdit.select11[i].checked=true;
                    }
                }
                else
                {
                    for(i=0;i<len;i++)
                    {
                        document.viewEdit.select11[i].checked=false;
                    }

                }
            }

            function onChangeCheck()
            {
                if(document.viewEdit.selectHead.checked)
                {
                    document.viewEdit.selectHead.checked=false;
                }
            }

            function onsubmitvalidate()
            {
                if(gtAct=='Delete')
                {
                    return valid2();
                }
                else
                {
                    return true;
                }
            }
        </script>

        <!--SCRIPTING BLOCK STARTS HERE -->
        <%

                    String uTypeId = (String) request.getAttribute("uTypeId");
                    if (uTypeId == null || uTypeId.trim().length() == 0) {
                        uTypeId = "";
                    }
        %>


        <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
    </head>
    <% String membTxt = (String) request.getAttribute("membTxt");
                boolean flag = true;
                if (membTxt == null) {
                    membTxt = (String) session.getAttribute("membTxt");
                    flag = false;
                }
    %>
<body>

<header id="header">
<%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</header>
  <table width=100% border="1" cellpadding="0" cellspacing="0" class="content_new" align="center"  height="350">



        <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>

    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
	   <br />
	    <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" style="border:groove;border-width:thin">
          
            <tr>
                <td class="tableCommonBg">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="centerTab" >
                        <tr>
                            <td width="100%" class="subDeptTablePad">
                                <!-- CONTENTS START HERE -->
                                <table border="1" cellpadding="0" cellspacing="0" class="tblInnerContainer" >
                                    <tr style="border-bottom-style:groove;border-bottom-width:thin;">
                                        <td colspan="6" class="tblMainHead"><strong>
	                           Membership Types Human:<span class="styleBoldTwo"> Listings</span></strong></td>
                                    </tr>
                                    <tr style="border-bottom-style:groove;border-bottom-width:thin;">
                                        <td  class="tblDescrp">
                                        <table>
                                        <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <label>You are viewing the list of Membership Types - Human created by you.To create a Membership Type - Human click <strong>Add</strong> button.To edit a Membership Type - Human select the checkbox before each record and then click on the <strong>Edit</strong> button.To delete Membership Types - Human select the checkbox(s) before each record and then click on the <strong>Delete</strong> button.</label></td>
                                            <td>&nbsp;</td>
                                            </tr></table></td>
                                        
                                    </tr>
                                    <form name="viewEdit" action="./memberMaster.html" method="post" onsubmit="return onsubmitvalidate();" >
                                        <input type="hidden" name="memProcess" value="Listing"/>
                                        <input type="hidden" name="memId" />
                                        <input type="hidden" name="index1" value=""/>
                                        <tr>
                                            <td>
                                                <table border="0" cellpadding="0" align="center" cellspacing="0"  width="100%" >
                                                    <tr align="center">
                                                        <td height="23" colspan="7" align = "center" valign="middle" style="text-align:center"><div style="vertical-align:middle">
                                                          <label>
                                                            <img src="images/add-icon-button.jpg" alt="" width="20px" height="20px" style="cursor:pointer"/>
                                                            <input type="submit" name="btnsubmit" value="Add" class="button-add" onclick="gtAct=this.value;"/>
                                                            </label>
                                                          <label>
                                                            <img src="images/edit-icon-button.png" alt="" width="20px" height="20px" style="cursor:pointer"/>
                                                            <input name="btnEdit" value="Edit" type="button" class="button-add" onclick="edit();" />
                                                            </label>
                                                          <label>
                                                            <img src="images/delete-icon-button.png" alt="" width="20px" height="20px" style="cursor:pointer"/>
                                                            <input name="btnsubmit" value="Delete" type="submit" class="button-add" onclick="gtAct=this.value;"/>
                                                            </label>
                                                        </div></td>
                                                    </tr>
                                                </table>
                                            </td>
                                      <tr>
                                                <td>
                                                  <table border="0"  id="dataTable" cellpadding="0"  align="center" cellspacing="1" width="100%" style='table-layout:fixed'>
                                                        <tr style="border-bottom-style:groove;border-bottom-width:thin;border-top-style:groove;border-top-width:thin">
                                                            <td width="39" align="left" valign="middle" class="tblRowHeadTwo"><input type="checkbox" name="selectHead" id="selectHead"  value="membershipTypeId" onclick="checkAll(this);"/></td>
                                                            <td width="298" height="27" align="left" valign="middle" class="tblRowHeadTwo"><strong>Membership type</strong></td>
                                                            <td width="164" align="left" valign="middle" class="tblRowHeadTwo"><strong>Membership Cost $ </strong></td>
                                                            <td width="64"  align="left" valign="middle" class="tblRowHeadTwo"><strong>Duration</strong></td>
                                                            <td width="54" align="left" valign="middle" class="tblRowHeadTwo"><strong>Active</strong></td>
                                                            <td width="63" align="left" valign="middle" class="tblRowHeadTwo"><strong>InActive</strong></td>
                                                        </tr>

                                                        <%
                                                                    Vector memType = (Vector) session.getAttribute("displayMemDetails");
                                                                    if (memType != null && memType.size() != 0) {
                                                                        Enumeration memTypeEnum = memType.elements();
                                                                        int i = 0;
                                                                        while (memTypeEnum.hasMoreElements()) {
                                                                            i++;
                                                                            String memTypeDet[] = (String[]) memTypeEnum.nextElement();
                                                                            String candelete = memTypeDet[0];
                                                                            String membershipTypeId = memTypeDet[1];
                                                                            String membershipTypeName = memTypeDet[2];
                                                                            String membershipAmount = memTypeDet[3];
                                                                            //String periodValue = memTypeDet[3];
                                                                            String durationno = memTypeDet[4];
                                                                            String durationValue = memTypeDet[5];
                                                                            int active_status = Integer.parseInt(memTypeDet[6]);

                                                                            if (durationValue == null) {
                                                                                durationValue = "N/A";
                                                                            }

                                                                            //String memberTypeDet[] = {membershipTypeId,membershipTypeName, membershipAmount,mDate};
%>

                                                        <tr>
                                                            <td width="39" height="26" align="left" class="listCellBg" style="text-align:left;"><input type="checkbox" name="select11" id="select11"  value="<%=membershipTypeId%>" onclick="onChangeCheck();" /><input type="hidden" name="candelete" value="<%=candelete%>"/>                                                            </td>
                                                          <td width="298" height="26" align="left" class="listCellBg" style="text-align:left;word-wrap:break-word"><%=membershipTypeName%>                                                            </td>
                                                          <td width="164" height="26" align="left" class="listCellBg" style="text-align:left;word-wrap:break-word"><%=membershipAmount%><input type="hidden" name="index" value="<%=i%>"/>                                                            </td>
                                                          <td height="26" align="left" class="listCellBg" style="text-align:left;"><%=durationno%> &nbsp;<%=durationValue%> </td>
                                                          
                                                            <%

                                                                                                                                        if (active_status == 1) {
                                                            %>

                                                            <td align="left" class="listCellBg" style="text-align:left;" ><span class="listCellBg" style="text-align:left;">
                                                              <input type="radio" name=<%="rd" + i%> value="active" checked="true" disabled />
                                                            </span></td>
                                                          <td align="left" class="listCellBg" style="text-align:left;" ><input type="radio" name=<%="rd" + i%> value="inactive" disabled/></td>
                                                            <%
                                                                                                                                                                                                    } else {
                                                            %>
                                                            <td width="35" align="left" class="listCellBg" style="text-align:left;" ><input type="radio" name=<%="rd" + i%> value="active" disabled/></td>
                                                          <td width="36" align="left" class="listCellBg" style="text-align:left;" ><input type="radio" name=<%="rd" + i%> value="inactive" checked="true" readonly=true disabled /></td>
                                                            <% }%>
                                                      </tr>
                                                        <%

                                                        %>
                                                        <%
                                                                                                                                }
                                                                                                                            } else {
                                                        %>
                                                        <tr>
                                                            <td height="20" colspan="6"  class="listCellBg"><div class="alignCenter"><strong>No Records Found!</strong></div></td>
                                                        </tr>
                                                        <%                                               }
                                                        %>
                                                        
                                                    </table>                 
                                  </form>
                              </table>
                          </td>
                      </tr>
                  </table>
                                            <!-- CONTENTS END HERE -->
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
