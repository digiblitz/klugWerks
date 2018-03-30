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
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.hlcmember.type.util.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script language="javascript">
function editBtn1(Id,fnme,lnme,mid){
	strURL = "./MemberRegiList.html?memRegiListProcess=adminTransDet&Id="+Id+"&fnme="+fnme+"&lnme="+lnme+"&mid="+mid;
	window.location.href = strURL;	
}
function assignBtn(uId){
	strURL = "./roles.html?roleProcess=initUserRole&userId="+uId;
	window.location.href = strURL;
}
function approveBtn1(usrtypname,memberId,uId){
	strURL = "./MemberRegiList.html?memRegiListProcess=memRegiListView&usrtypname="+usrtypname+"&memberId="+memberId+"&userId="+uId;
	window.location.href = strURL;	
}
function approveBtn(usrtypname,memid){
	strURL = "./MemberRegiList.html?memRegiListProcess=horseDet&usrtypname="+usrtypname+"&memid="+memid;
	window.location.href = strURL;
}
function postData(memTypId) {
	if(memTypId!="") {
		strURL = "./MemberRegiList.html?memRegiListProcess=memRegiListSubUserType&memTypId="+memTypId;
		window.location.href = strURL;	
	}
}


function postDataForPagination() {
	var memTypId = document.frmmemRegiList.userType_sel.value;
	var utyp=document.frmmemRegiList.usrtyp.value;
    var dispId=document.frmmemRegiList.memType_Sel.value;
	var stat = document.frmmemRegiList.statusId.value;
	var pn = document.frmmemRegiList.pn.value;
	var year = document.frmmemRegiList.year.value;

	strURL = "./MemberRegiList.html?memRegiListProcess=memRegiListMemberType&dispId="+dispId+"&memTypId="+memTypId+"&usrtyp=Human&status="+stat+"&pn="+pn+"&year="+year;
	window.location.href = strURL;
}

function postDataForPagination1() {
	var memTypId = document.frmmemRegiList.userType_sel.value;
	var utyp=document.frmmemRegiList.usrtyp.value;
    var dispId=document.frmmemRegiList.memType_Sel.value;
	var stat = document.frmmemRegiList.statusId.value;
	var pnVal = document.frmmemRegiList.pn1.value;
	document.frmmemRegiList.pn1.value = document.frmmemRegiList.pn.value;
	strURL = "./MemberRegiList.html?memRegiListProcess=memRegiListMemberType&dispId="+dispId + "&memTypId="+memTypId + "&usrtyp=Human&status="+stat+"&pn="+pnVal;
	window.location.href = strURL;	
}	
function getMemberTypes(){
 	var year =  document.frmmemRegiList.year.value;
	strURL ="./MemberRegiList.html?memRegiListProcess=getMemberTypes&year="+year;
	window.location.href = strURL;
}

function showData() {
	var memTypId = document.frmmemRegiList.userType_sel.value;
	var utyp=document.frmmemRegiList.usrtyp.value;
    var dispId=document.frmmemRegiList.memType_Sel.value;
	var stat1 = document.frmmemRegiList.statusId.value;
	var year =  document.frmmemRegiList.year.value;
	
	strURL = "./MemberRegiList.html?memRegiListProcess=memRegiListMemberType&dispId="+dispId+"&memTypId="+memTypId+"&usrtyp=Human&status="+stat1+"&year="+year;
	window.location.href = strURL;
}	


function showApprove(memberId) {
alert(memberId);
	if(memberId!="") {
			//alert(memTypId);
		strURL = "./MemberRegiList.html?memRegiListProcess=memRegiListView&memProcess="+memberId+"&memberId="+memberId;
		window.location.href = strURL;
	}
}

function getMemTyp(){
		/*var selObj = document.getElementById('userType_sel');
		var selIndex = selObj.selectedIndex;
		var selTxt = selObj.options[selIndex].text;*/
	var selTxt = document.getElementById('userType_sel');		
	var memObj = document.getElementById('memType_Sel');
	var memIndex = memObj.selectedIndex;
	var memtxt = memObj.options[memIndex].text;
		if(document.getElementById('memType_Sel').value=="" && document.getElementById('statusId').value==""){
			alert('Select Membership Type and Status first');
			document.getElementById('memType_Sel').options.selectedIndex=0;
			document.getElementById('memType_Sel').focus();
			return false;
		}
		else{
		if(document.getElementById('vectorSize').value!=0){
			if(document.getElementById('memType_Sel').selectedIndex==0)
			{
				alert('Select Membership Type first');
				document.getElementById('memType_Sel').options.selectedIndex=0;
				document.getElementById('memType_Sel').focus();
				return false;
			}
		}else{
				alert('No Membership Type is available for the Selected Year');
				document.getElementById('year').options.selectedIndex=0;
				document.getElementById('year').focus();
				return false;
		}
		
		if(document.getElementById('statusId').selectedIndex==0)
		{
			alert('Select Status Type first');
			document.getElementById('statusId').options.selectedIndex=0;
			document.getElementById('statusId').focus();
			return false;
		}
		
		//alert(document.frmmemRegiList.usrtyp.value);

		/*var selVal = selObj.options[selIndex].value;
		if (selTxt == "Junior Member" ){
			if(dobCnt > 18){
				alert("Sorry the age you have specified doesn't  match as required for a Junior Member");
				document.getElementById('memTyp_sel').value = 0;
			}
		}*/
		}
		
		showData();
		
	}

