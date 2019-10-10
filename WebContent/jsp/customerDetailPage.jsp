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
<style type="text/css">

.tdspace{
width:200px;
}
</style>
<style>
    .vertical-line {
        width: 0;
        border: 1px solid #000000;
        height: 1px
		 
    }
</style>
<style type="text/css">
	   
	.divtext{
    height: 11px;
    width: 610px;
    padding: 15px 0 15px 0;
    margin: 0 auto;
	
	}
	.divPasstext{
    height: 11px;
    width: 610px;
    padding: 15px 0 15px 0;
    margin: 0 auto;
	color: rgba(21, 152, 25, 0.98);
    font-weight: bold;
    font-family: sans-serif;
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
	text-align:left!important;
	pointer-events:none;
	background-color:#009FBC!important;
	color:#FFFFFF
	
	}
	
	.boxx{    width: 363px!important;
    padding: 7px -1px!important;
    border: none;
    border-radius: 4px;
    box-shadow: 0 1px 7px #ccc;
	margin:0!important;
	color:#FFFFFF;
	text-align:center!important;
	background-color:lightslategray}
	#anchorStyle{
	margin-right: -996px;
    color: #0950EF!important;
    font-family: sans-serif;
    font-weight: bold;
    font-style: italic;
	text-decoration: underline;
	}
	
	
	   </style>
</head>
<body>

<div>
<%@ include file = "../../include/HeaderProcess.jsp" %>
</div>

<div>
<%@ include file = "../../include/infobar.jsp" %>
</div>

			
<!--=======content================================-->
<%String customerPassStatus = (String)request.getAttribute("customerPassStatus");
if((customerPassStatus!=null) && (customerPassStatus.equalsIgnoreCase("success"))){%>
			<div class="divPasstext"  align="center">Password reseted successfully</div>
			<%} else if((customerPassStatus!=null) && (customerPassStatus.equalsIgnoreCase("fail"))){
			%>
			<div class="divPasstext"  align="center">Password can not reseted successfully</div>
			
			<%}%>
