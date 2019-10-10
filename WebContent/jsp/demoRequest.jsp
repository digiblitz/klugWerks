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
     <title>Demo Request</title>
     <link rel="stylesheet" href="css/form.css">   
     </head>
<body id="top">

<!--==============================header=================================-->

    <%@ include file = "../../include/Header.jsp" %>

<div class="bg1">

<!--=======content================================-->

    <div id="content">

		

		<div class="p44">
            <div class="container_12">
				<div class="grid_5">
				&nbsp;
				</div>
                <div class="grid_7">
				<h2>Demo Request</h2>
				</div>
			</div>
		</div>
		<div class="p44">
            <div class="container_12">
                <div class="grid_6">
				
				</div>
			</div>
		</div>

        <div class="p88">
            
            <div class="container_12 center">
				
				<div class="grid_4">
				&nbsp;
				</div>

                <div class="grid_6">
				
				<form accept-charset="UTF-8" action="https://ho192.infusionsoft.com/app/form/process/546cba3d413c95f91afb1f66eb3fb6de" class="infusion-form" method="POST" id="form">
					<input name="inf_form_xid" type="hidden" value="546cba3d413c95f91afb1f66eb3fb6de" />
					<input name="inf_form_name" type="hidden" value="KW-demo request form" />
					<input name="infusionsoft_version" type="hidden" value="1.59.0.51" />

					<label class="name">
					<div class="infusion-field">
						
						<input class="infusion-field-input-container" id="inf_field_FirstName" name="inf_field_FirstName" type="text" placeholder="Name"/>
					</div>
					</label>

					<label class="name">
					<div class="infusion-field">
						
						<input class="infusion-field-input-container" id="inf_field_Email" name="inf_field_Email" type="text" placeholder="Email"/>
					</div>
					</label>

					<label class="name">
					<div class="infusion-field">
						
						<input class="infusion-field-input-container" id="inf_field_Phone1" name="inf_field_Phone1" type="text" placeholder="Phone"/>
					</div>
					</label>

					<label class="name">
					<div class="infusion-submit">
						<input type="submit" value="Submit" style="color:#bf7e03;background-color: transparent;border-color: #e39500;"/>
					</div>
					</label>

				</form>
			<script type="text/javascript" src="https://ho192.infusionsoft.com/app/webTracking/getTrackingCode?trackingId=b592766f8ddb5fc8d319956c6b7b8ce6"></script>


				
                   
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
