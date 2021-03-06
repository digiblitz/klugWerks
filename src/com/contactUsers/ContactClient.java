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
package com.contactUsers;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import javax.xml.namespace.QName;

public class ContactClient implements ContactClientInterface{
	
	String firstName = null;
	String lastName = null;
	String emailId = null;
	String phoneNo = null;
	String companyName = null;
	String description = null;
	
	public String contact(ContactUser contactUser){
		
		String returnStatus = null; 
				
		try {
			
			firstName = contactUser.getFirstName();
			lastName = contactUser.getLastName();
			emailId = contactUser.getEmailId();
			phoneNo = contactUser.getPhoneNo();
			companyName = contactUser.getCompanyName();
			description = contactUser.getDescription();
			
	           String endpoint = 
	           			  "http://localhost:9480/ode/processes/gK_ContactProcess?wsdl";
	     
	           Service service = new Service();
	           Call call = (Call) service.createCall();
	           call.setTargetEndpointAddress( new java.net.URL(endpoint) );
	           call.setOperationName(new QName("http://contactUsers.com/", "process") );
	           
	           //SOAP_STRING
	           call.addParameter("firstName", org.apache.axis.Constants.XSD_STRING, javax.xml.rpc.ParameterMode.IN);
	           call.addParameter("lastName", org.apache.axis.Constants.XSD_STRING, javax.xml.rpc.ParameterMode.IN);
	           call.addParameter("emailId", org.apache.axis.Constants.XSD_STRING, javax.xml.rpc.ParameterMode.IN);
	           call.addParameter("phoneNo", org.apache.axis.Constants.XSD_STRING, javax.xml.rpc.ParameterMode.IN);
	           call.addParameter("companyName", org.apache.axis.Constants.XSD_STRING, javax.xml.rpc.ParameterMode.IN);
	           call.addParameter("description", org.apache.axis.Constants.XSD_STRING, javax.xml.rpc.ParameterMode.IN);	           
	           call.addParameter("status", org.apache.axis.Constants.XSD_STRING, javax.xml.rpc.ParameterMode.IN);
	                     
	           
	           call.setReturnType(org.apache.axis.Constants.XSD_STRING);
	           
	          /* int i = testCl.hashCode(input);
	           System.out.println("i ---> "+i);*/    
	           /*Object[] params = new Object[1];
			    params[0] = input;			    
			    call.invokeOneWay(params);*/
	           
	           
	           System.out.println("before invoke");
	           
	           returnStatus = (String) call.invoke(new Object[] { firstName, lastName, emailId,
	        		   phoneNo, description, companyName, ""} );	           
	           System.out.println("Sent 'Hello, ' and 'World!', got '" + returnStatus + "'");
	           
	           //call.invokeOneWay( new Object[] { password, verifyPwd, enabled, partyId, requirePwdChange, userLoginId, userLogin, loginUserName, loginUserPwd } );
	           
	           System.out.println("works fine ");
	       } catch (Exception e) { 
	           System.err.println(e.toString());
	       }
		
		return returnStatus;
	}

}
