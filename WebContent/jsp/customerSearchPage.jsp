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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
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
	.submitlabeltext{
	   float:none;
	   font-size:18px;
	}
	.bg1 {
    position: relative;
    background: url(../images/bg1.jpg) 0 0 repeat;
    padding: 30px 0!important;
	height:289px
}
	.box{    width: 350px!important;
    padding: 7px!important;
    border: none;
    border-radius: 4px;
    box-shadow: 0 1px 7px #ccc;
	margin:0!important;
	text-align:left!important;}
	.btnstyle{
	background-color: transparent;
	border:thin;
	border-style: groove;
	cursor:pointer;  
	width:61px; 
	height:29px;
	outline-color:#009FBC;
	color:009FBC
	}
	.btnstyle:hover{
	background-color: #009FBC;
	border:thin;
	border-style: groove;
	cursor:pointer;  
	width:61px; 
	height:29px;
	outline-color:#009FBC;
	color:#FFFFFF
	}
</style>
<body>
<div>
<%@ include file = "../../include/HeaderProcess.jsp" %>
</div>

<div>
<%@ include file = "../../include/infobar.jsp" %>
</div>

			<div class="bg1" align="center" style="height:412px;">

<!--=======content================================-->


            <div class="container_12">
			<div>&nbsp;</div>
			<div>&nbsp;</div>
                <div class="grid_12 center" style="border:thin;border-style:groove;">
                 
<form action="customerAction.html?custProcess=getCustomerDetails" method="post">
<div class="divtext"  align="center" >
						<h1 style="font-size:30px;color:rgba(202, 122, 4, 0.99)">Search Customer Information</h1>
						
						</div>
						&nbsp;
					<div class="divtext"  align="center" >
					<label class="labeltext">Customer Id: </label>
						<span class="spantext" ><input  type="text" name="customerId"   style="width:250px; height:20px;" class="box" ></span>
						
					</div>
						
						<div class="divtext"  align="center" >
					
						<label class="submitlabeltext">
						<input type="submit" name="Insert" value="Search" class="btnstyle">
						</label>
						</div>
						 </form>
						</div>
						</div>
						
		<!--table border="0" width="300" align="center" bgcolor="#e9f" style="margin-right:auto; margin-left:auto;">
			<tr>
				<td colspan=2 style="font-size: 12pt;">
					<h1>Search Customer Information</h1>
				</td>
			</tr>
			<tr>
				<td><b>Customer Id</b></td>
				<td>: <input type="text" name="customerId">
				</td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="submit"
					value="Search"></td>
			</tr>
		</table>
	</form>
			</div>
                
 			 </div>
 			 </div-->
 			</div>
			
			 <div>			 
			
                  
				    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
</div>
</body>
</html>
