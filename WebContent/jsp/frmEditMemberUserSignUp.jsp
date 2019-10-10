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
<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.*" %>
<%@ page import="com.hlchorse.form.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/validate.js" type="text/javascript" ></script>
<script src="js/cscombo_new.js" type="text/javascript" ></script>
<script src="js/frmMembRegi.js" type="text/javascript" ></script>
<script src="js/EditMemberUserReg.js" type="text/javascript" ></script>
</head>

<style>
    .vertical-line {
        width: 0;
        border: 1px solid #000000;
        height: 1px
		 
    }
</style>

<body>

<header>
<%@ include file = "../../include/HeaderProcess.jsp" %>
</header>

<!--=======content================================-->
  <table width=100% border="1" cellpadding="0" cellspacing="0" height="350" class="content_new" align="center">
    <tr><td><%@ include file = "../../include/infobar.jsp" %><br /></td></tr>
    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
    <table width="630px" border="1" cellpadding="0" cellspacing="0" style="border:thin;border-style:groove;">
    
    <tr>
	
      
     
      <td  align="center" valign="top" class="tableCommonBg">
	  <table width="630" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
        <tr>
          <td width="630" class="subDeptTablePad"><!-- CONTENTS START HERE -->
              <div class="cmmnForm">
                <div class="colspan" ><strong><span class="styleBoldTwo"><strong> <img src="images/edit-icon.png" alt="" width="20px" height="20px" />Edit User Registration</strong></span> </strong></div>
				<div class="divider3"></div>
                <div id="commonBG" class="textCommon"> Please use the form below to<strong> Edit/Update</strong> your registration details.You can also create your Login name and Password if you don't have one.</div><br />
                <%
	String source = (String)request.getAttribute("source");
	String eventTypeId = (String)request.getAttribute("eventTypeId");
	String compYear = (String)request.getAttribute("compYear");
