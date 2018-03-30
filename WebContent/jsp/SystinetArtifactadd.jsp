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
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/cscombo_new.js" type="text/javascript" ></script>
<script src="js/calendar2.js" type="text/javascript"></script> 
<script  src="js/ts_picker.js"></script>
 <script language="javascript" type="text/javascript">

//-----------------------------------is not alpha1----------------------------------------------------------------
function isnotAlpha1(str){
stringCheck="!@#$%^&*|<>?/=~`;:"+"\\"+"\'"+"\"";
f1=1;
for(j=0;j<str.length;j++)
{ if(stringCheck.indexOf(str.charAt(j))!=-1)
{ f1=0;}}
if(f1==0)
{ return true; }else {return false;}
}

//------------------------DOSPACE--------------------------------------------------------------------------
function Dospace(str){
if(str.indexOf("  ")!=-1)
{return true;}
else {return false;}
}

function isnotInteger(str){
stringCheck="0123456789.";
f1=1;
for(j=0;j<str.length;j++)
{ if(stringCheck.indexOf(str.charAt(j))!=-1)
{ f1=0;}}
if(f1==0)
{ return true; }else {return false;}
}

function myValidation(){
		
	if(document.frmlifecycleproc.frmDate.value==""){
	alert("Select Date");
	document.frmlifecycleproc.frmDate.focus();
	return false;
	}
	
		
	if(document.frmlifecycleproc.SelArtifacttype.value==""){
	alert("Select Artifact Type");
	document.frmlifecycleproc.SelArtifacttype.focus();
	return false;
	}
	if(document.frmlifecycleproc.txtLifeProcees.value==""){
	alert("Lifecycle Process Name can not be empty");
	document.frmlifecycleproc.txtLifeProcees.focus();
	return false;
	}
	
	if(document.frmlifecycleproc.txtLifeProcees.value.indexOf(" ")==0)
 {alert("Please enter a Lifecycle Process Name");
  document.frmlifecycleproc.txtLifeProcees.focus();
 return false;}
 
 if(isnotAlpha1(document.frmlifecycleproc.txtLifeProcees.value))
{ alert("Please enter a valid Lifecycle Process Name. Numbers and Symbols are not allowed");
  document.frmlifecycleproc.txtLifeProcees.focus();
   return false; }
   
    if(Dospace(document.frmlifecycleproc.txtLifeProcees.value)){
			alert("Please enter a valid Lifecycle Process Name");
	     	document.frmlifecycleproc.txtLifeProcees.focus();
	  		return false;
			}
			
			 if(isnotInteger(document.frmlifecycleproc.txtLifeProcees.value)){
			alert("Enter Valid Lifecycle Process Name");
	     	document.frmlifecycleproc.txtLifeProcees.focus();
	  		return false;
			}
	if(document.frmlifecycleproc.txtLifeProcees.value.length>30)
  {alert("Lifecycle Process Name too long");
  document.frmlifecycleproc.txtLifeProcees.focus();
  return false;}
	
	if(document.frmlifecycleproc.selNolifeStage.value==""){
	alert("Select number of lifecycle stages");
	document.frmlifecycleproc.selNolifeStage.focus();
	return false;
	}
	
	if(document.frmlifecycleproc.selNolifeStage.value=="1"){
	alert("Select more than 1 number of lifecycle stages");
	document.frmlifecycleproc.selNolifeStage.focus();
	return false;
	}
	
	if(document.frmlifecycleproc.selStages.value==""){
	alert("Select the lifecycle stage");
	document.frmlifecycleproc.selStages.focus();
	return false;
	}
	
	if(document.frmlifecycleproc.selStages.value!=""){
	var totstagesss=document.frmlifecycleproc.selNolifeStage.value;
	if(document.frmlifecycleproc.selStages.value>totstagesss){
	alert("Stage exceeded the number of lifecycle stages.");
	document.frmlifecycleproc.selStages.focus();
	return false;
	}
	}
	
	
	if(document.frmlifecycleproc.txtstagename.value==""){
	alert("Enter Stage Name");
	document.frmlifecycleproc.txtstagename.focus();
	return false;
	}
	
	if(document.frmlifecycleproc.txtstagename.value.indexOf(" ")==0)
 {alert("Enter a Stage Name");
  document.frmlifecycleproc.txtstagename.focus();
 return false;}
 
 if(isnotAlpha1(document.frmlifecycleproc.txtstagename.value))
{ alert("Enter Valid Stage Name");
  document.frmlifecycleproc.txtstagename.focus();
   return false; }
   
    if(Dospace(document.frmlifecycleproc.txtstagename.value)){
			alert("Enter Valid Stage Name");
	     	document.frmlifecycleproc.txtstagename.focus();
	  		return false;
			}
			
			 if(isnotInteger(document.frmlifecycleproc.txtstagename.value)){
			alert("Enter Valid Stage Name");
	     	document.frmlifecycleproc.txtstagename.focus();
	  		return false;
			}
			 if(document.frmlifecycleproc.txtstagename.value.length>30)
			  {alert("Enter Stage Name within 30");
			  document.frmlifecycleproc.txtstagename.focus();
			  return false;}
	
	if(document.frmlifecycleproc.txtInput.value==""){
	alert("Enter Input");
	document.frmlifecycleproc.txtInput.focus();
	return false;
	}
	
	if(document.frmlifecycleproc.txtInput.value.indexOf(" ")==0)
 {alert("Enter a Input");
  document.frmlifecycleproc.txtInput.focus();
 return false;}
 
 if(isnotAlpha1(document.frmlifecycleproc.txtInput.value))
{ alert("Enter Valid Input");
  document.frmlifecycleproc.txtInput.focus();
   return false; }
   
    if(Dospace(document.frmlifecycleproc.txtInput.value)){
			alert("Enter Valid Input");
	     	document.frmlifecycleproc.txtInput.focus();
	  		return false;
			}
			
			 if(isnotInteger(document.frmlifecycleproc.txtInput.value)){
			alert("Enter Valid Input");
	     	document.frmlifecycleproc.txtInput.focus();
	  		return false;
			}
			 if(document.frmlifecycleproc.txtInput.value.length>30)
			  {alert("Enter Input within 30");
			  document.frmlifecycleproc.txtInput.focus();
			  return false;}
	
	
	if(document.frmlifecycleproc.txtprocess.value==""){
	alert("Enter process");
	document.frmlifecycleproc.txtprocess.focus();
	return false;
	}
	
	if(document.frmlifecycleproc.txtprocess.value.indexOf(" ")==0)
 {alert("Enter a process");
  document.frmlifecycleproc.txtprocess.focus();
 return false;}
 
 if(isnotAlpha1(document.frmlifecycleproc.txtprocess.value))
{ alert("Enter Valid process");
  document.frmlifecycleproc.txtprocess.focus();
   return false; }
   
    if(Dospace(document.frmlifecycleproc.txtprocess.value)){
			alert("Enter Valid process");
	     	document.frmlifecycleproc.txtprocess.focus();
	  		return false;
			}
			
			 if(isnotInteger(document.frmlifecycleproc.txtprocess.value)){
			alert("Enter Valid process");
	     	document.frmlifecycleproc.txtprocess.focus();
	  		return false;
			}
			 if(document.frmlifecycleproc.txtprocess.value.length>30)
			  {alert("Enter Process within 30");
			  document.frmlifecycleproc.txtprocess.focus();
			  return false;}
		
			
	if(document.frmlifecycleproc.txtDesc.value==""){
	alert("Enter Description");
	document.frmlifecycleproc.txtDesc.focus();
	return false;
	}
	if(document.frmlifecycleproc.selControls.value==""){
	alert("Select number of controls/votes");
	document.frmlifecycleproc.selControls.focus();
	return false;
	}
	if(document.frmlifecycleproc.selVotes.value==""){
	alert("Select number of votes required by");
	document.frmlifecycleproc.selVotes.focus();
	return false;
	}
	
	if(document.frmlifecycleproc.txtOutput.value==""){
	alert("Enter output");
	document.frmlifecycleproc.txtOutput.focus();
	return false;
	}
	if(document.frmlifecycleproc.txtOutput.value.indexOf(" ")==0)
 {alert("Enter a output");
  document.frmlifecycleproc.txtOutput.focus();
 return false;}
 
 if(isnotAlpha1(document.frmlifecycleproc.txtOutput.value))
{ alert("Enter Valid output");
  document.frmlifecycleproc.txtOutput.focus();
   return false; }
   
    if(Dospace(document.frmlifecycleproc.txtOutput.value)){
			alert("Enter Valid output");
	     	document.frmlifecycleproc.txtOutput.focus();
	  		return false;
			}
			
			 if(isnotInteger(document.frmlifecycleproc.txtOutput.value)){
			alert("Enter Valid output");
	     	document.frmlifecycleproc.txtOutput.focus();
	  		return false;
			}
			 if(document.frmlifecycleproc.txtOutput.value.length>30)
			  {alert("Enter Output within 30");
			  document.frmlifecycleproc.txtOutput.focus();
			  return false;}
	
	
	return true;
}


