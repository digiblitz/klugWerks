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
<%@ page language="java" contentType="text/html; charset=iso-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
</head>
<script src="js/basic.js" type="text/javascript" ></script>


<body>

<header id="header">
<%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</header>
  <table width=100% border="1" cellpadding="0" cellspacing="0" class="content_new" align="center"  height="350">



        <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>

    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
	  <table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" style="border:thin;border-style:groove;">
  <tr>
    <td class="tableCommonBg">
		
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
		  <tr>
			<%
                       String usrnam=(String)request.getAttribute("usrname");
                       String pwd=(String)request.getAttribute("cpwd");
                       String actStat=(String)request.getAttribute("actStat");
                       String regStatus="";
                       
                       if(actStat!=null)
                       {
                           System.out.println(" request.getAttribute(actStat) in JSP :"+actStat);
                           regStatus="Active";
                       }
                       else
                       {
                           regStatus="Pending until payment processed";
                       }
                       
                    %>
                    
                    
			<td width="100%" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer">
  <tr style="border-bottom-width:thin;border-bottom-style:groove;">
    <td colspan="2" class="tblMainHead">
		Membership Registration: <span class="styleBoldTwo">Confirmation.	</span></td>
  </tr>
  <tr>
    <td colspan="2" class="tblDescrp" valign="top" style="padding:8px;">
	<form name="confirmation" method="post" action="MemberLogin.html" />
	<%
		String redirurl = "";
		String source = (String)session.getAttribute("forEE");
		String membid=(String)request.getAttribute("memberId");
		String membTyp=(String)request.getAttribute("membTyp");
		String amt=(String)request.getAttribute("tot_amt");
         Date expdate=(Date)session.getAttribute("exp_date");
		 String finalDate= "N/A";
         if(expdate!=null){
			 String temp_date = expdate.toString();
			 String[] split_date = temp_date.split("-");
			 String yr = split_date[0];
			 String month = split_date[1];
			 String day = split_date[2];
			 finalDate = month+"-"+day+"-"+yr;
		 }

		Calendar c = Calendar.getInstance();
		int day = c.get(Calendar.DATE);
		int month = c.get(Calendar.MONTH);
		int year = c.get(Calendar.YEAR);
		month=month+1;
		String date = month+"-"+day+"-"+year;
		String regDat="";
		if(session.getAttribute("regStatus")!=null){
			regDat=(String)session.getAttribute("regStatus");
        }
		String s = amt;
		if(s.indexOf('.')==-1){
			s= s+".00";
			amt=s;
		}
		if(s.indexOf('.')!=-1){
		String t = s.substring(s.indexOf('.'));
			if(t.length()==2){
				s=s+"0";
				amt=s;
			}
	  	}
		
		if(source!=null && source.equalsIgnoreCase("fromEventEntry")){
			redirurl = "OEEDemo.html?process=UserListing";
		}else{
			redirurl = "index.jsp";
		}
	%>
	
      You have successfully registered<strong> </strong> <strong></strong>. Registration details are as follows:<br />
      <br />
      <strong> No.:</strong> <span class="styleBoldOne"><%=membid%></span> <br />
      <strong>Member Type:</strong> <span class="styleBoldOne"> <%=membTyp%> </span> <br />
      <strong>Expiry Date:</strong> <span class="styleBoldOne"> <%=finalDate%> </span> <br />
      
	  <%
	      SimpleDateFormat formatter=new SimpleDateFormat("MM/dd/yyyy");
          session.setAttribute("exp_date",null);
          session.setAttribute("regStatus",null);
		  
        //expdate.setDate(expdate.getDate() +1);
		%>
	  
	      <strong>Registration Date:</strong> <span class="styleBoldOne"> <%=date%> </span> <br />
	  
      <strong>Registration Status:</strong> <span class="styleBoldOne"><%=regStatus%></span><br />
      <br />
      
	  If paying by check, please mail your payment of <strong> $ <%=amt%>(U.S. Dollars) </strong> to:
	  <br />
	  <br />
	  
      <strong><br />
      Membership Registration<br />
      525 Old Waterford Road NW<br />
      Leesburg, VA 20176<br />
      <br />
	  </strong>Please include member's name and No. on check!
      <br />
      <br />
   
      <input name="button" type="button" class="gradBtn" value="Back" onclick="location.href='<%=redirurl%>'" />
      <input name="button" type="button" class="gradBtn" value="Print This Page" onclick="window.print();" />
      <br />
	  </form>    </td>
  </tr>
  <tr>
  	<td>&nbsp;</td>
  </tr>
  
  <tr>
    <td height="20">&nbsp; <!-- DO NOT DELETE THIS ROW --></td>
  </tr>
</table>

			<!-- CONTENTS END HERE -->			</td>
		  </tr>
	  </table>	</td>
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
</html>
