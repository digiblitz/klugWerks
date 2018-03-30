/*******************************************************************************
 * Copyright: 2018 digiBlitz Foundation
 * 
 * License: digiBlitz Public License 1.0 (DPL) 
 * Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
 * 
 * Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
 * 
 * Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
 * 
 * "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
 ******************************************************************************/
package com.master.action;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.ProtocolException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.jasypt.util.text.BasicTextEncryptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.db.GeneralDBAction;
import com.hlccommon.util.Debug;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcmsg.groups.HLCMessageSessionBean;
import com.hlcrole.management.HLCBrahmaputraSessionBean;
import com.login.action.KlgLoginAction;
import com.logout.action.KlgLogoutAction;
import com.yes.cart.password.gen.YesCartPassword;

public class UserMaster implements Controller{
	private Properties properties;
	
	static Logger log = Logger.getLogger(UserMaster.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		
		HttpSession session=request.getSession(true); 
	
		//=====================Properties file configuration started here==============================
		
				Properties logProp = new Properties();  
			      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);
			      logProp.load(is); 
			      PropertyConfigurator.configure(logProp);      
			      log.info("Logging enabled"); 
			
		      properties = new Properties();        
		     
		      try {               
		      	properties.load(UserMaster.class.getResourceAsStream("/config.properties"));
		      	System.out.println("Property file loaded successfully");
		          } catch (Exception e) {
		              try {
		            	  InputStream in = this.getClass().getClassLoader().getResourceAsStream("/paypal.properties");
		            	  properties.load(UserMaster.class.getResourceAsStream("/config.properties"));
		                properties.load(in);
		              }catch(Exception ee) {
		                 Debug.print("Could not load the companyDetails.properties");
		              }
		          }
		      
		    //=====================Properties file configuration ended here==============================
	      
