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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
     <head>
     <title>Coupon code validation</title>
    
     </head>
     
     <%String statusCoupon = null;
String coupon_status = null;
String coupon_value = null;
String coupon_description = null;
String coupon_valid = null;
String coupon_code = null;

statusCoupon = (String) request.getAttribute("statusCoupon");

coupon_status = (String)request.getAttribute("coupon_status");
coupon_value = (String)request.getAttribute("coupon_value");
coupon_description = (String)request.getAttribute("coupon_description");
coupon_valid = (String)request.getAttribute("coupon_valid");
coupon_code = (String)request.getAttribute("coupon_code");
%>
<body id="top">

<!--==============================header=================================-->

    <%@ include file = "../../include/Header.jsp" %>


<div class="bg1">

<!--=======content================================-->

    <div id="content">

	
		<div class="p44">
            <div class="container_12">
                <div class="grid_6">
				</div>
			</div>
		</div>

		<div class="p44">
            <div class="container_12">
                <div class="grid_6">
				</div>
			</div>
		</div>

        <div class="p44">
			<div class="container_12 center">
				<div class="grid_12">
					<div class="center">
                 		<form action="signUp.html?signUpProcess=aftergetcoupon" name="" method="post">
                             <%if(statusCoupon != null && statusCoupon.equalsIgnoreCase("success")){ %>
                                <p><strong>Coupon Code Successfully validated ! </strong></p>
								<p>&nbsp;</p>
                                
                                <input type="hidden" name="coupon_status" value="<%=coupon_status%>"/>
                                <input type="hidden" name="coupon_value" value="<%=coupon_value%>"/>
                                <input type="hidden" name="coupon_description" value="<%=coupon_description%>"/>
                                <input type="hidden" name="coupon_valid" value="<%=coupon_valid%>"/>
                                <input type="hidden" name="coupon_code" value="<%=coupon_code%>"/>
                                
                                <input type="submit" name="Submit" value="Go to Sign Up" style="color:#bf7e03;background-color: transparent;border-color: #e39500;"/>
                                
                                <%}else{ %>
                                <p><strong>Invalid Coupon code ! Please give valid coupon code. </strong></p>
								<p>&nbsp;</p>
                                <strong><a href="signUp.html?signUpProcess=askcoupon&requiredcoupon=yescoupon"  style="color:#bf7e03;background-color: transparent;border-color: #e39500;">Go back to Apply Coupon Code</a></strong>
                                <%} %>
						</form>
					</div>                   
                </div>                                
            </div>                                 
        </div>

		<div class="p44">
            <div class="container_12">
                <div class="grid_6">
				</div>
			</div>
		</div>

		<div class="p44">
            <div class="container_12">
                <div class="grid_6">
				</div>
			</div>
		</div>

    </div>
</div>

<!--=======footer=================================-->

 <footer>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/Footer.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </footer>

</body>
</html>
