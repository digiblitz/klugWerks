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
package com.membership.action;

import java.io.IOException;
import java.io.InputStream;
import java.net.ProtocolException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import java.util.Vector;

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

import com.db.GeneralDBAction;
import com.hlcHorse.Form.Display.HLCkaverySessionBeanStatlessBean;
import com.hlcaccounts.session.HLCMahanadhiSessionBean;
import com.hlcaccounts.util.Debug;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlchorse.form.display.HLCKaverySessionStatefulBean;
import com.hlckavery.stateless.HLCkaveryStatelessBean;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionBean;

public class GldkftMembershipRegistrationAction implements Controller {
	
	
	static Logger log = Logger.getLogger(GldkftMembershipRegistrationAction.class.getName());
	
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
	
	
		HLCKaveryMembershipTypeSessionBean membTypeBean=new HLCKaveryMembershipTypeSessionBean();
		HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
		HLCMahanadhiSessionBean acctBean=new HLCMahanadhiSessionBean();
		HLCkaverySessionBeanStatlessBean hrsBean= new HLCkaverySessionBeanStatlessBean();
		HLCKaverySessionStatefulBean hrsStBean= new HLCKaverySessionStatefulBean();
		HLCkaveryStatelessBean mrmAdminBean=new HLCkaveryStatelessBean();
		GeneralDBAction db=new GeneralDBAction();	
		
		 HttpSession session=request.getSession(true); 
		String process=request.getParameter("process");
		 String usrId=(String) session.getAttribute("userId");
         
		
        Vector dispMembershipTypeVect = new Vector();
        Vector areUAMemberVect = new Vector();
        Vector membershipToVect = new Vector();
        Vector serviceTypeVect = new Vector();
        
        String memberId=(String) session.getAttribute("memberId");
        String userIdforDate = (String)session.getAttribute("userId");
        
        
        areUAMemberVect = hrsBean.areUAMember();
        membershipToVect = hrsBean.membershipTo();
        
        String country=hrsBean.getCountryName(usrId);
        Debug.print("User Country :"+country);
        
        
        ArrayList donDet=new ArrayList();
        donDet=db.getAllDonationDetails();
      
        
        java.util.Calendar toDay1 = java.util.Calendar.getInstance();
        int newyear1 = toDay1.get(Calendar.YEAR);
        int new_month1 = toDay1.get(Calendar.MONTH);
        Debug.print("new Year1 "+newyear1);
        Debug.print("new month "+new_month1);
        String[] addonPrice= new String[2];
        if(new_month1==11){
            Debug.print("In month == 11");
            dispMembershipTypeVect = membTypeBean.displayMembershipTypeOnYearAndTypeName("human",newyear1+1);
            addonPrice = hrsBean.getFamilyAddOnPrice("family member",newyear1+1);
        } else{
            Debug.print("In month != 11");
            dispMembershipTypeVect = hrsBean.getMembershipTypesOnCurYr("Human");
            addonPrice = hrsBean.getFamilyAddOnPrice("family member",newyear1);
        }
        
        ArrayList humanMembTypes = membTypeBean.getMembershipTypeForRegisteration();
        request.setAttribute("humanMembTypes",humanMembTypes);
        
        //dispMembershipTypeVect = remote.displayMembershipType("Human");
        
       
        serviceTypeVect=hrsBean.displayHorsePhoneServiceType("Horse");
        
        request.setAttribute("dispMembershipTypeVect", dispMembershipTypeVect);
        request.setAttribute("areUAMemberVect", areUAMemberVect);
        request.setAttribute("membershipToVect", membershipToVect);
        request.setAttribute("addonPrice",addonPrice);
        request.setAttribute("donDet",donDet);
        request.setAttribute("country",country);
        request.setAttribute("serviceTypeVect",serviceTypeVect);
		

		 boolean memextstat=humanMemb.isMemberExist(userIdforDate);
         Debug.print("remote1.isMemberExist(userIdforDate) :"+memextstat);
		
		if(process.equalsIgnoreCase("reg")) {
            //Debug.print("isMemberExist status in servlet :" + memextstat);
            
            Debug.print("     User Id:" + userIdforDate);
            Date dob = null;
            dob=humanMemb.getUserBirthDate(userIdforDate);
            Debug.print("     User DOB:" + dob);
            
            Debug.print("dob in Servlet:" + dob);
            request.setAttribute("dobCnt",dob);
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            
            ArrayList objlist = (ArrayList)db.getAllPublicationDetails();
            request.setAttribute("DispPubDetails",objlist);
            
            
            //Added for Furture year price
            
            java.util.Calendar toDay = java.util.Calendar.getInstance();
            int newyear = toDay.get(Calendar.YEAR);
            
            String[] dBnewFamilyPrice = membTypeBean.selectNextYrPrice("family member",newyear+1);
            String newFamilyPrice = dBnewFamilyPrice[0]+"#"+dBnewFamilyPrice[1];
            Debug.print("New Family Price "+newFamilyPrice);
            request.setAttribute("newFamilyPrice",newFamilyPrice);
            
            // Ended for Furture year price
            
            if(memextstat==true) {
                
                String stat="If you would like to renew your membership, please go to our <a href=" + "MembershipReg.do?process=renew" +">Renewal Page</a>";
                Debug.print("stat in servlet "+stat);
                request.setAttribute("stat",stat);
                return new ModelAndView("memb-reg-eligibility");
               
            } else {
                
                return new ModelAndView("member-registration");
            }
            
        }
		
		
		
		
		
		
		
		
		
		
		
	
    
		return null;	
		}	
	

}
