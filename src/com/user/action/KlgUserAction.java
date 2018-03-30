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
package com.user.action;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.apache.xmlrpc.XmlRpcException;
import org.jasypt.util.text.BasicTextEncryptor;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.StringTokenizer;
import java.util.Vector;
 

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
 
//import org.apache.struts.util.MessageResources;
import org.jasypt.util.text.BasicTextEncryptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

import com.db.GeneralDBAction;
import com.google.gson.Gson;
import com.hlccommon.util.Debug;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.util.HLCContactDetails;
import com.hlcform.util.HLCMemberDetails;
import com.hlcform.util.HLCPaymentDetails;
import com.hlcform.util.HLCUserMaster;
import com.hlchorse.form.display.HLCKaverySessionStatefulBean;
import com.hlchorse.form.util.HLCUserRegVO;
//import com.user.actionform.KlgUserRegActionForm;
import com.util.XMLParser;
import com.util.email.EmailContent;
import com.util.email.EmailEngine;
import com.util.email.MailMail;

import com.hlcmsg.groups.*;
import com.hlcrole.management.HLCBrahmaputraSessionBean;
import com.infusionejb.session.InfusionSessionBean;
//import com.hlcutil.HLCMemberVO;
import com.mysql.dao.MySQLDAO;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;

import org.springframework.ui.ModelMap;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/*------------------------------------------------------PRABHU HERE---------------------------*/
import com.AD.action.*;
/*---------------------------------------------------PRABHU END HERE----------------------------*/


public class KlgUserAction implements Controller  {
	
	static Logger log = Logger.getLogger(KlgUserAction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;

	String userId = null;
    Vector vObj = new Vector();
    String status=null;
    
    private InfusionSessionBean obj1;
	{
		try{
			obj1 = new InfusionSessionBean();
		}catch(Exception e){
			 throw new RuntimeException(e);
		}
	}
    
	Properties properties = new Properties();
	
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		
		//=====================Properties log file configuration started here==============================
		 PrintWriter writer = response.getWriter(); 
		
		Properties logProp = new Properties();  
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);
	      logProp.load(is); 
	      PropertyConfigurator.configure(logProp);      
	      log.info("Logging enabled"); 
	      //=====================Properties log file configuration started here==============================
	
	      properties.load(getClass().getClassLoader().getResourceAsStream("/infusionMail.properties"));
         
         HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
         HLCMessageSessionBean msgBean=new HLCMessageSessionBean();
         HLCBrahmaputraSessionBean roleBean=new HLCBrahmaputraSessionBean(); 
         HLCKaverySessionStatefulBean hrsBean=new HLCKaverySessionStatefulBean();
         
       
        
         HLCUserRegVO userregvo=new HLCUserRegVO();
         GeneralDBAction db=new GeneralDBAction();	 
        
         HttpSession session=request.getSession(true); 
         String usrProcess=request.getParameter("cmd");
         String source = request.getParameter("source");
         