var version = navigator.appVersion; 

function showKeyCode(e) { 
var keycode = (window.event) ? event.keyCode : e.keyCode; 

if ((version.indexOf('MSIE') != -1)) { 
if (keycode == 116) { 
event.keyCode = 0; 
event.returnValue = false; 
return false; 
} 
} 
else { 
if (keycode == 116) { 
return false; 
} 
} 
} 

var message="Sorry, right-click has been disabled"; 
/////////////////////////////////// 
function clickIE() {if (document.all) {(message);return false;}} 
function clickNS(e) {if 
(document.layers||(document.getElementById&&!document.all)) { 
if (e.which==2||e.which==3) {(message);return false;}}} 
if (document.layers) 
{document.captureEvents(Event.MOUSEDOWN);document.onmousedown=clickNS;} 
else{document.onmouseup=clickNS;document.oncontextmenu=clickIE;} 
document.oncontextmenu=new Function("return false") 

window.onbeforeunload = function() {
  return "Data will be lost if you leave the page, are you sure?";
};


//-------------------------------- Lifecycle validation Ajax Script ------------------------------------------------

var httpRequest;

function lifecyceStat()
{

if(document.frmlifecycleproc.txtLifeProcees.value!="" && document.frmlifecycleproc.txtLifeProcees.value.indexOf(' ')!=0)
	{

   var chsLifecycleName=document.frmlifecycleproc.txtLifeProcees.value;

   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
        url= "UsrSignupAjax.html?process=checkLifecycle&lifecycleN="+chsLifecycleName; 

        if (window.ActiveXObject) 
        { 
            httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
        } 
        else if (window.XMLHttpRequest) 
        { 
            httpRequest = new XMLHttpRequest(); 
        } 
     
        httpRequest.open("GET", url, true); 
        
        httpRequest.onreadystatechange =processUser; 
        httpRequest.send(null); 
   } 
   }
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
    function processUser() 
    { 
   
        if (httpRequest.readyState == 4) 
        { 
            if(httpRequest.status == 200) 
            { 
                //get the XML send by the servlet 
                 var salutationXML = httpRequest.responseXML.getElementsByTagName("userstatus")[0]; 
                 var salutationText = salutationXML.childNodes[0].nodeValue; 
     
                //Update the HTML 
                updateHTML(salutationXML); 
            } 
            else 
            { 
                alert("Error loading page\n"+ httpRequest.status +":"+ httpRequest.statusText); 
            } 
        } 
    } 
        
   /** 
    * This function parses the XML and updates the  
    * HTML DOM by creating a new text node is not present 
    * or replacing the existing text node. 
    */ 
    function updateHTML(salutationXML) 
    { 
        //The node valuse will give actual data 
        var salutationText = salutationXML.childNodes[0].nodeValue; 

		if(salutationText != "false")
		{
			alert("Lifecycle Name already Exists Choose Another !");
			document.frmlifecycleproc.txtLifeProcees.value="";
			document.frmlifecycleproc.txtLifeProcees.focus();
		}
		      
    } 


