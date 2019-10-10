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

<html lang="en">
     <head>
     <title>Coupon Enquiry</title>
    
     </head>
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
                 <form action="signUp.html?signUpProcess=askcoupon" name="" method="post">
                                <p><strong>Do you have a Coupon code : </strong>
                               
                                <input type="radio" name="requiredcoupon" value="yescoupon"/><strong>yes</strong>
								&nbsp;

                                <input type="radio" name="requiredcoupon" value="nocoupon"/><strong>no</strong>
                              
                                </p>
								<p>&nbsp;</p>
                                 
                                <input type="submit" name="Submit" value="Submit" style="color:#bf7e03;background-color: transparent;border-color: #e39500;"/>
								&nbsp;

								<input type="button" name="Cancel" value="Back" onclick="window.history.back()" style="color:#bf7e03;background-color: transparent;border-color: #e39500;"/>
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