         if(usrProcess.equals("initUsr")){
                     
         return new ModelAndView("frmMemberUserSignup");
        
         }else if(usrProcess.equals("initUsrReg")){
        	   	 
        	 return new ModelAndView("frmMemberUserRegistration");	 
        	 
         }else if(usrProcess.equals("usrReg")){
        /*	 try {
        		 
        		// /*------------------------------------PRABHU START HERE-------------------------------------------------/
                 String username = request.getParameter("usrname");
                 String firstname = request.getParameter("fname");
                 String lastname = request.getParameter("lname");
                 String usrPassword = request.getParameter("cpwd");
                 NewUser nu = new NewUser(username, firstname, lastname, usrPassword, "SharePoint");
                 
                 boolean addUsrStatus = nu.addUser();
                // boolean addUsrToGroupStatus = nu.addUserToGroup();
         		//boolean status = nu.deleteUser("kamal123");
         		//nu.assignUser("kamal123", "JavaSample");
         		if (addUsrStatus == true){
         			System.out.println("user created in Active Directory succcessfully");	
         		
/*------------------------------------PRABHU END HERE-------------------------------------------------*/
        	 
        	 String usrSalutation = null;
        	 String fName = null;
        	 String mName = null;
        	 String lName = null;
        	 String sName = null;
        	 String usrDOB = null;
        	 String gender = null;
        	 String usrName = null;
        	 String usrEmail = null;
        	 String usrPwd = null;
        	 String usrCnfPwd = null;
        	 String usrCompanyDetails = null;
        	 String usrCategory = null;
        	 String secretQuestion = null;
        	 String secretAns = null;
        	 String paddPlotNo = null;
        	 String paddBuildNo = null;
        	 String paddFloorNo = null;
        	 String paddStreetNo = null;
        	 String paddLane = null;
        	 String paddArea = null;
        	 String paddCity = null;
        	 String paddCountry = null;
        	 String paddState = null;
        	 String paddZip = null;
        	 String paddCntryPhn = null;
        	 String paddAreaPhone = null;
        	 String paddNoPhone = null;
        	 String paddCntryMob = null;
        	 String paddNoMob = null;
        	 String paddCntryFax = null;
        	 String paddAreaFax = null;
        	 String paddNoFax = null;
        	 String secAddrReqOrNot = null;
        	 String saddPlotBuildFloor = null;
        	 String saddPlotNo = null;
        	 String saddBuildingNo = null;
        	 String saddFloorNo = null;
        	 String saddStreet = null;
        	 String saddLane = null;
        	 String saddArea = null;
        	 String saddCity = null;
        	 String saddCountry = null;
        	 String saddState = null;
        	 String saddZip = null;
        	 String saddCntryPhone = null;
        	 String saddAreaPhone = null;
        	 String saddNoPhone = null;
        	 String saddCntryMob = null;
        	 String saddNoMob = null;
        	 String saddCntryFax = null;
        	 String saddAreaFax = null;
        	 String saddNoFax = null;
        	 String PreferredAddrType = null;
        	 String NonUseaEmail = null;
        	 String NonUseaMail = null;
        	 String fileLocation = null;
        
        	 

     
  	                	 
  	                	
  	                	 System.out.println("1");
  	                	 System.out.println("2");
  	                	 
  	                	 String fileSavePath;
  	        			 String UPLOAD_DIRECTORY ="c:\\userdocuments\\";
  	        			 List<FilePart> fileList = new ArrayList<FilePart>();
  	      
  	                	 
  	                	//Multiple file upload Start here-----------------------------------------------	
  	        			String parmName = "";

  	        			String factlist[] = null;
  	        			List<String> factList = new ArrayList<String>();
  	        			 fileSavePath =  UPLOAD_DIRECTORY;/*save uploaded files to a 'Upload' directory in the web app*/
  	        		        if (!(new File(fileSavePath)).exists()) {
  	        		            (new File(fileSavePath)).mkdir();    // creates the directory if it does not exist        
  	        		        }
  	        		    

  	        		    
  	        		        String resp = "";
  	        		        int i = 1;
  	        		        
  	        		        resp += "<br>Here is information about uploaded files.<br>";
  	        		        try {
  	        		            MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 1024);  /* file limit size of 1GB*/
  	        		            Part _part;
  	        		            int k=0;
  	        		            while ((_part = parser.readNextPart()) != null) {
  	        		            	System.out.println("LOOP START"+_part.getName());
  	        		            	parmName = _part.getName();
  	        		            	
  	        		            	
  	        		            	
  	        		                if (_part.isFile()) {
  	        		                	System.out.println("File Uploadddd");
  	        		                    FilePart fPart = (FilePart) _part;  // get some info about the file
  	        		                    String name = fPart.getFileName();
//  	        		                    fileList = (List) fPart;
  	        		                    fileList.add(fPart);
  	        		                    //InputStream in = fPart.getInputStream();
  	        		                    
  	        		             
  	        		                    
  	        		                    if (name != null) {
  	        		                        long fileSize = fPart.writeTo(new File(fileSavePath));
  	        		                        resp += i++ + ". " + fPart.getFilePath() + "[" + fileSize / 1024 + " KB]<br>";
  	        		                        String saveFile=fileSavePath+name;
											fileLocation = saveFile;
  	        			                    //db5.adddocumentfromstudent(user_id,name,saveFile);
  	        		                        String status = "";
  	        					             //db.adddocumentfromcustomer(userId,name,saveFile);
  	        					             status = "success";
  	        					             System.out.println("status from servlet : "+status);
  	        					             request.setAttribute("status",status);
  	        		                    } else {
  	        		                        resp = "<br>The user did not upload a file for this part.";
  	        		                    }
  	        		                }
  	        		                
  	        		                if(_part.isParam()){
  	        		                	System.out.println("Inside paramPart");
  	        		                	ParamPart paramPart = (ParamPart)_part;
  	        		                	if(parmName.equals("USelect")){
  	        		                		usrSalutation = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("fname")){
  	        		                		fName = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("mname")){
  	        		                		mName = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("lname")){
  	        		                		lName = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("sname")){
  	        		                		sName = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("dat")){
  	        		                		usrDOB = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("gender")){
  	        		                		gender = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("usrname")){
  	        		                		usrName = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("email")){
  	        		                		usrEmail = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("pwd")){
  	        		                		usrPwd = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("cpwd")){
  	        		                		usrCnfPwd = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	
  	        		                	if(parmName.equals("QSelect")){
  	        		                		secretQuestion = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("ans")){
  	        		                		secretAns = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("padd_txt_plotNo")){
  	        		                		paddPlotNo = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("padd_txt_buildNo")){
  	        		                		paddBuildNo = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("padd_txt_floorNo")){
  	        		                		paddFloorNo = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("padd_txt_strtAddr")){
  	        		                		paddStreetNo = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("padd_txt_lane")){
  	        		                		paddLane = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("padd_txt_area")){
  	        		                		paddArea = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("pcity_txt")){
  	        		                		paddCity = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("pcountry_sel")){
  	        		                		paddCountry = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("pstate_sel")){
  	        		                		paddState = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("pzip_txt")){
  	        		                		paddZip = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("country_phone_txt")){
  	        		                		paddCntryPhn = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("area_phone_txt")){
  	        		                		paddAreaPhone = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("no_phone_txt")){
  	        		                		paddNoPhone = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("country_mob_txt")){
  	        		                		paddCntryMob = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("no_mob_txt")){
  	        		                		paddNoMob = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("country_fax_txt")){
  	        		                		paddCntryFax = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("area_fax_txt")){
  	        		                		paddAreaFax = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("no_fax_txt")){
  	        		                		paddNoFax = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("secAddrReqOrNot")){
  	        		                		secAddrReqOrNot = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("sadd_txt_plot")){
  	        		                		saddPlotNo = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("sadd_txt_build_no")){
  	        		                		saddBuildingNo = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("sadd_txt_floor")){
  	        		                		saddFloorNo = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("sadd_txt_strt_addr")){
  	        		                		saddStreet = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("sadd_txt_laneNo")){
  	        		                		saddLane = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("sadd_txt_area")){
  	        		                		saddArea = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("scity_txt")){
  	        		                		saddCity = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("scountry_txt")){
  	        		                		saddCountry = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("sstate_txt")){
  	        		                		saddState = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("szip_txt")){
  	        		                		saddZip = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("s_country_phone_txt")){
  	        		                		saddCntryPhone = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("s_area_phone_txt")){
  	        		                		saddAreaPhone = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("s_no_phone_txt")){
  	        		                		saddNoPhone = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("s_country_mob_txt")){
  	        		                		saddCntryMob = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("s_no_mob_txt")){
  	        		                		saddNoMob = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("s_country_fax_txt")){
  	        		                		saddCntryFax = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("s_area_fax_txt")){
  	        		                		saddAreaFax = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("s_no_fax_txt")){
  	        		                		saddNoFax = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("PreferredAddrType")){
  	        		                		PreferredAddrType = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("nonUseaEmail")){
  	        		                		NonUseaEmail = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	if(parmName.equals("nonUseaMail")){
  	        		                		NonUseaMail = paramPart.getStringValue();
  	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
  	        		                		
  	        		                	}
  	        		                	
  	        		                	
  	        		                	
  	        		                	
  	        		                	
  	        		                	
  	        		                }
  	        		                
  	        		            }// end while 
  	        		        } catch (java.io.IOException ioe) {
  	        		            resp = ioe.getMessage();
  	        		        }
  	        //Multiple file upload end here-----------------------------------------------		
  	        			       
  	   //Test file upload end here-----------------------------------
  	                	 if(fileList.isEmpty()){
  	                		 System.out.println("File list is Empty----------------");
  	                	 }else{
  	                		 System.out.println("File is not Empty");
  	                	 }
        		 
        		 BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
                 textEncryptor.setPassword("sa");	 
        		 
                 HLCUserMaster objUserMaster = new HLCUserMaster();
                 HLCContactDetails objContact = new HLCContactDetails();
                 HLCMemberDetails objMember = new HLCMemberDetails();
                 HLCPaymentDetails objPayment = new HLCPaymentDetails();
               
                 System.out.println("inside user registration ..........");

               
               // String bday = request.getParameter("birthyear") + "-" + request.getParameter("birthmonth") + "-" + request.getParameter("birthday");
                // System.out.println(bday);
                 System.out.println("DOB::::"+usrDOB);
                 //String bday = request.getParameter("birthyear") + "-" + request.getParameter("birthmonth") + "-" + request.getParameter("birthday");
                 //System.out.println(bday);
                 String[] parts = usrDOB.split("-");
                 String part1 = parts[0]; // mm
                 String part2 = parts[1]; // dd
                 String part3 = parts[2]; //yy
                 String dob=part3+"-"+part1+"-"+part2;
                 
                 System.out.println("DOB Split::::"+dob);

                 objUserMaster.setUserTypeName("");
                 objUserMaster.setPrefix(usrSalutation);
                 objUserMaster.setFirstName(fName);
                 objUserMaster.setMiddleName(mName);
                 objUserMaster.setLastName(lName);
                 objUserMaster.setSufix(sName);
                 objUserMaster.setDob(dob);
                 objUserMaster.setGender(gender);
                 objUserMaster.setEmailId(usrEmail);
                 
                 
                 //String str=request.getParameter("cpwd");
                 String encryptedPWD = textEncryptor.encrypt(usrCnfPwd);
                  objUserMaster.setPassword(encryptedPWD);
                  objUserMaster.setSecretQuestion(secretQuestion);
                 objUserMaster.setSecretAnswer(secretAns);
                 objUserMaster.setLoginName(usrName); 
                 if (NonUseaEmail != null) {
                     objUserMaster.setNonUseaEmailStatus(true);
                     System.out.println("commit nonUseaEMail status--true");
                 } else {
                     objUserMaster.setNonUseaEmailStatus(false);
                     System.out.println("commit nonUseaEMail status--false");
                 }
                 if (NonUseaMail != null) {
                     objUserMaster.setNonUseaMailingStatus(true);
                     System.out.println("commit nonUseaMail status--true");
                 } else {
                     objUserMaster.setNonUseaMailingStatus(false);
                     System.out.println("commit nonUseaMail status--false");
                 }
                 if (secAddrReqOrNot.equalsIgnoreCase("Secondary")) {
                     objUserMaster.setCommunicationAddress("Primary");
                 }

                 if (secAddrReqOrNot.equalsIgnoreCase("Primary")) {
                	 objUserMaster.setCommunicationAddress(PreferredAddrType);
                 }
                // String usrCrit=request.getParameter("usrCriteria");
                 // remote.editUserDetails(objUserMaster);

                 String usrid = db.addUserRegistration(objUserMaster);
				 
				  if(usrid != null){
			              String user_id=db.getuserid(usrName);
			              String status=db.adduserpicture(user_id,fileLocation);
			         	 }
         	

                 Debug.print("remote.addUserRegistration(objUserMaster) usrid :" + usrid);
                 
                 /*if(usrid!=null){
                 	boolean result = humanMemb.addUserCriteria(usrid, usrCrit);
                 }
*/
                 
                 Vector uid = new Vector();
        
               //  uid = (Vector) humanMemb.getUserIdByLoginName(request.getParameter("usrname"));
                // String usrId = (String) uid.elementAt(0);
                // Debug.print("usrId after reg :" + usrId);
                 
                 objContact.setUserId(usrid);
                 String finalPrimaryPh = "";

                 String isdno=paddCntryPhn;
                 String areacode=paddAreaPhone;
                 String phno=paddNoPhone;
                 String primaryphno=isdno+"-"+areacode+"-"+phno;
                 System.out.println("isdno;;;;;;;;"+isdno);
                 System.out.println("areacode;;;;;;;;"+areacode);
                 System.out.println("phno;;;;;;;;"+phno);
                 System.out.println("primaryphno;;;;;;;;"+primaryphno);

                 if (primaryphno != null) {
                     Debug.print("request.getParameter(pphone_txt) value:" + request.getParameter("primaryphno"));

                     StringTokenizer strTkns = new StringTokenizer(primaryphno, "[](),.-{}");
                    
                     System.out.println("Phone;;;;;;;;"+strTkns);
                     
                     while (strTkns.hasMoreTokens()) {
                      	try {
                             String phNo = (String) strTkns.nextToken();

                             if (phNo != null && phNo.trim().length() != 0) {
                                 Debug.print("ph no Added from Stokenizer:" + phNo);
                                 finalPrimaryPh = finalPrimaryPh + phNo;
                                 System.out.println("finalPrimaryPh;;;;;;;;"+finalPrimaryPh);
                             }
                         } catch (Exception e) {
                             Debug.print("ph no tokanizing exception:" + e);
                         }
                     }

                     Debug.print("finally appended primary phNo :" + finalPrimaryPh);
                     System.out.println("finally appended primary phNo;;;;;;;;"+finalPrimaryPh);
                 }

                 String finalPrimaryMob = "";
                 String isdmob=paddCntryMob;
                 String areamob=paddNoMob;
                 String primarymob=isdmob+"-"+areamob;
                 System.out.println("isdmob;;;;;;;;"+isdmob);
                 System.out.println("areamob;;;;;;;;"+isdmob);
                 //System.out.println("phno;;;;;;;;"+phno);
                 System.out.println("primarymob;;;;;;;;"+primarymob);
                 if (primarymob != null) {
                     Debug.print("request.getParameter(pmob_txt) value:" +primarymob);

                     StringTokenizer strTkns = new StringTokenizer(primarymob, "[](),.-{}");

                     while (strTkns.hasMoreTokens()) {
                         try {
                             String phNo = (String) strTkns.nextToken();

                             if (phNo != null && phNo.trim().length() != 0) {
                                 Debug.print("ph no Added from Stokenizer:" + phNo);
                                 finalPrimaryMob = finalPrimaryMob + phNo;
                             }
                         } catch (Exception e) {
                             Debug.print("ph no tokanizing exception:" + e);
                         }
                     }

                     Debug.print("finally appended primary finalPrimaryMob :" + finalPrimaryMob);
                 }

                 String finalPrimaryFax = "";
                 String isdfax=paddCntryFax;
                 String areafax=paddAreaFax;
                 String faxno=paddNoFax;
                 String primaryfax=isdfax+"-"+areafax+"-"+faxno;
                 System.out.println("isdmob;;;;;;;;"+isdmob);
                 System.out.println("areamob;;;;;;;;"+isdmob);
                 //System.out.println("phno;;;;;;;;"+phno);
                 System.out.println("primaryfax;;;;;;;;"+primaryfax);

                 if (primaryfax != null) {
                     Debug.print("request.getParameter(pfax_txt) value:" + primaryfax);

                     StringTokenizer strTkns = new StringTokenizer(primaryfax, "[](),.-{}");

                     while (strTkns.hasMoreTokens()) {
                         try {
                             String phNo = (String) strTkns.nextToken();

                             if (phNo != null && phNo.trim().length() != 0) {
                                 Debug.print("ph no Added from Stokenizer:" + phNo);
                                 finalPrimaryFax = finalPrimaryFax + phNo;
                             }
                         } catch (Exception e) {
                             Debug.print("ph no tokanizing exception:" + e);
                         }
                     }

                     Debug.print("finally appended primary finalPrimaryFax :" + finalPrimaryFax);
                 }

                 objContact.setContactType("Primary");
                 String address1 = paddPlotNo+" "+paddBuildNo+" "+paddFloorNo+" "+paddStreetNo;
                 String parea = paddArea;
                 //String address2 = request.getParameter("padd_txt2");
                 String pLane = paddLane;
                 String setAddressOne = address1;
                 String setAddresstwo = parea+"\n"+pLane;
                 System.out.println("setAddressOne :::::::::::::"+setAddressOne);
                 System.out.println("setAddresstwo :::::::::::::"+setAddresstwo);
                 
                 objContact.setAddress1(setAddressOne);
                 objContact.setAddress2(setAddresstwo);
                 objContact.setCity(paddCity);
                 objContact.setState(paddState);
                 objContact.setCountry(paddCountry);
                 objContact.setZip(paddZip);
                 objContact.setPhoneNo(finalPrimaryPh);
                 objContact.setMobileNo(finalPrimaryMob);
                 objContact.setFaxNo(finalPrimaryFax);
                 db.addContactDetails(objContact,objUserMaster.getLoginName());


                 boolean result = new MySQLDAO().insertUserDetailToMqSQL(objUserMaster, objContact);
                 Debug.print("MySql Result :" + result);

                 if (secAddrReqOrNot.equalsIgnoreCase("Primary")) {
                	 objContact.setUserId(usrid);
                     String finalSecPh = "";
                     String sisdno=saddCntryPhone;
                     String sareacode=saddAreaPhone;
                     String sphno=saddNoPhone;
                     String secondaryphno=sisdno+"-"+sareacode+"-"+sphno;
                     System.out.println("sisdno;;;;;;;;"+sisdno);
                     System.out.println("sareacode;;;;;;;;"+sareacode);
                     System.out.println("sphno;;;;;;;;"+sphno);
                     System.out.println("secondaryphno;;;;;;;;"+secondaryphno);
                     if (secondaryphno != null) {

                         StringTokenizer strTkns1 = new StringTokenizer(secondaryphno, "[](),.-{}");


                         while (strTkns1.hasMoreTokens()) {
                             try {
                                 String phNo = (String) strTkns1.nextToken();

                                 if (phNo != null && phNo.trim().length() != 0) {
                                     Debug.print("ph no Added from Stokenizer:" + phNo);
                                     finalSecPh = finalSecPh + phNo;
                                 }
                             } catch (Exception e) {
                                 Debug.print("Secondary ph no tokanizing exception:" + e);
                             }
                         }

                         Debug.print("finally appended Secondary phNo :" + finalSecPh);
                     }

                     String finalSecMob = "";
                     String sisdmob=saddCntryMob;
                     //String sareacode=request.getParameter("smob_txt");
                     String smobno=saddNoMob;
                     String secondarymob=sisdmob+"-"+smobno;
                     System.out.println("sisdmob;;;;;;;;"+sisdmob);
                     //System.out.println("areacode;;;;;;;;"+areacode);
                     System.out.println("secondarymob;;;;;;;;"+secondarymob);
                    System.out.println("smobno;;;;;;;;"+smobno);
                     if (saddNoMob != null) {

                         StringTokenizer strTkns1 = new StringTokenizer(saddNoMob, "[](),.-{}");


                         while (strTkns1.hasMoreTokens()) {
                             try {
                                 String phNo = (String) strTkns1.nextToken();

                                 if (phNo != null && phNo.trim().length() != 0) {
                                     Debug.print("ph no Added from Stokenizer:" + phNo);
                                     finalSecMob = finalSecMob + phNo;
                                 }
                             } catch (Exception e) {
                                 Debug.print("Secondary ph no tokanizing exception:" + e);
                             }
                         }

                         Debug.print("finally appended Secondary finalSecMob :" + finalSecMob);
                     }

                     String finalSecFax = "";
                     String sisdfax=saddCntryFax;
                     String sareafax=saddAreaFax;
                     String sfax=saddNoFax;
                     String secondaryfax=sisdfax+"-"+sareafax+"-"+sfax;
                     System.out.println("sisdno;;;;;;;;"+sisdno);
                     System.out.println("sareacode;;;;;;;;"+sareacode);
                     System.out.println("sphno;;;;;;;;"+sphno);
                     System.out.println("secondaryphno;;;;;;;;"+secondaryphno);
                     if (secondaryfax != null) {

                         StringTokenizer strTkns1 = new StringTokenizer(secondaryfax, "[](),.-{}");


                         while (strTkns1.hasMoreTokens()) {
                             try {
                                 String phNo = (String) strTkns1.nextToken();

                                 if (phNo != null && phNo.trim().length() != 0) {
                                     Debug.print("ph no Added from Stokenizer:" + phNo);
                                     finalSecFax = finalSecFax + phNo;
                                 }
                             } catch (Exception e) {
                                 Debug.print("Secondary ph no tokanizing exception:" + e);
                             }
                         }

                         Debug.print("finally appended Secondary finalSecFax :" + finalSecFax);
                     }

                     objContact.setContactType("Secondary");
                     saddPlotBuildFloor = saddPlotNo+"_"+saddBuildingNo+"_"+saddFloorNo;
                     String address11 = saddPlotBuildFloor;
                     String sarea = saddArea;
                     String address22 = saddStreet;
                     String sLane = saddLane;
                     String ssetAddressOne = address11+"\n"+sarea;
                     String ssetAddresstwo = address22+"\n"+sLane;
                     System.out.println("ssetAddressOne :::::::::::::"+ssetAddressOne);
                     System.out.println("ssetAddresstwo :::::::::::::"+ssetAddresstwo);
                     objContact.setAddress1(ssetAddressOne);
                     objContact.setAddress2(ssetAddresstwo);
                  
                     objContact.setCity(saddCity);
                     objContact.setState(saddState);
                     objContact.setCountry(saddCountry);
                     objContact.setZip(saddZip);
                     objContact.setPhoneNo(finalSecPh);
                     objContact.setMobileNo(finalSecMob);
                     objContact.setFaxNo(finalSecFax);
                     db.addContactDetails(objContact,objUserMaster.getLoginName());

                 }

                 request.setAttribute("pwd", usrCnfPwd);
                 request.setAttribute("loginName", usrName);       
                 request.setAttribute("Cnfemail",usrEmail);
         
                 /* =====================================
                 *
                 * Sending confirmation E-mail
                 *
                 * ====================================*/
                 
                 
                 //String fromAddress = "prabhu.pandi@digiblitz.in";
                 String fromAddress = properties.getProperty("infusionMail.fromAddress");
                 String toAddress = usrEmail;
                 String ccAddresses = "";
                 String bccAddresses = "";
                 String contentType = "HTML/TEXT";
                // String subject = "Your Username";
                 //String htmlBody = "Congradulation! You have Registered successfully";
                 String textBody = "";
                 
               /*  System.out.println("infusion soft property values: ----> "+fromAddress+" toAddress "+toAddress+" subject "+subject+" htmlBody "+" textBody "+textBody);
                 System.out.println("ccAddresses "+ccAddresses+" bccAddresses "+bccAddresses);
                 //Infusion Soft mail starts
*/                
					String subject="Your Account Information";
					String htmlBody="<html><body><div style=\" background-color: #d8dde4;  padding: 32px 10px;text-align: center!important;\"><div style=\"max-width: 580px; text-align: center;margin: 0 auto;width: 100%; display: inline-block;" +
	                			"text-align: center;vertical-align: top; width: 100%;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody><tr><td align=\"center\" valign=\"top\" style=\" background-color: #2f68b4;border-radius: 4px 4px 0 0;padding-bottom: 16px; text-align: center;\">" +
	                			"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"padding-top: 16px;\"><a href=\"#\"><img style=\"height: auto; max-width: 156px;\" src=\"https://www.digiblitzonline.com:8843/KlugWerks/images/klug_Logo.png\" alt=\"Logo\"/></a></td>" +
	                			" </tr></tbody></table></td></tr></tbody></table><div ><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"background-color: #fff;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody>" +
	                			"<tr><td align=\"center\" valign=\"top\" style=\"  padding: 16px;text-align: center; vertical-align: top;\"><table style=\"width: 48px;clear: both; margin-left: auto; margin-right: auto;\"  width=\"80\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td >&nbsp;</td>" +
	                			"</tr><tr> <td style=\"background-color: #e1e3e7;border-radius: 80px; height: 48px;line-height: 1;padding: 8px;\"></td>" +
	                					"</tr><tr><td >&nbsp;</td></tr></tbody></table><h4 style=\"font-size: 22px;font-weight: 700;line-height: 30px; margin: 16px 0 8px;padding: 0;color: #383d42;text-align: center;\">Congratulations User!</h4><p style=\"   font-size: 19px;" +
	                					"line-height: 27px; margin-bottom: 16px;margin-top: 16px; text-align: center;\">You have finished setting up your account.</p><table style=\" clear: both; margin: 0 auto;\" align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
	                					"<tbody> <tr> <td style=\"border-radius: 4px;padding: 12px 24px;text-align: center;vertical-align: middle;background-color: #22aaa0; font-size: 16px;\" class=\"font_default\"><a style=\"font-weight: 700; color:#fff;\" href=\"https://www.digiblitzonline.com:8843/KlugWerks\"><span style=\" display: block;text-align: center; color: #fff;\">Login to Your Account</span></a></td>" +
	                					"</tr> </tbody> </table> <p>&nbsp; </p> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <table  width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody> <tr> <td align=\"center\" valign=\"top\" style=\"background-color: #fff;  padding: 16px; text-align: center; vertical-align: top;\">" +
	                					"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td style=\"color: #888;\" align=\"center\" valign=\"top\" style=\" padding: 16px; text-align: center; vertical-align: top;\">" +
	                					" <p style=\" line-height: 23px; margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
	                					"<strong>Username</strong><br />"+usrName+"</p> <p style=\" line-height: 23px; margin-bottom: 24px;margin-top: 16px;font-size: 15px;\">" +
	                					"<strong>Password</strong><br />"+usrCnfPwd+"</p> " +
	                					"</td> </tr> </tbody></table></td></tr></tbody></table></div></div></div></div></body></html>";
                                  
        //obj1.sendEmail(properties.getProperty("infusionMail.fromAddress"), usrEmail, properties.getProperty("infusionMail.ccAddresses"), properties.getProperty("infusionMail.bccAddresses"), properties.getProperty("infusionMail.contentType"), properties.getProperty("infusionMail.subject"), properties.getProperty("infusionMail.htmlBody"), properties.getProperty("infusionMail.textBody"));
             try {
				obj1.sendEmail(fromAddress, toAddress, ccAddresses, bccAddresses, contentType, subject, htmlBody, textBody);
			} catch (XmlRpcException e) {
			// TODO Auto-generated catch block
				e.printStackTrace();
			}
                         
                         System.out.println("Mail has been send successfully");                                 
                //Infusion Soft mail ends
                 
                 
                 
                 
                String emailid = usrEmail;
                String toMailIds[] = {emailid};
                EmailContent email = new EmailContent();
                email.setTo(toMailIds);
                email.setFrom("dhivya@digiblitz.in");
                email.setSubject("Your Account Info !");

                String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                        " <tr>" +
                        " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                        " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                        "<tr>" +
                        "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"HLC Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
                        " </tr>" +
                        "  <tr>" +
                        "<td valign=\"top\">" +
                        "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                        "<tr>" +
                        "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopLeft.jpg\" width=\"13\" height=\"12\" /></td> " +
                        "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                        "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopRght.jpg\" width=\"13\" height=\"12\" /></td>" +
                        "</tr>" +
                        "<tr>" +
                        "<td valign=\"top\" background=\"images/left.jpg\">&nbsp;</td>" +
                        "<td valign=\"top\" bgcolor=\"#FBF2F2\">" +
                        "<span class=\"boldTxt\">Dear " + fName + "</span>,<br /><br />" +
                        "<p>Please save this email for your records. Your account information is as follows:.<p>" + "<p>----------------------------<p>" + "<p>UserName :" + usrName + "<p> password: " +usrCnfPwd + "<p> ----------------------------<p>" +
                        /*"<p>Your account would be activated through your confirmation by visiting the following link: <p>"+
                        "<a href=http://192.168.3.98:8090/dashboad-war/uservalidate.do?email="+request.getParameter("email")+"> Click Here to Activate your Account </a>"+*/
                        "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>" +
                        "Thank You <br />" +
                        "------------------ <br />" +
                        "<span class=\"boldRedTxt\">HLC Team</span></td>" +
                        "<td valign=\"top\" background=\"images/Rght.jpg\">&nbsp;</td>" +
                        "</tr>" +
                        "<tr><td valign=\"top\" background=\"images/cornerBotLeft.jpg\">&nbsp;</td>" +
                        "<td valign=\"top\" background=\"images/cornerBot.jpg\">&nbsp;</td>" +
                        "<td valign=\"top\" background=\"images/cornerBotRght.jpg\">&nbsp;</td>" +
                        "</tr>" +
                        " </table>" +
                        "</td></tr>" +
                        "+<tr>" +
                        "<td valign=\"top\" style=\"padding:10px;\">" +
                        "<img src=\"images/pic.jpg\" width=\"272\" height=\"76\" style=\"float:right; padding-left:8px; padding-bottom:8px;\" />" +
                        "<p>The easiest way to access your day to day HLC activities online or offline where ever you are and when ever you want." +
                        "</p>If you are a NEW VISITOR, register now and ENJOY the following privileges:" +
                        "<ul>" +
                        "<li>Unlimited shopping online.</li>" +
                        "<li>Place advertisements online and/or on-site.</li>" +
                        "<li>Sponsor competitions held by HLC.</li>" +
                        "</ul>" +
                        "Also, REGISTER NOW! and become a member of HLC to access and 	enjoy the following privileges as per your Membership Type and as " +
                        "per your �Role� assigned:" +
                        "<ul>" +
                        "<li>Compete in Equestrian Events held by HLC.</li>" +
                        "<li>Take part in other events like; Annual Meetings, Educational events," +
                        "Activity Meetings held by HLC etc.</li>" +
                        "<li>Send Messages to other members.</li>" +
                        "<li>Create your own Distribution Lists.</li>" +
                        "<li>Create/Join a group and share your thoughts and common ideas.</li>" +
                        " <li>Unlimited Shopping online.</li>" +
                        " <li>Place advertisements online and/or on-site.</li>" +
                        " <li>Sponsor competitions held by HLC.</li>" +
                        "</ul>" +
                        "and much more..." +
                        "So go ahead and <a href=http://dashboard.useventing.com/>LOGIN NOW!</a></td>" +
                        "</tr>" +
                        " <tr>" +
                        "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>" +
                        "</tr>" +
                        "</table>";


                email.setBody(content);
                //email.setAttachments();

                EmailEngine emailEngine = new EmailEngine();
                boolean emailFlag = emailEngine.sendMimeEmail(email);
                Debug.print("Email sent sucessfully :" + emailFlag);
                request.setAttribute("source", source);     
                
/*-----------------------------------------------PRABHU START HERE----------------------------------------------                
                
         		} else{
         			System.out.println("Cannot registred in ldap: ");
         		}	
/*-----------------------------------------------PRABHU START HERE----------------------------------------------
        	 }catch (Exception ex) {
                 System.err.println("Caught an exception.");
                 ex.printStackTrace();
             }
        	 */
        	 
        	 return new ModelAndView("frmMemberUserRegiCnf");	
        	// return mapping.findForward("Confirmation");
        	 
         }
         
         
         else if(usrProcess != null && usrProcess.equals("edit")) 
         {
             Vector EditusrVect=new Vector();
             String usrId=(String)session.getAttribute("userId");
             Debug.print("loginName :"+usrId);
         
             userregvo = hrsBean.selectUserRegistrationForm1(usrId);

             request.setAttribute("EditusrVect",userregvo);
                                       
             System .out.println("inside status =" +status);
            // fwd="EditUserReg";
        
       	   return new ModelAndView("frmEditMemberUserSignUp");    
       	   
          }else if(usrProcess != null && usrProcess.equals("updateUsr")){
        	  
              HLCUserMaster objUserMaster = new HLCUserMaster();
              HLCContactDetails objContact = new HLCContactDetails();

              /*
               * Updating User Details by ejb/HLCMemberRegistrationJNDI JNDI
               */

             // UpdateUserRegActionForm usrbean = (UpdateUserRegActionForm) form;

              String bday = request.getParameter("birthyear") + "-" + request.getParameter("birthmonth") + "-" + request.getParameter("birthday");;
              System.out.println(bday);

              String userId = request.getParameter("userId");
              System.out.println("Email id inside the user action :::::::::::::::::::"+request.getParameter("email"));
              System.out.println("userId inside the user action :::::::::::::::::::"+userId);
              System.out.println("uselect inside the user action :::::::::::::::::::"+request.getParameter("uselect"));
              System.out.println("fname inside the user action :::::::::::::::::::"+request.getParameter("fname"));
              System.out.println("mname inside the user action :::::::::::::::::::"+request.getParameter("mname"));
              System.out.println("lname inside the user action :::::::::::::::::::"+request.getParameter("lname"));
              System.out.println("sname inside the user action :::::::::::::::::::"+request.getParameter("sname"));
              System.out.println("gender inside the user action :::::::::::::::::::"+request.getParameter("gender"));
              System.out.println("comAdd_sel inside the user action :::::::::::::::::::"+request.getParameter("comAdd_sel"));
              System.out.println("usrname inside the user action :::::::::::::::::::"+request.getParameter("usrname"));
              System.out.println("QSelect inside the user action :::::::::::::::::::"+request.getParameter("QSelect"));
              System.out.println("ans inside the user action :::::::::::::::::::"+request.getParameter("ans"));
              System.out.println("pphone_txt inside the user action :::::::::::::::::::"+request.getParameter("pphone_txt"));
              System.out.println("pmob_txt inside the user action :::::::::::::::::::"+request.getParameter("pmob_txt"));
              System.out.println("pfax_txt inside the user action :::::::::::::::::::"+request.getParameter("pfax_txt"));
              System.out.println("priAdd_cbx inside the user action :::::::::::::::::::"+request.getParameter("priAdd_cbx"));
              System.out.println("padd_txt inside the user action :::::::::::::::::::"+request.getParameter("padd_txt"));
              System.out.println("padd_txt2 inside the user action :::::::::::::::::::"+request.getParameter("padd_txt2"));
              System.out.println("pcity_txt inside the user action :::::::::::::::::::"+request.getParameter("pcity_txt"));
              System.out.println("pstate_sel inside the user action :::::::::::::::::::"+request.getParameter("pstate_sel"));
              System.out.println("pcountry_sel inside the user action :::::::::::::::::::"+request.getParameter("pcountry_sel"));
              System.out.println("pzip_txt inside the user action :::::::::::::::::::"+request.getParameter("pzip_txt"));
              System.out.println("nonUseaEmail inside the user action :::::::::::::::::::"+request.getParameter("nonUseaEmail"));
              System.out.println("nonUseaMail inside the user action :::::::::::::::::::"+request.getParameter("nonUseaMail"));
              System.out.println("userPassword inside the user action :::::::::::::::::::"+objUserMaster.getPassword());
              System.out.println("getUserTypeId inside the user action :::::::::::::::::::"+objUserMaster.getUserTypeId());
              System.out.println("getContactTypeId inside the user action :::::::::::::::::::"+objUserMaster.getContactTypeId());
              
              
              


              objUserMaster.setPrefix(request.getParameter("uselect"));
              objUserMaster.setFirstName(request.getParameter("fname"));
              objUserMaster.setMiddleName(request.getParameter("mname"));
              objUserMaster.setLastName(request.getParameter("lname"));
              objUserMaster.setSufix(request.getParameter("sname"));
              objUserMaster.setDob(bday);
              objUserMaster.setGender(request.getParameter("gender"));
              objUserMaster.setCommunicationAddress(request.getParameter("comAdd_sel"));
              objUserMaster.setEmailId(request.getParameter("email"));
              objUserMaster.setUserId(userId);
              objUserMaster.setLoginName(request.getParameter("usrname"));
              objUserMaster.setSecretQuestion(request.getParameter("QSelect"));
              objUserMaster.setSecretAnswer(request.getParameter("ans"));
              objUserMaster.setPassword(objUserMaster.getPassword());
              objUserMaster.setUserTypeId(objUserMaster.getUserTypeId());

              request.setAttribute("usrname", request.getParameter("usrname"));

             /* if (request.getParameter("confPwd") != null && request.getParameter("confPwd").trim().length() != 0) {
                  request.setAttribute("cpwd", request.getParameter("confPwd"));
              } else {
                  String pwd = request.getParameter("confPwd");

                  Debug.print("context.getAttribute(pwd) :" + pwd);
                  request.setAttribute("cpwd", pwd);
              }*/

              String finalPrimaryPh = "";

              if (request.getParameter("pphone_txt") != null) {
                  Debug.print("request.getParameter(pphone_txt) value:" + request.getParameter("pphone_txt"));

                  StringTokenizer strTkns = new StringTokenizer(request.getParameter("pphone_txt"), "[](),.-{}");

                  while (strTkns.hasMoreTokens()) {
                      try {
                          String phNo = (String) strTkns.nextToken();

                          if (phNo != null && phNo.trim().length() != 0) {
                              Debug.print("ph no Added from Stokenizer:" + phNo);
                              finalPrimaryPh = finalPrimaryPh + phNo;
                          }
                      } catch (Exception e) {
                          Debug.print("ph no tokanizing exception:" + e);
                      }
                  }

                  Debug.print("finally appended primary phNo :" + finalPrimaryPh);
              }

              String finalPrimaryMob = "";

              if (request.getParameter("pmob_txt") != null) {
                  Debug.print("request.getParameter(pmob_txt) value:" + request.getParameter("pmob_txt"));

                  StringTokenizer strTkns = new StringTokenizer(request.getParameter("pmob_txt"), "[](),.-{}");

                  while (strTkns.hasMoreTokens()) {
                      try {
                          String phNo = (String) strTkns.nextToken();

                          if (phNo != null && phNo.trim().length() != 0) {
                              Debug.print("ph no Added from Stokenizer:" + phNo);
                              finalPrimaryMob = finalPrimaryMob + phNo;
                          }
                      } catch (Exception e) {
                          Debug.print("ph no tokanizing exception:" + e);
                      }
                  }

                  Debug.print("finally appended finalPrimaryMob :" + finalPrimaryMob);
              }

              String finalPrimaryFax = "";

              if (request.getParameter("pfax_txt") != null) {
                  Debug.print("request.getParameter(pfax_txt) value:" + request.getParameter("pfax_txt"));

                  StringTokenizer strTkns = new StringTokenizer(request.getParameter("pfax_txt"), "[](),.-{}");

                  while (strTkns.hasMoreTokens()) {
                      try {
                          String phNo = (String) strTkns.nextToken();

                          if (phNo != null && phNo.trim().length() != 0) {
                              Debug.print("ph no Added from Stokenizer:" + phNo);
                              finalPrimaryFax = finalPrimaryFax + phNo;
                          }
                      } catch (Exception e) {
                          Debug.print("ph no tokanizing exception:" + e);
                      }
                  }

                  Debug.print("finally appended finalPrimaryFax :" + finalPrimaryFax);
              }

              objContact.setContactType(request.getParameter("priAdd_cbx"));
              objContact.setAddress1(request.getParameter("padd_txt"));
              objContact.setAddress2(request.getParameter("padd_txt2"));
              objContact.setCity(request.getParameter("pcity_txt"));
              objContact.setState(request.getParameter("pstate_sel"));
              objContact.setCountry(request.getParameter("pcountry_sel"));
              objContact.setZip(request.getParameter("pzip_txt"));
              objContact.setPhoneNo(finalPrimaryPh);
              objContact.setMobileNo(finalPrimaryMob);
              objContact.setFaxNo(finalPrimaryFax);
              objContact.setUserId(userId);
              objContact.setContactTypeId(objContact.getContactTypeId());
              
              System.out.println("nonUseaEmail.status:=" + request.getParameter("nonUseaEmail"));
              System.out.println("nonUseaMail.status:=" + request.getParameter("nonUseaMail"));

              if (request.getParameter("nonUseaEmail") != null) {
                  objUserMaster.setNonUseaEmailStatus(true);
                  System.out.println("commit nonUseaEMail status--true");
              } else {
                  objUserMaster.setNonUseaEmailStatus(false);
                  System.out.println("commit nonUseaEMail status--false");
              }
              if (request.getParameter("nonUseaMail") != null) {
                  objUserMaster.setNonUseaMailingStatus(true);
                  System.out.println("commit nonUseaMail status--true");
              } else {
                  objUserMaster.setNonUseaMailingStatus(false);
                  System.out.println("commit nonUseaMail status--false");
              }
              try {
				db.editUserDetails(objUserMaster, objContact);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

              Debug.print("objUserMaster.getLoginName() :" + objUserMaster.getLoginName());
              Debug.print("objUserMaster.getEmailId() :" + objUserMaster.getEmailId());

//              boolean result = new MySQLDAO().updateUserDetailToMqSQL(objUserMaster, objContact);
//              Debug.print("                MySql Result :" + result);

              /*
               * If Secondary address is updated or added
               */

              String secstat = request.getParameter("cttyp");
              String userid = request.getParameter("userId");

              System.out.println("sec status :" + secstat);
              System.out.println("user id :" + userid);


              if (request.getParameter("secAdd_cbx") != null) {
                  objContact.setUserId(userid);
                  objContact.setContactType(request.getParameter("secAdd_cbx"));
                  objContact.setAddress1(request.getParameter("sadd_txt"));
                  objContact.setAddress2(request.getParameter("sadd_txt1"));
                  objContact.setCity(request.getParameter("scity_txt"));
                  objContact.setState(request.getParameter("sState_sel"));
                  objContact.setCountry(request.getParameter("sCountry_sel"));
                  objContact.setZip(request.getParameter("szip_txt"));

                  Debug.print("request.getParameter(sphone_txt) value:" + request.getParameter("sphone_txt"));

                  String finalSecPh = "";
                  if (request.getParameter("sphone_txt") != null) {

                      StringTokenizer strTkns1 = new StringTokenizer(request.getParameter("sphone_txt"), "[](),.-{}");


                      while (strTkns1.hasMoreTokens()) {
                          try {
                              String phNo = (String) strTkns1.nextToken();

                              if (phNo != null && phNo.trim().length() != 0) {
                                  Debug.print("ph no Added from Stokenizer:" + phNo);
                                  finalSecPh = finalSecPh + phNo;
                              }
                          } catch (Exception e) {
                              Debug.print("Secondary ph no tokanizing exception:" + e);
                          }
                      }

                      Debug.print("finally appended Secondary phNo :" + finalSecPh);
                  }

                  String finalSecMob = "";
                  if (request.getParameter("smob_txt") != null) {

                      StringTokenizer strTkns1 = new StringTokenizer(request.getParameter("smob_txt"), "[](),.-{}");


                      while (strTkns1.hasMoreTokens()) {
                          try {
                              String phNo = (String) strTkns1.nextToken();

                              if (phNo != null && phNo.trim().length() != 0) {
                                  Debug.print("ph no Added from Stokenizer:" + phNo);
                                  finalSecMob = finalSecMob + phNo;
                              }
                          } catch (Exception e) {
                              Debug.print("Secondary ph no tokanizing exception:" + e);
                          }
                      }

                      Debug.print("finally appended Secondary finalSecMob :" + finalSecMob);
                  }

                  String finalSecFax = "";
                  if (request.getParameter("sfax_txt") != null) {

                      StringTokenizer strTkns1 = new StringTokenizer(request.getParameter("sfax_txt"), "[](),.-{}");


                      while (strTkns1.hasMoreTokens()) {
                          try {
                              String phNo = (String) strTkns1.nextToken();

                              if (phNo != null && phNo.trim().length() != 0) {
                                  Debug.print("ph no Added from Stokenizer:" + phNo);
                                  finalSecFax = finalSecFax + phNo;
                              }
                          } catch (Exception e) {
                              Debug.print("Secondary ph no tokanizing exception:" + e);
                          }
                      }

                      Debug.print("finally appended Secondary finalSecFax :" + finalSecFax);
                  }

                  objContact.setPhoneNo(finalSecPh);
                  objContact.setFaxNo(finalSecFax);
                  objContact.setMobileNo(finalSecMob);
                
                  try {
					db.editUserDetails(objUserMaster, objContact);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

              }

              if (secstat != null && request.getParameter("secAdd_cbx") == null) {
                  boolean delstat = humanMemb.deleteContactDetail(userId, "Secondary");
                  System.out.println("Secondary Contact Delete Status :" + delstat);
              }
              request.setAttribute("source", source);
              
              boolean status1=false;
           
              return new ModelAndView("index");
          }
         
          else if(usrProcess != null && usrProcess.equals("initchgPwd")){
        	  
        	  
        	  return new ModelAndView("frmChangePassword");  
        	  
          }else if(usrProcess != null && usrProcess.equals("chngPwd")){
        	        	 
              String userId=(String)session.getAttribute("userId");
              String oldPass=request.getParameter("currPwd");
              String newPass=request.getParameter("newPwd");
              String reNewPass=request.getParameter("reNewPwd");
              
              String password=db.getPasswordByLoginId(userId);
              BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
              textEncryptor.setPassword("sa");
              String  decryptPwd=textEncryptor.decrypt(password);
              
              System.out.println("decrypted Password : "+decryptPwd);
              System.out.println("Prabhu here-------------");
              
              if(decryptPwd.equals(oldPass) && newPass.equals(reNewPass)){
            	  
             
              
              Debug.print("user id from session :" +userId);
             
              Debug.print("changed password :" +newPass);
              BasicTextEncryptor textEncryptor1 = new BasicTextEncryptor();
              textEncryptor1.setPassword("sa");
              boolean status = humanMemb.changePassword(userId,textEncryptor1.encrypt(newPass));
              
              Debug.print("changePassword status :" +status);
              
              if(status==true)
                  
              {
                  System.out.println("Password Changed Successfully");
                  System.out.println("New Password is : "+newPass);
                  /* =====================================
                       *
                       * Sending confirmation E-mail
                       *
                       * ====================================*/
                  		
                      //String emailid=(String)session.getAttribute("emailId");
                  	  String emailid = db.getEmailIdByPassword(userId);
                      System.out.println("User emailid :"+emailid);
                      String toMailIds[] = {emailid};
                      EmailContent email=new EmailContent();
                      email.setTo(toMailIds);
                      email.setFrom("dhivya@digiblitz.in");
                      email.setSubject("Your Account Info !");
                      
                      String content = "<table width=\"530\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                              " <tr>" +
                              " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                              " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                              "<tr>" +
                              "<td height=\"70\" valign=\"top\"><img src=\"images/logo3.jpg\" alt=\"HLC Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
                              " </tr>"+
                              "  <tr>"+
                              "<td valign=\"top\">"+
                              "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"+
                              "<tr>"+
                              "<td width=\"7\" height=\"12\" valign=\"top\">&nbsp;</td> " +
                              
                              "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                              "<td width=\"7\" height=\"12\" valign=\"top\">&nbsp;</td>   " +
                           
                              "</tr>"+
                              "<tr>"+
                              "<td valign=\"top\" background=\"https://dashboard.useventing.com/dashboard/images/left.jpg\">&nbsp;</td>"+
                              "<td valign=\"top\" bgcolor=\"#FBF2F2\">"+
                              "<span class=\"boldTxt\">Dear User"+"</span>,<br /><br />"+
                              "<p>Please save this email for your records. Your Password Change Request is Succesful !! Your account information is as follows:.<p>"+"<p>----------------------------<p>"+"<p> New Password : "+newPass+"<p> ----------------------------<p>"+
                              /*"<p>Your account would be activated through your confirmation by visiting the following link: <p>"+
                              "<a href=http://192.168.3.98:8090/dashboad-war/uservalidate.do?email="+request.getParameter("email")+"> Click Here to Activate your Account </a>"+*/
                              "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
                              "Thank You <br />"+
                              "------------------ <br />"+
                              "<span class=\"boldRedTxt\">HLC Team</span></td>"+
                              "<td valign=\"top\" background=\"https://dashboard.useventing.com/dashboard/images/Rght.jpg\">&nbsp;</td>"+
                              "</tr>"+
                              "<tr><td valign=\"top\" background=\"https://dashboard.useventing.com/dashboard/images/cornerBotLeft.jpg\">&nbsp;</td>"+
                              "<td valign=\"top\" background=\"https://dashboard.useventing.com/dashboard/images/cornerBot.jpg\">&nbsp;</td>"+
                              "<td valign=\"top\" background=\"https://dashboard.useventing.com/dashboard/images/cornerBotRght.jpg\">&nbsp;</td>"+
                              "</tr>"+
                              " </table>"+
                              "</td></tr>"+
                              "<tr>"+
                              "<td valign=\"top\" style=\"padding:10px;\">"+                            
                              "and much more..."+
                              "So go ahead and <a href=\"http://localhost:8080/klugwerks/login.html?cmd=initLogin\">LOGIN NOW!</a></td>"+
                              "</tr>"+
                              " <tr>"+
                              "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"></td>"+
                              "</tr>"+
                              "</table>";
                      
                      
                      email.setBody(content);
                      //email.setAttachments();
                      
                     /* EmailEngine emailEngine = new EmailEngine();
                      boolean emailFlag = emailEngine.sendMimeEmail(email);
                      Debug.print("Email sent sucessfully :"+emailFlag);*/
                      
                      Debug.print("Email ID :"+email);
                	  MailMail mail = new MailMail();
                	  boolean emailFlag = mail.sendMimeEmail(email);
                      Debug.print("Email sent sucessfully :"+emailFlag);
                  
                      return new ModelAndView("frmChange-pwd-conf");  
              }

              }
              
              else
              {
                  String stat="fail";
                  request.setAttribute("status",stat);
                  return new ModelAndView("frmChange-pwd-conf");  
               }
          
          }
         
         
   
         
       //karthika started here-----------------------------------------------------
         
         else  if(usrProcess.equalsIgnoreCase("eConfig"))
          {
       	   System.out.println("inside eConfig:::::::::::::::::::::::");
       	   String usrname= "";
       	   usrname = request.getParameter("name");
           String emailid = "";
           emailid = request.getParameter("email");
       	   String phn = "";
       	   phn = request.getParameter("phone");
       	   String company = "";
       	   company = request.getParameter("company");
       	   String msg = "";
       	   msg = request.getParameter("message");
       	   boolean status = false;
       	   String dbStatus = "fails";
       	   if((usrname != "") && (emailid != "") && (phn != "") && (msg != "")&& (company != "")){
       	   status = db.insertUserEnquriyDetails(usrname, emailid, phn, msg, company);
       	   System.out.println("inside eConfig status:::::::::::::::::::::::"+status);
       	   request.setAttribute("status",dbStatus );
       	   }else{
       		request.setAttribute("name",usrname );
            request.setAttribute("email",emailid );
            request.setAttribute("phone",phn );
            request.setAttribute("company",company );
            request.setAttribute("message",msg );
       		request.setAttribute("status",dbStatus );
       		System.out.println("parameter value is empty::::::::::");
       	   }
       	   
           if(status==true)
           {
        	   dbStatus = "success";
              System.out.println("inside eConfig status:::::::::::::::::::::::"+status);
              request.setAttribute("name",usrname );
              request.setAttribute("email",emailid );
              request.setAttribute("phone",phn );
              request.setAttribute("company",company );
              request.setAttribute("message",msg );
              request.setAttribute("status",dbStatus );
        	   String toMailIds[] = {emailid};
              EmailContent email = new EmailContent();
              email.setTo(toMailIds);
              email.setFrom("karthikadec1@gmail.com");
              email.setSubject("Acknowledgement !");
             
              String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                      " <tr>" +
                      " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                      " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                      "<tr>" +
                      "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"HLC Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
                      " </tr>"+
                      "  <tr>"+
                      "<td valign=\"top\">"+
                      "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"+
                      "<tr>"+
                      "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopLeft.jpg\" width=\"13\" height=\"12\" /></td> " +
                      "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                      "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopRght.jpg\" width=\"13\" height=\"12\" /></td>" +
                      "</tr>"+
                      "<tr>"+
                      "<td valign=\"top\" background=\"images/left.jpg\">&nbsp;</td>"+
                      "<td valign=\"top\" bgcolor=\"#FBF2F2\">"+
                      "<span class=\"boldTxt\">Dear user,</span>,<br /><br />"+
                      "<p>Please save this email for your records. Your account information is as follows:.<p>"+
                      "<p> --------------------- <p>"+
                     
                      "<p> Your Password has been changed !!<p>"+
                      "<p> --------------------- <p>"+
                      "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
                      "Thank You <br />"+
                      "------------------ <br />"+
                      "<span class=\"boldRedTxt\">HLC Team</span></td>"+
                      "<td valign=\"top\" background=\"images/Rght.jpg\">&nbsp;</td>"+
                      "</tr>"+
                      "<tr><td valign=\"top\" background=\"images/cornerBotLeft.jpg\">&nbsp;</td>"+
                      "<td valign=\"top\" background=\"images/cornerBot.jpg\">&nbsp;</td>"+
                      "<td valign=\"top\" background=\"images/cornerBotRght.jpg\">&nbsp;</td>"+
                      "</tr>"+
                      " </table>"+
                      "</td></tr>"+
                      "+<tr>"+
                      "<td valign=\"top\" style=\"padding:10px;\">"+
                      "<img src=\"images/pic.jpg\" width=\"272\" height=\"76\" style=\"float:right; padding-left:8px; padding-bottom:8px;\" />"+
                      "<p>The easiest way to access your day to day HLC activities online or offline where ever you are and when ever you want."+
                      "</p>If you are a NEW VISITOR, register now and ENJOY the following privileges:"+
                      "<ul>"+
                      "<li>Unlimited shopping online.</li>"+
                      "<li>Place advertisements online and/or on-site.</li>"+
                      "<li>Sponsor competitions held by HLC.</li>"+
                      "</ul>"+
                      
                      
                      "Also, REGISTER NOW! and become a member of HLC to access and 	enjoy the following privileges as per your Membership Type and as "+
                      "per your ï¿½Roleï¿½ assigned:"+
                      
                      "<ul>"+
                      "<li>Compete in Equestrian Events held by HLC.</li>"+
                      "<li>Take part in other events like; Annual Meetings, Educational events,"+
                      "Activity Meetings held by HLC etc.</li>"+
                      "<li>Send Messages to other members.</li>"+
                      "<li>Create your own Distribution Lists.</li>"+
                      "<li>Create/Join a group and share your thoughts and common ideas.</li>"+
                      " <li>Unlimited Shopping online.</li>"+
                      " <li>Place advertisements online and/or on-site.</li>"+
                      " <li>Sponsor competitions held by HLC.</li>"+
                      "</ul>"+
                      
                      "and much more..."+
                      "So go ahead and <a href=\"#\">REGISTER NOW!</a></td>"+
                      "</tr>"+
                      " <tr>"+
                      "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>"+
                      "</tr>"+
                      "</table>";
              
              
              email.setBody(content);
              //email.setAttachments();
 
              MailMail mail = new MailMail();
              boolean emailFlag = mail.sendMimeEmail(email);
              Debug.print("Email sent sucessfully :"+emailFlag);
           }
                   	   return new ModelAndView("frmContacts");
          }
          else if(usrProcess.equalsIgnoreCase("initConfig")){
        	  request.setAttribute("status", "init");
        	  return new ModelAndView("frmContacts");
          }
         
 // karthika ends here---------------------------------------------------------------------------------  
         
          else if(usrProcess!=null)

              if(usrProcess.equalsIgnoreCase("view"))
              {   
            	  request.setAttribute("status", "init");
            	  return new ModelAndView("frmForgetPassword");  
              }
              
              if(usrProcess.equalsIgnoreCase("Password"))
              {
                  Debug.print("inside forget user name block ...........");
                  String usremail=request.getParameter("usrname2");
                  Debug.print("usrname :" +usremail);
                 
                  
                   ArrayList det=new ArrayList();
                   det=humanMemb.getLoginDetailsByEmailId(usremail);
                 
                  if(det.size() == 1){
                       for(int i=0;i<det.size();i++){
                          String lname=(String)det.get(i);
                          if(lname==null){
                              Debug.print("Login Name is "+lname+"     Redirected to user sign up page ");
                              request.setAttribute("loginName","notFound");
                              
                            //String fromAddress = "prabhu.pandi@digiblitz.in";
                              String fromAddress = properties.getProperty("infusionMail.fromAddress");
                              String toAddress = usremail;
                              String ccAddresses = "";
                              String bccAddresses = "";
                              String contentType = "HTML/TEXT";
                              String subject = "Your Username";
                              String htmlBody = "Here is your username: "+lname;
                              String textBody = "Here is your username: "+lname;
                              
                              System.out.println("infusion soft property values: ----> "+fromAddress+" toAddress "+toAddress+" subject "+subject+" htmlBody "+" textBody "+textBody);
                              System.out.println("ccAddresses "+ccAddresses+" bccAddresses "+bccAddresses);
                              //Infusion Soft mail starts
                                               
                     //obj1.sendEmail(properties.getProperty("infusionMail.fromAddress"), usrEmail, properties.getProperty("infusionMail.ccAddresses"), properties.getProperty("infusionMail.bccAddresses"), properties.getProperty("infusionMail.contentType"), properties.getProperty("infusionMail.subject"), properties.getProperty("infusionMail.htmlBody"), properties.getProperty("infusionMail.textBody"));
                          try {
							obj1.sendEmail(fromAddress, toAddress, ccAddresses, bccAddresses, contentType, subject, htmlBody, textBody);
						} catch (XmlRpcException e) {
						// TODO Auto-generated catch block
							e.printStackTrace();
						}
                                      
                                      System.out.println("Mail has been send successfully");                                 
                             //Infusion Soft mail ends
                              
                              return new ModelAndView("frmMemberUserSignup"); 
                          }
                       }
                  }
                   
                  if(det!=null)
                  {                     
                  
                  if(det.size()!=0)
                  {                   
                      String username="";              
                      Debug.print("det.size() :"+det.size());
                            
                      for(int i=0;i<det.size();i++)
                      {
                              String lname=(String)det.get(i);
                              if(lname!=null)
                              {
                                  username=username+lname+",";
                              }
                              
                            //String fromAddress = "prabhu.pandi@digiblitz.in";
                              String fromAddress = properties.getProperty("infusionMail.fromAddress");
                              String toAddress = usremail;
                              String ccAddresses = "";
                              String bccAddresses = "";
                              String contentType = "HTML/TEXT";
                              String subject = "Registration Success";
                              String htmlBody = "Here is your username: "+lname;
                              String textBody = "Here is your username: "+lname;
                              
                              System.out.println("infusion soft property values: ----> "+fromAddress+" toAddress "+toAddress+" subject "+subject+" htmlBody "+" textBody "+textBody);
                              System.out.println("ccAddresses "+ccAddresses+" bccAddresses "+bccAddresses);
                              //Infusion Soft mail starts
                                               
                     //obj1.sendEmail(properties.getProperty("infusionMail.fromAddress"), usrEmail, properties.getProperty("infusionMail.ccAddresses"), properties.getProperty("infusionMail.bccAddresses"), properties.getProperty("infusionMail.contentType"), properties.getProperty("infusionMail.subject"), properties.getProperty("infusionMail.htmlBody"), properties.getProperty("infusionMail.textBody"));
                          try {
							obj1.sendEmail(fromAddress, toAddress, ccAddresses, bccAddresses, contentType, subject, htmlBody, textBody);
						} catch (XmlRpcException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
                                      
                                      System.out.println("Mail has been send successfully");                                 
                              //Infusion Soft mail ends
                              
                              Debug.print("usrname's fetched :"+lname);
                              Debug.print("usrname's consolidated :"+username);
                      }
                      
                  /* =====================================
                   *
                   * Sending Password E-mail
                   *
                   * ====================================*/
                                                                 
                  String toMailIds[] = {usremail};
                  EmailContent email=new EmailContent();
                  email.setTo(toMailIds);
                  email.setFrom("dhivya@digiblitz.in");
                  email.setSubject("Your Account Details");
                  
                  String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                          " <tr>" +
                          " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                          " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                          "<tr>" +
                          "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"HLC Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
                          " </tr>"+
                          "  <tr>"+
                          "<td valign=\"top\">"+
                          "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"+
                          "<tr>"+
                          "<td width=\"13\" height=\"12\" valign=\"top\"></td> " +
                          "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                          "<td width=\"13\" height=\"12\" valign=\"top\"></td>" +
                          "</tr>"+
                          "<tr>"+
                          "<td valign=\"top\" background=\"images/left.jpg\">&nbsp;</td>"+
                          "<td valign=\"top\" bgcolor=\"#FBF2F2\">"+
                          "<span class=\"boldTxt\">Dear user,</span>,<br /><br />"+
                          "<p>Please save this email for your records. Your account information is as follows:.<p>"+
                          "<p> --------------------- <p>"+
                                                                             
                          "<p> User Name : "+username+"<p>"+                    
                                                
                          "<p> --------------------- <p>"+
                          "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
                          "Thank You <br />"+
                          "------------------ <br />"+
                          "<span class=\"boldRedTxt\">HLC Team</span></td>"+
                          "<td valign=\"top\" background=\"images/Rght.jpg\">&nbsp;</td>"+
                          "</tr>"+
                          "<tr><td valign=\"top\" background=\"images/cornerBotLeft.jpg\">&nbsp;</td>"+
                          "<td valign=\"top\" background=\"images/cornerBot.jpg\">&nbsp;</td>"+
                          "<td valign=\"top\" background=\"images/cornerBotRght.jpg\">&nbsp;</td>"+
                          "</tr>"+
                          " </table>"+
                          "</td></tr>"+
                          "<tr>"+
                          "<td valign=\"top\" style=\"padding:10px;\">"+                                                                                                                                                                   
                          "and much more..."+
                          "So go ahead and <a href=\"#\">REGISTER NOW!</a></td>"+
                          "</tr>"+
                          " <tr>"+
                          "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"></td>"+
                          "</tr>"+
                          "</table>";
                  
                  
                  email.setBody(content);
                  //email.setAttachments();
                  
                  MailMail mail = new MailMail();
                  boolean emailFlag = mail.sendMimeEmail(email);
                  Debug.print("Email sent sucessfully :"+emailFlag);
                  String stat="UserNameSuccess";
                  request.setAttribute("status1",stat);
                  request.setAttribute("usrName",username);
                  request.setAttribute("usrEmail",usremail);
                  return new ModelAndView("frmForgetPassword"); 
               
                  
                  }
                  else
                  {
                      String stat="UserNamefail";
                      request.setAttribute("status",stat);
                      return new ModelAndView("frmForgetPassword");   
                    
                      
                  }
                  }
                 
              }
  //-----------------------------------------------------karthika--------------------            
               if(usrProcess.equalsIgnoreCase("User"))
              {    
            	   
                 
                  Debug.print("Inside forget pwd block ..........");
                  String secretqus=request.getParameter("sAnswer2");
                  String sAnswer=request.getParameter("sAnswer");
                  String usrname=request.getParameter("usrname");
                  request.setAttribute("usrname", usrname);
                   
                  Debug.print("usrname :" +usrname);
                  Debug.print("sAnswer :" +secretqus);
                  Debug.print("secretqus :" +sAnswer);
                                   
                  // context.setAttribute("usrname",usrname);
                  
                  boolean status=humanMemb.checkSecurityQuestionByLoginName(usrname,secretqus,sAnswer);
                  Debug.print("remote.checkSecurityQuestionByLoginName(usrname,secretqus,sAnswer2) :" +status);
                
                  if(status == true)
                  {
                      
                      Debug.print(" ::::::::::::::: inside secret q/a fail block send pwd mail ::::::::" );
                      String emailid=humanMemb.getEmailByLoginName(usrname);
                      Debug.print("remote.getEmailByLoginName(usrname) :" +emailid);
                      Debug.print("remote.getPasswordByLoginName(usrname) :" +usrname);
                      String password=humanMemb.getPasswordByLoginName(usrname);
                      BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
                      textEncryptor.setPassword("sa");
                      String  decryptPwd=textEncryptor.decrypt(password);
                      request.setAttribute("password",decryptPwd);
                      request.setAttribute("usrEmail",emailid);
                      request.setAttribute("usrname",usrname);
                      Debug.print("remote.getPasswordByLoginName(usrname) :" +decryptPwd);
                      
                  /* =====================================
                   *
                   * Sending User Name E-mail
                   *
                   * ====================================*/
                      
                      String fromAddress = "prabhu.pandi@digiblitz.in";
                      // String fromAddress = properties.getProperty("infusionMail.fromAddress");
                       String toAddress = emailid;
                       String ccAddresses = "";
                       String bccAddresses = "";
                       String contentType = "HTML/TEXT";
                       String subject = "Your Password";
                       String htmlBody = "Here is your password: "+decryptPwd;
                       String textBody = "Here is your password: "+decryptPwd;
                       
                       System.out.println("infusion soft property values: ----> "+fromAddress+" toAddress "+toAddress+" subject "+subject+" htmlBody "+" textBody "+textBody);
                       System.out.println("ccAddresses "+ccAddresses+" bccAddresses "+bccAddresses);
                       //Infusion Soft mail starts
                                        
              //obj1.sendEmail(properties.getProperty("infusionMail.fromAddress"), usrEmail, properties.getProperty("infusionMail.ccAddresses"), properties.getProperty("infusionMail.bccAddresses"), properties.getProperty("infusionMail.contentType"), properties.getProperty("infusionMail.subject"), properties.getProperty("infusionMail.htmlBody"), properties.getProperty("infusionMail.textBody"));
                   try {
					obj1.sendEmail(fromAddress, toAddress, ccAddresses, bccAddresses, contentType, subject, htmlBody, textBody);
				} catch (XmlRpcException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                               
                               System.out.println("Mail has been send successfully");                                 
                       //Infusion Soft mail ends
                      
                      
                  String toMailIds[] = {emailid};
                  EmailContent email=new EmailContent();
                  email.setTo(toMailIds);
                  email.setFrom("dhivya@digiblitz.in");
                  email.setSubject("Your Account Details");
                  
                  String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                          " <tr>" +
                          " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                          " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                          "<tr>" +
                          "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"HLC Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
                          " </tr>"+
                          "  <tr>"+
                          "<td valign=\"top\">"+
                          "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"+
                          "<tr>"+
                          "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopLeft.jpg\" width=\"13\" height=\"12\" /></td> " +
                          "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                          "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopRght.jpg\" width=\"13\" height=\"12\" /></td>" +
                          "</tr>"+
                          "<tr>"+
                          "<td valign=\"top\" background=\"images/left.jpg\">&nbsp;</td>"+
                          "<td valign=\"top\" bgcolor=\"#FBF2F2\">"+
                          "<span class=\"boldTxt\">Dear user,</span>,<br /><br />"+
                          "<p>Please save this email for your records. Your account information is as follows:.<p>"+
                          "<p> --------------------- <p>"+
                         
                          "<p> Password :"+decryptPwd+"<p>"+
                          "<p> --------------------- <p>"+
                          "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
                          "Thank You <br />"+
                          "------------------ <br />"+
                          "<span class=\"boldRedTxt\">HLC Team</span></td>"+
                          "<td valign=\"top\" background=\"images/Rght.jpg\">&nbsp;</td>"+
                          "</tr>"+
                          "<tr><td valign=\"top\" background=\"images/cornerBotLeft.jpg\">&nbsp;</td>"+
                          "<td valign=\"top\" background=\"images/cornerBot.jpg\">&nbsp;</td>"+
                          "<td valign=\"top\" background=\"images/cornerBotRght.jpg\">&nbsp;</td>"+
                          "</tr>"+
                          " </table>"+
                          "</td></tr>"+
                          "+<tr>"+
                          "<td valign=\"top\" style=\"padding:10px;\">"+
                          "<img src=\"images/pic.jpg\" width=\"272\" height=\"76\" style=\"float:right; padding-left:8px; padding-bottom:8px;\" />"+
                          "<p>The easiest way to access your day to day HLC activities online or offline where ever you are and when ever you want."+
                          "</p>If you are a NEW VISITOR, register now and ENJOY the following privileges:"+
                          "<ul>"+
                          "<li>Unlimited shopping online.</li>"+
                          "<li>Place advertisements online and/or on-site.</li>"+
                          "<li>Sponsor competitions held by HLC.</li>"+
                          "</ul>"+
                          
                          
                          "Also, REGISTER NOW! and become a member of HLC to access and 	enjoy the following privileges as per your Membership Type and as "+
                          "per your �Role� assigned:"+
                          
                          "<ul>"+
                          "<li>Compete in Equestrian Events held by HLC.</li>"+
                          "<li>Take part in other events like; Annual Meetings, Educational events,"+
                          "Activity Meetings held by HLC etc.</li>"+
                          "<li>Send Messages to other members.</li>"+
                          "<li>Create your own Distribution Lists.</li>"+
                          "<li>Create/Join a group and share your thoughts and common ideas.</li>"+
                          " <li>Unlimited Shopping online.</li>"+
                          " <li>Place advertisements online and/or on-site.</li>"+
                          " <li>Sponsor competitions held by HLC.</li>"+
                          "</ul>"+
                          
                          "and much more..."+
                          "So go ahead and <a href=\"#\">REGISTER NOW!</a></td>"+
                          "</tr>"+
                          " <tr>"+
                          "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>"+
                          "</tr>"+
                          "</table>";
                  
                  
                  email.setBody(content);
                  //email.setAttachments();
                  
                  MailMail mail = new MailMail();
                  boolean emailFlag = mail.sendMimeEmail(email);
                  Debug.print("Email sent sucessfully :"+emailFlag);
                  String stat="PasswordSuccess";
                  request.setAttribute("status",stat);
                  return new ModelAndView("frmForgetPassword");  
                    
                  }
                  
                  else
                  {
                      String stat="PasswordFail";
                      request.setAttribute("idstatus",stat);
                      return new ModelAndView("frmForgetPassword");   
                    
                      
                  }
                  
               
              }
              
               if(usrProcess.equalsIgnoreCase("resetpw"))
              { 
                  
                  Debug.print("::::::::::::::::::: Inside reset pwd update block ::::::::::::");
                  String usrname=request.getParameter("usrname");
                  Debug.print("context.getAttribute(usrname) :"+usrname);
                  
                  String password=request.getParameter("password");
                  Debug.print("request.getParameter(password) :"+password);
                  
                  boolean stat=humanMemb.updateLoginDetailsByLoginName(usrname,password);
                  
                  Debug.print("remote.updateLoginDetailsByLoginName(usrname,password) :"+stat);
                  
                   String emailid=humanMemb.getEmailByLoginName(usrname);
                   Debug.print("remote.getEmailByLoginName(usrname) :" +emailid);
                   
                    /* =====================================
                   *
                   * Sending User Name E-mail
                   *
                   * ====================================*/
                      
                  String toMailIds[] = {emailid};
                  EmailContent email=new EmailContent();
                  email.setTo(toMailIds);
                  email.setFrom("dhivya@digiblitz.in");
                  email.setSubject("Your Account Details");
                  
                  String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                          " <tr>" +
                          " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                          " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                          "<tr>" +
                          "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"HLC Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
                          " </tr>"+
                          "  <tr>"+
                          "<td valign=\"top\">"+
                          "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"+
                          "<tr>"+
                          "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopLeft.jpg\" width=\"13\" height=\"12\" /></td> " +
                          "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                          "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopRght.jpg\" width=\"13\" height=\"12\" /></td>" +
                          "</tr>"+
                          "<tr>"+
                          "<td valign=\"top\" background=\"images/left.jpg\">&nbsp;</td>"+
                          "<td valign=\"top\" bgcolor=\"#FBF2F2\">"+
                          "<span class=\"boldTxt\">Dear user,</span>,<br /><br />"+
                          "<p>Please save this email for your records. Your account information is as follows:.<p>"+
                          "<p> --------------------- <p>"+
                         
                          "<p> Your Password has been changed !!<p>"+
                          "<p> --------------------- <p>"+
                          "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
                          "Thank You <br />"+
                          "------------------ <br />"+
                          "<span class=\"boldRedTxt\">HLC Team</span></td>"+
                          "<td valign=\"top\" background=\"images/Rght.jpg\">&nbsp;</td>"+
                          "</tr>"+
                          "<tr><td valign=\"top\" background=\"images/cornerBotLeft.jpg\">&nbsp;</td>"+
                          "<td valign=\"top\" background=\"images/cornerBot.jpg\">&nbsp;</td>"+
                          "<td valign=\"top\" background=\"images/cornerBotRght.jpg\">&nbsp;</td>"+
                          "</tr>"+
                          " </table>"+
                          "</td></tr>"+
                          "+<tr>"+
                          "<td valign=\"top\" style=\"padding:10px;\">"+
                          "<img src=\"images/pic.jpg\" width=\"272\" height=\"76\" style=\"float:right; padding-left:8px; padding-bottom:8px;\" />"+
                          "<p>The easiest way to access your day to day HLC activities online or offline where ever you are and when ever you want."+
                          "</p>If you are a NEW VISITOR, register now and ENJOY the following privileges:"+
                          "<ul>"+
                          "<li>Unlimited shopping online.</li>"+
                          "<li>Place advertisements online and/or on-site.</li>"+
                          "<li>Sponsor competitions held by HLC.</li>"+
                          "</ul>"+
                          
                          
                          "Also, REGISTER NOW! and become a member of HLC to access and 	enjoy the following privileges as per your Membership Type and as "+
                          "per your �Role� assigned:"+
                          
                          "<ul>"+
                          "<li>Compete in Equestrian Events held by HLC.</li>"+
                          "<li>Take part in other events like; Annual Meetings, Educational events,"+
                          "Activity Meetings held by HLC etc.</li>"+
                          "<li>Send Messages to other members.</li>"+
                          "<li>Create your own Distribution Lists.</li>"+
                          "<li>Create/Join a group and share your thoughts and common ideas.</li>"+
                          " <li>Unlimited Shopping online.</li>"+
                          " <li>Place advertisements online and/or on-site.</li>"+
                          " <li>Sponsor competitions held by HLC.</li>"+
                          "</ul>"+
                          
                          "and much more..."+
                          "So go ahead and <a href=\"#\">REGISTER NOW!</a></td>"+
                          "</tr>"+
                          " <tr>"+
                          "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>"+
                          "</tr>"+
                          "</table>";
                  
                  
                  email.setBody(content);
                  //email.setAttachments();
                  
                  MailMail mail = new MailMail();
                  boolean emailFlag = mail.sendMimeEmail(email);
                  Debug.print("Email sent sucessfully :"+emailFlag);
                  
                  return new ModelAndView("frmResetPasswordCnf");  
                 
              }
               if(usrProcess.equalsIgnoreCase("homeDash"))
               {  
            	   
                return new ModelAndView("dashboard");  
               }
               else if(usrProcess != null && usrProcess.equals("initwhyPoweringKlugWerks")){
              	  
              	  
              	  return new ModelAndView("What'spoweringklugWerks"); 
                }
			   else if(usrProcess != null && usrProcess.equals("initwhyKlugWerks")){
             	  
             	  
             	  return new ModelAndView("whyKlugWerks"); 
               }
			   else if(usrProcess != null && usrProcess.equals("initCompellingFeatures")){
	             	  
	             	  
	             	  return new ModelAndView("CompellingFeatures"); 
	               }
               else if(usrProcess != null && usrProcess.equals("initHome")){
              	  
              	  
              	  return new ModelAndView("frmHome"); 
                }
               else if(usrProcess != null && usrProcess.equals("initFAQs")){
               	  
               	  
               	  return new ModelAndView("frmFAQ_Forums"); 
                 }
               else if(usrProcess != null && usrProcess.equals("initPrivacy")){
              	  
              	  
              	  return new ModelAndView("privacypolicy"); 
                }
               else if(usrProcess != null && usrProcess.equals("couponname")){

            		 String json = null;
            		 String couponcode=request.getParameter("prog");
            		 String cost=request.getParameter("cost");
            		
            		 String offer=db.getcouponoffer(couponcode);
            		 System.out.println("parasu checking -----offer--->"+offer);
            		 
            		if(offer != null){
            			int off = Integer.parseInt(offer);
            			double aa=Double.parseDouble(cost);  
            			int amount = (int)Math.round(aa);
               		 
            			int to=amount*off/100;
            			int total=amount-to;
            			db.updatecouponstatus(couponcode);
            			json = new Gson().toJson(total);				 
            		     response.setContentType("application/json");	             
            		     response.getWriter().write(json);
            		}else{
            			
            			json = new Gson().toJson(offer);				 
            		     response.setContentType("application/json");	             
            		     response.getWriter().write(json);
            		}
              }
               else if(usrProcess != null && usrProcess.equals("demorequest")){
               	  
               	  
               	  return new ModelAndView("demoRequest"); 
                 }
               
               else if(usrProcess!=null && usrProcess.equalsIgnoreCase("checkusrnam")){
      			 String usrId=request.getParameter("chsUserName");
      			
      	           boolean usrStat;
      			try {
      				usrStat = db.checkUserNameExist(usrId);
      				writer.println("<userstatus><![CDATA[" + usrStat + "]]></userstatus>"); 
      			} catch (SQLException e) {
      				// TODO Auto-generated catch block
      				e.printStackTrace();
      			}
      	            //get the member id existing or not status and respond 

      	          
      		      
      		     }
               
               
return null;
	}

public static Context getInitialContext() throws javax.naming.NamingException {
    Properties p =new Properties();
    p.setProperty( "java.naming.factory.initial", "org.jnp.interfaces.NamingContextFactory" );
    p.setProperty( "java.naming.factory.url.pkgs", "org.jboss.naming:org.jnp.interfaces" );
    p.setProperty( "java.naming.provider.url", "localhost:11199" );
    return new javax.naming.InitialContext(p);
  }           
}