</script>
<style type="text/css">
<!--
.style1 {font-weight: bold}
-->
</style>
</head>
<%
//Henu..
SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
String memdispTypId =(String)request.getAttribute("memdispTypId");
String  memTypId = (String)request.getAttribute("memTypId");
if(memTypId==null || memTypId.equals("")){
memTypId="";
}
if(memdispTypId==null || memdispTypId.equals("")){
memdispTypId="";
}
%>

</head>


<body onload="searchSec()">

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
        
        <%!				SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat sd1 = new SimpleDateFormat("MM-dd-yyyy");
					
					String dateFormat(String fieldName){					
						java.util.Date clDate = null;
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
        <tr>
          <td class="tableCommonBg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
              <tr>
                
                <td width="100%" class="subDeptTablePad"><!-- CONTENTS START HERE -->
                    <table width="100%"  border="0"  align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer">
                      <tr style="border-bottom-style:groove;border-bottom-width:thin;">
                        <td colspan="5" class="tblMainHead"><strong> Membership: <span class="styleBoldTwo">Membership Registration Listing </span></strong></td>
                      </tr>
                      <tr style="border-bottom-style:groove;border-bottom-width:thin;">
                        <td colspan="5" class="tblDescrp"> The Human Members registered are listed as follows. </td>
                      </tr>
                      <tr>
                        <td align="center"><!--	action="/jsp/member/member-registration-approve.jsp" -->
                            <form name="frmmemRegiList" id="frmmemRegiList" >
                              <input name="memProcess" id="memProcess" type="hidden" value=""/>
                              <!-- henu -->
                              <input type="hidden" name="memRegiListProcess"/>
                              <input type="hidden" name="usrtyp" />
                              <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="formLayout">
                                <tr>
                                  <td colspan="7"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="100%" height="25" valign="middle" class="alignLeft" ><strong>Year:&nbsp;</strong>
                                            <select name="year" id="year" class="selectboxOne" onchange="getMemberTypes();">
                                              <% 
								  
								  String yearStr = (String) request.getAttribute("year");
								  //System.out.println(yearStr);
					   Calendar cal = Calendar.getInstance();
					   for (int i= 2007;i<=(cal.get(Calendar.YEAR)+1);i++){
					   if(yearStr != null && yearStr.equalsIgnoreCase(new Integer(i).toString())){
					   %>
                                              <option selected="selected" value="<%=i%>"><%=i%></option>
                                              <%}else{%>
                                              <option value="<%=i%>"><%=i%></option>
                                              <%}
					   }%>
                                            </select>
                                          &nbsp;&nbsp;&nbsp; <span> <strong>Membership Type:</strong> &nbsp;
                                            <select name="memType_Sel" id="memType_Sel" class="selectboxOne" style="width:120px;" >
                                              <option selected="selected">Select One</option>
                                              <% 
								//Henu..
						String str2[] = null;
						Vector memberTypeVect1=new Vector();
						memberTypeVect1=(Vector)session.getAttribute("userTypeVect1");
                                               //System.out.println("inside subtype ............. Size : " + memberTypeVect1.size());
					//	System.out.println("vector1:"+memberTypeVect1);
					  if(memberTypeVect1!=null && memberTypeVect1.size()!=0){  
						Enumeration enm1=memberTypeVect1.elements();
						  
						  while(enm1.hasMoreElements()){
								String[] s1 = (String[])enm1.nextElement();
								/*for (int j=0;j<s1.length; j++) {
									System.out.println("Content : "+s1[j]);
								}*/
								String memberTypeId = s1[0];
								String membershipName = s1[1];
								
							if(memberTypeId.equals(memdispTypId)){
							
							%>
                                              <option value="<%=memberTypeId%>" selected="selected"><%=membershipName%></option>
                                              <%}
							else{
							%>
                                              <option value="<%=memberTypeId%>"><%=membershipName%></option>
                                              <%		
							}
							}
							}%>
                                            </select>
                                            </span><strong>&nbsp;
                                              
                                              
                                              &nbsp;&nbsp;Status:&nbsp;</strong>
                                          <select name="statusId" id="statusId" class="selectboxOne" style="width:78px;" >
                                            <option selected="selected">Select One</option>
                                            <%
					  		String selStat=(String)request.getAttribute("status");
							String[] stat={"Pending","Active","Expired","Suspended","Inactive","Duplicate","Deceased","Merged"};
							
							for(int i=0;i<8;i++)
							{
							if(selStat!=null)
							{
							if(selStat.equalsIgnoreCase(stat[i]))
							{
							%>
                                            <option value="<%=stat[i]%>" selected="selected"><%=stat[i]%></option>
                                            <%}
							else
							{%>
                                            <option value="<%=stat[i]%>"><%=stat[i]%></option>
                                            <%}}
							else
							{%>
                                            <option value="<%=stat[i]%>"><%=stat[i]%></option>
                                            <%}}
						
						%>
                                          </select>
                                        &nbsp; </td>
                                      </tr>
                                      <input type="hidden" name="vectorSize"  id="vectorSize" value="<%=memberTypeVect1.size()%>"/>
                                      <tr>
                                        <td width="100%" height="28" align="center" valign="bottom" class="alignLeft">
                                        <label>
                                        <img src="images/list_icon.jpg" alt="" width="23px" height="23px"/>
                                        <input name="button" type="button" class="button-add" onclick="getMemTyp();" value="List" />
                                        </label></td>
                                      </tr>
                                      <tr>
                                        <% 
								//Henu..
						
						String uId="";
						String memberId="";
						String usrtypname=(String)request.getAttribute("usrtypname");
						String umemberTypeId="";
						
						String str1[] = null;
						Vector memberTypeVect=new Vector();
						memberTypeVect=(Vector)session.getAttribute("userTypeVect");
                        if(memberTypeVect!=null && memberTypeVect.size()!=0){                    
						
						
						
						Enumeration enm=memberTypeVect.elements();
						  
						  while(enm.hasMoreElements()){
								String[] s = (String[])enm.nextElement();
								
								if(!s[1].equalsIgnoreCase("Human")){
/*								for (int i=0;i<s.length; i++) {
									System.out.println("Content : "+s[i]);
								}
*/								 umemberTypeId= s[0];
								String umembershipName = s[1];
								if(umemberTypeId.equals(memTypId)){
							%>
                                        <%}
							else{
							%>
                                        <%		
							}
							}
							}}%>
                                        <input type="hidden" name="userType_sel" value="<%=umemberTypeId%>" />
                                        <td class="alignLeft">&nbsp;</td>
                                        <td class="alignCenter">&nbsp;</td>
                                        <td class="alignRight">&nbsp;</td>
                                      </tr>
                                  </table></td>
                                </tr>
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
								end = (rCnt/25);
								totalPage = (rCnt%25);
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
                                  <td  colspan="7"  bgcolor="#ffffff" class="alignRight"><strong>View Page(s): </strong> &nbsp;
                                      <select name="pn" id="pn" class="selectboxOne" onchange="getMemTyp();postDataForPagination();">
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
                                      <strong> of <%=end%> </strong> </td>
                                </tr>
                                <%
						   }
						if(usrtypname!=null){

						if(usrtypname.equalsIgnoreCase("Horse"))
						{


						%>
                                <tr>
                                  <td width="87" height="27" class="tblRowHeadTwo"><strong>Horse Member ID </strong></td>
                                  <td width="83" class="tblRowHeadTwo"><strong>Competition Name </strong></td>
                                  <td width="98" class="tblRowHeadTwo"><strong>Rider Member Id </strong></td>
                                  <td width="102" class="tblRowHeadTwo"><strong>Date of Membership </strong></td>
                                  <td width="94" class="tblRowHeadTwo"><strong>Status</strong></td>
                                  <td width="94" class="tblRowHeadTwo"><strong>Detail</strong></td>
                                </tr>
                                <%
							
							ArrayList horsedet=new ArrayList();
							horsedet=(ArrayList)request.getAttribute("horsedet");
							System.out.println(sdf.format(new java.util.Date()));
							if(horsedet!=null && horsedet.size()!=0)
							{
							for(int i=0;i<horsedet.size();i++)
							{
								HLCHorseListVO objHorseListVO = new HLCHorseListVO();
								objHorseListVO=(HLCHorseListVO)horsedet.get(i);
							%>
                                <tr>
                                  <td height="26"  class="alignCenter"></a> <%=objHorseListVO.getHorseMemberId()%></td>
                                  <td height="26"  class="alignCenter"><%=objHorseListVO.getCompetitionName()%></td>
                                  <td class="alignCenter"><%=objHorseListVO.getRiderMemberId()%></td>
                                  <td class="alignCenter"><%=sdf.format(objHorseListVO.getAddDate())%></td>
                                  <td class="alignCenter"><%=objHorseListVO.getStatusName()%></td>
                                  <td class="alignCenter">
                                  <label>
                                  <img src="images/approve-icon-button.png" alt="" width="20px" height="20px"/>
                                  <input name="button" type="button" class="button-add" onclick="approveBtn('<%=usrtypname%>','<%=objHorseListVO.getHorseMemberId()%>');"  value="Approve" />
                                  </label>
                                  </td>
                                </tr>
                                <%}}}

						else
						{%>
                                <tr>
                                  <td width="87" height="27" class="tblRowHeadTwo"><strong>Member ID </strong></td>
                                  <td width="83" class="tblRowHeadTwo"><strong>First Name </strong></td>
                                  <td width="98" class="tblRowHeadTwo"><strong>Last Name </strong></td>
                                  <td width="102" class="tblRowHeadTwo"><strong>Date of Membership </strong></td>
                                  <td width="94" class="tblRowHeadTwo"><strong>Approve</strong></td>
                                  <!--td width="94" class="tblRowHeadTwo">Role</td-->
                                  <td width="94" class="tblRowHeadTwo"><strong>Transaction Details </strong></td>
                                </tr>
                                <!--  -->
                                <%

	//Henu..
						String str3[] = null;
						Vector memberTypeVect2=new Vector();
						memberTypeVect2=(Vector)session.getAttribute("userTypeVect2");
                       //                         System.out.println("Vector1 ............. Size : " + memberTypeVect1.size());
					//	System.out.println("vector1:"+memberTypeVect1);
					  if(memberTypeVect2!=null && memberTypeVect2.size()!=0){  
						Enumeration enm2=memberTypeVect2.elements();
						  while(enm2.hasMoreElements()){

							String[] s2 = (String[])enm2.nextElement();
							String[] memdate=s2[0].split(" ");
							//String membershipTypeId = s2[1];
							memberId = s2[1];
							String firstName = s2[2];
							String lastName = s2[3];
							String statusName = s2[4];
							uId = s2[5];
							String payId = s2[6];
%>
                                <tr>
                                  <td height="26"  class="alignCenter"></a> <%=memberId%></td>
                                  <td height="26"  class="alignCenter"><%=firstName%></td>
                                  <td  class="alignCenter"><%=lastName%></td>
                                  <td  class="alignCenter"><%=dateFormat(memdate[0])%></td>
                                  <!--<td bgcolor="#E3E1D2" class="alignCenter">< %=statusName%></td>-->
                                  <td  class="alignCenter">
                                  <label>
                                  <img src="images/approve-icon-button.png" alt="" width="20px" height="20px"/><input name="button" type="button" class="button-add" onclick="approveBtn1('<%=usrtypname%>','<%=memberId%>','<%=uId%>');"  value="Approve" />
                                  </label>
                                </td>
                     <!--td bgcolor="#E3E1D2" class="alignCenter"><input name="button" type="button" class="oneBtn" onclick="assignBtn('<!--%=uId%>')"  value="Assign" />
                                  </td-->
                                  <td  class="alignCenter"><label>
                                  <img src="images/edit-icon-button.png" alt="" width="20px" height="20px"/>
                                  <input name="button" type="button" class="button-add" onclick="editBtn1('<%=payId%>','<%=firstName%>','<%=lastName%>','<%=memberId%>');"  value="Edit"/>
                                  </label></td>
                                </tr>
                                <%}}}}else{%>
                                <tr>
                                  <td width="87" height="27" class="tblRowHeadTwo"><strong>Member ID </strong></td>
                                  <td width="83" class="tblRowHeadTwo"><strong>First Name </strong></td>
                                  <td width="98" class="tblRowHeadTwo"><strong>Last Name </strong></td>
                                  <td width="102" class="tblRowHeadTwo"><strong>Date of Membership </strong></td>
                                  <td width="94" class="tblRowHeadTwo"><strong>Approve</strong></td>
                                  <!--td width="94" class="tblRowHeadTwo">Role</td-->
                                  <td width="94" class="tblRowHeadTwo"><strong>Transaction</strong></td>
                                </tr>
                                <%}%>
                                <!--<tr>
		  	<td height="25" colspan="6"  bgcolor="#ffffff" class="alignRight">
				<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
			<a href="" class="linkThree">Prev</a> | <a href="" class="linkThree">Next</a>			</td>
		   </tr>-->
                                <%
		   if(rCnt!=0){
							%>
                                <tr>
                                  <td  colspan="7"  bgcolor="#ffffff" class="alignRight"><strong>View Page(s): </strong> &nbsp;
                                      <select name="pn1" id="pn1" class="selectboxOne" onchange="getMemTyp();postDataForPagination1();">
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
                                      <strong> of <%=end%> </strong> </td>
                                </tr>
                                <%
						   }
						   %>
                                <tr>
                                  <td height="19" colspan="6">&nbsp;</td>
                                </tr>
                              </table>
                            </form></td>
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