		String usrProcess = request.getParameter("profileCmd");
		GeneralDBAction db=new GeneralDBAction();	
		YesCartPassword yc = new YesCartPassword(); 
		YesGetjsessionURL ycURL = new YesGetjsessionURL();
		//----------------------MASTER ACC--------------------
        if(usrProcess != null && usrProcess.equals("profiledetails")){
          	String userId=(String)session.getAttribute("userId");
          	System.out.println("------USerACtion----userid"+userId);
          	String emailId=db.getemail_id(userId);
          	System.out.println("------USerACtion----emailId"+emailId);
          	ArrayList userdetails=db.getprofile_details(emailId);
          	String details[];
          	String username=null;
          	String password=null;
          	String institution_name=null;
          	String e_mail=null;
          	String customer_id=null;
          	if(userdetails!=null){
     			 Iterator itr=userdetails.iterator();			 
     			 while(itr.hasNext()){
     				details=(String[]) itr.next();
     				username=details[0];
     				password=details[1];
     				institution_name=details[2];
     				e_mail=details[3];
     				customer_id=details[4];
     			 }}
     			 request.setAttribute("username", username);
     			 System.out.println("------USerACtion----Username"+username);
     			 request.setAttribute("password", password );
     			 request.setAttribute("institutionname", institution_name);
     			 request.setAttribute("e_mail", e_mail);
     			 request.setAttribute("customer_id", customer_id);	
          	  return new ModelAndView("profiledetails");  
          	  
            }
            else if(usrProcess != null && usrProcess.equals("product_package")){
            	String userId=(String)session.getAttribute("userId");
            	String emailId=db.getemail_id(userId);
            	ArrayList packagedetails=db.getproduct_package(emailId);
            	String packages[];
            	String Productplan=null;
            	String subscription_plan=null;
            	String amount=null;
            	if(packagedetails!=null){
       			 Iterator itr=packagedetails.iterator();			 
       			 while(itr.hasNext()){
       				packages=(String[]) itr.next();
       				Productplan=packages[0];
       				subscription_plan=packages[1];
       				amount=packages[2];
       			
       			 }}
       			 request.setAttribute("Productplan", Productplan);
       			 request.setAttribute("subscription_plan",subscription_plan);
       			 request.setAttribute("amount", amount);
       			 

       			 String dateStr=db.getdate(emailId);	 				
       							 String difference=null;
       							 //subscription status Area---------------------------------------				  	  
       							  SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
       								
       								try {
       									Date date=formatter.parse(dateStr);
       									long lo=30;					
       									Date thirty = new Date(date.getTime() + lo * 1000 * 60 * 60 * 24);						
       									System.out.println("Tomorrow"+thirty);						
       									String subsenddate=formatter.format(thirty);						
       									System.out.println(subsenddate);			
       									
       									Date currentdate=new Date();
       									String strcurrent=formatter.format(currentdate);	
       									
       				int diffInDays = (int) ((thirty.getTime() - currentdate.getTime()) / (1000 * 60 * 60 * 24));

       									if(strcurrent.equals(subsenddate)){
       										diffInDays=0;
       									}		
       									else{
       										System.out.println(diffInDays);
       										difference=Integer.toString(diffInDays);
       									}
       								} catch (ParseException e) {					
       									e.printStackTrace();
       								}
       								
       								request.setAttribute("difference", difference);

       								
       								
       				        	  String usrPassword = db.getPasswordByLoginId(userId);
       				        	  System.out.println("usrPassword:::::::::::::::::::::::::::"+usrPassword);
       				        	  BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
       				              textEncryptor.setPassword("sa");	
       				              String originalPass = textEncryptor.decrypt(usrPassword);
       				              System.out.println("originalPass:::::::::::::::::::::::::::"+originalPass);
       				        	  String usrEmail = db.getemail_id(userId);
       				        	  System.out.println("usrEmail:::::::::::::::::::::::"+usrEmail);
       				        	  //String yesCustomerId = db.getYesCartCustomerId(usrEmail);
       				        	  
       				        	  String yesEncryptPass = null;;
       							try {
       								yesEncryptPass = yc.getHash(originalPass);
       								System.out.println("Encrypted password here ::::::::::::::::::yesEncryptPass::::"+yesEncryptPass);
       							} catch (NoSuchAlgorithmException e) {
       								e.printStackTrace();
       							}
       				        	  String yesUpdateStatus = db.putYesCartPassword(yesEncryptPass, usrEmail);
       				        	  if(yesUpdateStatus.equalsIgnoreCase("success")){
       				        		  String jsessionId = ycURL.getYesLoginjsessionId(properties.getProperty("dBstore_login_url"));
//       				        		  response.setContentType("text/html");
//       				        			PrintWriter p=response.getWriter();
//       				        			
//       				        		p.println("<html>");		
//       				        		
//       				        		p.println("<form class='form-horizontal' id='loginForm1' method=post action='http://74.208.110.192:8480/yes-shop/login;jsessionid="+jsessionId+"IFormSubmitListener-authView-loginForm'><div style='width:0px;height:0px;position:absolute;left:-100px;top:-100px;overflow:hidden'><input type='hidden' name='loginForm1_hf_0' id='loginForm1_hf_0' /></div><input type='hidden' value='' name='restorePassword'/><div class='login-title'><h2>Login</h2></div><div class='form-group'><label for='loginEmail' class='control-label col-xs-12 col-sm-3'>E-mail</label><div class='col-xs-12 col-sm-8'><input type='text' class='form-control' id='loginEmail' value="+usrEmail+" name='email' placeholder='E-mail'></div></div><div class='form-group' id='InlineEnclosure_02'><label for='loginPassword' class='control-label col-xs-12 col-sm-3'>Password</label><div class='col-xs-12 col-sm-8'><input type='password' class='form-control' id='loginPassword' value="+originalPass+" name='password' placeholder='Password'></div></div><div class='form-group'><div class='col-xs-offset-3 col-xs-8 buttons'><input type='submit' class='btn btn-primary2' name='loginBtn' id='loginBtn3' value='Sign In'/></div></div><div class='form-group'></div></form>");
//       				        		  p.println("<script type=text/javascript>document.getElementById('loginForm1').submit()</script>");
//       				        		p.println("hi everyone");
//       				        		p.println("</html>");	
       				        		
       				        		  request.setAttribute("jsessionId", jsessionId);
       				        		  request.setAttribute("originalPass", originalPass);
       				        		  request.setAttribute("usrEmail", usrEmail);
       								return new ModelAndView("productpackage");  
       				        	  }
            	  
              }
            else if(usrProcess != null && usrProcess.equals("security")){
              	String userId=(String)session.getAttribute("userId");
              	String emailId=db.getemail_id(userId);
     		   //String lastLoginDetails = db.getLastLoginDetails(userId);

              	ArrayList securitydetails=db.getsecurity_details(emailId);
              	String security[];
              	String Productplan=null;
              	String mobile=null;
              	String e_mail=null;
              //	String last_login=null;
              	String notifi_setting=null;
              	if(securitydetails!=null){
         			 Iterator itr=securitydetails.iterator();			 
         			 while(itr.hasNext()){
         				security=(String[]) itr.next();
         				Productplan=security[0];
         				mobile=security[1];
         				e_mail=security[2];
         				//last_login=security[3];
         				//notifi_setting=security[4];
         			
         			 }}
              	     request.setAttribute("Productplan", Productplan);
         			 request.setAttribute("mobile", mobile);
         			 request.setAttribute("e_mail",e_mail);
         			// request.setAttribute("lastlogin", lastLoginDetails);
         			 //request.setAttribute("notifi_setting", notifi_setting);
              	  return new ModelAndView("security");  
              	  
                }
         // update profile-----------------------------------
     // update profile-----------------------------------
            else if(usrProcess!=null && usrProcess.equalsIgnoreCase("updateprofile")){
            			    
            			    System.out.println("user picture upload here");
            			    String new_email=request.getParameter("e_mail");
            			     //String usernamee=db1.getusername(user_id);
            			     
            			   String username=request.getParameter("username");
            			   String password=request.getParameter("password");
            			   String e_mail=request.getParameter("email");
            			   String institutionname=request.getParameter("institutionname");
            			   String customerid=request.getParameter("customerid");
            			   System.out.println("");
            			 System.out.println("User action----------new_email"+new_email);
            			 System.out.println("--------username"+username);
            			 System.out.println("customerid"+customerid);
            			   String updateprofile=db.updateprofile(new_email,username, password, e_mail);
            			   String updatesignup=db.updatesignupuserdetails(new_email,username, password, e_mail, institutionname);
            			   request.setAttribute("username", username);
              			 System.out.println("------USerACtion----Username"+username);
              			 request.setAttribute("password", password );
              			 request.setAttribute("institutionname", institutionname);
              			 request.setAttribute("e_mail", e_mail);
              			 request.setAttribute("customer_id", customerid);		
            			   if(updateprofile != null && updatesignup != null){
            				   request.setAttribute("upstatus", "Updated Succesfully!!!");
            			   }else{
            				   request.setAttribute("upstatus", "Updated Failed!!!!!");
            			   }
            			   request.setAttribute("upstatus", updateprofile);
            			   return new ModelAndView("profiledetails");
            			   }
          else if(usrProcess!=null && usrProcess.equalsIgnoreCase("updateproductppackage")){
			    String userId = null;
			    System.out.println("user picture upload here");
			     userId=request.getParameter("userId");
			     //String usernamee=db1.getusername(user_id);
			     
			   String plantype=request.getParameter("plan_type");
			   String subscriptiontype=request.getParameter("subs_type");
			   String paymentHistory=request.getParameter("pay_history");
			   String subscriptionExpiry=request.getParameter("Subs_expiry");
			   String new_email=request.getParameter("email");

			   
			  
			   String updateproductppackage=db.updateproductpackage(new_email,plantype, subscriptiontype, paymentHistory,subscriptionExpiry); 
			   request.setAttribute("updatestatus", updateproductppackage);
			   return new ModelAndView("productpackage");
			   }
      //----------------------------------------updateSecurity---------------
        
            
          else if(usrProcess!=null && usrProcess.equalsIgnoreCase("updatesecurity")){
      		    String userId = null;
      		    System.out.println("user picture upload here");
      		     userId=request.getParameter("userId");
      		     //String usernamee=db1.getusername(user_id);
      		     //HttpSession session = request.getSession();
      		       
      		   String plantype=request.getParameter("plan_type");
      		   String mobile=request.getParameter("Rec_phno");
      		   String e_mail=request.getParameter("rec_email");
      		  String last_login=request.getParameter("last_login");
      		  // String new_email=request.getParameter("notifi_setting");

      		   
      		  
      		   String updatesecurity=db.updatesecurity(plantype, mobile, e_mail); 
      		   request.setAttribute("updatestatus", updatesecurity);
      			 request.setAttribute("Productplan", plantype);
      			 
      			 request.setAttribute("mobile", mobile );
      			 request.setAttribute("e_mail", e_mail);
      			 request.setAttribute("lastlogin", last_login);
      			// request.setAttribute("difference", subscriptionExpiry);
      			
      		   
      		   return new ModelAndView("security");
      		   }
          else if(usrProcess!=null && usrProcess.equalsIgnoreCase("yesaction")){
        	  String plantype=request.getParameter("hidplan_type");
			   String subscriptiontype=request.getParameter("hidsubs_type");
			   String paymentHistory=request.getParameter("hidpay_history");
			   String subscriptionExpiry=request.getParameter("hidSubs_expiry");
        	  
        	  String userId=(String)session.getAttribute("userId");
        	  String usrPassword = db.getPasswordByLoginId(userId);
        	  System.out.println("usrPassword:::::::::::::::::::::::::::"+usrPassword);
        	  BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
              textEncryptor.setPassword("sa");	
              String originalPass = textEncryptor.decrypt(usrPassword);
              System.out.println("originalPass:::::::::::::::::::::::::::"+originalPass);
        	  String usrEmail = db.getemail_id(userId);
        	  System.out.println("usrEmail:::::::::::::::::::::::"+usrEmail);
        	  //String yesCustomerId = db.getYesCartCustomerId(usrEmail);
        	  
        	  String yesEncryptPass = null;;
			try {
				yesEncryptPass = yc.getHash(originalPass);
				System.out.println("Encrypted password here ::::::::::::::::::yesEncryptPass::::"+yesEncryptPass);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
        	  String yesUpdateStatus = db.putYesCartPassword(yesEncryptPass, usrEmail);
        	  if(yesUpdateStatus.equalsIgnoreCase("success")){
        		  String jsessionId = ycURL.getYesLoginjsessionId(properties.getProperty("dBstore_login_url"));
//        		  response.setContentType("text/html");
//        			PrintWriter p=response.getWriter();
//        			
//        		p.println("<html>");		
//        		
//        		p.println("<form class='form-horizontal' id='loginForm1' method=post action='http://74.208.110.192:8480/yes-shop/login;jsessionid="+jsessionId+"IFormSubmitListener-authView-loginForm'><div style='width:0px;height:0px;position:absolute;left:-100px;top:-100px;overflow:hidden'><input type='hidden' name='loginForm1_hf_0' id='loginForm1_hf_0' /></div><input type='hidden' value='' name='restorePassword'/><div class='login-title'><h2>Login</h2></div><div class='form-group'><label for='loginEmail' class='control-label col-xs-12 col-sm-3'>E-mail</label><div class='col-xs-12 col-sm-8'><input type='text' class='form-control' id='loginEmail' value="+usrEmail+" name='email' placeholder='E-mail'></div></div><div class='form-group' id='InlineEnclosure_02'><label for='loginPassword' class='control-label col-xs-12 col-sm-3'>Password</label><div class='col-xs-12 col-sm-8'><input type='password' class='form-control' id='loginPassword' value="+originalPass+" name='password' placeholder='Password'></div></div><div class='form-group'><div class='col-xs-offset-3 col-xs-8 buttons'><input type='submit' class='btn btn-primary2' name='loginBtn' id='loginBtn3' value='Sign In'/></div></div><div class='form-group'></div></form>");
//        		  p.println("<script type=text/javascript>document.getElementById('loginForm1').submit()</script>");
//        		p.println("hi everyone");
//        		p.println("</html>");	
        		  request.setAttribute("plan_type", plantype);
        		  request.setAttribute("subs_type", subscriptiontype);
        		  request.setAttribute("pay_history", paymentHistory);
        		  request.setAttribute("hidSubs_expiry", subscriptionExpiry);
        		  request.setAttribute("jsessionId", jsessionId);
        		  request.setAttribute("originalPass", originalPass);
        		  request.setAttribute("usrEmail", usrEmail);
        		  return new ModelAndView("productpackage");
        		  
        	  }
        	  
        	  
        	  
    		   
    			
    		   
    		   return null;
    		   }
         //----------------------------------------
		 
		return null; 
	
}
}
