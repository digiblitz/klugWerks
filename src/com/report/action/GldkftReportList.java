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
package com.report.action;

/*
 * Dhivya
 * 
 */

import java.io.IOException;
import java.io.InputStream;
import java.net.ProtocolException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

public class GldkftReportList implements Controller {
	
	static Logger log = Logger.getLogger(GldkftReportList.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
	
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		//=====================Properties log file configuration started here==============================
		
				Properties logProp = new Properties();  
			      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);
			      logProp.load(is); 
			      PropertyConfigurator.configure(logProp);      
			      log.info("Logging enabled"); 
		 //=====================Properties log file configuration started here==============================
	
	try{
		  HttpSession session = request.getSession();
		  String cmd = request.getParameter("cmd");
	
		  if(cmd.equalsIgnoreCase("shReportlst")){
			  
			  return new ModelAndView("showReportList");   	  
		  }
		
		
		
		
	}catch(Exception e){
		e.printStackTrace();
		
	}
	
		return null;
	
	}
	

}
