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
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
 <script src="javascripts/validate.js" type="text/javascript" ></script>
        <script src="javascripts/frmCreateMembType.js" type="text/javascript" ></script>
        <script language="javascript">
            /*function isnotInteger(str){
        stringIntCheck="0123456789";
        f2=1;
        for(j=0;j<str.length;j++)
        { if(stringIntCheck.indexOf(str.charAt(j))==-1)
         {f2=0;}}
        if(f2==0)
        {alert('Enter valid priority'); document.frmCreateMembType.periodValue.focus();  return false;} else {   return true;}
        }	*/

            function clearFields(obj){
				//document.frmCreateMembType.memName.value="";
                document.frmCreateMembType.memAmount.value="";
                document.frmCreateMembType.periodValue.value="";
                document.frmCreateMembType.DurationNoDdl.value="";
                document.getElementById('frmCreateMembType').status1.checked=false;
                document.getElementById('frmCreateMembType').status2.checked=false;
                document.frmCreateMembType.transacType.options.selectedIndex = 0;
				document.frmCreateMembType.DurationTypeDdl.options.selectedIndex= 0;
                /*var vOptionsLen = 0;
                if(document.frmCreateMembType.DurationTypeDdl.options[document.frmCreateMembType.DurationTypeDdl.selectedIndex].value!='')
                {
                    document.frmCreateMembType.DurationTypeDdl.options.length = document.frmCreateMembType.DurationTypeDdl.options.length+1;
                    document.frmCreateMembType.DurationTypeDdl.options[document.frmCreateMembType.DurationTypeDdl.options.length-1].value = "";
                    document.frmCreateMembType.DurationTypeDdl.options[document.frmCreateMembType.DurationTypeDdl.options.length-1].text = "Select One";
                    document.frmCreateMembType.DurationTypeDdl.selectedIndex = 	document.frmCreateMembType.DurationTypeDdl.options.length-1;
                }
                for(var i=0;i<(obj.DurationTypeDdl.options.length-1);i++)
                {
                    if(document.frmCreateMembType.DurationTypeDdl.options[i].value=='')
                    {
                        vOptionsLen++;
                        document.frmCreateMembType.DurationTypeDdl.options.length = document.frmCreateMembType.DurationTypeDdl.options.length - vOptionsLen;
                        document.frmCreateMembType.DurationTypeDdl.selectedIndex = 	document.frmCreateMembType.DurationTypeDdl.options.length-1;

                    }
                }*/
                return true;
            }

            function cancelEditMember(){
         if(confirm("Do you want to Cancel and go back to List Page?")){
                strURL = "./memberMaster.html?memProcess=initList";
                window.location.href = strURL;
                }
	  else
	    {
		return;
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
  <table width=100% border="1" cellpadding="0" cellspacing="0" class="content_new" align="center"  height="350">



        <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>

    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
	     <%!
            String nullCheck(String fieldName) {
                String retValue = "";
                if (fieldName != null && fieldName.trim().length() != 0) {
                    retValue = fieldName;
                }

                return retValue;

            }

        %>
	  <table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" style="border:groove;border-width:thin">
           
            <tr>
                <td class="tableCommonBg">
                    <table width="100%" border="0" ali="center" cellpadding="0" cellspacing="5" id="centerTab">
                        <tr>
                            
                            <td width="100%" class="subDeptTablePad">
                                <!-- CONTENTS START HERE -->
                                <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer">
                                    <tr style="border-bottom-style:groove;border-bottom-width:thin;">
                                        <td colspan="2" class="tblMainHead"><strong>
		&nbsp;Membership Types - Human: <span class="styleBoldTwo"> Edit</span>                                        </strong></td>
                                    </tr>
                                    <tr style="border-bottom-style:groove;border-bottom-width:thin;">
                                        <td colspan="2" class="tblDescrp">&nbsp;You can <strong>Edit/Update</strong> the <strong>Membership Type - Human</strong> created by you as given below. </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <form name="frmCreateMembType" id="frmCreateMembType" method="post" action="./memberMaster.html" onsubmit="return myvalidate();">
                                                <input type="hidden" name="memProcess" value="memTyEdit"/>
                                                <%
                                                           String membershipName = "";
                                                            String yr = (String) request.getAttribute("year");
                                                %>
                                                <input type="hidden" name="populYr" value="<%=yr%>" />
                                                <input type="hidden" name="memNme" value="" />
                                                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="formLayout">
                                                    <!--<tr>
                                                        <td colspan="2" class="tblRowHead">
						Edit Membership Type </td>
                                                    </tr>-->
                                                    <!--Debug Starts Here-->
                                                    <%
                                                                // String status = (String) request.getAttribute("status");
                                                                //   if (status != null) {
                                                                //     if (status.equalsIgnoreCase("false")) {
%>
                                                    <!-- <tr>
                                                         <td class="styleError" colspan="4">Membership Type already exists</td>
                                                     </tr>-->
                                                    <%		//}
                                                                //      }
%>
                                                    <!--Debug Ends Here-->
                                                    <tr>
                                                        <td colspan="2" class="tblDescrp">Fields marked with an asterisk (<span class="asterisk">*</span>) are required.</td>
                                                    </tr>
                                                    <%
                                                                String status = (String) request.getAttribute("status");
                                                                if (status != null) {
                                                                    if (status.equalsIgnoreCase("false")) {
                                                    %>
                                                    <tr>
                                                        <td class="styleError" colspan="4"><strong>Membership Type already exists</strong></td>
                                                    </tr>
                                                    <%		membershipName=(String)request.getAttribute("memName");
                                                                    }
                                                                }
                                                    %>

                                                    <%
                                                                String[] subType = (String[]) session.getAttribute("displayEditMemDetails");
                                                                String membershipTypeId = "";
                                                                String membershipTypeName = "";
                                                                String membershipAmount = "";
                                                                String userTypeId = "";
                                                                String periodValue = "";
                                                                String mDate = "";
                                                                String transacTypeId = "";
                                                                String DurationNo = "";
                                                                String DurationType = "";
                                                                int active_status = 0;
                                                                int membership_year = 0;

                                                                if (subType != null) {
                                                                    membershipTypeId = subType[0];
                                                                    membershipTypeName = subType[1];
                                                                    userTypeId = subType[2];
                                                                    membershipAmount = subType[3];
                                                                    mDate = subType[4];
                                                                    periodValue = subType[5];
                                                                    transacTypeId = subType[6];
                                                                    DurationNo = subType[7];
                                                                    DurationType = subType[8];
                                                                    active_status = Integer.parseInt(subType[9]);
                                                                    membership_year = Integer.parseInt(subType[10]);

                                                                    if (periodValue == null) {
                                                                        periodValue = "";
                                                                    }
                                                                }

                                                                String uTypeId = (String) request.getAttribute("uTypeId");
                                                    %>
                                                    <input type="hidden" id="memId" name="memId" value="<%=membershipTypeId%>"/>
                                                    <input type="hidden" id="memyear" name="memyear" value="<%=membership_year%>"/>
                                                    <tr>
                                                        <td width="216" height="23" class="tableLeft"><strong>Membership Type:</strong></td>
														<td height="23" class="tableRight">
														<% 
														System.out.print("Name" +membershipName);
														if(membershipName=="")
														{     %>
                                                      <input name="memName" id="memName" type="text" class="readOnly" maxlength="80" value="<%=membershipTypeName%>" readOnly="true"/> <!--<span class="asterisk">*</span>-->
														<%}
														else{
															%>
													 <input name="memName" id="memName" type="text" class="readOnly" maxlength="80" value="<%=membershipName%>" readOnly="true"/>
															 <% } %>
															  </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="23" class="tableLeft"><strong>Membership cost $: </strong></td>
                                                        <td height="23" class="tableRight"><input name="memAmount" id="memAmount" type="text" maxlength="16" value="<%=membershipAmount%>" class="textboxOne" />
                                                      <span class="asterisk">*</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="23" class="tableLeft"><strong>Duration: </strong></td>
                                                        <td height="23" class="tableRight">
                                                            <input type="text" value="<%=DurationNo%>" name="DurationNoDdl" id="DurationNoDdl" maxLength="3" class="textboxOne" style="width:30px;"/>

                                                            <select name="DurationTypeDdl" id="DurationTypeDdl" class="selectboxOne">
															<option selected="selected" value="">Select One</option>

                                                                <%
                                                                            if (DurationType.equals("year")) {
                                                                %>

                                                                <option selected="selected" value="year">Year</option>
                                                                <option value="month">Month</option>

                                                                <%                                                                                                                                                 } else {
                                                                %>
                                                                <option selected="selected" value="month">Month</option>
                                                                <option value="year">Year</option>
                                                                <%}%>

                                                            </select>  <span class="asterisk">*</span>
                                                      </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="23" class="tableLeft"><strong>Status: </strong></td>
														 <td width="367" height="23" class="tableRight" >
                                                        <%

                                                                    if (active_status == 1) {
                                                        %>
                                                       <input type="radio" name="rd1" id="status1" value="active" checked="true"  />Active
                                                      <input type="radio" name="rd1" id="status2"  value="inactive" />Inactive  <span class="asterisk">*</span>
                                                            <%                                                                    } else {
                                                            %>
                                                        <input type="radio" name="rd1" id="status1"  value="active" />Active
                                                      <input type="radio" name="rd1" id="status2"  value="inactive" checked="true"/>Inactive  <span class="asterisk">*</span>
                                                            <% }%>
															</td>
                                                    </tr>
                                                    <tr>
                                                        <td height="23" class="tableLeft"><strong>Membership Prority: </strong></td>
                                                        <td height="23" class="tableRight"><input style="width:30px;" name="periodValue" id="periodValue" type="text" maxLength="3"  value="<%=periodValue%>" class="textboxOne" />
                                                      <!--<span class="asterisk">*</span>--></td>
                                                    </tr>
                                                    <tr>
                                                        <td height="23" class="tableLeft"><strong>QB Transaction Type: </strong></td>
                                                        <td height="23" class="tableRight">
                                                            <select name="transacType" id="transacType" class="selectboxOne" >
                                                                <option selected="selected" value="Select One">Select One</option>
                                                                <%
                                                                            ArrayList accDetails = (ArrayList) request.getAttribute("accDetails");
                                                                            if (accDetails != null && accDetails.size() != 0) {
                                                                                Iterator itr = accDetails.iterator();
                                                                                while (itr.hasNext()) {
                                                                                    String txnDet[] = (String[]) itr.next();

                                                                                    String txnId = txnDet[0];
                                                                                    String txnName = txnDet[1];
                                                                                    if (transacTypeId != null) {
                                                                                        if (transacTypeId.equalsIgnoreCase(txnId)) {
                                                                %>
                                                                <option value="<%=txnId%>" selected="selected"><%=txnName%></option>
                                                                <%	} else {%>
                                                                <option value="<%=txnId%>"><%=txnName%></option>
                                                                <%	}
                                                                                                                                                    } else {%>
                                                                <option value="<%=txnId%>"><%=txnName%></option>
                                                                <%}
                                                                                }
                                                                            }
                                                                %>
                                                      </select><span class="asterisk">*</span></td>
                                                    </tr>
                                                    <input type="hidden" value="<%=membershipTypeId%>" name="memId" />
                                                    <tr>
                                                        <!--<td class="tableLeft">&nbsp;</td>-->
                                                        <td height="25" colspan = "2" valign="middle" style="text-align:center">
                                                            <label>
																<img src="images/update-icon-button.jpg" alt="" width="20px" height="20px" style="cursor:pointer"/>
																	<input name="Button" type="submit" class="button-add" value="Update"  />
														  </label>
															&nbsp;&nbsp;
															<label>
																<img src="images/clear-icon.png" alt="" width="20px" height="20px" style="cursor:pointer"/>
                                                            		<input name="Clear" type="button" class="button-add" value="Clear"  onClick = "clearFields(this.form)" />
															</label>
																	&nbsp;&nbsp;
															<label>
																<img src="images/cancel-icon-button.png" alt="" width="20px" height="20px" style="cursor:pointer"/>
                                                            		<input type="button" value="Cancel" class="button-add" onclick="cancelEditMember()"/>
															</label>
                                                      </td>
                                                    </tr>
                                              </table>
                                            </form>
                                      </td>
                                    </tr>
                                    
                              </table>
                                <!-- CONTENTS END HERE -->
                          </td>
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
