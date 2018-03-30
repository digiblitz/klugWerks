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
import java.util.Date;
import java.util.Properties;
import java.util.Vector;

import javax.ejb.FinderException;
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
import com.hlcHorse.Form.Display.HLCkaverySessionBeanStatlessBean;
import com.hlcaccounts.session.HLCMahanadhiSessionBean;
import com.hlcaccounts.util.Debug;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.stateless.HLCkaverystatelessRemote;
import com.hlcform.stateless.HLCkaverystatelessRemoteHome;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionBean;
import com.hlcform.util.HLCMemberDetails;
import com.hlcform.util.HLCPaymentDetails;
import com.hlcform.util.HLCPaymentDetailVO;
import com.logout.action.KlgLogoutAction;

public class GldkftMembershipAction implements Controller {
	
	static Logger log = Logger.getLogger(GldkftMembershipAction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;

	@Override
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
		
		HttpSession session=request.getSession(true); 
		  String memRegiListProcess = request.getParameter("memRegiListProcess");
		  String memTypId1 = request.getParameter("memTypId");
		  String memdispTypId = request.getParameter("dispId");
		  
		if(memRegiListProcess.equalsIgnoreCase("initFind")) {
            try{
                Debug.print("initial search is loading......." );
      
                Vector  userVect =(Vector)membTypeBean.displayUserTypeDetails();
                session.setAttribute("userTypeVect",userVect);
                //System.out.println("servletvector:"+userVect);
                session.setAttribute("userTypeVect2",null);
                
                Vector userVect1=(Vector)membTypeBean.displayMembershipTypeDetails1(2007);
                session.setAttribute("userTypeVect1",userVect1);
                //System.out.println("servletvector1:"+userVect1);
                request.setAttribute("memTypId",memTypId1);
                session.setAttribute("userTypeVect2",null);
                
              //  return mapping.findForward("displayMemberRegiList");
                
                return new ModelAndView("MemberRegiList");
            } catch(Exception emember) {
                Debug.print("while Loading User Type ID page" + emember);
                
            }
        
        }
		else if(memRegiListProcess.equalsIgnoreCase("adminTransDet")){
             
			///  Payment Details
			               
			                ArrayList transacEntries = null;
			                ArrayList subTransac = null;
			                ArrayList nxtTransac = null;
			                HLCPaymentDetails objPayment = null;
			                HLCPaymentDetailVO bounceDet = null;
			                String payId = request.getParameter("Id");
			                String firstNme = request.getParameter("fnme");
			                String lastNme = request.getParameter("lnme");
			                String memberId = request.getParameter("mid");
			                if(firstNme==null)    {
			                    firstNme= "";
			                }
			                if(lastNme==null){
			                    lastNme= "";
			                }
			                if(memberId==null){
			                    memberId = "";
			                }
			                if(payId!=null || payId.trim().length()!=0){
			                    transacEntries = acctBean.getAccTxnDetailsOnPaymentId(payId);
			                    objPayment = humanMemb.getPaymentDetails(payId);
			                    try {
									nxtTransac = humanMemb.getAdminPaymentDetails(payId);
								} catch (Exception e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
			                    bounceDet = humanMemb.getNSFCheckDetails(payId);
			                }
			                request.setAttribute("fnme",firstNme);
			                request.setAttribute("lnme",lastNme);
			                request.setAttribute("mid",memberId);
			                request.setAttribute("objPayment",objPayment);
			                request.setAttribute("transacEntries",transacEntries);
			                request.setAttribute("bounceDet",bounceDet);
			                request.setAttribute("subTransac",nxtTransac);
			                request.setAttribute("memTypId1",memTypId1);
			                return new ModelAndView("frmTransacAdminDet");
			            }
		
		else if(memRegiListProcess.equalsIgnoreCase("memRegiListView")) {
            
            try {
                String usrtypname=request.getParameter("usrtypname");
                String memberId=request.getParameter("memberId");
                String userId=request.getParameter("userId");
                
                Debug.print(" userId :"+ userId);
                System.out.println("MemberID...................."+memberId);
                Vector userVect3=(Vector)membTypeBean.selectDetailsForMember(memberId);
                request.setAttribute("userTypeVect3",userVect3);
                System.out.println("servletvector3:"+userVect3);
                request.setAttribute("usrtypname",usrtypname);
                
               
                String status=humanMemb.getStatusByMemberId(memberId);
                
                ArrayList familyAddOnId = new ArrayList();
                familyAddOnId = membTypeBean.getFamilyAddOnId(memberId);
                request.setAttribute("familyAddOnId",familyAddOnId);
                
               
                // request.setAttribute("memberId",memberId);
                Debug.print("The Size.....................................:"+ userVect3.size());
                
                HLCMemberDetails objMember = new HLCMemberDetails();
                objMember=humanMemb.displayMemberDetail(memberId);
                Debug.print("remote1.displayMemberDetail(memberId) :" + objMember);
                
                int siz=0;
                
                if(objMember.getFamilyAddOn()!=null) {
                    siz=objMember.getFamilyAddOn().size();
                }
                
                request.setAttribute("objMember",objMember);
                System.out.println("objMember.getFamilyAddOn() : "+siz);
                
                ArrayList nonhlc=new ArrayList();
                ArrayList donSelect=new ArrayList();
                
                nonhlc=hrsBean.getMemberNonUseaDetails(memberId);
                donSelect=hrsBean.getMemberDonationDetails(userId);
                
                request.setAttribute("nonhlc",nonhlc);
                request.setAttribute("donSelect",donSelect);
                
                HLCPaymentDetails objPayment = new HLCPaymentDetails();
                objPayment=humanMemb.getPaymentDetails(objMember.getPaymentId());
                request.setAttribute("objPayment",objPayment);
                Debug.print("objMember.getPaymentId() returned by getPaymentDetails() :"+objMember.getPaymentId());
                System.out.println("objPayment returned by getPaymentDetails() :"+objPayment.toString());
                
                ArrayList childPayment=new ArrayList();
                
                childPayment = humanMemb.getAdminPaymentDetails(objMember.getPaymentId());
                request.setAttribute("childPayment",childPayment);
                Debug.print("ArrayList returned by getAdminPaymentDetails() childPayment.size() :"+childPayment.size());
                
                Date approvalDate =(Date) humanMemb.getApprovedDate(memberId);
                Debug.print("memberId: "+memberId);
                Debug.print(" approvalDate:"+approvalDate);
                request.setAttribute("approvalDate",approvalDate);
                request.setAttribute("userId",userId);
                String[] serviceType = (String[]) humanMemb.loadServiceType();
                request.setAttribute("serviceType",serviceType);
                
                
                ArrayList NSFcharge = (ArrayList) humanMemb.getNsfPaymentDetails(objMember.getPaymentId());
                Debug.print("NSFcharge Size"+NSFcharge.size());
                
                request.setAttribute("NSFcharge",NSFcharge);
                
                return new ModelAndView("member-registration-approve");
                
                
            } catch(Exception emember) {
                Debug.print("while Viewing the Member information page" + emember);
                
                
            }
        }
		
		/*
	       * To Assign Satus of Member
	       */
	            else if(memRegiListProcess.equalsIgnoreCase("memRegiApprove")) {
	                
	                try {
	                   
	                    String uStatusId=request.getParameter("uStatusId");
	                    String memberId=request.getParameter("memberId");
	                    System.out.println("MemberID...................."+memberId);
	                    
	                           /*  String uStatusId=request.getParameter("uStatusId");
	                             if(usrtypname.equalsIgnoreCase("Human"))
	                             {
	                             }*/
	                    if(memberId.length()!=0 && memberId!=null) {
	                        String usrtypname=request.getParameter("usrtypname");
	                        
	                        if(usrtypname.equalsIgnoreCase("Horse")) {
	                            boolean result=membTypeBean.editHorseMemberStatus(uStatusId,memberId);
	                            //request.setAttribute("userTypeVect4",userVect4);
	                            System.out.println("result:"+result);
	                            
	                        } else {
	                            boolean result=membTypeBean.editMemberStatus(uStatusId,memberId);
	                            //request.setAttribute("userTypeVect4",userVect4);
	                            System.out.println("result:"+result);
	                            
	                            ArrayList familyAddOnId=new ArrayList();
	                            familyAddOnId=(ArrayList)session.getAttribute("familyAddOnId");
	                            
	                            if(uStatusId.equalsIgnoreCase("Inactive")) {
	                                if(familyAddOnId!=null) {
	                                    Debug.print("Inside familyAddOn Inactiveate block :" +familyAddOnId.size());
	                                    
	                                    Debug.print("familyAddOnId.size() :" +familyAddOnId.size());
	                                    
	                                    for(int i=0;i<familyAddOnId.size();i++) {
	                                        String memId[]=(String[])familyAddOnId.get(i);
	                                        
	                                        Debug.print("uStatusId is "+uStatusId);
	                                        Debug.print("memberId of familyAddOn is "+memId[0]);
	                                        boolean stat=membTypeBean.editMemberStatus(uStatusId,memId[0]);
	                                        Debug.print("memberRemote2.editMemberStatus(uStatusId,memId[0]) :"+stat);
	                                        
	                                    }
	                                    
	                                    session.setAttribute("familyAddOnId",null);
	                                }
	                            }
	                            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyy");
	                            Debug.print("memberId:"+memberId);
	                            Debug.print("request.getParameter(approvalDate) :"+request.getParameter("approvalDate"));
	                            
	                            Date approvalDate=null;
	                            
	                            if(request.getParameter("approvalDate")!=null && request.getParameter("approvalDate").trim().length()!=0) {
	                                approvalDate = (Date) sdf.parse(request.getParameter("approvalDate"));
	                                Debug.print("approvalDate :"+approvalDate.toString());
	                                boolean appDateStatus = humanMemb.updateApprovalDate(memberId,approvalDate);
	                                Debug.print("approvalDate :"+appDateStatus);
	                            }
	                            
	                            
	                            /// Update status in the History Details
	                            String paymentId= request.getParameter("parentpayId");
	                            Debug.print("parent Pay Id "+paymentId);
	                            String statid=humanMemb.getStatusIBasedOnStatus(uStatusId);
	                            Debug.print("Status Id on query for "+uStatusId+" is "+statid);
	                            String memberId1 = request.getParameter("memberId");
	                            boolean histStatusUpdate = humanMemb.updateMemberHistoryDetailStatus(memberId1,statid,paymentId);
	                            Debug.print("histStatusUpdate is "+histStatusUpdate);
	                            /// End update status in the History Details
	                            
	                            
	                            // request.setAttribute("memberId",memberId);
	                            // Debug.print("The Size.....................................:"+ userVect4.size());
	                            
	                            String mainStat = request.getParameter("mainStat");
	                            String subStat = request.getParameter("subStat");
	                            
	                            Debug.print("mainStat"+mainStat);
	                            Debug.print("subStat"+subStat);
	                            
	                            String mainPayNfs=null;
	                            String firstEnbAmt = null;
	                            boolean firstRec = false;
	                            if(mainStat.equalsIgnoreCase("avail")){
	                                mainPayNfs = request.getParameter("mainPayNfs");
	                                Debug.print("Request Parameter    "+mainPayNfs);
	                                if(mainPayNfs!=null){
	                                    String[] payId_amount = mainPayNfs.split("#");
	                                    mainPayNfs = payId_amount[0];
	                                    String amount = payId_amount[1];
	                                    String subpayamount = payId_amount[2];
	                                    
	                                    String usrtxtArea = request.getParameter("usrtxtArea");
	                                    String admintxtArea = request.getParameter("admintxtArea");
	                                    Debug.print("payId_amount "+payId_amount);
	                                    Debug.print("mainPayNfs" +mainPayNfs);
	                                    Debug.print("amount "+amount);
	                                    Debug.print("subpayamount   "+subpayamount);
	                                    
	                                    HLCPaymentDetailVO payDetVO = new HLCPaymentDetailVO();
	                                    // Get client's IP address
	                                    String addr = request.getRemoteAddr(); // 123.123.123.123
	                                    Debug.print("Port Value:" + addr);
	                                    
	                                    String newPaymentId = humanMemb.getNextId();
	                                    payDetVO.setNsfStatus(true);
	                                    //payDetVO.setNsf_charge_status(true);
	                                    payDetVO.setCheckAmount(0);
	                                    payDetVO.setPendingAmount(Float.parseFloat(amount));
	                                    payDetVO.setParentPaymentId(mainPayNfs);
	                                    payDetVO.setAmount(Float.parseFloat(amount));
	                                    payDetVO.setPaymentId(newPaymentId);
	                                    String userId = (String) session.getAttribute("userId");
	                                    payDetVO.setUserId(userId);
	                                    payDetVO.setUser_comments(usrtxtArea);
	                                    payDetVO.setStaff_comments(admintxtArea);
	                                    
	                                    ///payDetVO.setPaymentStatus("check");
	                                    
	                                    payDetVO.setIpAddress(addr);
	                                    humanMemb.insertPayment(payDetVO);
	                                    humanMemb.updateNSFChargeStatus(mainPayNfs);
	                                    if(firstRec!=true){
	                                        firstRec = true;
	                                        firstEnbAmt = subpayamount;
	                                        humanMemb.updateNSFPendingAmt(mainPayNfs,Float.parseFloat(firstEnbAmt));
	                                    }
	                                    String parentpayId = request.getParameter("parentpayId");
	                                    
	                                    if(parentpayId!=null && parentpayId.trim().length()!=0){
	                                        boolean update_NSF_Sebsequent = humanMemb.updateNSFChargeStatusForSubSequentPayments(parentpayId,Float.parseFloat(subpayamount));
	                                        Debug.print("update_NSF_Sebsequent Result "+update_NSF_Sebsequent);
	                                    }
	                                }
	                            }
	                            //Sub payment Update
	                            if(subStat.equalsIgnoreCase("avail")){
	                                String subPaySz = request.getParameter("subPaySz");
	                                String parentPayId = (String) request.getParameter("parentpayId");
	                                Debug.print("Parent Pay Id "+parentPayId);
	                                int subSz = Integer.parseInt(subPaySz);
	                                for(int j=0;j<subSz;j++){
	                                    String subpay = (String) request.getParameter("subpay"+j);
	                                    Debug.print("sub Pay is "+subpay);
	                                    Debug.print("sub Pay length is "+subpay.length());
	                                    String checkedSub = (String) request.getParameter("chkItem"+j);
	                                    Debug.print("checkedSub is :"+checkedSub);
	                                    if(checkedSub!=null && checkedSub.trim().length()!=0){
	                                        if(checkedSub.trim().equalsIgnoreCase("avail")){
	                                            Debug.print("sub Pay is "+subpay);
	                                            String[] payId_amount1 = subpay.split("#");
	                                            String subPayNfs = payId_amount1[0];
	                                            String nsfamount = payId_amount1[1];
	                                            String subpayamount = payId_amount1[2];
	                                            
	                                            String subusrtxtArea = request.getParameter("subusrtxtArea"+j);
	                                            String subadmintxtArea = request.getParameter("subadmintxtArea"+j);
	                                            
	                                            Debug.print("subPayNfs "+subPayNfs);
	                                            Debug.print("nsfamount "+nsfamount);
	                                            Debug.print("subPaySz  "+subPaySz);
	                                            Debug.print("subpayamount "+subpayamount);
	                                            
	                                            if(subPayNfs!=null || subPayNfs.trim().length()!=0){
	                                                HLCPaymentDetailVO payDetVO = new HLCPaymentDetailVO();
	                                                
	                                                // Get client's IP address
	                                                String addr = request.getRemoteAddr(); // 123.123.123.123
	                                                Debug.print("Port Value:" + addr);
	                                                String newPaymentId = humanMemb.getNextId();
	                                                payDetVO.setNsfStatus(true);
	                                                payDetVO.setCheckAmount(0);
	                                                payDetVO.setStaff_comments(subadmintxtArea);
	                                                payDetVO.setUser_comments(subusrtxtArea);
	                                                payDetVO.setPendingAmount(Float.parseFloat(nsfamount));
	                                                payDetVO.setParentPaymentId(parentPayId);
	                                                payDetVO.setPaymentId(newPaymentId);
	                                                payDetVO.setAmount(Float.parseFloat(nsfamount));
	                                                String userId = (String) session.getAttribute("userId");
	                                                payDetVO.setUserId(userId);
	                                                ///payDetVO.setPaymentStatus("check");
	                                                payDetVO.setUser_comments(subusrtxtArea);
	                                                payDetVO.setStaff_comments(subadmintxtArea);
	                                                //payDetVO.setNsf_charge_status(true);
	                                                payDetVO.setIpAddress(addr);
	                                                
	                                                humanMemb.insertPayment(payDetVO);
	                                                humanMemb.updateNSFChargeStatus(subPayNfs);
	                                                if(firstRec!=true){
	                                                    firstRec = true;
	                                                    firstEnbAmt = subpayamount;
	                                                    humanMemb.updateNSFPendingAmt(parentPayId,Float.parseFloat(firstEnbAmt));
	                                                }
	                                                
	                                                String parentpayId = request.getParameter("parentpayId");
	                                                
	                                                if(parentpayId!=null && parentpayId.trim().length()!=0){
	                                                    boolean update_NSF_Sebsequent = humanMemb.updateNSFChargeStatusForSubSequentPayments(parentpayId,Float.parseFloat(subpayamount));
	                                                    Debug.print("update_NSF_Sebsequent Result "+update_NSF_Sebsequent);
	                                                }
	                                                
	                                            }
	                                        }
	                                    }
	                                }
	                            }
	                            // }
	                        }
	                        
	                        
	                        return new ModelAndView("MemberRegiList"); 
	                        
	                    } else {
	                        
	                        
	                        // String memberId=request.getParameter("memberId");
	                        //    System.out.println("MemberID...................."+memberId);
	                        //  Vector userVect3=(Vector)memberRemote.selectDetailsForMember(memberId);
	                        // request.setAttribute("userTypeVect3",userVect3);
	                        // System.out.println("servletvector3:"+userVect3);
	                        // request.setAttribute("memberId",memberId);
	                        // Debug.print("The Size.....................................:"+ userVect3.size());
	                    	 return new ModelAndView("MemberRegiList"); 
	                    }
	                }
	                
	                catch(Exception emember) {
	                    emember.printStackTrace();
	                    Debug.print("while changing the status of Member " + emember);
	                    
	                }
	            }
		
		else if(memRegiListProcess.equalsIgnoreCase("memRegiListSubUserType")) {
            if(memTypId1.length()!=0 && memTypId1!=null) {
                try {
                    String usrtypname=request.getParameter("usrtyp");
                    String year = request.getParameter("year");
                    int yearVal = Integer.parseInt(year);
                    Debug.print("memtypname from servlet MemberDetails block :" + usrtypname);
                    request.setAttribute("usrtypname",usrtypname);
                    
                    //Vector userVect1=(Vector)memberRemote.displayMembershipType(memTypId1);
                    Vector userVect1=(Vector)membTypeBean.displayMembershipTypeDetails1(yearVal);
                    session.setAttribute("userTypeVect1",userVect1);
                    System.out.println("servletvector1:"+userVect1);
                    request.setAttribute("memTypId",memTypId1);
                    session.setAttribute("userTypeVect2",null);
                    request.setAttribute("year",year);
                    return new ModelAndView("MemberRegiList");
                } catch(Exception emember) {
                    Debug.print("while Loading User Type ID page" + emember);
                    
                }
            }
        }	
		
		/*
        Populate Member Type Dropdown List...
 */
           else if(memRegiListProcess.equalsIgnoreCase("memRegiListMemberType")) {
               Debug.print("memRegiListMemberType Method Called");
               String year = request.getParameter("year");
               request.setAttribute("year",year);
               if(memdispTypId.length()!=0 && memdispTypId!=null)  {
                   try{
                       int rCnt =0;
                       int pNo =1;
                       String statusName=request.getParameter("status");
                       Debug.print("status name from servlet :" +statusName);
                       String pageNo = request.getParameter("pn");
                       
                       if(pageNo!=null){
                           pNo = Integer.parseInt(pageNo);
                       }
                       Debug.print("Page NO :"+pNo);
                       String statid=humanMemb.getStatusIBasedOnStatus(statusName);
                       Debug.print("statusID from servlet :"+statid);
                       //session.setAttribute("statusID",statusID);
                       
                       System.out.println("MemberDisplayID...................."+memdispTypId);
                       // String statid=(String)session.getAttribute("statusID");
                       Debug.print("statusID from session inside servlet MemberDetails block :" + statid);
                       String usrtypname=request.getParameter("usrtyp");
                       Debug.print("memtypname from servlet MemberDetails block :" + usrtypname);
                       request.setAttribute("memdispTypId",memdispTypId);
                       request.setAttribute("memTypId",memTypId1);
                       request.setAttribute("status",statusName);
                       
                       if(usrtypname.equalsIgnoreCase("Human")) {
                           Debug.print("Inside Human Details Block ......");
                           if(memdispTypId!=null && memdispTypId.trim().length()!=0 && statid!=null && statid.trim().length()!=0){
                               rCnt = membTypeBean.memberRowCount(memdispTypId,statid);
                               Vector userVect2=(Vector)membTypeBean.displayMembershipDetailByMemberIDe(memdispTypId,statid,pNo);
                               session.setAttribute("userTypeVect2",userVect2);
                               request.setAttribute("usrtypname",usrtypname);
                           }
                           request.setAttribute("rCnt", String.valueOf(rCnt));
                           request.setAttribute("pNo", String.valueOf(pNo));
                       }
                       
                       if(usrtypname.equalsIgnoreCase("Horse")) {
                           Debug.print("Inside Horse Details Block ......");
                           
                           String usertypid=request.getParameter("userType_sel");
                           String memtypid=request.getParameter("memType_Sel");
                           
                           System.out.println("usertypid :"+usertypid);
                           System.out.println("memtypid :"+memtypid);
                           System.out.println("statid :"+statid);
                           
                           ArrayList horsedet=new ArrayList();
                           horsedet=membTypeBean.displayMembershipDetailForHorse(usertypid,memtypid,statid);
                           System.out.println("horsedet size :"+horsedet.size());
                           request.setAttribute("horsedet",horsedet);
                           
                           request.setAttribute("usrtypname",usrtypname);
                           
                       }
                       
                       return new ModelAndView("MemberRegiList");
                   } catch(Exception emember) {
                       Debug.print("while Loading User Type ID page" + emember);
                       
                   }
               }
               
               int yearVal = 0;
               if(year!=null &&year.trim().length()!=0){
                   yearVal  =Integer.parseInt(year);
               }
               Vector userVect1;
			try {
				
				userVect1 = (Vector)membTypeBean.displayMembershipTypeDetails1(yearVal);
				session.setAttribute("userTypeVect1",userVect1);
			} catch (FinderException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
               
               
           }
		
		
           else if(memRegiListProcess.equalsIgnoreCase("getMemberTypes")){
               String year = request.getParameter("year");
               int yearVal = 0;
               if(year!=null &&year.trim().length()!=0){
                   yearVal  =Integer.parseInt(year);
               }
               Vector userVect1;
			try {
				userVect1 = (Vector)membTypeBean.displayMembershipTypeDetails1(yearVal);
				 Debug.print("Vector Returned:"+userVect1);
	               request.setAttribute("year",year);
	               session.setAttribute("userTypeVect1",userVect1);
	               return new ModelAndView("MemberRegiList");
			} catch (FinderException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
              
           }
		
		
		
		
		
		return null;
	}
	
	
	
	
	

}
