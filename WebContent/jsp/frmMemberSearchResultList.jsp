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
<%@ page import="com.hlcform.util.HLCUserSearchResultVO" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>

<script language="javascript">
function assignBtn(uId, login){
	strURL = "roles.html?roleProcess=initUserRole&userId="+uId+"&login_name="+login;
	window.location.href = strURL;
}
</script>
</head>


<body>

<header id="header">
<%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</header>
  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0" class="content_new" align="center">
        <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>

    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
	  
	   
	 
	  
	 
		
	  <table width="630" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab"  height="100" style="border:thin;border-style:groove;">
        <tr>
          <td width="887" valign="top" class="subDeptTablePad"><!-- CONTENTS START HERE -->
              <table  border="0" cellpadding="0" cellspacing="0"  align="center" class="tblInnerContainer" width="700">
                <tr >
                  <td colspan="5" class="tblMainHead"><img src="images/search-list-icon.png" alt="" width="20px" height="20px" /> <strong> Membership: <span class="styleBoldTwo">Search Result List</span> </strong> <div class="divider3"></div></td>
                </tr>
				
                <tr>
                  <td>
				  <table border="0" cellpadding="0" align="center" cellspacing="1" class="formLayout" width="100%">
                      <tr>
                        <td colspan="5"></td>
                      </tr>
                      <%
		String radName=(String)session.getAttribute("radMem");
		
		if(radName!=null && radName.equalsIgnoreCase("members")){
		
		%>
                      <tr style="border-bottom-style:groove;border-bottom-width:thin">
                        <td width="90" height="27" class="tblRowHeadTwo"><strong>Member ID </strong></td>
                        <td width="84" class="tblRowHeadTwo"><strong>Name</strong></td>
                        <td width="70" class="tblRowHeadTwo"><strong>State </strong></td>
                        <td width="92" class="tblRowHeadTwo"><strong>Member Type</strong></td>
                        <td width="99" class="tblRowHeadTwo"><strong>Status</strong></td>
                        <td width="119" class="tblRowHeadTwo"><strong>Role</strong></td>
                        <td colspan="2"class="tblRowHeadTwo"><strong>Login</strong></td>
                      </tr>
                      <%
						ArrayList  memberList = (ArrayList) request.getAttribute("memberDetails");
						
						if(memberList!=null && memberList.size()!=0){
							Iterator itUserList = memberList.iterator();
							while(itUserList.hasNext()){
								HLCUserSearchResultVO objUserSearch = (HLCUserSearchResultVO)itUserList.next();
								String firstName =  objUserSearch.getFirstName();
								String lastName = objUserSearch.getLastName();
								String loginName = objUserSearch.getLoginName();
								String Password = objUserSearch.getPassword();
								String memberId = objUserSearch.getMemberId();
								String emailId = objUserSearch.getEmailId();
								String userIdM = objUserSearch.getUserId();
								String state = objUserSearch.getState();
								String memberType = objUserSearch.getMembershipTypeName();
								String memberStatus = objUserSearch.getStatusName();
								//out.println("Login Name:" + loginName);
								String lastFirstName = firstName+", "+lastName;
							
								if(loginName==null || loginName.trim().length()==0)  loginName = "N/A";
								if(memberId==null || memberId.trim().length()==0)  memberId = "N/A";
								if(memberType==null || memberType.trim().length()==0)  memberType = "N/A";
								else {
								        String memtyp[] = memberType.split(" ");
										memberType = memtyp[0];
								}
								if(memberStatus==null || memberStatus.trim().length()==0)  memberStatus = "N/A";
						%>
                      <form action="SearchList.html" method="post" name="viewHrsServiceList" id="viewHrsServiceList" >
                     
                    <input type="hidden" name="searchProcess" value="loginProcess" />
                      <input type="hidden" name="userId" value="<%=userIdM%>"/>
                      <input type="hidden" name="memberId" value="<%=memberId%>"/>
                      <tr>
                       <td height="26" class="alignCenter">
                        <% if (memberId.equals("N/A")) {%>
                       <a href="meeting.do?meeProcess=userDetailsViewLogin&amp;uid=<%=userIdM%>"><%=memberId%></a>
                        <% } else { %>
                        <a href="MembershipReg.do?process=familyView&amp;status=approve&amp;memberId=<%=memberId%>&amp;userId=<%=userIdM%>"><%=memberId%> </a>
                        <% }%>
                        </td>
                        <td height="26" class="alignLeft"><%=lastFirstName%></td>
                        <th height="26" class="alignCenter"><%=state%></th>
                        <td class="alignCenter"><%=memberType%></td>
                        <td class="alignCenter"><%=memberStatus%></td>
                        <td width="119"  class="alignCenter">
                        <label>
                        <img src="images/asign-icon-button.png" alt="" width="20px" height="20px" style="cursor:pointer"/>
                        <input name="button" type="button" class="button-add" onclick="assignBtn('<%=userIdM%>')"  value="Assign" />
                        </label>                        </td>
                        <td width="138" class="alignCenter">
                        <label>
                        <img src="images/signIn_icon.jpg" alt="" width="20px" height="20px"/>
                        <input type="submit" name="Submit5" value="SignIn" class="button-add" />
                        </label></td>
                      </tr>
                      <tr>
                      </form>
                        <td></td>
                      </tr>
                      <%
						}
				   }
					else{
				   %>
                      <tr>
                        <td height="26" colspan="8" align="center" class="alignCenter"><strong>No Records were Found !</strong></td>
                      </tr>
                      <%
				   }
				   %>
                      <%}else if(radName!=null && radName.equalsIgnoreCase("nonMembers")){%>
                      <tr style="border-bottom-style:groove;border-bottom-width:thin">
                        <td colspan="2" class="tblRowHeadTwo"><strong>Name</strong></div></td>
                        <td colspan="2" class="tblRowHeadTwo"><strong>State </strong></div></td>
                        <td colspan="2" class="tblRowHeadTwo"><strong>Role</strong></div></td>
                        <td colspan="2" class="tblRowHeadTwo"><strong>Login</strong></div></td>
                      </tr>
                      <%
				
				
						ArrayList  NonMemberList = (ArrayList) request.getAttribute("memberDetails");
						
						if(NonMemberList!=null && NonMemberList.size()!=0){
							Iterator itDUserList = NonMemberList.iterator();
							while(itDUserList.hasNext()){
								HLCUserSearchResultVO objNUserSearch = (HLCUserSearchResultVO)itDUserList.next();
								String firstNameN =  objNUserSearch.getFirstName();
								String lastNameN = objNUserSearch.getLastName();
								String loginNameN = objNUserSearch.getLoginName();			System.out.println(" User login name : "+loginNameN);
								String PasswordN = objNUserSearch.getPassword();
								String userIdN = objNUserSearch.getUserId();
								String emailIdN = objNUserSearch.getEmailId();
								String stateN = objNUserSearch.getState();
								
								String lastFirstNameN = firstNameN+", "+lastNameN;
						
															
						%>
                      <form action="SearchList.html" method="post" name="viewHrsServiceList" id="viewHrsServiceList" >
                     
                    <input type="hidden" name="searchProcess" value="loginProcess" />
                      <input type="hidden" name="userId" value="<%=userIdN%>"/>
                      <tr>
                        <td height="26" class="alignLeft"colspan="2"><a href="meeting.do?meeProcess=userDetailsViewLogin&amp;uid=<%=userIdN%>"><%=lastFirstNameN%></a></td>
                        <th height="26" colspan="2" align="left" class="alignCenter"><%=stateN%></th>
                        <td class="alignCenter" colspan="2">
                        <label>
                        <img src="images/asign-icon-button.png" alt="" width="20px" height="20px" style="cursor:pointer"/>
                        <input name="button" type="button" class="button-add" onclick="assignBtn('<%=userIdN%>','<%=loginNameN%>')"  value="Assign" />
                        </label></td>
                        <td class="alignCenter" colspan="2">
                        <label>
                        <img src="images/signIn_icon.jpg" alt="" width="20px" height="20px"/>
                        <input type="submit" name="Submit5" value="SignIn" class="button-add" />
                        </label>
                        </td>
                      </tr>
                      <tr>
                        <td></td>
                      </tr>
                      <%
						}
				   }
					else{
				   %>
                      <tr>
                        <td height="26" colspan="8" align="center" class="alignCenter"><strong>No Records were Found !</strong></td>
                      </tr>
                      <%
				   }
				   %>
                      <%}%>
					 
					  
                      <tr>
                        <td height="19" colspan="8" align="center">
						<label><img src="images/search-icon-button.png" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="submit" type="button" class="button-add" onclick="javascript:location.href='SearchList.html?searchProcess=initViewDet'" value="Search Again" align="middle" /></label>
                            &emsp;&emsp;
						<label><img src="images/add-new-user-icon.png" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="submit" type="submit" class="button-add" onclick="window.open('EditUserReg.do?status=searchSignup','mywindow',
			'width=1100,height=700,toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes,scrollbars=yes,copyhistory=yes,resizable=yes')" value="Add New User" align="alignLeft" /></label></td>
                      </tr></form>
                  </table></td>
                </tr>
                <!--end of the file-->
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