document.getElementById('txtDesc').addEventListener('keyup', function () {
			this.style.height = 0; // this is necessary to make it shrink when deleting
			this.style.height = this.scrollHeight + 'px';
		}, false);
		
		

		
function stageStat(){


//alert(1);

var artCnt=document.frmlifecycle.artCount.value;
//alert(artCnt);

if(artCnt!=0){
for(var k=1;k<=artCnt;k++){
var chName = "staCount"+k;

 var stageName1=document.getElementById(chName).value; 
 //alert(stageName1);
 if(stageName1==document.frmlifecycleproc.txtstagename.value){
alert("Stage Name already Exists");
document.frmlifecycleproc.txtstagename.value="";
document.frmlifecycleproc.txtstagename.focus();
return false;
}

}
}
return true;
}		
	












</script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>
<%
 
            String fstname=(String)session.getAttribute("firstName");
			  String userLname=(String)session.getAttribute("lastName");
			  
			  
			  String fullNam=fstname+" "+userLname;
                String lifecycleProNameinputType = (String) request.getAttribute("lifecycleProName");
                String numStage = (String) request.getAttribute("numofStage");
                String dateofCreat = (String) request.getAttribute("dateofCreation");
                String addArtitype = (String) request.getAttribute("addArtifacttype");	
                                
                String cntValue = (String) session.getAttribute("cntValue");
                
                String CurStage=(String) request.getAttribute("CurStage");
                
                String descripitions=(String) request.getAttribute("descripition");
                
				String dupmsg=(String) request.getAttribute("dupMsg");
 
 
 if(dupmsg==null){
 dupmsg="";
 
 }else{
 }
 
                boolean butStatus=true;
                String curStage="";
                if(CurStage==null){
                	 curStage="1";
                }else{
 int tempCurSt=Integer.parseInt(CurStage);
 int finalCurSt=0;
 if(dupmsg!=""){
 finalCurSt=tempCurSt;
 }else{
 finalCurSt=tempCurSt++;
 
 }
 curStage=String.valueOf(tempCurSt);
 
 int tempNumSts=Integer.parseInt(numStage);
 
 if(tempCurSt>tempNumSts){
                	
                		butStatus=false;
                		dateofCreat = "";
                		addArtitype = "";	
                		lifecycleProNameinputType = "";
                		numStage = "";
						curStage="";
						descripitions="";
										 
                	}else{
                		butStatus=true;
                	}
 

                }
                                           
                System.out.println("butStatus"+butStatus);
             /*   if(cntValue.equalsIgnoreCase("0")){
                	
                	cntValue="1";	
                }else{
                	cntValue=cntValue;
                }*/
                if (addArtitype == null) {

                	addArtitype = "";
				}
                
                else{
                	
                	if(addArtitype.equalsIgnoreCase("hpsoaProjectArtifact")){
                		addArtitype="Project";               		
                	}else if(addArtitype.equalsIgnoreCase("hpsoaApplicationArtifact")){
                		addArtitype="Application";  
                	}else if(addArtitype.equalsIgnoreCase("businessServiceArtifact")){
                		addArtitype="Service";  
                	}else if(addArtitype.equalsIgnoreCase("implementationArtifact")){
                		addArtitype="Implementaion";  
                	}else if(addArtitype.equalsIgnoreCase("hpsoaProcessArtifact")){
                		addArtitype="Business Process";  
                	}
                	 
                }
                
                if (descripitions == null) {

                	descripitions = "";
				}
                
                else{
                	
                	
                }
				
                if (lifecycleProNameinputType == null) {

                	lifecycleProNameinputType = "";
				}
				
                
                if (numStage == null) {

                	numStage = "";
				}
                if (dateofCreat == null) {

                	dateofCreat = "";
				}
               
    %>

	
	