%>
                <form name="frmMembRegi" id="frmMembRegi" method="post" class="formcss" action="user.html" onsubmit="return myvalidate(this);" onmouseover="hide_switchDiv();" >
                  <input type="hidden" name="eventTypeId" id="eventTypeId" value="<%=eventTypeId%>" />
                  <input type="hidden" name="compYear" id="compYear" value="<%=compYear%>" />
                  <div id="parta" align="right">
                    <!-- **************************************** Part A of the form starts here *********************************************** -->
                                      <table width="600" border="1" cellspacing="2" cellpadding="2">
                                        <tr>
                                          <td height="33" colspan="2"><div class="rowHead"><strong> Basic Information: </strong></div></td>
                                        </tr>
                                        <%
                                    HLCUserRegVO HLCUserRegVO=new HLCUserRegVO();
						
                         			HLCUserRegVO=(HLCUserRegVO)request.getAttribute("EditusrVect");
						               
							%>
                                        <tr>
                                          <td width="181" height="33"><span class="row"><span class="label">Salutation:</span></span></td>
                                          <td width="411"><span class="row"><span class="formX">
										  
                                           <label> <strong><%=HLCUserRegVO.getPrefix()%></strong></label>
										   <input type="hidden" name="uselect" value="<%=HLCUserRegVO.getPrefix()%>"/>
										   
                                          </span></span></td>
                                        </tr>
                                        <tr>
                                          <td height="33"><span class="row"><span class="label">First Name:</span></span></td>
                                          <td>
										  
                                          <label> <strong><%=HLCUserRegVO.getFirstName()%></strong></label>
										  <input type="hidden" name="fname" value="<%=HLCUserRegVO.getFirstName()%>"/>
										  </td>
                                        </tr>
                                        <tr>
                                          <%

			String mname="";
			
			if(HLCUserRegVO.getMiddleName()!=null && HLCUserRegVO.getMiddleName().trim().length()!=0)
			{
				mname=HLCUserRegVO.getMiddleName();
			}
			else
			{
				mname="";
			}
			
			%>
                                          <td height="33"><span class="row"><span class="label">Middle Name:</span></span></td>
                                          <td><span class="row"><span class="formX">
                                           
										   <label><strong><%=mname%></strong></label>
										    <input type="hidden" name="mname" value="<%=mname%>"/>
                                          </span></span></td>
                                        </tr>
                                        <tr>
                                          <td height="33"><span class="row"><span class="label">Last Name:</span></span></td>
                                          <td><span class="row"><span class="formX">
                                          
										  <label><strong><%=HLCUserRegVO.getLastName()%></strong></label>
										  <input type="hidden" name="lname" value="<%=HLCUserRegVO.getLastName()%>"/>
                                            </span></span></td>
                                        </tr>
                                        <tr>
                                          <%

			String suff="";
			
			if(HLCUserRegVO.getSufix()!=null && HLCUserRegVO.getSufix().trim().length()!=0)
			{
				suff=HLCUserRegVO.getSufix();
			}
			else
			{
				suff="";
			}
			
			%>
                                          <td height="33"><span class="row"><span class="label">Suffix:</span></span></td>
                                          <td><span class="row"><span class="formX">
                                           
										   <label><strong><%=suff%></strong></label>
										    <input type="hidden" name="sname" value="<%=suff%>"/>
										   
                                          </span></span></td>
                                        </tr>
                                        <tr>
                                          <td height="33"><span class="row"><span class="label">Date of Birth :</span></span></td>
                                          <td><span class="row"><span class="formX">
                                            <%
																					
																					    if(HLCUserRegVO.getDob()!=null)
																						{
                                                                                        String[] dob1=HLCUserRegVO.getDob().split(" ");
                                                                                        String[] dob=dob1[0].split("-");
                                                                                        
                                                                                        String mm=dob[1];
                                                                                        String dd=dob[2];
                                                                                        String yy=dob[0];
                                                                                                                                                                                
                                                                                       String[] mon={"January","February","March","April","May","June","July","August","September","October","November","December"};
                                                                                       String month="";
                                                                                       
                                                                                    if(mm.equals("01"))
                                                                                        month=mon[0];
                                                                                    else if(mm.equals("02"))
                                                                                        month=mon[1];
                                                                                    else if(mm.equals("03"))
                                                                                        month=mon[2];
                                                                                    else if(mm.equals("04"))

                                                                                        month=mon[3];
                                                                                    else if(mm.equals("05"))
                                                                                        month=mon[4];
                                                                                    else if(mm.equals("06"))
                                                                                        month=mon[5];
                                                                                    else if(mm.equals("07"))
                                                                                        month=mon[6];
                                                                                    else if(mm.equals("08"))
                                                                                        month=mon[7];
                                                                                    else if(mm.equals("09"))
                                                                                        month=mon[8];
                                                                                    else if(mm.equals("10"))
                                                                                        month=mon[9];
                                                                                    else if(mm.equals("11"))
                                                                                        month=mon[10];
                                                                                    else if(mm.equals("12"))
                                                                                        month=mon[11];
                                                                                    else
                                                                                           
                                                                                       
                                                                                    %>
                                            
                                              <%
													int selmth=Integer.parseInt(mm);
													System.out.println("selmth :"+selmth);

													for(int mth=1;mth<=12;mth++)
													{
														if(selmth==mth)
														{%>
														
														
                                             <label><strong><%=mth%></strong></label>
											 <input type="hidden" name="birthmonth" value="<%=mth%>"/>
											 
											 
                                              <%}else{%>
                                              
                                              <%}}%>
                                            
                                      
                                              <%
													int dat=Integer.parseInt(dd);
													for(int d=1;d<=31;d++)
													{
														if(dat==d)
														{%>
                                              <strong>
                                              <label>/<%=d%></label>
                                              </strong>
											  <input type="hidden" name="birthday" value="<%=d%>"/>
<%}else{%>
                                              
                                              <%}}%>
                                           
                                              <%  														            												  
														int selyr=Integer.parseInt(yy);
														java.util.Calendar c5 = java.util.Calendar.getInstance();
                                                        //int day = c.get(Calendar.DAY);
                                                        //int month = c.get(Calendar.MONTH);
                                                        int year5 = c5.get(java.util.Calendar.YEAR);
                                                        //String date = day+" / "+month+" / "+year;
                                                        System.out.println("Current Date = "+year5);
                                                        for(int yr=1900;yr<=year5;yr++)
                                                                                                                    {
															if(yr==selyr)
															{%>
                                              <strong>
                                              <label>/<%=yr%></label>
                                              </strong>
											    <input type="hidden" name="birthyear" value="<%=yr%>"/>
<%}else{%>
                                              
                                              <%}}%>
                                            
                                            <%}
										else
										{
										%>
                                            
                                             
                                              <%
                                                                                                  java.util.Calendar c5 = java.util.Calendar.getInstance();
                                                                                                  //int day = c.get(Calendar.DAY);
                                                                                                  //int month = c.get(Calendar.MONTH);
                                                                                                  int year5 = c5.get(java.util.Calendar.YEAR);
                                                                                                  //String date = day+" / "+month+" / "+year;
                                                                                                  System.out.println("Current Date = "+year5);

                                                                                                  for(int f=1900;f<=year5;f++) 
                                                                                                  {%>
                                             
                                              <%}
                                                                                                  %>
                                           
                                            <%}%>
                                          </span></span></td>
                                        </tr>
                                        <tr>
                                          <%
									 if(HLCUserRegVO.getGender()!=null)
                                     {%>
                                          <td height="33"><span class="row"><span class="label">Gender:</span></span></td>
                                          <td><span class="row"><span class="floatLeft"><strong><%=HLCUserRegVO.getGender()%>
                                                                         
										  </strong></span></span>
										   <input type="hidden" name="gender" value="<%=HLCUserRegVO.getGender()%>"/>
										  </td>
                                          <%}%>
                                        </tr>
                                        <tr>
                                          <td height="33"><span class="row"><span class="label">EMail :</span></span></td>
                                          <td><span class="row"><span class="formX">
                                            <input type="text" name="email" value="<%=HLCUserRegVO.getEmailId()%>" />
                                            &nbsp;<span class="asterisk">*</span></span></span></td>
                                        </tr>
                                        <tr>
                                          <%
                                                                          String logName="";
                                                                          
                                                                          if(HLCUserRegVO.getLoginName()!=null && HLCUserRegVO.getLoginName().trim().length()!=0)
                                                                          {
                                                                            logName=HLCUserRegVO.getLoginName();
                                                                          }
                                                                          
                                                                          String userId1="";
                                                                          userId1=HLCUserRegVO.getUserId();
                                                                          
                                                                        %>
                                          <input type="hidden" name="userId" value="<%=userId1%>" />
                                          <input type="hidden" name="cmd" value="updateUsr" />
                                          
                                          <td height="33"><span class="row"><span class="label">User Name (Login ID):</span></span></td>
                                          <td><span class="row"><span class="formX"><strong><%=logName%>
                                            </strong></span></span>
											<input type="hidden" name="usrname" value="<%=logName%>" />
											</td>
                                        </tr>
                                        <tr>
                                          <td height="33"><span class="row"><span class="label">Choose A Secret Question:</span></span></td>
                                          <td><span class="row"><span class="formX">
                                          <select name="QSelect" id="select" class="selectboxOne">
                                            <%
																														
										String[] secQuest={"What is your favorite passtime?","What is your pets name?","What was your first car?","What is your mothers first name?","Which is your favorite vacation spot?"}; 
									
									int i=0;
									int j=0;
									
									for(i=0;i<secQuest.length;i++)
									{
										if(HLCUserRegVO.getSecretQuestion()!=null && HLCUserRegVO.getSecretQuestion().trim().length()!=0)
										{											
											if(HLCUserRegVO.getSecretQuestion().equalsIgnoreCase(secQuest[i]))
											{
												System.out.print("secQuest[i]) match :"+secQuest[i]);
											%>
                                            <option selected="selected" value="<%=secQuest[i]%>"><%=secQuest[i]%></option>
                                            <%}
										  else{
										  
										  if(j==0)
											{
										  %>
                                            <option value="">Select One</option>
                                            <%}%>
                                            <option value="<%=secQuest[i]%>"><%=secQuest[i]%></option>
                                            <%}}
										  else
										  {
										  	if(j==0)
											{
										  %>
                                            <option selected="selected" value="">Select One</option>
                                            <%}%>
                                            <option value="<%=secQuest[i]%>"><%=secQuest[i]%></option>
                                            <%										  
										  }
										  j++;
										  }%>
                                          </select>
