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
<title>Profile Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/validate.js" type="text/javascript" ></script>
<script src="js/cscombo_new.js" type="text/javascript" ></script>
<script src="js/frmMembRegi.js" type="text/javascript" ></script>
<script src="js/EditMemberUserReg.js" type="text/javascript" ></script>
</head>
<%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
<style>
    .vertical-line {
        width: 0;
        border: 1px solid #000000;
        height: 1px
		 
    }
</style>
<style type="text/css">
	   
	   .divtext{
      height: 22px;
    width: 610px;
    padding: 15px 0 15px 0;
    margin: 0 auto;
	
	}
	
	.labeltext{
	   float:left;
	   font-size:18px;
	}
	.submitlabeltext{
	   float:none;
	   font-size:18px;
	}
	.spantext{
	   float:right
	}
	.container_12{
		width:1170px!important;
		margin:0 auto;
		position:relative;
		
	}
	.container_12 .grid_12 {
    	width: 1170px!important;
		    padding: 10px 0;
	}
	.container_12 .grid_6 {
		width: 565px!important;
		float: left;
	}
	.bg1 {
    position: relative;
    background: url(../images/bg1.jpg) 0 0 repeat;
    padding: 30px 0!important;
}
	button.btn {
    background: green;
    outline: mediumaquamarine;
    border: none;
    padding: 8px 10px;
}
	button.btn1 {
    background: red;
    outline: mediumaquamarine;
    border: none;
    padding: 8px 10px;
}
	.box{    width: 350px!important;
    padding: 7px!important;
    border: none;
    border-radius: 4px;
    box-shadow: 0 1px 7px #ccc;
	margin:0!important;
	text-align:left!important;}
	
	.boxx{    width: 363px!important;
    padding: 7px -1px!important;
    border: none;
    border-radius: 4px;
    box-shadow: 0 1px 7px #ccc;
	margin:0!important;
	color:#FFFFFF;
	text-align:center!important;
	background-color:lightslategray}
	   </style>

<body>

<div>
<%@ include file = "../../include/HeaderProcess.jsp" %>
</div>
<div><%@ include file = "../../include/infobar.jsp" %></div>

<%String mail=(String)request.getAttribute("e_mail");

System.out.println("In JSP =================="+mail);%>
<!--=======content================================-->
<div class="bg1" align="center" style="height:412px;">

 <div class="container_12">
                <div class="grid_12 center" style="border:thin;border-style:groove;">
				
				 <form  action="masterAccount.html?profileCmd=updateprofile&e_mail=<%=nullCheck((String)request.getAttribute("e_mail"))%>" method=post name="uploadfile">
                <%request.getAttribute("upstatus"); %>
               
			
                  <div class="divtext"  align="center" >
						<h2>User Profile Details</h2>
						
					</div>
					<div class="divtext"  align="center" >
					
						<label class="labeltext">User Name: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
value="<%=nullCheck((String)request.getAttribute("username"))%>" class="box" ></span>
						
					</div>
					<div class="divtext"  align="center" >
						<label class="labeltext">Password:</label>
						<span class="spantext" ><input  type="text" name="password" style="width:250px; height:20px;"  
value="<%=nullCheck((String)request.getAttribute("password"))%>" class="box"></span>
						
					</div>
					<div class="divtext"  align="center" >
						<label class="labeltext">Business Name:</label>
						<span class="spantext" ><input  type="text" name="institutionname" style="width:250px; height:20px;"  
value="<%=nullCheck((String)request.getAttribute("institutionname"))%>" class="box"></span>
						
					</div>
					<div class="divtext"  align="center" >
						<label class="labeltext">Email:</label>
						<span class="spantext" ><input  type="text" name="email" id="email" style="width:250px; height:20px;"  
  value="<%=nullCheck((String)request.getAttribute("e_mail"))%>" class="box"></span>
						
					</div>
					<div class="divtext"  align="center" >
						<label class="labeltext">Customer Id:</label>
						<span class="spantext" ><input  name="customerid" id="customerid" style="width:250px; height:20px;"
  value="<%=nullCheck((String)request.getAttribute("customer_id"))%>" class="box" readonly></span>
						
					</div>
					
					<div class="divtext"  align="center" >
					
						<label class="submitlabeltext"><img src="images/update.jpg" alt="" width="20" height="20" style="cursor:pointer"/>
						<input type="submit" name="Insert" value="Update" style=" background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;">
						</label>
						
						<label class="submitlabeltext"><img src="images/Cancel.png"  width="20" height="20" style="cursor:pointer"/>
						<input name="button" type="button" class="gradBtn" style=" background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
						</label>
						
					</div>
					</form> 
			</div>
               
 			 </div>
			 </div>










<!------------------------------------->

  

<!--=======footer=================================-->
	<footer>		
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
           </footer>    

</body>

</html>
