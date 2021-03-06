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
<html>
<head>
<title>Lavita</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>

.img-circle {
    border-radius: 50%;
	width: 50px;
    height: 50px%;
}
</style>

<link rel="stylesheet" type="text/css" href="jsp/myChatApp/LavitaStyle.css" />


<script src="jsp/myChatApp/chatScript.js"> </script>
</head>


<body>

<div class="myChat_box">

<div class="myChat_head">Chat Box
</div>

<div class="myChat_body">

<div class="user" id="user0" data-id="0" >
<img class="img-circle" src="img/Lavita/2.png" width="50px" height="50px">
<label class="lavita">Lavita</label>
</div>
	
</div>
</div>

<div class="chatBox" ></div>

<!-- this is for joey user 0 -->
<div class="msg_box" style="right:290px;" >
<div class="msg_head" >
<label class="msg_head_label">Talk to Lavita</label>
<div class="arrow_down"></div>
<div class="arrow_up"></div>
<div class="close" >X</div>
</div>

<div class="msg_slideDown" id="slideDown" >
<div class="msg_body" > 
<div class="msg_a"><img class="img-circle" src="img/Lavita/2.png" width="50px" height="50px">Hi i am Lavita!</div>
<!--div class="msg_b">This is B</div-->
<div class="msg_insert"></div>
</div>
<div class="msg_footer" > <textarea class="msg_input" rows="4" placeholder="Enter Query Here"></textarea> </div>
</div>

</div>


</body>

</html>