&nbsp; <span class="asterisk">*</span></span></span></td>
                                        </tr>
                                        <tr>
                                          <%
									  		String secAns="";
											
											if(HLCUserRegVO.getSecretAnswer()!=null)
											{
												secAns=HLCUserRegVO.getSecretAnswer();
											}
									  %>
                                          <td height="33"><span class="row"><span class="label">Your Answer To This Question:</span></span></td>
                                          <td><span class="row"><span class="formX">
										  
                                          <label>
                                          <input type="text"name="ans" value="<%=secAns%>" class="textboxOne" size="30" />
                                          <span class="asterisk">*</span></label>
											
                                          </span></span></td>
                                        </tr>
                                        <!--tr>
                                          <td colspan="2"><div class="rowHead"> Change Password: </div></td>
                                        </tr>
                                        <tr>
                                          <td><span class="row"><span class="label">New Password:</span></span></td>
                                          <td><span class="row"><span class="formX">
                                            <input type="password" name="newPwd" class="textboxOne" size="18" />
                                          </span></span></td>
                                        </tr>
                                        <tr>
                                          <td><span class="row"><span class="label">Re-Type New Password:</span></span></td>
                                          <td><span class="row"><span class="formX">
                                            <input type="password" name="confPwd" class="textboxOne" size="18" />
                                          </span></span></td>
                                        </tr-->
                                        <tr>
                                          <td height="33" colspan="2"><div class="colspan"> <span class="label"><strong>Address Types:</strong></span> </div></td>
                                        </tr>
                                        <tr>
                                          <td height="33" colspan="2"><div class="row"> <span class="formX">
                                          <div class="floatLeft">
                                                <input type="checkbox" name="priAdd_cbx" id="priAdd_cbx" value="Primary" size="10" checked="checked" onclick="defaultPriAdd();"/>
                                            Primary Address</div>
                                            </span> <span class="formX">
                                              <%
                                                                                       if(HLCUserRegVO.getSecondaryContactTypeName()!=null)
                                                                                       {
                                                                                       if(HLCUserRegVO.getSecondaryContactTypeName().equalsIgnoreCase("Secondary"))
                                                                                                                                                                                                                                                               
                                                                                     {%>
                                              <div class="floatLeft">
                                                <input type="checkbox" checked="checked" name="secAdd_cbx" value="Secondary" id="secAdd_cbx" size="10" onclick="return hide_switchDiv();"/>
                                                Secondary Address</div>
                                              <input type="hidden" name="cttyp" value="Secondary" />
                                              <%}}else{%>
                                              <div class="floatLeft">
                                                <input type="checkbox" name="secAdd_cbx" value="Secondary" id="secAdd_cbx" size="10" onclick="return hide_switchDiv();"/>
                                                Secondary Address</div>
                                              <% }%>
                                          </span> </div></td>
                                        </tr>
                                        <tr>
                                          <td colspan="2"><div id="pAdd">
                                              <table width="600" border="1" cellspacing="2" cellpadding="2">
                                                <tr>
                                                  <td height="33" colspan="2"><div class="colspan"> <strong>Primary Address </strong> </div></td>
                                                </tr>
                                                <tr>
                                                  <td width="179" height="33"><span class="row"><span class="label">Address 1:</span></span></td>
                                                  <td width="401"><span class="row"><span class="formX">
                                                    <input type="text" value="<%=HLCUserRegVO.getPrimaryAddress1()%>" name="padd_txt" id="padd_txt" class="textboxOne" size="35" />
                                                  &nbsp;<span class="asterisk">*</span></span></span></td>
                                                </tr>
                                                <tr>
                                                  <%

			String add2="";
			
			if(HLCUserRegVO.getPrimaryAddress2()!=null && HLCUserRegVO.getPrimaryAddress2().trim().length()!=0)
			{
				add2=HLCUserRegVO.getPrimaryAddress2();
			}
			else
			{
				add2="";
			}
			
			%>
                                                  <td height="33"><span class="row"><span class="label">Address 2:</span></span></td>
                                                  <td><span class="row"><span class="formX">
                                                    <input type="text" value="<%=add2%>" name="padd_txt2" id="padd_txt2" class="textboxOne" size="35" />
                                                  </span></span></td>
                                                </tr>
                                                <tr>
                                                  <td height="33"><span class="row"><span class="label">City:</span></span></td>
                                                  <td><span class="row"><span class="formX">
                                                    <input type="pcity_txt" name="pcity_txt" value="<%=HLCUserRegVO.getPrimaryCity()%>" id="pcity_txt" class="textboxOne" size="20" />
                                                    &nbsp;<span class="asterisk">*</span> </span></span></td>
                                                </tr>
                                                <tr>
                                                  <td height="33"><span class="row"><span class="label">State:</span></span></td>
                                                  <td><span class="row"><span class="formX">
                                                    <select name="pstate_sel" id="pstate_sel" class="selectboxOne">
                                                    </select>
                                                    &nbsp;<span class="asterisk">*</span> </span></span></td>
                                                </tr>
                                                <tr>
                                                  <td height="33"><span class="row"><span class="label">Zipcode:</span></span></td>
                                                  <td><span class="row"><span class="formX">
                                                    <input type="text" value="<%=HLCUserRegVO.getPrmaryZip()%>" name="pzip_txt" id="pzip_txt" class="textboxOne" size="8" />
                                                    &nbsp;<span class="asterisk">*</span></span></span></td>
                                                </tr>
                                                <tr>
                                                  <td height="33"><span class="row"><span class="label">Country:</span></span></td>
                                                  <td><span class="row"><span class="formX">
                                                    <%System.out.print(HLCUserRegVO.getPrimaryCountry());
																   System.out.print(HLCUserRegVO.getPrimaryState());
																    System.out.print(HLCUserRegVO.getSecondaryCountry());
																   System.out.print(HLCUserRegVO.getSecondaryState());
																	%>
                                                    <select name="pcountry_sel" id="pcountry_sel" class="selectboxOne" onchange="FillState(document.frmMembRegi.pcountry_sel, document.frmMembRegi.pstate_sel,'');" >
                                                    </select>
                                                    &nbsp;<span class="asterisk">*</span></span></span></td>
                                                </tr>
                                                <tr>
                                                  <td height="33"><span class="row"><span class="label">Phone:</span></span></td>
                                                  <td><span class="row"><span class="formX">
                                                    <input type="text" name="pphone_txt" value="<%=HLCUserRegVO.getPrimaryPhoneNo()%>" class="textboxOne" size="15" />
                                                    &nbsp;<span class="asterisk">*</span>&nbsp;(e.g. xxx yyy zzzz)</span></span></td>
                                                </tr>
                                                <tr>
                                                  <%

			String pmobil="";
			
			if(HLCUserRegVO.getPromaryMobileNo()!=null && HLCUserRegVO.getPromaryMobileNo().trim().length()!=0)
			{
				pmobil=HLCUserRegVO.getPromaryMobileNo();
			}
			else
			{
				pmobil="";
			}

			String pfax="";
			
			if(HLCUserRegVO.getPrimaryFaxNo()!=null && HLCUserRegVO.getPrimaryFaxNo().trim().length()!=0)
			{
				pfax=HLCUserRegVO.getPrimaryFaxNo();
			}
			else
			{
				pfax="";
			}
			
			%>
                                                  <td height="33"><span class="row"><span class="label">Mobile:</span></span></td>
                                                  <td><span class="row"><span class="formX">
                                                    <input type="text" name="pmob_txt" value="<%=pmobil%>" class="textboxOne" size="15" />
                                                  </span></span></td>
                                                </tr>
                                                <tr>
                                                  <td height="33"><span class="row"><span class="label">Fax:</span></span></td>
                                                  <td><span class="row"><span class="formX">
                                                    <input type="text" name="pfax_txt" value="<%=pfax%>" class="textboxOne" size="15" />
                                                  </span></span></td>
                                                </tr>
                                            </table>
                                          </div>
                                             </td>
                                        </tr>
                                        <tr>
                                          <td colspan="2"><div id="sAdd">
                                              <table width="600" border="1" cellspacing="2" cellpadding="2">
                                                <tr>
                                                  <td height="33" colspan="2"><div class="colspan"> <strong>Secondary Address </strong> </div></td>
                                                </tr>
                                                <tr>
                                                  <td width="180" height="33"><span class="row"><span class="label">Address 1:</span></span></td>
                                                  <td width="400"><span class="row">
                                                    <%
										 String sec_add1="";
                                                                                       if(HLCUserRegVO.getSecondaryAddress1()!=null)
                                                                                       {
	                                                                                       	sec_add1=HLCUserRegVO.getSecondaryAddress1();
                                                                                        } %>
                                                    </span><span class="row"><span class="formX">
                                                    <input type="text" name="sadd_txt" id="sadd_txt" class="textboxOne" value="<%=sec_add1%>" size="35" />
                                                  &nbsp;<span class="asterisk">*</span></span></span></td>
                                                </tr>
                                                <tr>
                                                  <td height="33"><span class="row"><span class="label">Address 2:</span></span></td>
                                                  <td><span class="row">
                                                    <%
                                                                                    																						String sadd2="";
																						
																						if(HLCUserRegVO.getSecondaryAddress2()!=null)
																						{
																							sadd2=HLCUserRegVO.getSecondaryAddress2();
																						}
																						
																						%>
                                                    </span><span class="row"><span class="formX">
                                                    <input type="text" value="<%=sadd2%>" name="sadd_txt1" id="sadd_txt1" class="textboxOne" size="35" />
                                                  </span></span></td>
                                                </tr>
                                                <tr>
                                                  <td height="33"><span class="row"><span class="label">City:</span></span></td>
                                                  <td><span class="row">
                                                    <%
												 String sec_city="";
                                                                                       if(HLCUserRegVO.getSecondaryCity()!=null)
                                                                                       {
																					   sec_city=HLCUserRegVO.getSecondaryCity();
																					   }
                                                                                      %>
                                                    </span><span class="row"><span class="formX">
                                                    <input type="text" value="<%=sec_city%>" name="scity_txt" id="scity_txt" class="textboxOne" size="20" />
                                                      &nbsp;<span class="asterisk">*</span></span></span></td>
                                                </tr>
                                                <tr>
                                                  <td height="33"><span class="row"><span class="label">State:</span></span></td>
                                                  <td><span class="row"><span class="formX">
                                                    <select name="sstate_txt" id="sState_sel" class="selectboxOne">
                                                    </select>
                                                    <!--<input type="text" name="sstate_txt" value="<%=HLCUserRegVO.getSecondaryState()%>" class="textboxOne" size="20" />-->
                                                    &nbsp;<span class="asterisk">*</span> </span></span></td>
                                                </tr>
                                                <tr>
                                                  <%
											String sec_zip="";
										
											if(HLCUserRegVO.getSecondaryZip()!=null)
											{
												sec_zip=HLCUserRegVO.getSecondaryZip();
											}
										%>
                                                  <td height="33"><span class="row"><span class="label">Zip:</span></span></td>
                                                  <td><span class="row"><span class="formX">
                                                    <input type="text" value="<%=sec_zip%>" name="szip_txt" id="szip_txt" class="textboxOne" size="8" />
                                                    &nbsp;<span class="asterisk">*</span></span></span></td>
                                                </tr>
                                                <tr>
                                                  <td height="33"><span class="row"><span class="label">Country:</span></span></td>
                                                  <td><span class="row"><span class="formX">
                                                    <select name="scountry_txt" id="sCountry_sel" class="selectboxOne" onchange="FillState(document.frmMembRegi.scountry_txt, document.frmMembRegi.sstate_txt,'');" >
                                                    </select>
                                                    <!--<input type="text" name="scountry_txt" value="<%=HLCUserRegVO.getSecondaryCountry()%>" class="textboxOne" size="20" />-->
                                                    &nbsp;<span class="asterisk">*</span> </span></span></td>
                                                </tr>
                                                <tr>
                                                  <%
