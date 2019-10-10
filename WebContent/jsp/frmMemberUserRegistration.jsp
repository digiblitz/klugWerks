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
   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Klugwerks-User Registration</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/validate.js" type="text/javascript" ></script>
<script src="js/memberUserRegistration.js" type="text/javascript" ></script>
<script src="js/cscombo_new.js" type="text/javascript" ></script>
<script src="js/frmMembRegi.js" type="text/javascript" ></script>

<script src="js/datetimepicker_css.js"></script>

<link rel="stylesheet" href="css/style.css">
</head>


<body>

<header id="header">
<%@ include file = "../../include/Header.jsp" %>
</header>

  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0" class="content_new" align="center">
    <tr><td>&nbsp;</td></tr>
    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
  <table width="630" border="1" cellpadding="0" cellspacing="0"  style="border:thin;border-style:groove;">
     
    <tr>
	
      
     
      <td  align="left" valign="top" class="tableCommonBg" ><div class="cmmnForm">
        <div class="colspan" ><span class="styleBoldTwo"><img src="images/register_icon.png" alt="" width="20px" height="20px" /><strong> User Registration</strong></span></div>
      <div class="divider3"></div>
        <div id="commonBG" class="textCommon" style="height:50px;" align="center"><strong>&nbsp;&nbsp;&nbsp;User, please take your time and register to avail the privileges that accompanies with it.</strong> <br />
              <br />
          </div>
        <form name="frmMembRegi" id="frmMembRegi" method="post" action="user.html?cmd=usrReg" class="formcss" enctype="multipart/form-data" onsubmit="return myvalidate(this);">
          
          <div align="right">
            <table width="600" border="1" cellspacing="2" cellpadding="2">
              <tr>
                <td height="32" colspan="2" valign="middle"><span class="rowHead"><strong> Basic Information</strong></span></td>
              </tr>
              <tr>
                <td width="301" height="27" valign="middle"><span class="label">Salutation:</span></td>
                <td width="504" valign="middle"><span class="formX">
                  <select name="USelect" id="select" class="selectboxOne">
                    <option value="" selected="selected">Select One</option>
                    <option value="Mr">Mr.</option>
                    <option value="Mrs">Mrs.</option>
                    <option value="Miss">Miss.</option>
                    <option value="Ms">Ms.</option>
                  </select>
                </span></td>
              </tr>
              <tr>
                <td height="29" valign="middle"><span class="row"> <span class="label">First Name:</span></span></td>
                <td valign="middle"><span class="row"><span class="formX">
                  <input type="text" name="fname" class="textboxOne" size="20" />
                  &nbsp;<font color="#FF0000"><span class="asterisk" id="error">*</span></font></span></span></td>
              </tr>
              <tr>
                <td height="25" valign="middle"><span class="label">Middle Name:</span></td>
                <td valign="middle"><span class="formX">
                  <input type="text" name="mname"class="textboxOne" size="20" />
                </span></td>
              </tr>
              <tr>
                <td height="26" valign="middle"><span class="label">Last Name:</span></td>
                <td valign="middle"><span class="row"> <span class="formX">
                  <input type="text" name="lname" class="textboxOne" size="20" />
                  &nbsp;<font color="#FF0000"><span class="asterisk" id="error1">*</span></font></span></span></td>
              </tr>
              <tr>
                <td height="26" valign="middle"><span class="label">Suffix:</span></td>
                <td valign="middle"><span class="row"><span class="formX">
                  <input type="text" name="sname" class="textboxOne" size="20" />
                </span></span></td>
              </tr>
			    <tr>
                <td height="29" valign="middle"><span class="label">Date of Birth:</span></td>
                <td valign="middle"><span class="row"> <span class="formX">
				<input name="dat" type="text" value="" placeholder="DD/MM/YYYY" readonly="true" class="textboxOne" id="date" size="6"/>	
						
				  <img src="images/calendar.jpg" alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;cursor:pointer" border="0" onclick="javascript:NewCssCal('date')" />	
				 &nbsp;<font color="#FF0000"><span class="asterisk" id="datepic">*<div id="datepic"></div></span></font></span></span></td>
              </tr>
              <!--tr>
                <td height="29" valign="middle"><span class="label">Date of Birth:</span></td>
                <td valign="middle"><span class="row"><span class="formX">
                  <select name="birthmonth" id="select2" class="selectboxOne">
                    <option value="" selected="selected">Month</option>
                    <option value="01">January</option>
                    <option value="02">February</option>
                    <option value="03">March</option>
                    <option value="04">April</option>
                    <option value="05">May</option>
                    <option value="06">June</option>
                    <option value="07">July</option>
                    <option value="08">August</option>
                    <option value="09">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                  </select>
                  <select name="birthday" id="select2" class="selectboxOne">
                    <option value="" selected="selected">Day</option>
                    <option value="01">01</option>
                    <option value="02">02</option>
                    <option value="03">03</option>
                    <option value="04">04</option>
                    <option value="05">05</option>
                    <option value="06">06</option>
                    <option value="07">07</option>
                    <option value="08">08</option>
                    <option value="09">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                    <option value="21">21</option>
                    <option value="22">22</option>
                    <option value="23">23</option>
                    <option value="24">24</option>
                    <option value="25">25</option>
                    <option value="26">26</option>
                    <option value="27">27</option>
                    <option value="28">28</option>
                    <option value="29">29</option>
                    <option value="30">30</option>
                    <option value="31">31</option>
                  </select>
                  <select name="birthyear" id="select2" class="selectboxOne">
                    <option value="" selected="selected" >Year</option>
                  / <!--%
                                                                                                  java.util.Calendar c5 = java.util.Calendar.getInstance();
                                                                                                  //int day = c.get(Calendar.DAY);
                                                                                                  //int month = c.get(Calendar.MONTH);
                                                                                                  int year5 = c5.get(java.util.Calendar.YEAR);
                                                                                                  //String date = day+" / "+month+" / "+year;
                                                                                                  System.out.println("Current Date = "+year5);

                                                                                                  for(int f=1900;f<=year5;f++) 
                                                                                                  {%>
                    <option  value="<!%=f%>"><!%=f%></option>
                    <!%}
                                                                                                  %>
                  </select>
                  &nbsp;<font color="#FF0000"><span class="asterisk">*</span></font><span class="mmddyy">&nbsp;(e.g. MM/DD/YYYY)</span> </span></span></td>
              </tr-->
              <tr>
                <td valign="middle"><span class="label">Gender</span>:</td>
                <td valign="middle"><span class="row"><span class="floatLeft">
                  <input type="radio" size="10" name="gender" value="male" />
                  Male
                  <input type="radio" size="10" name="gender" value="female" />
                  Female &emsp;<font color="#FF0000"><span id="gender"></span></font></span></span></td>
              </tr>
              <tr>
                <td height="27" valign="middle"><span class="label">User Name (Login ID)</span>:</td>
                <td valign="middle"><span class="row"><span class="formX">
                  <input type="text" name="usrname" id="frmMembRegi_usrname" class="textboxOne" size="20" onblur="usrStat();" />
                  &nbsp;<font color="#FF0000"><span class="asterisk" id="usrname">*</span></font></span></span></td>
              </tr>
              <tr>
                <td height="27" valign="middle"><span class="label">E-Mail:</span></td>
                <td valign="middle"><span class="row"><span class="formX">
                  <input type="text" name="email" class="textboxOne" size="20" />
                  <font color="#FF0000"><span class="asterisk" id="email">*</span></font></span></span></td>
              </tr>
              <tr>
                <td height="28" valign="middle"><span class="label">Choose Your Password:</span></td>
                <td valign="middle"><span class="row"><span class="formX">
                  <input type="password" name="pwd" class="textboxOne" size="10" />
                  &nbsp;  <font color="#FF0000"><span class="asterisk" id="pwd">*</span></font>&nbsp;(Minimum 6 Characters)</span></span></td>
              </tr>
              <tr>
                <td height="28" valign="middle"><span class="label">Re-Type Password</span>:</td>
                <td valign="middle"><span class="row"><span class="formX">
                  <input type="password"name="cpwd" class="textboxOne" size="10" />
                  &nbsp; <font color="#FF0000"><span class="asterisk" id="cpwd">*</span></font></span></span></td>
              </tr>
			   	  			  
              <tr>
                <td height="30" valign="middle"><span class="label">Choose A Secret Question</span>:</td>
                <td valign="middle"><span class="row"><span class="formX">
                  <select name="QSelect" id="select3" class="selectboxOne">
                    <option selected="selected" value="">Select One</option>
                    <option value="What is your favorite passtime?">What is your favorite passtime?</option>
                    <option value="What is your pet's name?">What is your pet's name?</option>
                    <option value="What was your first car?">What was your first car?</option>
                    <option value="What is your mother's first name?">What is your mother's first name?</option>
                    <option value="Which is your favorite vacation spot?">Which is your favorite vacation spot?</option>
                  </select>
                  &nbsp;<font color="#FF0000"><span class="asterisk" id="QSelect">*</span></font></span></span></td>
              </tr>
              <tr>
                <td height="32" valign="middle"><span class="label">Your Answer To This Question:</span></td>
                <td valign="middle"><span class="row"><span class="formX">
                  <input type="text" name="ans" class="textboxOne" size="30" />
                  <font color="#FF0000"><span class="asterisk" id="ans">*</span></font></span></span></td>
              </tr>
			   <tr>
                <td height="27" valign="middle"><span class="label">Upload Pic</span>:</td>
                <td valign="middle"><span class="row"><span class="formX">
                  <input type="file" name="uploadpic" id="frmMembRegi_uploadpic" />
               &nbsp;<font color="#FF0000"><span class="asterisk" id="upload"></span></font></span></span></td>
              </tr>
              <tr>
                <td height="37" colspan="2" valign="middle"><strong>Primary Address</strong></td>
              </tr>
              <tr>
                <td height="27" valign="middle"><span class="label">Plot No</span>:</td>
                <td valign="middle"><span class="row"><span class="formX">
                  <input type="text" name="padd_txt_plotNo" id="nplotno" value="" class="textboxOne" size="35" />
                  <font color="#FF0000"><span class="asterisk" id="gplotno">*</span></font></span></span></td>
              </tr>
              <tr>
                <td height="27" valign="middle"><span class="label">Building No </span>:</td>
                <td valign="middle"><span class="row"><span class="formX">
                  <input type="text" name="padd_txt_buildNo" id="nbuildno" value="" class="textboxOne" size="35" />
               <font color="#FF0000"><span id="gbuildno">*</span></font>
			    </span></span></td>
              </tr>
			  <tr>
                <td height="27" valign="middle"><span class="label">Floor No</span>:</td>
                <td valign="middle"><span class="row"><span class="formX">
                  <input type="text" name="padd_txt_floorNo" id="nfloor" value="" class="textboxOne" size="35" />
               <font color="#FF0000"><span id="gfloor">*</span></font>
			    </span></span></td>
              </tr>
			   <tr>
                <td height="27" valign="middle"><span class="label">Street Address</span>:</td>
                <td valign="middle"><span class="row"><span class="formX">
                  <input type="text" name="padd_txt_strtAddr" id="nstreet" value="" class="textboxOne" size="35" />
                <font color="#FF0000"><span id="gstreet">*</span></font>
				</span></span></td>
              </tr>
			   <tr>
                <td height="27" valign="middle"><span class="label">Lane</span>:</td>
                <td valign="middle"><span class="row"><span class="formX">
                  <input type="text" name="padd_txt_lane" id="nlane" value="" class="textboxOne" size="35" />
                <font color="#FF0000"><span id="glane">*</span></font>
				</span></span></td>
              </tr>
			  <tr>
                <td height="27" valign="middle"><span class="label">Area</span>:</td>
                <td valign="middle"><span class="row"><span class="formX">
                  <input type="text" name="padd_txt_area" id="area" value="" class="textboxOne" size="35" />
                <font color="#FF0000"><span id="garea">*</span></font>
			    </span></span></td>
              </tr>
			   <tr>
                <td height="30" valign="middle"><span class="label">Country</span>:</td>
                <td valign="middle"><span class="row"><span class="formX">
                  <select name="pcountry_sel" id="pCountry_sel" class="selectboxOne" onchange="FillState(document.frmMembRegi.pcountry_sel, document.frmMembRegi.pstate_sel, '');" style="width:277px;">
                    <option selected="selected">Select One</option>
                    <option value="United States of America">United States of America</option>
                  </select>
                  <font color="#FF0000"><span class="asterisk">*</span></font> </span></span></td>
              </tr>
			  <tr>
                <td height="29" valign="middle"><span class="label">State</span>:</td>
                <td valign="middle"><span class="row"><span class="formX">
                  <select name="pstate_sel" id="pState_sel" class="selectboxOne">
                    <option selected="selected">Select One</option>
                    <option value="FL">FL</option>
                    <option value="VA">VA</option>
                  </select>
                  <font color="#FF0000"><span class="asterisk" id="pstate_sel">*</span></font> </span></span></td>
              </tr>
              <tr>
                <td height="27" valign="middle"><span class="label">City</span>:</td>
                <td valign="middle"><span class="row"><span class="formX">
                  <input type="text" id="pCity_txt" name="pcity_txt" value="" class="textboxOne" size="20" />
                  <font color="#FF0000"><span class="asterisk" id="pcity_txt">*</span></font></span></span></td>
              </tr>
              
              <tr>
                <td height="27" valign="middle"><span class="label">Zipcode</span>:</td>
                <td valign="middle"><span class="row"><span class="formX">
                  <input type="text" name="pzip_txt" id="pzip_txt" class="textboxOne" size="17" />
                  <font color="#FF0000"><span class="asterisk" id="pzip">*</span></font></span></span></td>
              </tr>
             
            <tr>
                <td height="28" valign="middle"><span class="label">Phone</span>:</td>
                <td valign="middle"><span class="row"><span class="formX">
				<label >+</label>
                 <input type="text" name="country_phone_txt"  id="ncountry" class="textboxOne" size="4" maxlength="3"  />
                  <input type="text" name="area_phone_txt"  id="narea" class="textboxOne" size="5" />
				  <input type="text" name="no_phone_txt"  id="nphone" class="textboxOne" size="15" />
                  <font color="#FF0000"><span class="asterisk" id="pphone">*</span></font>&nbsp;</span></span></td>
              </tr>
            <tr>
                <td height="28" valign="middle"><span class="label">Mobile</span>:</td>
                <td valign="middle"><span class="row"><span class="formX">
                 	<label >+</label>
                 <input type="text" name="country_mob_txt"  id="pimob_txt" class="textboxOne" size="4"  />
                  <input type="text" name="no_mob_txt"  id="pmob_txt" class="textboxOne" size="10" />
               <font color="#FF0000"><span id="pmobile">*</span></font>
			    </span></span></td>
              </tr>
              <tr>
                <td height="28" valign="middle"><span class="label">Fax</span>:</td>
                <td valign="middle"><span class="row"><span class="formX">
                  <label >+</label>
				<input type="text" name="country_fax_txt"  id="pifax_txt" class="textboxOne" size="5"  />
				 <input type="text" name="area_fax_txt"  id="pafax_txt" class="textboxOne" size="5" />
                  <input type="text" name="no_fax_txt"  id="pfax_txt" class="textboxOne" size="15" />
                <font color="#FF0000"><span id="pfax">*</span></font>
			    </span></span></td>
              </tr>
              <tr>
                <td height="36" valign="middle"><span class="row"> <span class="label">Do you have secondary address ?</span></span></td>
                <td valign="middle">
				
					<span class="formX">
                  		<div class="floatLeft">
				  
                    <input type="radio" value="Primary" name="secAddrReqOrNot" size="10" checked="checked" onclick="showHideRadio('secAddrReqOrNot','sAdd','Secondary');" />
                    Yes
					
                    <input type="radio" value="Secondary" name="secAddrReqOrNot" size="10"  onclick="showHideRadio('secAddrReqOrNot','sAdd','Secondary');" id="addr_sec"/>
                    No						</div>
                	</span>				</td>
              </tr>
              <tr>
                <td colspan="2" align="right" valign="middle">
				
				<div id="sAdd" align="right">
				
				
                  <table width="600" border="1" cellpadding="2" cellspacing="2">
                    <tr>
                      <td height="35" colspan="2" valign="middle"><strong>Secondary Address </strong></td>
                      </tr>
                    <tr>
                      <td width="219" height="28" valign="middle"><span class="label">Plot No</span>:</td>
                      <td width="361" valign="middle"><span class="row"><span class="formX">
                        <input type="text" value="" name="sadd_txt_plot" id="splotno" class="textboxOne" size="35" />
                        <font color="#FF0000"><span class="asterisk" id="plotno">*</span></font></span></span></td>
                    </tr>
                    <tr>
                      <td height="28" valign="middle"><span class="label">Building No</span>:</td>
                      <td valign="middle"><span class="row"><span class="formX">
                        <input type="text" value="" name="sadd_txt_build_no" id="sbuildno" class="textboxOne" size="35" />
                      <font color="#FF0000"><span id="buildno">*</span></font>
					  </span></span></td>
                    </tr>
					 <tr>
                      <td height="28" valign="middle"><span class="label">Floor No</span>:</td>
                      <td valign="middle"><span class="row"><span class="formX">
                        <input type="text" value="" name="sadd_txt_floor" id="sfloor" class="textboxOne" size="35" />
                      <font color="#FF0000"><span id="floor">*</span></font>
					  </span></span></td>
                    </tr>
					 <tr>
                      <td height="28" valign="middle"><span class="label">Street Address</span>:</td>
                      <td valign="middle"><span class="row"><span class="formX">
                        <input type="text" value="" name="sadd_txt_strt_addr" id="sAdd2_txt" class="textboxOne" size="35" />
                      <font color="#FF0000"><span id="street">*</span></font>
					  </span></span></td>
                    </tr>
					 <tr>
                      <td height="28" valign="middle"><span class="label">Lane</span>:</td>
                      <td valign="middle"><span class="row"><span class="formX">
                        <input type="text" value="" name="sadd_txt_laneNo" id="sAdd2_txt" class="textboxOne" size="35" />
                      <font color="#FF0000"><span id="lane">*</span></font>
					  </span></span></td>
                    </tr>
					 <tr>
                      <td height="28" valign="middle"><span class="label">Area</span>:</td>
                      <td valign="middle"><span class="row"><span class="formX">
                        <input type="text" value="" name="sadd_txt_area" id="sAdd2_txt" class="textboxOne" size="35" />
                      <font color="#FF0000"><span id="area">*</span></font>
					  </span></span></td>
                    </tr>
					 <tr>
                      <td height="28" valign="middle"><span class="label">Country</span>:</td>
                      <td valign="middle"><span class="row"><span class="formX">
                        <select name="scountry_txt" id="sCountry_sel" class="selectboxOne" onchange="FillState(document.frmMembRegi.scountry_txt, document.frmMembRegi.sstate_txt,'');" style="width:277px;">
                        </select>
                        <!--<input type="text" value="" name="scountry_txt" id="sCountry_txt" class="textboxOne" size="30" />-->
                        <font color="#FF0000"><span class="asterisk">*</span></font></span></span></td>
                    </tr>
					<tr>
                      <td height="30" valign="middle"><span class="label">State</span>:</td>
                      <td valign="middle"><span class="row"><span class="formX">
                        <select name="sstate_txt" id="sState_sel" class="selectboxOne">
                        </select>
                        <!--<input type="text" value="" name="sstate_txt" id="sState_txt" class="textboxOne" size="25" />-->
                        <font color="#FF0000"><span class="asterisk" id="state">*</span></font></span></span></td>
                    </tr>
					                    <tr>
                      <td height="28" valign="middle"><span class="label">City</span>:</td>
                      <td valign="middle"><span class="row"><span class="formX">
                        <input type="text" value="" name="scity_txt"  id="sCity_txt" class="textboxOne" size="20" />
                        <font color="#FF0000"><span class="asterisk" id="city">*</span></font></span></span></td>
                    </tr>
                   
                    <tr>
                      <td height="29" valign="middle"><span class="label">Zipcode</span>:</td>
                      <td valign="middle"><span class="row"><span class="formX">
                        <input type="text" value="" name="szip_txt"  id="sZip_txt" class="textboxOne" size="17" />
                        <font color="#FF0000"><span class="asterisk" id="zip">*</span></font></span></span></td>
                    </tr>
                   
                    <tr>
                      <td height="27" valign="middle"><span class="label">Phone</span>:</td>
                      <td valign="middle"><span class="row"><span class="formX">
					  <label >+</label>
                 <input type="text" name="s_country_phone_txt"  id="ncountry" class="textboxOne" size="4" maxlength="3"  />
                  <input type="text" name="s_area_phone_txt"  id="narea" class="textboxOne" size="5" />
				  <input type="text" name="s_no_phone_txt"  id="nphone" class="textboxOne" size="15" />                      
				    <font color="#FF0000"><span class="asterisk" id="phone">*</span></font>&nbsp;</span></span></td>
                    </tr>
                    <tr>
                      <td height="27" valign="middle"><span class="label">Mobile</span>:</td>
                      <td valign="middle"><span class="row"><span class="formX">
                       <label >+</label>
                 <input type="text" name="s_country_mob_txt"  id="pimob_txt" class="textboxOne" size="4"  />
                  <input type="text" name="s_no_mob_txt"  id="pmob_txt" class="textboxOne" size="10" />
                      <font color="#FF0000"><span id="mobile">*</span></font>
					  </span></span></td>
                    </tr>
                    <tr>
                      <td height="28" valign="middle"><span class="label">Fax</span>:</td>
                      <td valign="middle"><span class="row"><span class="formX">
                        <label >+</label>
				<input type="text" name="s_country_fax_txt"  id="pifax_txt" class="textboxOne" size="5"  />
				 <input type="text" name="s_area_fax_txt"  id="pafax_txt" class="textboxOne" size="5" />
                  <input type="text" name="s_no_fax_txt"  id="pfax_txt" class="textboxOne" size="15" />
                    <font color="#FF0000"><span id="fax">*</span></font>
					  </span></span></td>
                    </tr>
                    <tr>
                      <td height="30" valign="middle"><span class="label">Preferred Communication Address:</span></td>
                      <td valign="middle"><span class="row"><span class="formX">
                        <select name="PreferredAddrType" id="comAdd_sel" class="selectboxOne">
                          <option selected="selected" value="Primary">Primary Address</option>
                          <option value="Secondary">Secondary Address</option>
                        </select>
                      </span></span></td>
                    </tr>
                  </table>
                  <span class="colspan"> </span></div>                  </td>
                </tr>
              <tr>
                <td height="33" colspan="2" valign="middle"><span class="colspan"> <strong>Contact Options</strong> </span></td>
                </tr>
              <tr>
                <td colspan="2" valign="middle"><span class="textCommon" style="height:40px;"> We provide Mail/E-mail information to other affiliates, organizations and vendors on a limited basis. You may choose to not receive these mailings by selecting the appropriate options below:</span></td>
              </tr>
              <tr>
                <td colspan="2" valign="middle"><span class="textCommon" style="height:40px;">
                  <input type="checkbox" name="nonUseaEmail"  id="nonUseaEmail_id" value="true"/>
                  Do not release my email address for specific use.</span></td>
              </tr>
              <tr>
                <td colspan="2" valign="middle"><span class="textCommon" style="height:40px;">
                  <input type="checkbox" name="nonUseaMail"  id="nonUseaAdd_id" value="true"/>
                  Do not release my mailing address for specific use.</span></td>
              </tr>
              <tr>
                <td colspan="2" valign="middle" align="center">&nbsp;</td>
              </tr>
              <tr>
                <td height="36" colspan="2" align="center" valign="top"><label>
                  <img src="images/register_button.jpg" alt="" width="20px" height="20px" style="cursor:pointer"/><input type="submit" name="Submit" value="Register" class="button-add" /></label>               </td>
              </tr>
            </table>
          </div>
        </form>
      </div></td>
      
    </tr>
    
  </table>
