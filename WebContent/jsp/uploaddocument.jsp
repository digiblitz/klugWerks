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
    <%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Klugwerks</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/changePassword.js" type="text/javascript" ></script>
<script type="text/javascript">

      
 
        $(document).ready(function(){  
           $(".menu li a").each(function() { 

               if ($(this).next().length > 0) { 

                   $(this).addClass("parent");  
               };  
           })  
           var menux = $('.menu li a.parent');  
           $( '<div class="more"><img src="btn-hamburger.png" alt=""></div>' ).insertBefore(menux);  
           $('.more').click(function(){  
                $(this).parent('li').toggleClass('open');  
           });  
           $('.menu-btn').click(function(){  
              $('nav').toggleClass('menu-open');  
          });  
       });  
    
	function dothat() {  
	alert("aaa");
   var div = document.getElementById('fileuploads');  
    var field = div.getElementsByTagName('input')[0];  
      
    div.appendChild(document.createElement("br"));  
    div.appendChild(field.cloneNode(false));  
}

     </script>
</head>






<body>

<header id="header">
<!-- HEADER STARTS HERE -->
<%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</header>



  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0" class="content_new" align="center">
                <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>

    <tr>
	
      <td  align="center" valign="middle" class="tableCommonBg" >





<div class="content">
  <div class="container_12 ">
      <div class="" align="center" style="vertical-align:middle">
      
     <label><strong>File Upload</strong></label>
	    <table width="800" border="1" style="border-left-style:groove;border-left-width:thin;border-right-style:groove;border-right-width:thin;border-bottom-style:groove;border-bottom-width:thin; border-top-style:groove; border-top-width:thin;" >
<tr><td>
       <FORM ENCTYPE="multipart/form-data" ACTION="ExterApp.html?process=uploaddocument&userId=<%=userId%>" METHOD=POST name="uploadfile">
 


 
<table width="100%">
      
     
       <tr>
	   
            <td  height="40" width="300"><br /><label>&emsp;Choose the Document To Upload:</label></td>
           <td> 
		    <div id="fileuploads">
		    <INPUT NAME="file" TYPE="file" multiple="muliple" required/>
		    <input type="button" name="addmore" id="addmore" value="Add More" onClick="dothat();"/></div>
		   </td>
      </tr>
     
      <tr>
	  <td>&nbsp;</td>
            <td colspan="2" width="296" align="left"><br />
				<label>
					<img src="images/upload-icon.png" alt="" width="20" height="20" style="cursor:pointer"/>
						<input type="submit" value="Send File"   style=" background-color: transparent; border:none; cursor:pointer;  width:70px; height:20px;">
				</label>
				<label>
					<img src="images/cancel-icon-button.png"  width="20" height="20" style="cursor:pointer"/>
						<input name="button" type="button" class="gradBtn" style="background-color: transparent; border:none; cursor:pointer;  width:50px; height:20px;"  onClick="javascript:history.back(-1);" value="Cancel" >
				</label>
				
			</td>
			
      </tr>
	  <tr><td colspan="2">&nbsp;</td></tr>
     </table></FORM></td></tr></table>
	 
	  <%
								String status=(String)request.getAttribute("status");
                                                                System.out.println("status from jsp :"+status);
																
																
									
								
									if( status!=null && status.equalsIgnoreCase("success"))
									{%>
									<div>File Uploaded Successfully</div>
									<%}%>
          
            
     <br><br>  
    </div>   
  </div>   
</div>


</td>
    </tr>
	<tr><td>&nbsp;</td></tr>
</table>




 <footer>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </footer>
</body>
<script type="text/javascript">


function onValidate()
{
	if(document.uploadfile.file.value==""){
		alert("File name cannot be empty");
		document.uploadfile.file.focus();
		return false;
	}
	
	return true;
}
</script>
</html>