String ph="";
if(HLCUserRegVO.getSecondaryPhoneNo()!=null)
{
	ph=HLCUserRegVO.getSecondaryPhoneNo();
}

%>
                                                  <td height="33"><span class="row"><span class="label">Phone:</span></span></td>
                                                  <td><span class="row"><span class="formX">
                                                    <input type="text" name="sphone_txt" value="<%=ph%>" class="textboxOne" size="15" />
                                                    &nbsp;<span class="asterisk">*</span>&nbsp;(e.g. xxx yyy zzzz)</span></span></td>
                                                </tr>
                                                <tr>
                                                  <%

			String smob2="";
			
			if(HLCUserRegVO.getSecondaryMobileNo()!=null)
			{
				smob2=HLCUserRegVO.getSecondaryMobileNo();
			}
			
			String sfax2="";
			
			if(HLCUserRegVO.getSecondaryFaxNo()!=null)
			{
				sfax2=HLCUserRegVO.getSecondaryFaxNo();
			}
			
			
			%>
                                                  <td height="33"><span class="row"><span class="label">Mobile:</span></span></td>
                                                  <td><span class="row"><span class="formX">
                                                    <input type="text" name="smob_txt" value="<%=smob2%>" class="textboxOne" size="15" />
                                                  </span></span></td>
                                                </tr>
                                                <tr>
                                                  <td height="33"><span class="row"><span class="label">Fax:</span></span></td>
                                                  <td><span class="row"><span class="formX">
                                                    <input type="text" name="sfax_txt" value="<%=sfax2%>" class="textboxOne" size="15" />
                                                  </span></span></td>
                                                </tr>
                                            </table>
                                          </div>
                                             </td>
                                        </tr>
                                        <tr>
                                          <td height="33"><span class="row"><span class="label">Preferred Communication Address:</span></span></td>
                                          <td><span class="row"><span class="formX">
                                            <select name="comAdd_sel" id="comAdd_sel" class="selectboxOne" onchange="return hideTwo_switchDiv();">
                                              <%
                                                                                       if(HLCUserRegVO.getPreferedCommunication()!=null)
                                                                                       {
                                                                                       if(HLCUserRegVO.getPreferedCommunication().equalsIgnoreCase("Secondary"))
                                                                                        {    System.out.println("HLCUserRegVO.getPreferedCommunication() :"+HLCUserRegVO.getPreferedCommunication());                                                                                                                                                                   
                                                                                     %>
                                              <option value="Primary">Primary Address</option>
                                              <option selected="selected" value="Secondary">Secondary Address</option>
                                              <%}else if(HLCUserRegVO.getPreferedCommunication().equalsIgnoreCase("Primary")){
										System.out.println("HLCUserRegVO.getPreferedCommunication() :"+HLCUserRegVO.getPreferedCommunication()); 
										%>
                                              <option selected="selected" value="Primary">Primary Address</option>
                                              <option value="Secondary">Secondary Address</option>
                                              <%}}%>
                                            </select>
                                          </span></span></td>
                                        </tr>
                                        <tr>
                                          <td height="33" colspan="2"><div class="colspan"> <strong>Contact Options</strong> </div></td>
                                        </tr>
                                        <tr>
                                          <td colspan="2"><div id="div" class="textCommon" style="height:40px;"> We provide mail/email information to other affliates, organizations, sponsors 
                                            and vendors on a limited basis. You may choose to not receive these mailings by selecting the 
                                            appropriate options below: </div></td>
                                        </tr>
                                        <tr>
                                          <td colspan="2"><div id="div2" class="textCommon" style="height:40px;">
                                              <% 
											System.out.println("HLCUserRegVO.isNonUseaEmailStatus() :"+HLCUserRegVO.isNonUseaEmailStatus());
											
											if(HLCUserRegVO.isNonUseaEmailStatus()){%>
                                              <input type="checkbox" name="nonUseaEmail"  id="nonUseaEmail_id" value="true" checked="checked" />
                                            Do not release my email address for specific use. <br />
                                            <%}else {%>
                                            <input type="checkbox" name="nonUseaEmail"  id="nonUseaEmail_id" value="true" />
                                            Do not release my email address for specific use. <br />
                                            <%}%>
                                            <%System.out.println("nonUseaMail:testing:"+HLCUserRegVO.isNonUseaMailingStatus()); 
											  if(HLCUserRegVO.isNonUseaMailingStatus()){
											%>
                                            <input type="checkbox" name="nonUseaMail"  id="nonUseaAdd_id" value="true" checked="checked" />
                                            Do not release my mailing address for specific use.<br/>
                                            <%} else {%>
                                            <input type="checkbox" name="nonUseaMail"  id="nonUseaAdd_id" value="true" />
                                            Do not release my mailing address for specific use.<br/>
                                            <%}%>
                                            </div>
                                              <!-- spacer starts-->
                                              <div class="spacer">&nbsp;</div>
                                            <!-- spacer ends-->
                                          </td>
                                        </tr>
                                        <tr>
                                          <td colspan="2" align="center"><div class="row"> <span class="label">&nbsp;</span> <span class="formX">
                                             <img src="images/update-icon-button.jpg" alt="" width="18px" height="18px" style="cursor:pointer"/> <input name="submit" type="submit" class="button-add" value="Update" />
                                            </span> </div>
                                              <!-- spacer starts-->
                                              <div class="spacer">&nbsp;</div>
                                            <!-- spacer ends-->
                                              <!-- spacer starts-->
                                              <div class="spacer">&nbsp;</div>
                                            <!-- spacer ends-->
                                              <!-- **************************************** Part A of the form Ends here *********************************************** -->
                                              <%
                           
                        String pctry="";
			
			if(HLCUserRegVO.getPrimaryCountry()!=null && HLCUserRegVO.getPrimaryCountry().trim().length()!=0)
			{
				pctry=HLCUserRegVO.getPrimaryCountry();
			}
			else
			{
				pctry="USA";
			}
                        
                        String pstat="";
			
			if(HLCUserRegVO.getPrimaryState()!=null && HLCUserRegVO.getPrimaryState().trim().length()!=0)
			{
				pstat=HLCUserRegVO.getPrimaryState();
			}
			else
			{
				pstat="";
			}
			
			String sctry="";
			
			if(HLCUserRegVO.getSecondaryCountry()!=null && HLCUserRegVO.getSecondaryCountry().trim().length()!=0)
			{
				sctry=HLCUserRegVO.getSecondaryCountry();
			}
			else
			{
				sctry="USA";
			}
                        
                        String sstat="";
			
			if(HLCUserRegVO.getSecondaryState()!=null && HLCUserRegVO.getSecondaryState().trim().length()!=0)
			{
				sstat=HLCUserRegVO.getSecondaryState();
			}
			else
			{
				sstat="";
			}

			%></td>
                                        </tr>
                    </table>
                  </div>
                </form>
              </div>
            <!-- CONTENTS END HERE -->          </td>
        </tr>
      </table></td>
      
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
<script language="javascript">

	FillCountry(document.frmMembRegi.pcountry_sel, document.frmMembRegi.pstate_sel, '<%=pctry%>' );
	FillState(document.frmMembRegi.pcountry_sel, document.frmMembRegi.pstate_sel, '<%=pstat%>');

	FillCountry(document.frmMembRegi.scountry_txt, document.frmMembRegi.sstate_txt, '<%=sctry%>' );
	FillState(document.frmMembRegi.scountry_txt, document.frmMembRegi.sstate_txt, '<%=sstat%>');

</script>
</html>