</td>
      
    </tr>
	 <tr><td>&nbsp;</td></tr>
    
  </table><!--=======footer=================================-->
 <footer>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
							<%@ include file = "../../include/Footer.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </footer>
 <script type="text/javascript">
			

//-------------------------------- User status validation Ajax Script ------------------------------------------------

var httpRequest;

function usrStat()
{

if(document.getElementById("frmMembRegi_usrname").value!="" && document.getElementById("frmMembRegi_usrname").value.indexOf(' ')!=0)
	{

   var chsUserName=document.getElementById("frmMembRegi_usrname").value
   
   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
        url="user.html?cmd=checkusrnam&chsUserName="+chsUserName; 

        if (window.ActiveXObject) 
        { 
            httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
        } 
        else if (window.XMLHttpRequest) 
        { 
            httpRequest = new XMLHttpRequest(); 
        } 
     
        httpRequest.open("GET", url, true); 
        
        httpRequest.onreadystatechange =processUser; 
        httpRequest.send(null); 
   } 
   }
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
    function processUser() 
    { 
   
        if (httpRequest.readyState == 4) 
        { 
            if(httpRequest.status == 200) 
            { 
                //get the XML send by the servlet 
                 var salutationXML = httpRequest.responseXML.getElementsByTagName("userstatus")[0]; 
                 var salutationText = salutationXML.childNodes[0].nodeValue; 
     
                //Update the HTML 
                updateHTML(salutationXML); 
            } 
            else 
            { 
                alert("Error loading page\n"+ httpRequest.status +":"+ httpRequest.statusText); 
            } 
        } 
    } 
        
   /** 
    * This function parses the XML and updates the  
    * HTML DOM by creating a new text node is not present 
    * or replacing the existing text node. 
    */ 
    function updateHTML(salutationXML) 
    { 
        //The node valuse will give actual data 
        var salutationText = salutationXML.childNodes[0].nodeValue; 

		if(salutationText != "false")
		{
			alert("User Name already Exists Choose Another !");
			document.getElementById("frmMembRegi_usrname").value="";
			document.getElementById("frmMembRegi_usrname").focus();
		}
		      
    } 

			 
 </script>
 <script language="javascript">
	FillCountry(document.frmMembRegi.pcountry_sel, document.frmMembRegi.pstate_sel, 'USA' );
	FillState(document.frmMembRegi.pcountry_sel, document.frmMembRegi.pstate_sel, '');

	FillCountry(document.frmMembRegi.scountry_txt, document.frmMembRegi.sstate_txt, 'USA' );
	FillState(document.frmMembRegi.scountry_txt, document.frmMembRegi.sstate_txt, '');
	


</script>
</body>
</html>