<body onload="JavaScript:document.body.focus();" onkeydown="return showKeyCode(event)">

<header id="header">
<%@ include file = "../../include/HeaderProcess.jsp" %>
</header>
  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0" class="content_new" align="center">
        <tr><td><%@ include file = "../../include/infobar.jsp" %></td></tr>

    <tr>
	
      
     
      <td  align="center" valign="middle" class="tableCommonBg" >
	  <table width="900" border="1" align="center" cellpadding="0" cellspacing="0" id="mainTab" style="border:thin;border-style:groove;">
        <tr>
          <td class="tableCommonBg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="centerTab">
              
              <tr>
                <td><table width="100%" border="1" align="center" cellpadding="" cellspacing="" id="centerTab">
                    <tr>
                      <% String msg=(String)request.getAttribute("Success");
%>
                      <td>
                          <div class="colspan" style="border-bottom-style:groove;border-bottom-width:thin">
						  <img src="images/Users-Lifecycle-icon.png" alt="" width="20px" height="20px" style="cursor:pointer"/>
						  <strong> Lifecycle Process:<span class="styleBoldTwo"> Create</span>
                            <%if(msg!=null) {%>
                            <script language="JavaScript" type="text/javascript">
		
 function popitup(url) {
	 if(confirm(msg))
	 {
		newwindow=window.open(msg,'name','height=450,width=800,scrollbars=no,resizable=no,top=300,left=500,toolbar=no,menubar=no,dialog=yes');
                        if (window.focus) {newwindow.focus()}
                        return false;
	 }
	 else
	 {
		 return;
	 }

}
                              </script>
                            <%}%>
                            </strong></div>
												
						  
                        <form name="frmlifecycleproc" id="frmlifecycleproc" method="post" action="SysMgmt.html?process=callArtadd" class="formcss" onsubmit="return myValidation();">
						<input type="hidden" name="fullName" value="<%=fullNam%>" />

                            <div class="row"> 
							<table width="100%">
								<tr>
								<td width="36%" height="23">
								<span class="label"><strong>&emsp;Date of Lifecycle</strong></span>								</td>
								<td width="64%">
									<span class="formX">
                              			<input name="frmDate" type="text" id="frmDate"  class="textboxOne" value="<%=dateofCreat%>" size="10" readonly="true"/>
                               				<a href="javascript:show_calendar('document.frmlifecycleproc.frmDate', document.frmlifecycleproc.frmDate.value);">
							   					<img src="images/calendar.jpg" alt="Click To View Calendar" width="20" height="17" style="vertical-align:bottom;" border="0" />
							   				</a> 
											<span class="asterisk">*</span>
						   		  </span>
							   </td>
							   </tr>
						      </table>
							</div>
							

                          <div class="row"> 
						  <table width="100%">
								<tr>
								<td width="36%" height="23">
						  <span class="label"><strong>&emsp;Artifact Type:</strong></span>						  </td>
						  <td>
						   <span class="formX">
                              <select name="SelArtifacttype" class="selectboxOne" id="SelArtifacttype">
                                <option selected="selected" value="">Select One</option>
                                <%
                                                       
                                                            Map<String,String> artiType = (HashMap) session.getAttribute("artifactType");
                                                            if (artiType != null && artiType.size() != 0) {
                                                           Iterator iter = artiType.entrySet().iterator();
                                                                //String [] userType = {ID, name };
                                                                while (iter.hasNext()) {
                                                                	Map.Entry me = (Map.Entry)iter.next();
                                                                    String artifactType =(String) me.getValue();
                                                                    String artifactId =(String) me.getKey(); 
                                                                    if (artifactId.equals(addArtitype)) {

                                                %>
                                <option value="<%=artifactId%>" selected="selected" ><%=artifactType%></option>
                                <%
                                                 } else {
                                                %>
                                <option value="<%=artifactId%>" ><%=artifactType%></option>
                                <%
                                                                    }
                                                                }
                                                            }
                                                %>
                              </select>
                            &nbsp;<span class="asterisk">*</span></span>
							</td>
							</tr>
							</table>
						  </div>
                          <div class="row"> 
						  <table width="100%">
								<tr>
								<td width="36%" height="23">
						  <span class="label"><strong>&emsp;Lifecycle Process Name:</strong></span>						  </td>
						  <span class="formX">
                              <% if(lifecycleProNameinputType.equalsIgnoreCase("")){ %>
							  						  <td>

                            <input type="text" name="txtLifeProcees" id="txtLifeProcees" class="textboxOne" size="20"/>
							 <span class="asterisk">*</span>
							</td>
                            <%} else { %>
							<td>
                            <input type="text" name="txtLifeProcees" value="<%=lifecycleProNameinputType %>" readonly="readonly"  class="textboxOne" size="20"/>
							 <span class="asterisk">*</span>
							    </td>

                            <% } %>
                             </span>
							  </tr>
						    </table>
						  </div>
                          <div class="row"> 
						  <table width="100%">
								<tr>
								<td width="36%" height="23">
								<span class="label"><strong>&emsp;Number of Lifecycle Stages:</strong></span>								</td>
                                 <span class="formX">
								<% if(numStage=="") {%>
								
								<td>
                               
                                <select name="selNolifeStage" class="selectboxOne" id="selNolifeStage">
                                  <option selected="selected" value="">Select One</option>
                                  <%
                                                       
                                                            ArrayList numlifeCycle = (ArrayList) session.getAttribute("lifeCycle");
                                                            if (numlifeCycle != null && numlifeCycle.size() != 0) {
                                                            	Iterator  lifeCycle = numlifeCycle.iterator();
                                                                //String [] userType = {ID, name };
                                                                while (lifeCycle.hasNext()) {
                                                                    String strType = (String) lifeCycle.next();
                                                                    String numlifeStage = strType;
                                                                 
                                                                   

                                                %>
                                  <option value="<%=numlifeStage%>"><%=numlifeStage%></option>
                                  <%
                                                                    
                                                                }
                                                            }
                                                %>
                                </select>
                                  &nbsp;<span class="asterisk">*</span> 
								  </td>
                                <%}else{%>
								<td>
                               
                                <input type="text" name="selNolifeStage" id="selNolifeStage" value="<%=numStage%>" readonly="readonly"  class="textboxOne" size="20"/>
                                <span class="asterisk">*</span>
								</td>
                                <%}%>
								</span>
								</tr>
							</table>
                          </div>
                          <div class="row"> 
						  <table width="100%">
								<tr>
								<td width="36%" height="23">
						  <span class="label"><strong>&emsp;Stage</strong></span>						  </td>
						  <td>
						  <span class="formX">
                            <select name="selStages" class="selectboxOne" id="selStages">
                              <option selected="selected" value="">Select One</option>
                                <%
                                                       
                                                            ArrayList StageCycle = (ArrayList) session.getAttribute("StageCycle");
                                                            if (StageCycle != null && StageCycle.size() != 0) {
                                                            	Iterator  StaCycle = StageCycle.iterator();
                                                              
                                                                while (StaCycle.hasNext()) {
                                                                    String strType = (String) StaCycle.next();
                                                                    String Stage = strType;
                                                                 
                                                                    if (Stage.equals("")) {

                                                %>
                                <option value="<%=Stage%>" selected="selected" ><%=Stage%></option>
                                <%
                                                 } else {
                                                %>
                                <option value="<%=Stage%>" ><%=Stage%></option>
                                <%
                                                                    }
                                                                }
                                                            }
                                                %>
                              </select>
                            &nbsp;<span class="asterisk">*</span></span>
							</td>
							</tr>
							</table>
						  </div>
                          <div class="row">
						  <table width="100%">
								<tr>
								<td width="36%" height="23">
						  <span class="label"><strong>&emsp;Stage Name:</strong></span>						  </td>
						  <td>
						  <span class="formX">
                            <input type="text" name="txtstagename" class="textboxOne" size="20" id="txtstagename"/>
                              <span class="asterisk">*</span></span>
							  </td>
							  </tr>
						    </table>
						  </div>
                          <div class="row"> 
						  <table width="100%">
								<tr>
								<td width="36%" height="23">
								<span class="label"><strong>&emsp;Input:</strong></span>							</td>
								<td><span class="formX">
                            <input type="text" name="txtInput" class="textboxOne" size="20" id="txtInput"/>
                              <span class="asterisk">*</span></span>
							  </td>
							  </tr>
						    </table>
						  </div>
                          <div class="row">
						  
                              <div class="row"> 
							  <table width="100%">
								<tr>
								<td width="36%" height="23">
								<span class="label"><strong>&emsp;Process:</strong></span>								</td>
								<td>
								<span class="formX">
                                <input type="text" name="txtprocess" class="textboxOne" size="20" id="txtprocess"/>
                                <span class="asterisk">*</span></span>
								</td>
								</tr>
								</table>
							</div>
                            <div class="row"> 
							<table width="100%">
								<tr>
								<td width="36%" height="23">
								<span class="label"><strong>&emsp;Description</strong></span>								</td>
								<td>
								<span>
                                <textarea rows="4" cols="20" name="txtDesc" id="txtDesc"></textarea>
                                <span class="asterisk">*</span></span>
								</td>
								</tr>
							  </table>
							</div>
                            <div class="row"> 
							<table width="100%">
								<tr>
								<td width="36%" height="23">
								<span class="label"><strong>&emsp;Numbers of Controls/Votes</strong></span>								</td>
								<td>
								 <span class="formX">
                              <select name="selControls" class="selectboxOne" id="selControls">
                                <option selected="selected" value="">Select One</option>
                                  <%
                                                       
                                                            ArrayList numberVoters = (ArrayList) session.getAttribute("numberVoters");
                                                            if (numberVoters != null && numberVoters.size() != 0) {
                                                            	Iterator  numberContrVoters = numberVoters.iterator();
                                                                //String [] userType = {ID, name };
                                                                while (numberContrVoters.hasNext()) {
                                                                    String strType = (String) numberContrVoters.next();
                                                                    String ContrVoters = strType;
                                                                 
                                                                    if (ContrVoters.equals("")) {

                                                %>
                                  <option value="<%=ContrVoters%>" selected="selected" ><%=ContrVoters%></option>
                                  <%
                                                 } else {
                                                %>
                                  <option value="<%=ContrVoters%>" ><%=ContrVoters%></option>
                                  <%
                                                                    }
                                                                }
                                                            }
                                                %>
                                </select>
                              &nbsp;<span class="asterisk">*</span></span>
							  </td>
							  </tr>
							  </table>
						    </div>
                            <div class="row"> 
							<table width="100%">
								<tr>
								<td width="36%" height="23">
								<span class="label"><strong>&emsp;Votes Required By</strong></span>								</td>
								<td>
								<span class="formX">
                                <select name="selVotes" class="selectboxOne" id="selVotes">
                                  <option selected="selected" value="">Select One</option>
                                  <%
                                                       
                                                            Map<String,String> votesReq = (HashMap) session.getAttribute("votesReq");
                                                            if (votesReq != null && votesReq.size() != 0) {
                                                            	 Iterator iter = votesReq.entrySet().iterator();
                                                                while (iter.hasNext()) {
                                                                	Map.Entry me = (Map.Entry) iter.next();
                                                                    String Voters =(String)me.getValue() ;
                                                                    String votersId=(String)me.getKey();
                                                                    if (Voters.equals("")) {

                                                %>
                                  <option value="<%=votersId%>" selected="selected" ><%=Voters%></option>
                                  <%
                                                 } else {
                                                %>
                                  <option value="<%=votersId%>" ><%=Voters%></option>
                                  <%
                                                                    }
                                                                }
                                                            }
                                                %>
                                </select>
                              &nbsp;<span class="asterisk">*</span></span>
							  </td>
							  </tr>
							  </table>
						    </div>
                            <div class="row"> 
							<table width="100%">
								<tr>
								<td width="36%" height="23">
								<span class="label"><strong>&emsp;Output</strong></span>								</td>
								<td>
								<span class="formX">
                              <input type="text"name="txtOutput" class="textboxOne" size="10" id="txtOutput"/>
                              &nbsp; <span class="asterisk">*</span></span>
							  </td>
							  </tr>
							  </table>
						    </div>
                            <!-- spacer starts-->
                              <div class="spacer">&nbsp;</div>
                            <!-- spacer ends-->
                              <div class="row"> 
                                <div align="center"><span class="label">&nbsp;</span> <span class="formX">
                                   <label><img src="images/add-save-icon.png" alt="" width="20px" height="20px" style="cursor:pointer"/><input type="submit" value="ADD/SAVE STAGE" class="button-add" name="method" onClick="return(onValidate());"/></label>
                                  </span> </div>
                              </div>
                            <!-- spacer starts-->
                            <!-- spacer ends-->
                              <!-- spacer starts-->
                              <div class="spacer">&nbsp;</div>
                            <!-- spacer ends-->
                              <s:text name="Please fill in the form below:" />
                              <!-- **************************************** Part A of the form Ends here *********************************************** -->
                          </div>
                        </form></td>
                    </tr>
                  </table>
                    <table  border="1" cellpadding="0" cellspacing="0" width="100%" align="left" style="table-layout:fixed" >
                      <tr>
                        <td colspan="11" class="tblMainHead" > Displaying results 1-5 </td>
                      </tr>
                      <tr align="center" style="border-bottom-style:groove;border-bottom-width:thin;border-top-style:groove;border-top-width:thin">
                        <th width="8%" align="left" class="tblMainHead1" >Lifecycle</th>
                        <th width="12%" class="tblMainHead1" >Total Stages</th>
                        <th width="17%" class="tblMainHead1">Date of Creation</th>
                        <th width="10%" class="tblMainHead1">Created By</th>
                        <th width="5%" class="tblMainHead1">Stage</th>
                        <th width="11%" class="tblMainHead1">Stage Name</th>
                        <th width="5%" class="tblMainHead1">Input</th>
                        <th width="7%" class="tblMainHead1">Process</th>
                        <th width="8%" class="tblMainHead1">Control</th>
                        <th width="6%" class="tblMainHead1">Output</th>
                        <th width="11%" class="tblMainHead1">Description</th>
                      </tr>
                      <form name="frmlifecycle" id="frmlifecycle" method="post" action="SysMgmt.html?process=systinetLifecycle" class="formcss" onsubmit="">
                        <%
     
    
     
                                                 ArrayList artifactName=(ArrayList)session.getAttribute("artifactData");
     
     if (artifactName != null && artifactName.size() != 0) { 
    	 Iterator evotesartifactName = artifactName.iterator();
    	 //String [] userType = {ID, name };
    	 while (evotesartifactName.hasNext()) {
             String strType[] = (String[]) evotesartifactName.next();
         	
			String lifecycleProName=strType[0];
    	String numofStage=strType[1];
    	String dateofCreation=strType[2];
    	String createdBy=strType[3];
    	String stage=strType[4];
    	String stageName=strType[5];
    	String input=strType[6];
    	String process=strType[7];
    	String voter=strType[8];
    	String output=strType[9];
    	String descripition=strType[10];
        String addArtifacttype=strType[11]; 
        String votes=strType[12]; 		
       

%>
                        <tr>
                          <td align="left"><%=lifecycleProName%></td>
                          <td align="center"><%=numofStage%></td>
                          <td align="center"><%=dateofCreation%></td>
                          <td align="center"><%=fullName%></td>
                          <td align="center"><%=stage%></td>
                          <td align="center"><%=stageName%></td>
                          <td align="center"><%=input%> </td>
                          <td align="center"><%=process%></td>
                          <td align="center"><%=voter%></td>
                          <td align="center"><%=output%> </td>
                          <td align="center" style="word-wrap: break-word;"><%=descripition%></td>
                        </tr>
                        <%
                                                 
                                                                                                                                                                       }
   }
   else{
	   %>
                        <tr>
                          <td colspan="11"><div align="center">No DATA </div></td>
                        </tr>
                        <%
   }
                                               
                                                
                                                 if (artifactName != null && artifactName.size() != 0) { %>
                        <tr>
                          <td colspan="11" align="center"><div align="center">
                            <label><img src="images/submit-icon.png" alt="" width="20px" height="20px" style="cursor:pointer"/><input name="submit" type="submit" class="button-add" value="Submit" align="right"/>
                          </label>
                          </div></td>
                        </tr>
                        <%
   } %>
                      </form>
                    </table></td>
              </tr>
              <!-- CONTENTS START HERE -->
          </table></td>
        </tr>
      </table></td>
   

    </tr>
    	<tr><td>&nbsp;</td></tr>

  </table>
<!--=======footer=================================-->
 <footer>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </footer>
<script type="text/javascript">


function onValidate()
{
	
	if(document.frmlifecycleproc.frmDate.value==""){
		alert("Startdate cannot be empty");
		document.frmlifecycleproc.frmDate.focus();
		return false;
	}
	if(document.frmUserSignup.toDate.value==""){
		alert("Lastdate cannot be empty");
		document.frmUserSignup.toDate.focus();
		return false;
	}
	
	return true;
}
</script>
</body>


</html>
