/*******************************************************************************
 * Copyright: 2019 digiBlitz Foundation
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
package com.login.action;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Properties;
import java.util.Vector;
 

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
 
//import org.apache.struts.util.MessageResources;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.jasypt.util.text.BasicTextEncryptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

import com.AD.action.NewUser;
import com.db.GeneralDBAction;
import com.hlccommon.util.Debug;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlchorse.form.display.HLCKaverySessionStatefulBean;
import com.hlchorse.form.util.HLCUserRegVO;
import com.util.BIRTGraphsConfig;
import com.util.XMLParser;

import com.hlcmsg.groups.*;
import com.hlcrole.management.HLCBrahmaputraSessionBean;
import org.springframework.ui.ModelMap;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
//import org.systinet.uddi.ResourceBundle;


public class KlgLoginAction implements Controller {
	public Properties properties; 
	
	static Logger log = Logger.getLogger(KlgLoginAction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;

	
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		
		//=====================Properties file configuration started here==============================
		
		Properties logProp = new Properties();  
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);
	      logProp.load(is); 
	      PropertyConfigurator.configure(logProp);      
	      log.info("Logging enabled"); 
	
      properties = new Properties();        
     
      try {               
      	properties.load(KlgLoginAction.class.getResourceAsStream("/config.properties"));
      	properties.load(KlgLoginAction.class.getResourceAsStream("/paypal.properties"));
      	properties.load(BIRTGraphsConfig.class.getResourceAsStream("/config.properties"));
      	System.out.println("Property file loaded successfully");
          } catch (Exception e) {
              try {
            	  InputStream in = this.getClass().getClassLoader().getResourceAsStream("/paypal.properties");
            	  properties.load(KlgLoginAction.class.getResourceAsStream("/config.properties"));
            	  properties.load(BIRTGraphsConfig.class.getResourceAsStream("/config.properties"));
                properties.load(in);
              }catch(Exception ee) {
                 Debug.print("Could not load the companyDetails.properties");
              }
          }
      
    //=====================Properties file configuration ended here==============================
      
	
		 int totalXMLUsers=0;int totalUsersAssignedRole=0;
			GeneralDBAction db=new GeneralDBAction();	 
		 String loginProcess=request.getParameter("cmd");
         String login,pass = "";
                 String userName="";
                 String userPassword="";
        
         HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
         HLCMessageSessionBean msgBean=new HLCMessageSessionBean();
         HLCBrahmaputraSessionBean roleBean=new HLCBrahmaputraSessionBean(); 
        
         HttpSession session=request.getSession(true); 
        
        
         String memberId = (String) session.getAttribute("searchMemId");
         String fName = (String) session.getAttribute("fname");
         String lName = (String) session.getAttribute("lname");
         String email = (String) session.getAttribute("email");
         String zip = (String) session.getAttribute("zip");
         String loginName = (String) session.getAttribute("login_Name");
         String frmDate = (String) session.getAttribute("fromDate");
         String tDate = (String) session.getAttribute("toDate");
         String rolId = (String) session.getAttribute("rolesId");
         String radMem = (String) session.getAttribute("radMem");
                                  
         session.setAttribute("sessionId",null);  
         session.setAttribute("userId",null);
         session.setAttribute("userCode",null);
         //session.setAttribute("firstName",null);
         session.setAttribute("userTypeName",null);
         session.setAttribute("emailId",null);
         session.setAttribute("memberId",null);
         session.setAttribute("periodValue",null);
         session.setAttribute("userTypeId",null);
         session.setAttribute("title","klugWerks");
       
         
       //String license_file_path="C://XML//license-config.xml";
       String license_file_path=properties.getProperty("config.licensepath");
     
       
       if(loginProcess != null && loginProcess.equals("initDash")){
    	   String userId = null;
    	    Vector vObj = new Vector();
			 String imagedata=null;
     	   String file_path=null;
    	    /*-----------------------ACTIVE DIRECTORY HERE------------------------
    	    boolean ADchk = false;
    	    /*-----------------------ACTIVE DIRECTORY HERE------------------------*/

    	    String status=null;
    	      	  
           String fileEncryptedContent=XMLParser.readXMLCreated(license_file_path);
           String original=XMLParser.decryptFileContent(fileEncryptedContent);
           
           totalXMLUsers=XMLParser.readFromXMLUsers(original); // Reading licensed users from license file .
           totalUsersAssignedRole=humanMemb.getUserCountBasedOnRole();
           System.out.println("befor if totalUsersAssignedRole...."+totalUsersAssignedRole);
           
           if(totalUsersAssignedRole==-1)
           {
           	System.out.println("Inside if block....");
           	return new ModelAndView("callErrorPage");
           //	return mapping.findForward("callErrorPage");
           }
           
           boolean output=XMLParser.readXMLDecryptedContent(original);
           ArrayList uu=XMLParser.totalXMLUsers(original);
          String hh1=uu.get(0).toString();
          String hh2=uu.get(1).toString();
          String hh3=uu.get(2).toString();
          String hh4=uu.get(3).toString();
          request.setAttribute("nuser",hh1);
          request.setAttribute("sdate",hh2);
          request.setAttribute("edate",hh3);
          request.setAttribute("luser",hh4);
  
          if(output)
          {
           login = request.getParameter("textfield");
           pass = request.getParameter("textfield2");
       
           
           Debug.print("   Normal Login Process    Login Name:" + login);
          // Debug.print("   Normal Login Process    viewVal:" + viewVal);
           if(login != null && login.trim().length() != 0 && pass != null && pass.trim().length() != 0)
			try {
				
/* --------------------------ACTIVE DIRECTORY CODE START HERE---------------------------------------------------
				
				NewUser nu = new NewUser();
				ADchk = nu.active(login,pass);
				System.out.println("ACTIVE DIRECTORY RESULT HERE : "+ADchk);
				

			if (ADchk == true){
/* --------------------------ACTIVE DIRECTORY CODE END HERE---------------------------------------------------*/
				vObj = humanMemb.getLoginStatus(login, pass);
				String user_id=db.getuser_status(login); 
	               if(user_id != null){
	                file_path=db.getpicture_path(user_id);
	               }

	               					try
	              					 {
	              					 FileInputStream inpStream = new FileInputStream(file_path);
	              					 byte[] bytearr= IOUtils.toByteArray(inpStream);
	              					 byte byteImageData[]  =com.bea.xbean.util.Base64.encode(bytearr);
	              					  imagedata= new String(byteImageData);
	              					 System.out.println("sdvvv==>"+imagedata);
	              					 }
	              					 catch(Exception e)
	              					 {
	              					 System.out.println("Exception Occured"+e.toString());
	              					 }
/*			} else{
				System.out.println("LDAP Authentication faild");
			}
*/
				session.setAttribute("imagedata", imagedata);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
          // session.setAttribute("viewVal", viewVal);
           
          }
          
          else
          {
            status="expired";
            request.setAttribute("status",status);
            session.removeAttribute("adminUserId");
            return new ModelAndView("frmHome");
           // return mapping.findForward("ReLogin");   
          }
          

          if(vObj != null && (vObj.size() != 0)) {
             String[] logdet=null;

             logdet=(String[]) vObj.elementAt(0);
             if(logdet[0].equalsIgnoreCase("true")) {            
               // counting first Roles count for this userID
                 int count=humanMemb.getRolesCountForUser(logdet[1]);
                Debug.print("Count For Roles for this User"+count);
                 if(count==0)
                      request.setAttribute("requestStatus","false");
                 else if(count>0)
                 {
                     if(totalUsersAssignedRole>totalXMLUsers)
                     {
                         //System.out.println("If equal");
                         status="users";
                         request.setAttribute("status",status);
                         //System.out.println("If equal");
                         session.removeAttribute("adminUserId");
                         return new ModelAndView("frmLogin");
                         //return mapping.findForward("ReLogin");
                     }
                         
                     else if(totalUsersAssignedRole<=totalXMLUsers)
                     {
                       request.setAttribute("requestStatus","true");
                       //System.out.println("If less");
                     }
                 }  
               
                
                
                session.setAttribute("userCode",logdet[2]);
                session.setAttribute("userName",userName);
                session.setAttribute("userPassword",userPassword);
                session.setAttribute("userTypeName",logdet[4]);
                session.setAttribute("emailId",logdet[5]);
                session.setAttribute("memberId",logdet[6]);
                session.setAttribute("loginName",logdet[7]);
                session.setAttribute("lastName",logdet[8]);
                session.setAttribute("phoneNo",logdet[9]);
                session.setAttribute("periodValue",logdet[10]);
                session.setAttribute("userTypeId",logdet[11]);
                String request_Status=logdet[12];
                request.setAttribute("requestValue",request_Status);
                session.setAttribute("fname",fName);
                session.setAttribute("lname",lName);
                session.setAttribute("email",email);
                session.setAttribute("zip",zip);
                session.setAttribute("login_Name",loginName);
                session.setAttribute("searchMemId",memberId);
                session.setAttribute("fromDate",frmDate);
                session.setAttribute("toDate",tDate);
                session.setAttribute("rolesId",rolId);
                session.setAttribute("radMem",radMem);
                System.out.println(logdet[0]+" "+logdet[1]+" "+logdet[2]+" "+logdet[3]+" "+logdet[4]+" "+logdet[5]+" "+logdet[6]+" "+logdet[7]+" "+logdet[8]+" "+logdet[9] + " " + logdet[10] + " " + logdet[11]);
                   //return mapping.findForward("LoginSuccess");
              String msgCount = String.valueOf(db.totalMessageCount(logdet[1].trim()));
                session.setAttribute("msgCount",msgCount);
                
                boolean updateStat=humanMemb.updateLoginDate(logdet[1]);
               
                Debug.print("remote.updateLoginDate() in servlet :"+updateStat);
               
                  session.setAttribute("sessionId",session.getId()); 
                session.setAttribute("userId",logdet[1]);
                Debug.print("userId in logdet[1] :"+logdet[1]);
                session.setAttribute("firstName",logdet[3]);
                session.setAttribute("userName",login);
                session.setAttribute("userPassword",pass);
                status="success";
                request.setAttribute("status",status);
                 try {

        DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
       
        String str="C:/XML/";
        Document doc = docBuilder.parse (new File(str+"association-config.xml"));

        // normalize text representation
        doc.getDocumentElement ().normalize ();
        System.out.println ("Root element of the doc is " + doc.getDocumentElement().getNodeName());


        NodeList listOfPersons = doc.getElementsByTagName("first");
        int totalPersons = listOfPersons.getLength();
         for(int s=0; s<listOfPersons.getLength() ; s++){


            Node firstPersonNode = listOfPersons.item(s);
            if(firstPersonNode.getNodeType() == Node.ELEMENT_NODE){


                Element firstPersonElement = (Element)firstPersonNode;

                //-------
                NodeList firstNameList = firstPersonElement.getElementsByTagName("title");
                Element firstNameElement = (Element)firstNameList.item(0);

                NodeList textFNList = firstNameElement.getChildNodes();
                System.out.println("Title Name : " + ((Node)textFNList.item(0)).getNodeValue().trim());
                 String titleName=((Node)textFNList.item(0)).getNodeValue().trim();
                 session.setAttribute("title",titleName);
              

            }


        }


    }catch (SAXParseException err) {
    System.out.println ("** Parsing error" + ", line " 
         + err.getLineNumber () + ", uri " + err.getSystemId ());
    System.out.println(" " + err.getMessage ());

    }catch (SAXException e) {
    Exception x = e.getException ();
    ((x == null) ? e : x).printStackTrace ();

    }catch (Throwable t) {
    	
    t.printStackTrace ();
    System.out.println("Inside catch block");
    request.setAttribute("status","conFailed");
    return new ModelAndView("frmLogin");
   // return mapping.findForward("ReLogin");
    }
                 
         //=================Role mgt Process=====================
                 
                 //String firName = (String) session.getAttribute("fname");
                 String userIdVal = (String)session.getAttribute("userId");
                 System.out.println("user id value Role mgt Process............."+userId);
               
                 
                 String requestStat=(String)request.getAttribute("requestStatus");
                 String req_Value=(String)request.getAttribute("requestValue");
                System.out.println("Request Value is "+req_Value);
                String displayButton=(String)request.getAttribute("viewButton");
                System.out.println("display button....."+displayButton);
                 Debug.print("RequestStatus In main board"+requestStat);
                 try {
                 Debug.print("KlgLoginAction.initDashboard()");
                 
                 ArrayList roleList = new ArrayList();
                 ArrayList entityList = new ArrayList();
                 //ArrayList allList = new ArrayList();
                
                 
    String viewVal=(String) session.getAttribute("viewVal");
   
   
    Debug.print("View Value in Action Role Mgt"+viewVal);
    
    
                 if(userIdVal != null)
                	 System.out.println("after userIdVal loop............."+userIdVal);
                     roleList = db.getAllRolesBasedOnUser(userIdVal);
                    // String generalRoleId = "bc559b5e-3aaf-47c4-8560-d10197c86119";
                
                     String roleId = null;
                    
                     if(roleList != null && roleList.size() != 0) {
                         Iterator itEntList = roleList.iterator();
                         if(itEntList.hasNext()) {
                             String[] strRolelist = (String[])(String[])itEntList.next();
                             roleId = strRolelist[2];
                         }
                     }         
                     if(roleId != null && roleId.trim().length() != 0) {
                        // allList = db.getMappingDetailsForRlEntPriv(roleId);
                         entityList = db.getMappingDetailsForRlEnt(roleId);
                    
                         String roleDetails[] = db.getRole(roleId);
                         String roleName = roleDetails[1];
                         if(roleName == null)
                             roleName = "";
                         session.setAttribute("roleId", roleId);
                         session.setAttribute("roleName", roleName);
                     }   
                    // session.setAttribute("DBAllList", allList);
                     session.setAttribute("DBEntityList", entityList);
                    
                     
                   System.out.println("entityList size() in KlgLoginAction"+entityList.size());
 					
                   
                 }
                 catch(Exception eDisp) {
                     Debug.print("while calling initalDashboard:" + eDisp);
                 }
                 Debug.print("KlgLoginAction.initDashboard() sucessfully comes from servlet.");
                 session.setAttribute("userId",userIdVal);
                 if(requestStat.equalsIgnoreCase("true"))
                 {
                      System.out.println("first if ......");
                     session.setAttribute("requestStat","true");
                     session.setAttribute("req_Value","true");
                     
                     System.out.println("userId ::1"+userIdVal);
                     session.setAttribute("userId",userIdVal);
                     return new ModelAndView("dashboard");
                     //return mapping.findForward("LoginSuccess");
                 }
                 else if(displayButton!=null && requestStat.equalsIgnoreCase("false") && displayButton.equalsIgnoreCase("true"))
                 {
                     System.out.println("second if else......");

                     request.setAttribute("viewButton","true");
                     session.setAttribute("viewButton","true");

                     return new ModelAndView("frmIndex-no-role");
                     //return mapping.findForward("LoginSuccessNoRole");
                 }
                 else if(requestStat.equalsIgnoreCase("false") && req_Value.equalsIgnoreCase("true"))
                 {
                     System.out.println("Third if else......");
                     request.setAttribute("viewButton","true");
                     session.setAttribute("viewButton","true");
                     session.setAttribute("requestStat","false");
                     session.setAttribute("req_Value","true");
                     
                     return new ModelAndView("frmIndex-no-role");
                    // return mapping.findForward("LoginSuccessNoRole");
                 }
                 else if(requestStat.equalsIgnoreCase("false") && req_Value.equalsIgnoreCase("false"))
                     {
                        System.out.println("Fourth if else......");
                     session.setAttribute("requestStat","false");
                     session.setAttribute("req_Value","false");
                     return new ModelAndView("frmIndex-no-role"); 
                     //return mapping.findForward("LoginSuccessNoRole");
                 }
                 session.setAttribute("userId",userIdVal);
                 System.out.println("userId ::2"+userId);
                  return new ModelAndView("dashboard");
               // return mapping.findForward("callMainBoard");

             }
             else  {
                 status="fail";
                 request.setAttribute("status",status);
                 session.removeAttribute("adminUserId");
                 return new ModelAndView("frmHome"); 
               //  return mapping.findForward("ReLogin");
                 
             }
   
         }
         else{
             status="fail";
             request.setAttribute("status",status);
             session.removeAttribute("adminUserId");
             
             return new ModelAndView("frmHome");
             
         }
          
       }
       else if(loginProcess != null && loginProcess.equals("initIndex")){
    	  
           ArrayList privList = new ArrayList();
           ArrayList allList = new ArrayList();
          
    	   String userId = request.getParameter("UsrId");
    	   String entityId = request.getParameter("entityId");
    	   String roleId = request.getParameter("roleId");
    	  
    	 
          
                   allList = db.getMappingDetailsForRlEntPrivPerm(roleId,entityId);              
                   privList = db.getMappingDetailsForRlEntPriv(roleId,entityId);
               
               session.setAttribute("DBAllList", allList);
               session.setAttribute("privList", privList);
               System.out.println("userId in index servlet : "+userId);
               session.setAttribute("userId",userId); 
          
             System.out.println("entityList size() in KlgLoginAction"+privList.size()); 
    	   
    	  
    	   return new ModelAndView("index");
       }  
       
       
     
       
       
       
       
       
       
       
       
       return new ModelAndView("frmHome");
		
	}

public static Context getInitialContext() throws javax.naming.NamingException {
    Properties p =new Properties();
    p.setProperty( "java.naming.factory.initial", "org.jnp.interfaces.NamingContextFactory" );
    p.setProperty( "java.naming.factory.url.pkgs", "org.jboss.naming:org.jnp.interfaces" );
    p.setProperty( "java.naming.provider.url", "localhost:11199" );
    return new javax.naming.InitialContext(p);
  }           
}
