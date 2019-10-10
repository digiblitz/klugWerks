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
package com.yes.cart.password.gen;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.util.XMLParser;

public class YesCartPassword {
	
	static Logger log = Logger.getLogger(YesCartPassword.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
	
	public YesCartPassword(){
		//=====================Properties log file configuration started here==============================
		
		Properties logProp = new Properties();  
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);
	      try {
			logProp.load(is);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	      PropertyConfigurator.configure(logProp);      
	      log.info("Logging enabled"); 
	      //=====================Properties log file configuration started here==============================
	}

	
	
 public String getHash(final String password) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		 
		 String salt = "YCPWSALT";
	        final MessageDigest digest = MessageDigest.getInstance("MD5");
	        byte[] md5hash;

	        final String saltedPassword = StringUtils.isNotBlank(salt) ? password.concat(salt) : password;

	        digest.update(saltedPassword.getBytes("utf-8"), 0, saltedPassword.length());
	        md5hash = digest.digest();
	        return convertToHex(md5hash);
	    }

	    private static String convertToHex(final byte[] data) {
	        StringBuffer buf = new StringBuffer();
	        for (int i = 0; i < data.length; i++) {
	            int halfbyte = (data[i] >>> 4) & 0x0F;
	            int two_halfs = 0;
	            do {
	                if ((0 <= halfbyte) && (halfbyte <= 9)) {
	                    buf.append((char) ('0' + halfbyte));
	                } else {
	                    buf.append((char) ('a' + (halfbyte - 10)));
	                }
	                halfbyte = data[i] & 0x0F;
	            } while (two_halfs++ < 1);
	        }
	        return buf.toString();
	    }
}
