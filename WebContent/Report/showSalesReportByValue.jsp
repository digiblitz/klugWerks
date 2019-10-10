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
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-base.css" />
<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-topbar.css" />
<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-sidebar.css" />


<link rel="stylesheet" type="text/css" href="css/EAframe.css" />
<link rel="stylesheet" type="text/css" href="css/Usermenu.css" />
<link rel="stylesheet" type="text/css" href="css/table.css" />
<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-base.css" />
<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-topbar.css" />
<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-sidebar.css" />
<script src="js/basic.js" type="text/javascript" ></script>
<script>
    function UpdateSelect()
{
select_value = document.salesPage.view.value;
var id = 'hide_this_row';
var obj = '';
obj = (document.getElementById) ? document.getElementById(id) : ((document.all) ? document.all[id] : ((document.layers) ? document.layers[id] : false));

if(select_value =2)
{
obj.style.display = ( obj.style.display != "none" ) ? "none" : "";//Hide Fields
}
else
{
obj.visibility = "show";//Show Fields
}
}
 function goSubmit(type)
 {
     if(type=='quarterSalesByItemParticularYear')
         {
             document.salesPage.action='salesReport.do?process=quarterSalesByItemParticularYear';
           } 
       if(type=='quarterSalesAllItemsParticularYear')
           {
           document.salesPage.action='salesReport.do?process=quarterSalesAllItemsParticularYear';    
           }
          if(type=='yearlySalesItemWise')
           {
           document.salesPage.action='salesReport.do?process=yearlySalesItemWise';    
           } 
           
     }
	 </script>
<script type="text/javascript" src="js/ddlevelsmenu.js">

/***********************************************
* All Levels Navigational Menu- (c) Dynamic Drive DHTML code library (http://www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/


</script>
</head>


<body onload="searchSec()">

<header id="header">
<%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</header>
  <table width=100% border="1" cellpadding="0" cellspacing="0" class="content_new" align="center"  height="350">



        <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>

    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
	  <table width="700" border="1" align="center" cellpadding="0"  id="centerTab">
	  <tr>
    	<td class="bg">
	 		<span class="text8"><strong>Sales Report</strong></span>		</td>
  	</tr>
        <tr>
          <!-- LEFT MENU STARTS HERE -->
          <!-- <%@ include file = "ADV_MappingRoleLeftBar.html" %> -->
          <!-- LEFT MENU ENDS HERE -->
          <td  class="subDeptTablePad"><!-- CONTENTS START HERE -->
              <table border="1" cellpadding="0" align="center" cellspacing="0" class="formLayout">
                <tr>
                  <td height="61" colspan="2" bgcolor="#e2eaf2" class="tblDescrp"><strong>
                    <%  if (request.getParameter("type").equalsIgnoreCase("quarterSalesByItemParticularYear")) { %>
                    <b>Quarterly Sales By Item For Particular Year </b>
                    <%  } else if(request.getParameter("type").equalsIgnoreCase("quarterSalesAllItemsParticularYear")) { %>
                    <b>Quarter Wise Sales All Items For Particular Year </b>
                    <% } else if(request.getParameter("type").equalsIgnoreCase("yearlySalesItemWise")) { %>
                    <b>Quarter Wise Sales All Items For Particular Year </b>
                    <% } %>
                    </strong><br />
                    <br />
                  </td>
                </tr>
                <form method="post" name="salesPage" id="salesPage" onsubmit="goSubmit('<%=(String)request.getParameter("type") %>')" >
                  <tr>
                    <td><table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
                        <tr>
                          <td class="tableLeft"><strong>Select Year :</strong></td>
                          <td class="tableRight"><select name="year" id="year">
                              <option value='2006'>2006</option>
                              <option value='2007'>2007</option>
                              <option value='2008'>2008</option>
                              <option value='2009'>2009</option>
                          </select></td>
                        </tr>
                        <% if(request.getParameter("type").equalsIgnoreCase("quarterSalesByItemParticularYear")) { %>
                        <tr>
                          <td class="tableLeft"><strong>Select Item :</strong></td>
                          <td class="tableRight"><select name="item" id="item">
                              <option value='101'>Engine Assembly</option>
                              <option value='102'>Transmission Assembly</option>
                              <option value='103'>Engine Control Module</option>
                          </select></td>
                        </tr>
                        <tr>
                          <td class="tableLeft"><strong>Report type :</strong></td>
                          <td class="tableRight"><select name="view" id="view" onchange="UpdateSelect();">
                              <option value='1'>Graphical</option>
                              <option value='2'>Tabular</option>
                          </select></td>
                        </tr>
                        <% } %>
                        <% if(request.getParameter("type").equalsIgnoreCase("quarterSalesAllItemsParticularYear")) { %>
                        <tr>
                          <td class="tableLeft"><strong>Select Quarter :</strong></td>
                          <td class="tableRight"><select name="quarter" id="quarter">
                              <option value='Q1'>Q1</option>
                              <option value='Q2'>Q2</option>
                              <option value='Q3'>Q3</option>
                              <option value='Q4'>Q4</option>
                          </select></td>
                        </tr>
                        <tr>
                          <td class="tableLeft"><strong>Report type :</strong></td>
                          <td class="tableRight"><select name="view" id="view" onchange="UpdateSelect();">
                              <option value='1'>Graphical</option>
                              <option value='2'>Tabular</option>
                          </select></td>
                        </tr>
                        <% } %>
                        <tr id="hide_this_row">
                          <td class="tableLeft"><strong>Graph types :</strong></td>
                          <td class="tableRight"><input type="radio" name="graph" value="Cone" checked="checked" />
                            Cone<br />
                            <input type="radio" name="graph" value="Pie" />
                            Pie<br />
                            <input type="radio" name="graph" value="PlotFormat" />
                            PlotFormat<br />
                            <input type="radio" name="graph" value="Line" />
                            Line<br />
                            <input type="radio" name="graph" value="Pyramid" />
                            Pyramid<br />
                            <input type="radio" name="graph" value="Tube" />
                            Tube<br />
                          </td>
                        </tr>
                        <tr>
                          <td colspan="2" class="tblRowHead"><table width="100%" height="25" border="0" cellpadding="0" cellspacing="0" id="tableHead">
                              <tr>
                                <td width="11%"  ><input type="submit" name="Submit" value="Submit" class="gradTwoBtn" />
                                </td>
                              </tr>
                          </table></td>
                        </tr>
                    </table></td>
                  </tr>
                </form>
               
            </table></td>
        </tr>
      </table></td>
    </tr>
      
      
</table>
<!--=======footer=================================-->
 <footer>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </footer>

</body>
<% if(request.getParameter("type").equalsIgnoreCase("purchaseRequisitionPeriodWise")) { %>
<script language="javascript">
    var cal1 = new calendar2(document.forms['salesPage'].elements['fromDate']);
    cal1.year_scroll = true;
    cal1.time_comp = false;
    
    var cal2 = new calendar2(document.forms['salesPage'].elements['toDate']);
    cal2.year_scroll = true;
    cal2.time_comp = false;
    </script> <% } %>

</html>