<%ArrayList customerDetails = (ArrayList) request.getAttribute("customerDetails");

          					 if(customerDetails!=null && customerDetails.size()!=0){
							Iterator it = customerDetails.iterator();
							while(it.hasNext()){
								String[] s = (String[])it.next();
								
								 String first_name = s[0];
			    	             String last_name = s[1];
			    	             String e_mail = s[2];
			    	             String mobile = s[3];
			    	             String institution_name = s[4];
			    	             String country = s[5];
			    	             String state = s[6];
			    	             String city = s[7];
			    	             String credit_card_type = s[8];
			    	             String credit_card_no = s[9];
			    	             String cvv_no = s[10];
			    	             String name_on_card = s[11];
			    	             String expiry_date = s[12];
			    	             String customer_id = s[13];
			    	             String date = s[14];
			    	             String product_price = s[15];
			    	             String subscription_type = s[16];
			    	             String subscription_id = s[17];
			    	             String order_id = s[18];
			    	             String purchase_type = s[19];
			    	             String product_plan = s[20];
			    	             String user_name = s[21];
			    	             String user_password = s[22];
			    	             String registration_id = s[23];
								 System.out.println("email id inside the jsp:::::::::::::::::::::::::::"+e_mail);
			    	             %>
								 
			
								 
           <div class="bg1" align="center" style="height:auto;">
 <div class="container_12">
               <div class="grid_12 center" style="border:thin;border-style:groove;">

<div class="divtext"  align="center" >
						<h2 style="color:rgba(202, 122, 4, 0.99)">Customer Details</h2>
						
					</div>
					<div class="divtext"  align="center" >
						<label class="labeltext">First name: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=first_name %>" class="box" ></span>
					</div>

                     <div class="divtext"  align="center" >
						<label class="labeltext">Last name: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=last_name %>" class="box" ></span>
					</div>
                     
					  <div class="divtext"  align="center" >
						<label class="labeltext">E-mail : </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=e_mail %>" class="box" ></span>
					</div>

                      <div class="divtext"  align="center" >
						<label class="labeltext">Mobile: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=mobile %>" class="box" ></span>
					</div>

					<div class="divtext"  align="center" >
						<label class="labeltext">Institution name: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=institution_name %>" class="box" ></span>
					</div>
					
					<div class="divtext"  align="center" >
						<label class="labeltext">Country: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=country %>" class="box" ></span>
					</div>
					
					<div class="divtext"  align="center" >
						<label class="labeltext">State: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=state %>" class="box" ></span>
					</div>
					
					<div class="divtext"  align="center" >
						<label class="labeltext">City: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=city %>" class="box" ></span>
					</div>
					
					<div class="divtext"  align="center" >
						<label class="labeltext">Customer id: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=customer_id %>" class="box" ></span>
					</div>
					
					<div class="divtext"  align="center" >
						<label class="labeltext">User name: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=user_name %>" class="box" ></span>
					</div>
					
					<div class="divtext"  align="center" >
						<label class="labeltext">User password: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=user_password %>" class="box" ></span>
						<a href="./customerAction.html?custProcess=changeCustomerPass&customerId=<%=customer_id%>" id="anchorStyle">change password</a>
					</div>
					
					<div class="divtext"  align="center" >
						<label class="labeltext">Registration id: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=registration_id %>" class="box" ></span>
					</div>




</div>

<div>&nbsp;</div>
<div>&nbsp;</div>
<div class="grid_12 center" style="border:thin;border-style:groove;">

<div class="divtext"  align="center">
						<h2 style="color:rgba(202, 122, 4, 0.99)">Customer Card and Purchase Details</h2>
						
					</div>
					<div class="divtext"  align="center" >
						<label class="labeltext">Expiry date: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=expiry_date %>" class="box" ></span>
					</div>

                     <div class="divtext"  align="center" >
						<label class="labeltext">Date of purchase: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=date %>" class="box" ></span>
					</div>
                     
					  <div class="divtext"  align="center" >
						<label class="labeltext">Product price : </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=product_price %>" class="box" ></span>
					</div>
 
                      <div class="divtext"  align="center" >
						<label class="labeltext">Subscription type: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=subscription_type %>" class="box" ></span>
					</div>

					<div class="divtext"  align="center" >
						<label class="labeltext">Subscription id: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=subscription_id %>" class="box" ></span>
					</div>
					
					<div class="divtext"  align="center" >
						<label class="labeltext">Order id: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=order_id %>" class="box" ></span>
					</div>
					
					<div class="divtext"  align="center" >
						<label class="labeltext">Purchase type: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=purchase_type %>" class="box" ></span>
					</div>
					
					<div class="divtext"  align="center" >
						<label class="labeltext">Product plan: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=product_plan %>" class="box" ></span>
					</div>
					
					<div class="divtext"  align="center" >
						<label class="labeltext">Credit card type: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=credit_card_type %>" class="box" ></span>
					</div>
					
					<div class="divtext"  align="center" >
						<label class="labeltext">Credit card no: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=credit_card_no %>" class="box" ></span>
					</div>
					
					<div class="divtext"  align="center" >
						<label class="labeltext">CVV no: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=cvv_no %>" class="box" ></span>
					</div>
					
					<div class="divtext"  align="center" >
						<label class="labeltext">Name on card: </label>
						<span class="spantext" ><input  type="text" name="username"   style="width:250px; height:20px;"
						value="<%=name_on_card %>" class="box" ></span>
					</div>




</div>
</div>
</div>
 <%
							}
          					 }
          					 else{
          						 %>
					<div class="bg1" align="center" style="height:413px">
 						<div class="container_12">
								<div class="grid_12 center" style="border:thin;border-style:groove;">

								<div class="divtext"  align="center">
						<h2 style="color:rgba(202, 122, 4, 0.99);margin-top: -13px;">No Record Found!</h2>
					</div>
					
					</div>
					</div>
</div>
					 <%
          					 }
								 %>






















        <div>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </div>
</body>
</html>
