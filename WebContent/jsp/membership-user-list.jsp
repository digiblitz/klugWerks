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
<%@ page import = "java.text.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/validate.js" type="text/javascript" ></script>
<script>

function getUserTypeName(selMemTypeId){
	strURL = "./UserRegList.html?selMemTypeId="+selMemTypeId+"&memProcess=uList";
	window.location.href = strURL;
//alert(selMemTypeId);
}

function postDataForPagination1() {
	var pn = document.frmMemberList.pn.value;
	strURL = "./UserRegList.html?&memProcess=uList&pn="+pn;
	window.location.href = strURL;
}
function postDataForPagination() {
	var pn = document.frmMemberList.pn.value;
	strURL = "./UserRegList.html?&memProcess=uList&pn="+pn;
	window.location.href = strURL;

	//var selMemTypeId = document.frmmemRegiList.selMemTypeId.value;
}
</script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>
<%!
				    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat sd1 = new SimpleDateFormat("MM-dd-yyyy");

					String dateFormat(String fieldName){
						Date clDate = null;
						Calendar cal = Calendar.getInstance();
						GregorianCalendar gc = new GregorianCalendar();
						try{
							clDate = sd.parse(fieldName);
						}catch(Exception e){
							System.out.println("Error While Parsing Date: "+e);
						}

						gc.setTime(clDate);
						cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
						String dispDate = "N/A";
						if(clDate!=null ){
						dispDate = sd1.format(cal.getTime());
						}
						return dispDate;
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
	   
	  <table width="800" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" style="border:groove;border-width:thin">
  <tr>
    <td class="tableCommonBg">

		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">

		  <tr>
			<td width="100%" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->

<table width="100%"  border="0"  align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer">
<%
String  userTypeId = (String)request.getAttribute("userTypeId");
if(userTypeId==null || userTypeId.equals("")){
	userTypeId="";
}
%>
  <tr style="border-bottom-style:groove;border-bottom-width:thin;">
    <td colspan="5" class="tblMainHead"><strong>
	Membership: <span class="styleBoldTwo">Registered User Listing </span></strong></td>
  </tr>
  <tr style="border-bottom-style:groove;border-bottom-width:thin;">
    <td colspan="5" class="tblDescrp">
		All Registered Users are listed as follows. <br />
		To delete a user, click on the <strong>'Delete'</strong> button beside it. To detele a record click on the <strong>'Delete'</strong> button.  </td>
  </tr>

 <tr>
 	<td align="center">


		 <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" class="formLayout">
		   <form name="frmMemberList" id="myform" method="post" action="./UserRegList.html">
				<input name="memProcess" type="hidden" value="uList"/>
		  <%--<tr>
			 <td colspan="5" class="tableSpan">

			 	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <th width="126" class="alignRight">User Type:</th>
					 <td width="366" colspan="4" class="alignLeft">&nbsp;
					 <%
						Vector memberTypeVect=new Vector();
						memberTypeVect=(Vector)request.getAttribute("userTypeVect");
						Enumeration enm=memberTypeVect.elements();
					 %>
						<select name="selMemTypeId" id="selMemTypeId" class="selectboxOne" onChange="getUserTypeName(this.value)">
					<option selected="selected">Select One</option>
					<%
					  while(enm.hasMoreElements()){
							String[] s = (String[])enm.nextElement();
							String memberTypeId = s[0];
							String membershipName = s[1];
							if(!membershipName.equalsIgnoreCase("Horse")){
								if(userTypeId.equalsIgnoreCase(memberTypeId)){
							%>
								 <option value="<%=memberTypeId%>" selected="selected"><%=membershipName%></option>
								 <%
								 }
								 else{
								 %>
								 <option value="<%=memberTypeId%>"><%=membershipName%></option>
								 <%
								 }
							}
						}
						%>
					  </select>
					 <span class="asterisk">*</span>
					 </td>
				</table>

			 </td>
		  </tr>--%>
		  	 <%
							int start = 1;
							int end = 1;
							int totalPage = 0;
							String rowCnt = (String)request.getAttribute("rCnt");
							String pageNo = (String) request.getAttribute("pNo");

							int rCnt = 0;
							int pNo = 0;
							if(rowCnt==null){
								rCnt = 0;
							}
							else{
								rCnt = Integer.parseInt(rowCnt);
								end = (rCnt/50);
								totalPage = (rCnt%50);
								if(totalPage>0){
									end = end  +1;
								}
							}

							if(pageNo==null){
								pNo = 1;
							}
							else{
								pNo = Integer.parseInt(pageNo);
							}
							if(rCnt!=0){
							%>
							<tr>
							<td  colspan="7" valign="middle"  bgcolor="#ffffff" class="alignRight">
							<span class="alignRight"><strong>View Page(s): </strong></span> &nbsp;
							<select name="pn" id="pn" class="selectboxOne" onchange="postDataForPagination();">
							<%
								for(int i = 1; i <=end; i++) {
									if(pNo==i){
									%>
										<option selected="selected" value="<%=i%>"><%=i%></option>
									<%
									}
									else{
									%>
										<option value="<%=i%>"><%=i%></option>
									<%
									}
								}
								%>
							  </select>
							  <strong> of <%=end%> </strong>							  </td>
						 </tr>
						   <%
						   }
						   %>
		  		  </form>
		  <tr>
			<td width="109" height="27" class="tblRowHeadTwo"><strong>Firstname</strong></td>
			<td width="107" class="tblRowHeadTwo"><strong>Lastname</strong></td>
			<td width="138" class="tblRowHeadTwo"><strong>Date Of Registration </strong></td>
			<td width="152" class="tblRowHeadTwo"><strong>Request Status </strong></td>
		<!--	<td width="63" class="tblRowHeadTwo">Delete</td>   -->
			<!--For Debug Starts-->
			<!--<td width="63" class="tblRowHeadTwo">Activate </td>-->
			<td width="144" class="tblRowHeadTwo"><strong>Activate/Deactivate </strong></td>
			<!--For Debug Ends-->
			<td width="129" class="tblRowHeadTwo"><strong>Assign Role </strong></td>
		   </tr>
		   <%
		   		//String str1[] = null;
					//Vector memberType=new Vector();
						String[] rdate=new String[5];

					 Vector memberType=(Vector)request.getAttribute("dispStr");
  					//  System.out.println("vector2:"+memberType);
					 if(memberType!=null && memberType.size()!=0){
					  Enumeration enm1=memberType.elements();

					  while(enm1.hasMoreElements()){
							String[] s = (String[])enm1.nextElement();
							String ss[] = (String[])memberType.elementAt(0);
							String firstName = s[1];
							String lastName = s[3];
							String regDate = s[4];
							String emailId = s[5];
							String loginName = s[11];
							String userID = s[6];
							String userTypeId1 = s[7];
							String requestStatus=s[12];
							//For Debug Starts
							String activeStatus=s[13];
							//For Debug Ends
							//out.println("firstName-->"+firstName+" requestStatus==>"+requestStatus);
							requestStatus=requestStatus==null?"false":requestStatus;
							if(requestStatus.equalsIgnoreCase("true"))
								 requestStatus="TRUE";
							else
								requestStatus=requestStatus.toUpperCase();
							if (firstName == null) { firstName = "";}
							if (lastName == null) {lastName = ""; }
							if(regDate!=null)
							{
								rdate=regDate.split(" ");
							}
							else
							{
								rdate[0]="N/A";
							}

//{prefix,firstName,middleName,lastName,registerDate,emailId,userID,UserTypeID,sufix,dob,gender};
		   %>


		    <form name="frmDisplay" method="post" action="./UserRegList.html">
			<input name="memProcess" type="hidden" value="updateStatus"/>


			 <input name="userId" type="hidden" value="<%=userID%>"/>
			 <input name="emailId" type="hidden" value="<%=emailId%>"/>




		    <tr>
			<td height="26"  class="alignCenter"><a href = "./ViewUserList.html?memProcess=viewMember&userId=<%=userID%>"><%=firstName%></a>			</td>
			<td  class="alignCenter"><%=lastName%></td>
			<td  class="alignCenter"><%=dateFormat(rdate[0])%></td>
		 <!--   <td bgcolor="#E3E1D2" class="alignCenter"><input type="button" name="Submit22" value="Delete" class="twoBtn" /></td> -->
		    <td class="alignCenter"><%=requestStatus%></td>
			<!--For Debug Starts-->
			<!--<td bgcolor="#E3E1D2" class="alignCenter"><input type="submit" name="Submit2" value="Deactivate" class="oneBtn" /></td>-->
            <td class="alignCenter" width="144">
			<%
			if(activeStatus.equals("1"))
  		    {
			%>
			
            <label>
            <img src="images/deactive-icon-button.png" alt="" width="20px" height="20px" style="cursor:pointer"/>
            <input type="button" name="Submit2" value="Deactivate" class="button-add" onclick="location.href='UserRegList.html?memProcess=updateStatus&userId=<%=userID%>&activeStatus=False';"/>
            </label>
            <%
			}
			else{
			%>
			<label>
            <img src="images/activate-icon-button.png" alt="" width="20px" height="20px" style="cursor:pointer"/>
            <input type="button" name="Submit2" value="Activate" class="button-add" onclick="location.href='UserRegList.html?memProcess=updateStatus&userId=<%=userID%>&activeStatus=True';"/>
            </label>
           
            <%
			}
			%>
             </td>
			<!--For Debug Ends-->
						<td width="129" class="alignCenter">
                                                     <%
												if(requestStatus.equalsIgnoreCase("true")) { %>
                                                <label>
                                                <img src="images/pending-icon-button.png" alt="" width="20px" height="20px" style="cursor:pointer"/>
						<input type="button"  value="Pending" class="button-add" onclick="location.href='roles.html?roleProcess=initUserRole&userId=<%=userID%>';" />
                        </label>
                                                     <% } else { %>
                                                     <label>
            <img src="images/asign-icon-button.png" alt="" width="20px" height="20px" style="cursor:pointer"/><input type="button"  value="Assign" class="button-add"  />
            </label>
                                                     <% } %>						</td>
		   </tr>



		   <%		}
						}else {
					%>
					<tr>
					  <th height="25" colspan="6"><center>There are no records available.</center> </th>
					</tr>
					<%}
		if(rCnt!=0){
							%>
							<tr>
							<td  colspan="6"  bgcolor="#ffffff" class="alignRight">
							<span class="alignRight"><strong>View Page(s): </strong></span> &nbsp;
							<select name="pn" id="pn" class="selectboxOne" onchange="postDataForPagination1(this.value);">
							<%
								for(int i = 1; i <=end; i++) {
									if(pNo==i){
									%>
										<option selected="selected" value="<%=i%>"><%=i%></option>
									<%
									}
									else{
									%>
										<option value="<%=i%>"><%=i%></option>
									<%
									}
								}
								%>
							  </select>
							  <strong> of <%=end%> </strong>							  </td>
						 </tr>
						   <%
						   }
						   %>
					      </form>
		  <tr>
			<td height="19" colspan="6">&nbsp;</td>
           </tr>
	  </table>	</td>
</tr>
</table>
			<!-- CONTENTS END HERE -->			</td>
		  </tr>
	  </table>	</td>
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
