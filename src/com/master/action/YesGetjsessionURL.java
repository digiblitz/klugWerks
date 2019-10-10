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
package com.master.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

import org.apache.commons.lang.StringUtils;

public class YesGetjsessionURL {
	
	
	public String getYesLoginjsessionId(String reqURL){
		String jsessionId = null;
		try
	      {
//	         URL url = new URL("http://74.208.110.192:8480/yes-shop/login");
			 URL url = new URL(reqURL);
	         URLConnection urlConnection = url.openConnection();
	         HttpURLConnection connection = null;
	         if(urlConnection instanceof HttpURLConnection)
	         {
	            connection = (HttpURLConnection) urlConnection;
	         }
	         else
	         {
	            System.out.println("Please enter an HTTP URL.");
	            return null;
	         }
	         BufferedReader in = new BufferedReader(
	         new InputStreamReader(connection.getInputStream()));
	         String urlString = "";
	         String current;
	         while((current = in.readLine()) != null)
	         {
	            urlString += current;
	         }
	         String splitableStr = "action=\"./login;jsessionid=";
	         jsessionId= StringUtils.substringBetween(urlString, splitableStr, "IFormSubmitListener-authView-loginForm");
	         System.out.println(jsessionId);

//	         System.out.println(urlString);

	      }catch(IOException e)
	      {
	         e.printStackTrace();
	      }
		
		return jsessionId;
	}

}
