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
package com.db;

import java.io.IOException;
import java.io.InputStream;
import java.rmi.RemoteException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Iterator;
import java.util.Properties;
import java.util.Random;
import java.util.Vector;
import java.util.Date;
import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.FinderException;
import javax.ejb.ObjectNotFoundException;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.jasypt.util.text.BasicTextEncryptor;

//import com.hlccommon.util.DBHelper;
//import com.hlccommon.util.Debug;
import com.customer.support.action.CustomerSupportAction;
import com.hlccommon.util.HLCMenuListVO;
import com.hlcform.user.HLCArabianSeaEntityUserBean;
import com.hlcform.user.HLCArabianSeaEntityUserLocal;
import com.hlcform.user.HLCArabianSeaEntityUserLocalHome;
import com.hlcform.util.HLCContactDetails;
import com.hlcform.util.HLCMemberUpdateDAO;
import com.hlcform.util.HLCPassword;
import com.hlcform.util.HLCUserMaster;
import com.hlcform.util.DBHelper;
import com.hlcform.util.Debug;
import com.hlcmember.type.util.HLCMembershipTypeMaster;
import com.hlcmrm.util.HLCDonationVO;
import com.hlcmrm.util.HLCPublicationVO;


public class GeneralDBAction {
	
	static Logger log = Logger.getLogger(GeneralDBAction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
	
	
	public static final String dbName = "java:/HLCMSSQLDS";
	public static final String mySqldbName = "java:/HLCMYSQLDS";
    public Connection con = null;
    public PreparedStatement prepStmt = null;
    public ResultSet rs = null;
	
    HLCArabianSeaEntityUserLocal remote;
    HLCArabianSeaEntityUserLocalHome home;
    HLCArabianSeaEntityUserBean remoteArB;
    HLCUserMaster objUpdateUser = null;
    HLCContactDetails objUpdateContact = null;
    
    public GeneralDBAction(){
    	
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
    
        public int totalMessageCount(String toUserId) {
        Debug.print("GeneralDBAction.totalMessageCount():" + toUserId);
        int count = 0;
     
        makeConnection();
        try {
            String selectStatement = " SELECT count(*) from tblMessages where view_status = 0 and to_user_id= ? ";
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1, toUserId);
            rs = prepStmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
            Debug.print("GeneralDBAction.totalMessageCount():" + count);
        } catch (SQLException sql) {
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.totalMessageCount():" + sql.getMessage());
        } catch (Exception e) {
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.totalMessageCount():" + e.getMessage());
        }
        return count;
    }
	
    public ArrayList getAllRolesBasedOnUser(String userId){
        Debug.print("GeneralDBAction.getAllRolesBasedOnUser():");
        ArrayList rolesList = null;
       
        makeConnection();
   	try {
            String selectStatement = " SELECT A.user_map_id, A.user_id, A.role_id, B.role_name from tblMapUserPrivilege A, tblRoleMaster B  where A.role_id = B.role_id and A.user_id = ? order by B.role_name" ;
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,userId);
            rs = prepStmt.executeQuery();
            rolesList = new ArrayList();
            while(rs.next()){
                String userMapId = rs.getString(1);
                String userIdVal = rs.getString(2);
                String roleId = rs.getString(3);
                String roleName = rs.getString(4);
                String[] rlList = {userMapId, userIdVal, roleId, roleName};
                rolesList.add(rlList);
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
           // Debug.print("RoleManagementDAOImpl.selectAllRolesBasedOnUser():" + rolesList);
        } 
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.getAllRolesBasedOnUser():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.getAllRolesBasedOnUser():" + e.getMessage());
        }
        return rolesList;
      }
    
    public ArrayList getMappingDetailsForRoleAndPrivileges(String roleId){
        Debug.print("GeneralDBAction.getMappingDetailsForRoleAndPrivileges():");
        ArrayList roleEntityMapList = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        makeConnection();
   	try {
            String selectStatement=" SELECT a.map_entity_id , a.role_id ,a.entity_id, b.role_name, c.entity_name,c.entity_access_url from tblMapEntity a , " +
            		"tblRoleMaster b , tblEntityMaster c " +
                    " where a.entity_id = c.entity_id and a.role_id = b.role_id and a.role_id = ? order by c.entity_name";
         
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,roleId);
            Debug.print(selectStatement);
            rs = prepStmt.executeQuery();
            roleEntityMapList = new ArrayList();
            while(rs.next()){
                String mapEntityId = rs.getString(1);
                String roleIdVal = rs.getString(2);
                String entityId = rs.getString(3);
                String roleName = rs.getString(4);
                String entityName = rs.getString(5);
                String entityUrl = rs.getString(6);
                String[] entMapList = {mapEntityId, roleIdVal, entityId, roleName, entityName,entityUrl};
                roleEntityMapList.add(entMapList);
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
            //Debug.print("RoleManagementDAOImpl.selectAllMappingDetailsForRole():" + roleEntityMapList);
        } 
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.getMappingDetailsForRoleAndPrivileges():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.getMappingDetailsForRoleAndPrivileges():" + e.getMessage());
        }
        return roleEntityMapList;
    }
    
 
    public String [] getRole(String roleId) {
        Debug.print("GeneralDBAction.getRole():");
       
        String[] strRoleList = {};
        makeConnection();
   	try {

            String selectStatement=" select case when role_id in(select role_id from tblMapEntity union all select role_id from tblMapUserPrivilege"+
                                   " union all select role_id from tblMapRole) then '0' else '1' end flag, "+
                                   " role_id, role_name,role_desc,active_status from tblRoleMaster where role_id = ? ";

            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,roleId);
            rs = prepStmt.executeQuery();
            if(rs.next()){
                String roleIdVal = rs.getString(2);
                String roleName = rs.getString(3);

                String roledesc = rs.getString("role_desc");
                String status = rs.getString("active_status");
                String flag = rs.getString("flag");

                String tempStrRoleList[] = {roleIdVal, roleName,roledesc,status,flag};
                strRoleList = tempStrRoleList;
            }
  
            rs.close();
            prepStmt.close();
            releaseConnection();
            Debug.print("GeneralDBAction.getRole():" + strRoleList);
        } 
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.getRole():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.getRole():" + e.getMessage());
        }
        return strRoleList;
    }   
    
    public ArrayList getMappingDetailsForRlEntPrivPerm(String roleId, String entId){
        Debug.print("GeneralDBAction.getMappingDetailsForRlEntPriv():");
        ArrayList roleEntityMapList = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        makeConnection();
   	try {
            String selectStatement="SELECT distinct a.map_entity_id , a.role_id ,a.entity_id, b.role_name, " +
            		"c.entity_name, c.entity_access_url, d.privilege_name, " +
            		"e.privilege_id, f.access_name,f.access_url " +
            		"from tblMapEntity a , tblRoleMaster b , tblEntityMaster c, " +
            		"tblPrivilegeMaster d, tblMapRole e, tblMapPermission f " +
            		"where a.entity_id = c.entity_id and a.role_id = b.role_id and " +
            		"f.permission_id=e.permission_id and f.privilege_id=e.privilege_id and " +
            		"d.privilege_id=e.privilege_id and d.privilege_id=f.privilege_id " +
            		"and a.entity_id=c.entity_id and a.entity_id=e.entity_id " +
            		"and c.entity_id=e.entity_id and a.role_id = e.role_id and b.role_id = e.role_id " +
            		"and e.role_id =? and e.entity_id=? order by c.entity_name";
            
         
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,roleId);
            prepStmt.setString(2,entId);
            Debug.print(selectStatement);
            rs = prepStmt.executeQuery();
            roleEntityMapList = new ArrayList();
            while(rs.next()){
                String mapEntityId = rs.getString(1);
                String roleIdVal = rs.getString(2);
                String entityId = rs.getString(3);      
               String roleName = rs.getString(4);
               String entityName = rs.getString(5);
               String entityUrl = rs.getString(6);
              String privName= rs.getString(7);
               String priviId = rs.getString(8);
              String accessName = rs.getString(9);
              String accessUrl = rs.getString(10);
            
               String[] entMapList = {mapEntityId, roleIdVal, entityId, roleName, entityName,entityUrl,privName,priviId,accessName,accessUrl};
               roleEntityMapList.add(entMapList);    
      
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
            //Debug.print("RoleManagementDAOImpl.selectAllMappingDetailsForRole():" + roleEntityMapList);
        } 
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.getMappingDetailsForRlEntPriv():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.getMappingDetailsForRlEntPriv():" + e.getMessage());
        }
        return roleEntityMapList;
    }   
    
    
    public ArrayList getMappingDetailsForRlEnt(String roleId){
        Debug.print("GeneralDBAction.getMappingDetailsForRlEnt():");
        ArrayList roleEntityMapList = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        makeConnection();
   	try {
          /*String selectStatement=" SELECT distinct a.map_entity_id , a.role_id ,a.entity_id, b.role_name, c.entity_name, " +
            		"c.entity_access_url, d.privilege_name, e.privilege_id from tblMapEntity a , " +
            		"tblRoleMaster b , tblEntityMaster c, tblPrivilegeMaster d, " +
            		"tblMapRole e where a.entity_id = c.entity_id and a.role_id = b.role_id and " +
            		"d.privilege_id=e.privilege_id and a.entity_id=c.entity_id and " +
            		"a.entity_id=e.entity_id and c.entity_id=e.entity_id and " +
            		"a.role_id = e.role_id and b.role_id = e.role_id " +
            		"and e.role_id =? and e.entity_id=? order by c.entity_name";*/
   		
   	String selectStatement="SELECT distinct a.map_entity_id , a.role_id ,a.entity_id, b.role_name, c.entity_name, " +
        		"c.entity_access_url from tblMapEntity a, tblRoleMaster b , tblEntityMaster " +
        		"c where a.entity_id = c.entity_id and a.role_id = b.role_id and " +
        		"a.entity_id=c.entity_id and a.role_id =? order by c.entity_name";
         
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,roleId);
           
            Debug.print(selectStatement);
            rs = prepStmt.executeQuery();
            roleEntityMapList = new ArrayList();
            while(rs.next()){
                String mapEntityId = rs.getString(1);
                String roleIdVal = rs.getString(2);
                String entityId = rs.getString(3);      
               String roleName = rs.getString(4);
               String entityName = rs.getString(5);
               String entityUrl = rs.getString(6);
            // String privName= rs.getString(7);
          // String priviId = rs.getString(8);
             
               String[] entMapList = {mapEntityId, roleIdVal, entityId, roleName, entityName,entityUrl};
               roleEntityMapList.add(entMapList);    
      
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
          
        } 
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.getMappingDetailsForRlEnt():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.getMappingDetailsForRlEnt():" + e.getMessage());
        }
        return roleEntityMapList;
    }  
    
    
    public ArrayList getMappingDetailsForRlEntPriv(String roleId, String entId){
        Debug.print("GeneralDBAction.getMappingDetailsForRlEntPriv():");
        ArrayList roleEntityMapList = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        makeConnection();
   	try {
          String selectStatement=" SELECT distinct a.map_entity_id , a.role_id ,a.entity_id, b.role_name, c.entity_name, " +
            		"c.entity_access_url, d.privilege_name, e.privilege_id from tblMapEntity a , " +
            		"tblRoleMaster b , tblEntityMaster c, tblPrivilegeMaster d, " +
            		"tblMapRole e where a.entity_id = c.entity_id and a.role_id = b.role_id and " +
            		"d.privilege_id=e.privilege_id and a.entity_id=c.entity_id and " +
            		"a.entity_id=e.entity_id and c.entity_id=e.entity_id and " +
            		"a.role_id = e.role_id and b.role_id = e.role_id " +
            		"and e.role_id =? and e.entity_id=? order by c.entity_name";
   		
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,roleId);
            prepStmt.setString(2,entId);
            Debug.print(selectStatement);
            rs = prepStmt.executeQuery();
            roleEntityMapList = new ArrayList();
            while(rs.next()){
                String mapEntityId = rs.getString(1);
                String roleIdVal = rs.getString(2);
                String entityId = rs.getString(3);      
               String roleName = rs.getString(4);
               String entityName = rs.getString(5);
               String entityUrl = rs.getString(6);
            String privName= rs.getString(7);
          String priviId = rs.getString(8);
             
               String[] entMapList = {mapEntityId, roleIdVal, entityId, roleName, entityName,entityUrl,privName,priviId};
               roleEntityMapList.add(entMapList);    
      
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
          
        } 
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.getMappingDetailsForRlEntPriv():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.getMappingDetailsForRlEntPriv():" + e.getMessage());
        }
        return roleEntityMapList;
    }   
    
    
  
    
    
    public ArrayList getMappingDetailsForPrivPerm(String roleId){
        Debug.print("GeneralDBAction.getMappingDetailsForPrivPerm():");
        ArrayList roleEntityMapList = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        makeConnection();
   	try {
          String selectStatement=" SELECT distinct a.map_entity_id , a.role_id ,a.entity_id, b.role_name, c.entity_name, " +
            		"c.entity_access_url, d.privilege_name, e.privilege_id from tblMapEntity a , " +
            		"tblRoleMaster b , tblEntityMaster c, tblPrivilegeMaster d, " +
            		"tblMapRole e where a.entity_id = c.entity_id and a.role_id = b.role_id and " +
            		"d.privilege_id=e.privilege_id and a.entity_id=c.entity_id and " +
            		"a.entity_id=e.entity_id and c.entity_id=e.entity_id and " +
            		"a.role_id = e.role_id and b.role_id = e.role_id " +
            		"and e.role_id =? order by c.entity_name";   		
   	   /*String selectStatement="SELECT distinct a.map_entity_id , a.role_id ,a.entity_id, b.role_name, c.entity_name, " +
        		"c.entity_access_url from tblMapEntity a, tblRoleMaster b , tblEntityMaster " +
        		"c where a.entity_id = c.entity_id and a.role_id = b.role_id and " +
        		"a.entity_id=c.entity_id and a.role_id =? order by c.entity_name";*/
         
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,roleId);
            Debug.print(selectStatement);
            rs = prepStmt.executeQuery();
            roleEntityMapList = new ArrayList();
            while(rs.next()){
                String mapEntityId = rs.getString(1);
                String roleIdVal = rs.getString(2);
                String entityId = rs.getString(3);      
               String roleName = rs.getString(4);
               String entityName = rs.getString(5);
               String entityUrl = rs.getString(6);
              String privName= rs.getString(7);
             String priviId = rs.getString(8);
             
               String[] entMapList = {mapEntityId, roleIdVal, entityId, roleName, entityName,entityUrl,privName,priviId};
               roleEntityMapList.add(entMapList);    
      
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
            //Debug.print("RoleManagementDAOImpl.selectAllMappingDetailsForRole():" + roleEntityMapList);
        } 
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.getMappingDetailsForPrivPerm():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.getMappingDetailsForPrivPerm():" + e.getMessage());
        }
        return roleEntityMapList;
    }  
  
//====================Edit User Details=====================================================
    private static String userId;
    private String contactTypeId = null;
//    public void editUserDetails(HLCUserMaster objUserMaster, HLCContactDetails objContact) throws RemoteException{
//        System.out.print("Email ID In Kavery Session Bean : "+objUserMaster.getEmailId());
//        boolean bol = false;
//        String commAddrId="";
//        
//        HLCMemberUpdateDAO objDAO = new HLCMemberUpdateDAO();
//        if (objUserMaster == null && (objUserMaster.getEmailId()).equals("") ) {
//            throw new EJBException("Email ID can't be empty");
//        }
//        
//        makeConnection();
//        Debug.print(" USer Id in Kavery Session Bean : "+objUserMaster.getUserId());
//        if (objUserMaster.getUserId() == null) {
//            try {
//                userId = DBHelper.getUserId(con, objUserMaster.getEmailId());
//                Debug.print(" User Id Based on email Id in Kavery Session Bean : "+userId);
//            }catch (Exception e){
//                e.printStackTrace();
//            }
//        }else {
//            this.userId = objUserMaster.getUserId();
//        }
//        
//        if (objContact.getContactType() != null) {
//            try {
//                contactTypeId = DBHelper.getContacttypeId(con,objContact.getContactType());
//                commAddrId = DBHelper.getContacttypeId(con,objUserMaster.getCommunicationAddress());
//                Debug.print("commAddrId for comm name - "+objUserMaster.getCommunicationAddress()+" :" +commAddrId);
//                objUserMaster.setCommunicationAddress(commAddrId);
//                
//                bol = objDAO.isContactTypeExist(contactTypeId,userId);
//                Debug.print(" contact type Exist in Kavery Session Bean: "+bol);
//                Debug.print(" Contact Details Received From JSP: \n"+objContact);
//                
//                if (bol == false){
//                    objContact.setContactTypeId(contactTypeId);
//                    insertRowContactDetails(objUserMaster,objContact,contactTypeId);
//                    Debug.print(" New Record added to the contact Details");
//                    Debug.print(" Contact Details Received From JSP After insertion: \n"+objContact);
//                    releaseConnection();
//                    return;
//                    
//                }
//                
//            }
//           
//            catch (Exception e){
//                releaseConnection();
//                e.printStackTrace();
//            }
//        }
//        
//        releaseConnection();
//        
//       
//        
//        if (memberExists(userId,objUserMaster.getEmailId()) == false) {
//            throw new EJBException("Email ID Not Exists : " + userId);
//        }
//        
//        Debug.print("objUserMaster.getLoginName() :"+objUserMaster.getLoginName());
//        Debug.print("objUserMaster.getEmailId() :"+objUserMaster.getEmailId());
//        
//      
//    }
    public void editUserDetails(HLCUserMaster objUserMaster, HLCContactDetails objContact) throws RemoteException, SQLException, ParseException{
        System.out.print("Email ID In Kavery Session Bean : "+objUserMaster.getEmailId());
        boolean bol = false;
        String commAddrId="";
        objUpdateUser=objUserMaster;
        objUpdateContact=objContact;
        
        HLCMemberUpdateDAO objDAO = new HLCMemberUpdateDAO();
        if (objUserMaster == null && (objUserMaster.getEmailId()).equals("") ) {
            throw new EJBException("Email ID can't be empty");
        }
        
        makeConnection();
        Debug.print(" USer Id in Kavery Session Bean : "+objUserMaster.getUserId());
        if (objUserMaster.getUserId() == null) {
            try {
                userId = DBHelper.getUserId(con, objUserMaster.getEmailId());
                Debug.print(" User Id Based on email Id in Kavery Session Bean : "+userId);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else {
            this.userId = objUserMaster.getUserId();
        }
        
        if (objContact.getContactType() != null) {
            try {
                contactTypeId = DBHelper.getContacttypeId(con,objContact.getContactType());
                commAddrId = DBHelper.getContacttypeId(con,objUserMaster.getCommunicationAddress());
                Debug.print("commAddrId for comm name - "+objUserMaster.getCommunicationAddress()+" :" +commAddrId);
                objUserMaster.setCommunicationAddress(commAddrId);
                
                bol = objDAO.isContactTypeExist(contactTypeId,userId);
                Debug.print(" contact type Exist in Kavery Session Bean: "+bol);
                Debug.print(" Contact Details Received From JSP: \n"+objContact);
                
                if (bol == false){
                    objContact.setContactTypeId(contactTypeId);
                    remote = home.create(objContact);
                    Debug.print(" New Record added to the contact Details");
                    Debug.print(" Contact Details Received From JSP After insertion: \n"+objContact);
                    releaseConnection();
                    return;
                    
                }
                
            }
           
            catch (Exception e){
                releaseConnection();
                e.printStackTrace();
            }
        }
        
        releaseConnection();
        
        
        
        if (memberExists(userId) == false) {
            throw new EJBException("Email ID Not Exists : " + userId);
        }
        
        Debug.print("objUserMaster.getLoginName() :"+objUserMaster.getLoginName());
        Debug.print("objUserMaster.getEmailId() :"+objUserMaster.getEmailId());
        
//        if (objUserMaster.getLoginName() != null){
//        	remoteArB.setLoginName(objUserMaster.getLoginName());
//        }
//        
//        
//        if (objUserMaster.getActiveStatus() != null){
//        	remoteArB.setActiveStatus(objUserMaster.getActiveStatus());
//        }
//        if (objUserMaster.getUserId() != null){
//        	System.out.println("objUserMaster.getUserId()::::::::::::::::::::"+objUserMaster.getUserId());
//        	remoteArB.setUserId(objUserMaster.getUserId());
//        }
//        if (objUserMaster.getPrefix() != null){
//        	remoteArB.setPrefix(objUserMaster.getPrefix());
//        }
//        if (objUserMaster.getFirstName() != null){
//        	remoteArB.setFirstName(objUserMaster.getFirstName());
//        }
//        if (objUserMaster.getMiddleName() != null){
//        	remoteArB.setMiddleName(objUserMaster.getMiddleName());
//        }
//        if (objUserMaster.getLastName() != null){
//        	remoteArB.setLastName(objUserMaster.getLastName());
//        }
//        if (objUserMaster.getSufix() != null){
//        	remoteArB.setSufix(objUserMaster.getSufix());
//        }
//        if (objUserMaster.getDob() != null){
//        	remoteArB.setDob(objUserMaster.getDob());
//        }
//        if (objUserMaster.getGender() != null){
//        	remoteArB.setGender(objUserMaster.getGender());
//        }
//        if (objUserMaster.getEmailId() != null){
//        	remoteArB.setEmailId(objUserMaster.getEmailId());
//        }
//        if (objUserMaster.getUserCode() != null){
//        	remoteArB.setUserCode(objUserMaster.getUserCode());
//        }
//        
//        if (objUserMaster.getCommunicationAddress() != null){
//        	remoteArB.setPrefAddress(commAddrId);
//        }
//        
//        remoteArB.setNonUseaEmailStatus(objUserMaster.isNonUseaEmailStatus());
//        remoteArB.setNonUseaMailingStatus(objUserMaster.isNonUseaMailingStatus());
//        
//        
//          /*  if (objUserMaster.getPassword() != null){
//                remote.setPassword(objUserMaster.getPassword());
//                System.out.println("Email : ID "+objUserMaster.getEmailId());
//            }
//           **/
//        if (objUserMaster.getSecretQuestion() != null){
//        	remoteArB.setSecretQuestion(objUserMaster.getSecretQuestion());
//        }
//        if (objUserMaster.getSecretAnswer() != null){
//        	remoteArB.setSecretAnswer(objUserMaster.getSecretAnswer());
//        }
//        
//        if (objContact.getContactType() != null){
//            remote.setContactType(objContact.getContactType());
//            remote.setContactTypeId(contactTypeId);
//        }
//        
//        if (objContact.getSuite() != null){
//            remote.setSuite(objContact.getSuite());
//        }
//        if (objContact.getAddress1() != null){
//            remote.setAddress1(objContact.getAddress1());
//        }
//        if (objContact.getAddress2() != null){
//            remote.setAddress2(objContact.getAddress2());
//        }
//        if (objContact.getAddress2() != null){
//            remote.setCity(objContact.getCity());
//        }
//        if (objContact.getState() != null){
//            remote.setState(objContact.getState());
//        }
//        if (objContact.getCountry() != null){
//            remote.setCountry(objContact.getCountry());
//        }
//        if (objContact.getCountry() != null){
//            remote.setZip(objContact.getZip());
//        }
//        if (objContact.getPhoneNo() != null){
//            remote.setPhoneNo(objContact.getPhoneNo());
//        }
//        if (objContact.getMobileNo() != null){
//            remote.setMobileNo(objContact.getMobileNo());
//        }
//        if (objContact.getMobileNo() != null){
//            remote.setFaxNo(objContact.getFaxNo());
//        }
        this.storeUserDetails();
        this.storeContactDetails();
        
    }
    private void storeUserDetails() throws SQLException, ParseException {
    	
        Debug.print("ArabianSeaEntityBean storeUserDetails");
        java.sql.Date jsqlD =  new java.sql.Date( new Date().getTime() );
       // horseId = (String) context.getPrimhorseIdaryKey();
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
      try {
        makeConnection();
        String updateStatement =
                "update tblUserMaster set prefix = ? , first_name = ? , middle_name = ? , last_name = ? , " +
                "sufix = ? , dob = ? ,gender = ? , secret_question = ? , " +
                "secret_answer = ?, email_id = ? , login_name = ?, user_code=?  where user_id = ?";
            
        PreparedStatement prepStmt = con.prepareStatement(updateStatement);
        System.out.println("objUpdateUser.getPrefix():::::::::::::::::::::::::::::"+objUpdateUser.getPrefix());
        String dateOfBirth = objUpdateUser.getDob();
        
        System.out.println("dateOfBirth:::::::::::::::::::::::::::"+dateOfBirth);
        Date dateBirth = formatter.parse(objUpdateUser.getDob());
        System.out.println("dateBirth:::::::::::::::::::::::::::"+dateBirth);
        prepStmt.setString(1, objUpdateUser.getPrefix());
        prepStmt.setString(2, objUpdateUser.getFirstName());
        prepStmt.setString(3, objUpdateUser.getMiddleName());
        prepStmt.setString(4, objUpdateUser.getLastName());
        prepStmt.setString(5, objUpdateUser.getSufix());
        prepStmt.setString(6, dateOfBirth);
        prepStmt.setString(7, objUpdateUser.getGender());
//        prepStmt.setString(8, objUpdateUser.getPassword());
        prepStmt.setString(8, objUpdateUser.getSecretQuestion());
        prepStmt.setString(9, objUpdateUser.getSecretAnswer());
        prepStmt.setString(10, objUpdateUser.getEmailId());
        prepStmt.setString(11, objUpdateUser.getLoginName());
//        prepStmt.setBoolean(13, nonUseaMailingStatus);
//        prepStmt.setBoolean(14, nonUseaEmailStatus);
//        prepStmt.setString(12, objUpdateUser.getContactTypeId());
        prepStmt.setString(12, objUpdateUser.getUserCode());
        prepStmt.setString(13, userId);
        
        int rowCount = prepStmt.executeUpdate();
        Debug.print("Sucessfully Updated UserDetails Master." + rowCount);
        Debug.print(" User Details ....\n"+objUpdateUser);
        prepStmt.close();
        //releaseConnection();
      }catch (SQLException e){
          e.printStackTrace();
      }finally {
          releaseConnection();
      }
      
    }
    private void storeContactDetails()  throws SQLException {
        Debug.print("ArabianSeaEntityBean storeContactDetails");
        java.sql.Date jsqlD =  new java.sql.Date( new Date().getTime() );
       // horseId = (String) context.getPrimhorseIdaryKey();
        String contactTypeId = getContactTypeIdByUserId(objUpdateContact.getUserId());
       try {
        makeConnection();
        String updateStatement =
                "update tblContactDetails set suite = ? , address1 = ? , address2 = ? , city = ? , " +
                "state = ? , country = ? ,zip = ? , phone_no = ? , mobile_no = ? , fax_no = ?  where user_id = ? AND contact_type_id = ?";
            
        PreparedStatement prepStmt = con.prepareStatement(updateStatement);
        prepStmt.setString(1, objUpdateContact.getSuite());
        prepStmt.setString(2, objUpdateContact.getAddress1());
        prepStmt.setString(3, objUpdateContact.getAddress2());
        prepStmt.setString(4, objUpdateContact.getCity());
        prepStmt.setString(5, objUpdateContact.getState());
        prepStmt.setString(6, objUpdateContact.getCountry());
        prepStmt.setString(7, objUpdateContact.getZip());
        prepStmt.setString(8, objUpdateContact.getPhoneNo());
        prepStmt.setString(9, objUpdateContact.getMobileNo());
        prepStmt.setString(10, objUpdateContact.getFaxNo());
        prepStmt.setString(11, userId);
        prepStmt.setString(12, contactTypeId);
        Debug.print("Data In Contact Details : \n"+objUpdateContact);
        int rowCount = prepStmt.executeUpdate();
        Debug.print("Contact Details Sucessfully Updated." + rowCount);
        prepStmt.close();
       }catch (Exception e){
            releaseConnection();
            Debug.print(" Error While Updating contact Details : "+e.getMessage());
       }finally {
            releaseConnection();
       }
    }  
    private String getContactTypeIdByUserId(String userId) throws SQLException{
    	String retContactTypeId = null;
    	  makeConnection();
          String selectStatement = "SELECT contact_type_id from tblContactDetails WHERE user_id = ?";
          PreparedStatement prepStmt = con.prepareStatement(selectStatement);
          prepStmt.setString(1, userId);
       
          System.out.println("selectByPrimaryKey : Working ");
          
          ResultSet rs = prepStmt.executeQuery();
          rs.next();
          retContactTypeId = rs.getString(1);
          rs.close();
          prepStmt.close();
          releaseConnection();
    	return retContactTypeId;
    	
    }
    
    private boolean memberExists(String userId) {
        Debug.print("Kavery Session Bean memberExists");
        
        // if ( !(userId.equals(this.userId)) ) {
        try {
            String userIdInRemote = ejbFindByPrimaryKey(userId);
            System.out.println("userIdInRemote::::::::::::"+userIdInRemote);
           // HLCUserMaster.setUserId(userIdInRemote);
            this.mailId = mailId;
        } catch (Exception ex) {
            return false;
        }
        // }
        return true;
    }
    
    public String ejbFindByPrimaryKey(String userTypeId) throws FinderException {
        Debug.print("ArabianSeaEntityBean ejbFindByPrimaryKey");

        boolean result;
        try {
            result = selectByPrimaryKey(userId);
        } catch (Exception ex) {
            throw new EJBException("ejbFindByPrimaryKey: " + ex.getMessage());
        }
        if (result) {
             Debug.print("ArabianSeaEntityBean ejbFindByPrimaryKey ID:" + userId);
            return userTypeId;
        } else {
            throw new ObjectNotFoundException("Row for id " + userId + " not found.");
        }
    }
    
   
    /**====================Insert for Contact Details==============================*/
    private void insertRowContactDetails(HLCUserMaster objUserMaster, HLCContactDetails objContact, String contactTypeId) throws SQLException {
        Debug.print("ArabianSeaEntityBean insertRowContactDetails");

        makeConnection();
        
        if (objUserMaster.getLoginName()!= null){
            try {
                userId = DBHelper.getUserId(con, objUserMaster.getLoginName());
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        System.out.print("User Id is from insertRowContactDetails: "+userId);
        String insertStatement = "insert into tblContactDetails (contact_type_id,user_id,suite,address1,"+
            "address2,city,state,country,zip,phone_no, mobile_no, fax_no)" +
                " values ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ?, ?) ";
        prepStmt = con.prepareStatement(insertStatement);
        System.out.println("Inside the Contact Details ....\n\n ");
        prepStmt.setString(1, contactTypeId);
        System.out.print("contactTypeId: "+contactTypeId);
        prepStmt.setString(2, userId);
        System.out.print("userId: "+userId);
        prepStmt.setString(3, objContact.getSuite());
        System.out.print("suite: "+objContact.getSuite());
        prepStmt.setString(4, objContact.getAddress1());
        prepStmt.setString(5, objContact.getAddress2());
        prepStmt.setString(6, objContact.getCity());
        prepStmt.setString(7, objContact.getState());
        prepStmt.setString(8, objContact.getCountry());
        prepStmt.setString(9, objContact.getZip());
        prepStmt.setString(10, objContact.getPhoneNo());
        System.out.print("phoneNo: "+objContact.getPhoneNo());
        prepStmt.setString(11, objContact.getMobileNo());
        System.out.print("mobileNo: "+objContact.getMobileNo());
        prepStmt.setString(12, objContact.getFaxNo());
        System.out.print("faxNo: "+objContact.getFaxNo());
        int cnt = prepStmt.executeUpdate();
        System.out.print("Record Inserted succefully  "+cnt);
        Debug.print(" Insert Contact Detail Data : \n"+objContact);
        prepStmt.close();
        releaseConnection();
    }
    
    
    String mailId;
    private boolean memberExists(String userId, String emailId) {
        Debug.print("Kavery Session Bean memberExists");
        
        // if ( !(userId.equals(this.userId)) ) {
        try {
            boolean res = (boolean)selectByPrimaryKey(userId);
            mailId = emailId;
        } catch (Exception ex) {
            return false;
        }
        // }
        return true;
    } 
    
    private boolean selectByPrimaryKey(String userId) throws SQLException {
        Debug.print("ArabianSeaEntityBean selectByPrimaryKey");

        makeConnection();
        String selectStatement = "SELECT user_id from tblUserMaster WHERE user_id = ?";
        PreparedStatement prepStmt = con.prepareStatement(selectStatement);
        prepStmt.setString(1, userId);
        ResultSet rs = prepStmt.executeQuery();
        System.out.println("selectByPrimaryKey : Working ");
        boolean result = rs.next();
        prepStmt.close();
        releaseConnection();
        return true;
    }  
    
    
    
    public boolean changePasword(String userId,String pass) throws Exception {
        Debug.print("GeneralDBAction changePasword");
        int cnt = 0;
        String encryptPassword=null;
        BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
        textEncryptor.setPassword("sa");
        try {
            makeConnection();
            
            if (  (pass != null && pass.trim().length() > 0) &&
                    ( userId != null && userId.trim().length() > 0 )) {
            	
            	
            	encryptPassword=textEncryptor.encrypt(pass);	
            	
                String str = "update  tblUserMaster set password = ?  WHERE user_id = ?";
                PreparedStatement prepStmt = con.prepareStatement(str);
                prepStmt.setString(1, encryptPassword);
                prepStmt.setString(2, userId);
             
                cnt = prepStmt.executeUpdate();
              
                Debug.print("Successfully Password Changed......"+cnt);
                prepStmt.close();
            }
        }catch (Exception e){
           
            releaseConnection();
            Debug.print("Error while change password  : "+e.getMessage());
        }finally {
            releaseConnection();
        }
        if (cnt >0)
            return true;
        else
            return false;
    }
    
    
    public String addUserRegistration(HLCUserMaster objUserMaster) throws RemoteException{
       
        String contactTypeId = null;
        String usrId = null;
        System.out.println("objUserMaster.getCommunicationAddress() inside the addUserRegistration"+objUserMaster.getCommunicationAddress());
        try{
             contactTypeId = (String)getDetFrmContyId(objUserMaster.getCommunicationAddress());
            
            objUserMaster.setContactTypeId(contactTypeId);
            Debug.print("Contant Of objUserMaster : "+objUserMaster);
            
            Debug.print("user Registration getNextUserId");
            makeConnection();
            
            try{
                String selectStatement = "select newid() as userId";
                Debug.print("GeneralDBAction getNextUserId:" + selectStatement);
                PreparedStatement prepSelect = con.prepareStatement(selectStatement);
                ResultSet rs = prepSelect.executeQuery();
                rs.next();
                usrId = rs.getString(1);
                rs.close();
                prepSelect.close();
                releaseConnection();
            } catch(SQLException sql){
                releaseConnection();
                Debug.print("SQL Exception in getNextUserId:" + sql.getMessage());
            }
            Debug.print("getNextUserId :" + usrId);
            
            objUserMaster.setUserId(usrId);
            insertRowUserMaster(objUserMaster);
        } catch(Exception exp){
        	exp.printStackTrace();
        }
        
        return usrId;
    }
    
    
    
   
    
    
    private void insertRowUserMaster(HLCUserMaster objUserMaster) throws SQLException {
        Debug.print("ArabianSeaEntityBean insertRowUserMaster");
        java.sql.Date dt = null;
       String userTypeId="";
     if(objUserMaster.getDob()!=null)
        {
            dt = java.sql.Date.valueOf(objUserMaster.getDob());
        }
        Debug.print("After converting DOB");
       
        
         makeConnection();
        Debug.print("USer code : "+objUserMaster.getUserCode());
        String str = "SELECT user_type_id FROM tblUserTypeMaster where user_type_name = ?";
        prepStmt = con.prepareStatement(str);
        prepStmt.setString(1, "Human".trim());
        rs = prepStmt.executeQuery();
        if (rs.next()) {
            userTypeId = rs.getString(1);
        } 
        
        rs.close();
        
        if (objUserMaster.getUserTypeName()!= null){
            str = "SELECT user_type_id FROM tblUserTypeMaster where user_type_name = ?";
            prepStmt = con.prepareStatement(str);
            prepStmt.setString(1, objUserMaster.getUserTypeName());
            rs = prepStmt.executeQuery();
            if (rs.next()) {
            	userTypeId = rs.getString(1);
            } 
            rs.close();
        }
        
        
        if (objUserMaster.getUserTypeName().startsWith("USEA Staff")){
            String password = HLCPassword.getPassword();
        }
        
        //=============================Checking for apostopies in the string and removing==========================
        
        String secQes=objUserMaster.getSecretQuestion();
        String s1 = secQes;
        String s2 = "'";
        String s3 = "";
        String str1 = null;
        Debug.print(" Replace String : "+s1);
        if (s1 != null && s1.trim().length() > 0) {
            str1 = DBHelper.replace(s1,s2,s3);
            Debug.print(" Replace String : "+str1);
            int index = s1.indexOf("'");    
            if (index >= 0){
            	secQes = str1;
            }
        }
        Debug.print(" Final String : "+secQes);  
        
        
        
        String insertStatement = "insert into tblusermaster (contact_type_id,user_type_id,prefix,first_name,middle_name,"+
                "last_name,sufix,dob,gender,email_id, password, secret_question, secret_answer,user_code,login_name,non_usea_mailing_status,non_usea_email_status,user_id)" +
                    " values ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ?, ?,?,?,?,?,?) ";

        prepStmt = con.prepareStatement(insertStatement);
        System.out.println("Inside the User Master ....\n\n ");
       // prepStmt.setString(1, membershipTypeId);
       //System.out.println("membershipTypeId : "+membershipTypeId);
        
        prepStmt.setString(1, objUserMaster.getContactTypeId());
        System.out.println("contactTypeId :  "+contactTypeId);
        prepStmt.setString(2, userTypeId);
        System.out.println("userTypeId :  "+userTypeId);
        prepStmt.setString(3, objUserMaster.getPrefix());
         System.out.println("prefix :  "+objUserMaster.getPrefix());
        prepStmt.setString(4, objUserMaster.getFirstName());
         System.out.println("firstName :  "+objUserMaster.getFirstName());
        prepStmt.setString(5, objUserMaster.getMiddleName());
        prepStmt.setString(6, objUserMaster.getLastName());
        prepStmt.setString(7, objUserMaster.getSufix());
       prepStmt.setDate(8, dt);
	   
         System.out.println("Date :  "+dt);
        prepStmt.setString(9, objUserMaster.getGender());
        prepStmt.setString(10, objUserMaster.getEmailId());
        System.out.println("emailId :  "+objUserMaster.getEmailId());
        prepStmt.setString(11, objUserMaster.getPassword());
        prepStmt.setString(12, secQes);
        System.out.println("secretQuestion :  "+secQes);
        prepStmt.setString(13, objUserMaster.getSecretAnswer());
        System.out.println("secretAnswer :  "+objUserMaster.getSecretAnswer());
        prepStmt.setString(14, objUserMaster.getUserCode());
        System.out.println("userCode :  "+objUserMaster.getUserCode());
        prepStmt.setString(15, objUserMaster.getLoginName());
        System.out.println("loginName :  "+objUserMaster.getLoginName());
        prepStmt.setBoolean(16, objUserMaster.nonUseaMailingStatus);
        System.out.println("nonUseaMailingStatus :  "+objUserMaster.nonUseaMailingStatus);
        prepStmt.setBoolean(17, objUserMaster.nonUseaEmailStatus);
        System.out.println("nonUseaEmailStatus :  "+objUserMaster.nonUseaEmailStatus);
        prepStmt.setString(18, objUserMaster.getUserId());
        System.out.println("userId :  "+userId);
        
        int cnt = prepStmt.executeUpdate();
      
        prepStmt.close();
        releaseConnection();
        System.out.println("Succefully inserted :  "+cnt);
       
        }

    
    public void addContactDetails(HLCContactDetails objContact, String logName) throws RemoteException {
       
        String contactTypeId = null;;
       
        try{
        	contactTypeId = (String)getDetFrmContyId(objContact.getContactType());
           
            objContact.setContactTypeId(contactTypeId);
            objContact.setUserId(objContact.getUserId());
            insertRowContactDetails(objContact,logName);
        } catch(Exception exp){
            throw new EJBException("addContactDetails: " + exp.getMessage());
        }
    }
    
    private void insertRowContactDetails(HLCContactDetails objContact, String logName) throws SQLException {
        Debug.print("GeneralDBAction insertRowContactDetails");

        makeConnection();
        if (logName != null){
            try {
                userId = DBHelper.getUserId(con, logName);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        System.out.print("User Id is from insertRowContactDetails: "+userId);
        String insertStatement = "insert into tblContactDetails (contact_type_id,user_id,suite,address1,"+
            "address2,city,state,country,zip,phone_no, mobile_no, fax_no)" +
                " values ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ?, ?) ";
        prepStmt = con.prepareStatement(insertStatement);
        System.out.println("Inside the Contact Details ....\n\n ");
        prepStmt.setString(1, objContact.getContactTypeId());
        System.out.print("contactTypeId: "+objContact.getContactTypeId());
        prepStmt.setString(2, objContact.getUserId());
        System.out.print("userId: "+objContact.getUserId());
        prepStmt.setString(3, objContact.getSuite());
        System.out.print("suite: "+objContact.getSuite());
        prepStmt.setString(4, objContact.getAddress1());
        prepStmt.setString(5, objContact.getAddress2());
        prepStmt.setString(6, objContact.getCity());
        prepStmt.setString(7, objContact.getState());
        prepStmt.setString(8, objContact.getCountry());
        prepStmt.setString(9, objContact.getZip());
        prepStmt.setString(10, objContact.getPhoneNo());
        System.out.print("phoneNo: "+objContact.getPhoneNo());
        prepStmt.setString(11, objContact.getMobileNo());
        System.out.print("mobileNo: "+objContact.getMobileNo());
        prepStmt.setString(12, objContact.getFaxNo());
        System.out.print("faxNo: "+objContact.getFaxNo());
        int cnt = prepStmt.executeUpdate();
        System.out.print("Record Inserted succefully  "+cnt);
        Debug.print(" Insert Contact Detail Data : \n"+objContact);
        prepStmt.close();
        releaseConnection();
    }

    
 public String getDetFrmContyId(String contactType){
        
        ArrayList array = new ArrayList();
        String contYId=null;
        try {
            makeConnection();
            String selectStatement = "SELECT contact_type_id FROM tblContactTypeMaster WHERE contact_type_name = ?";
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1, contactType.trim());
            rs = prepStmt.executeQuery();
            if (rs.next()) {
                contYId=rs.getString(1);
            } 
             prepStmt.close();
             releaseConnection();
        } catch (SQLException sqe) {
            throw new EJBException(sqe);
            //sqe.printStackTrace();
        } finally {releaseConnection(); }
        
        return contYId;
    }
 
 
 
 public ArrayList getAllRoles() throws RemoteException { 
     Debug.print("GeneralDBAction getAllRole");
     ArrayList results =(ArrayList)selectAllRole();
     return results;
  }
 
 public ArrayList selectAllRole(){
     Debug.print("GeneralDBAction.selectAllRole():");
     ArrayList rolesList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {

             String selectStatement=" select case when role_id in(select role_id from tblMapEntity union all select role_id from tblMapUserPrivilege "+
                                    " union all select role_id from tblMapRole) then '0' else '1' end flag, "+
                                    " role_id, role_name,role_desc,active_status,role_path from tblRoleMaster order by role_name";

         prepStmt = con.prepareStatement(selectStatement);
         rs = prepStmt.executeQuery();
         rolesList = new ArrayList();
         while(rs.next()){
             String roleId = rs.getString(2);
             String roleName = rs.getString(3);

             String roledesc = rs.getString("role_desc");
             String status = rs.getString("active_status");
             String flag = rs.getString("flag");
             String rolePath = rs.getString(6);

             String[] rlList = {roleId, roleName,roledesc,status,flag,rolePath};
             rolesList.add(rlList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
       
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectAllRole():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectAllRole():" + e.getMessage());
     }
     return rolesList;
 }    
 
 public ArrayList getAllViews() throws RemoteException { 
     System.out.println("GeneralDBAction getAllViews()");
     ArrayList results = (ArrayList)selectAllViews();
     return results;
  }
 
 public ArrayList selectAllViews(){
 	  System.out.println("GeneralDBAction: selectAllViews()");
       ArrayList viewList = new ArrayList();
       PreparedStatement prepStmt = null;
       ResultSet rs = null;
       makeConnection();
  	try {

 String selectStatement = " SELECT view_point_id, view_point_name from tblviewpointmaster order by view_point_name";
            
 
 prepStmt = con.prepareStatement(selectStatement);

 rs = prepStmt.executeQuery();
          
           while(rs.next()){
               String viewId = rs.getString(1);
               String viewName = rs.getString(2);
               String[] viList = {viewId, viewName};
               viewList.add(viList);
           }
           rs.close();
           prepStmt.close();
           releaseConnection();
          
       } 
       catch(SQLException sql){
           releaseConnection();
           System.out.println("SQL Exception in GeneralDBAction.selectAllViews():" + sql.getMessage());
       }
       catch(Exception e){
           releaseConnection();
           e.printStackTrace();
       }
       return viewList;
   }
 
 
 //==============================Mapping  User  with Role ==========================================================
 public boolean createMappingUserWithRoles(String userId, ArrayList roleList) throws RemoteException{
     Debug.print("GeneralDBAction createMappingUserWithRoles UserId:" + userId);
     boolean result = false;
     boolean flag = false;
     if(userId!=null && userId.trim().length()!=0){
         flag =(boolean)deleteRow("user_id", userId,  "tblMapUserPrivilege","");
     }
     Debug.print("GeneralDBAction createMappingUserWithRoles():: deleteRow Deleted Enities Result:" + flag);
     if(flag){
         Iterator itRoleIds = roleList.iterator();
         while(itRoleIds.hasNext()){
             String roleId = (String)itRoleIds.next();
             if(roleId!=null){
                result =(boolean)insertUserWithRoleMapping(userId, roleId);
             }
         }
     }
     return result;
 }
 
 
//=============================================Delete Mapping Records with fieldValue details========================================= 
 public boolean deleteRow(String fieldName, String fieldValue, String tableName,String deptId) {
    Debug.print("GeneralDBAction.deleteRow()" +deptId);
    boolean result = false;
    makeConnection();
    try{
    	
    	
    	  String deleteStatement = "delete from " + tableName + "  where " + fieldName  + " = ? ";
          Debug.print("GeneralDBAction.deleteRow():" + "\n" + deleteStatement + ":" +  fieldValue);
          PreparedStatement prepStmt = con.prepareStatement(deleteStatement);
          prepStmt.setString(1, fieldValue);
          prepStmt.executeUpdate();
          prepStmt.close();
          releaseConnection();
          result = true;
    }
    catch(SQLException sql){
       releaseConnection();
       Debug.print("SQL Exception in GeneralDBAction deleteRow:" + sql.getMessage());
    }
    catch(Exception e){
        releaseConnection();
        Debug.print("General Exception  in  GeneralDBAction deleteRow:" + e.getMessage());
    }        
    return result;
}
 
 
//=============================================  User Map with Roles details=========================================      
 public boolean insertUserWithRoleMapping(String userId, String roleId) {
   Debug.print("GeneralDBAction.insertUserWithRoleMapping():");
   PreparedStatement prepStmt = null;
   boolean result = false;
   makeConnection();
   try {
       String insertStatement = "insert into tblMapUserPrivilege (user_id , role_id) " +
               " values( ? , ? )";
       prepStmt = con.prepareStatement(insertStatement);
       prepStmt.setString(1, userId);
       prepStmt.setString(2, roleId);
       prepStmt.executeUpdate();
       prepStmt.close();
       releaseConnection();
       result = true;
   } 
   catch(SQLException sql){
       releaseConnection();
       Debug.print("SQL Exception in GeneralDBAction.insertUserWithRoleMapping():" + sql.getMessage());
   }
   catch(Exception e){
       releaseConnection();
       Debug.print("General Exception  in GeneralDBAction.insertUserWithRoleMapping():" + e.getMessage());
   }
   return result;
} 
 
 
 public ArrayList getMappingDetailsForEnitityAndPrivileges(String  entityId)  throws RemoteException {
     Debug.print("GeneralDBAction getMappingDetailsForEnitityAndPrivileges");
     ArrayList results =(ArrayList)selectAllMappingDetailsForEntity(entityId); 
     return results;
 }
 
 
//=============================================Getting Mapping permission with privilege details=========================================      
 public ArrayList selectAllMappingDetailsForEntity(String entityId){
     Debug.print("GeneralDBAction.selectAllMappingDetailsForEntity():");
     ArrayList entityMapList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
         String selectStatement=" SELECT a.map_privilege_id , a.entity_id ,a.privilege_id, b.entity_name, c.privilege_name from tblMapPrivilege " +
         		"a , tblEntityMaster b , tblPrivilegeMaster c " +
                 " where a.privilege_id = c.privilege_id and a.entity_id = b.entity_id and a.entity_id =? order by b.entity_name";
         
         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,entityId);
         Debug.print(selectStatement);
         rs = prepStmt.executeQuery();
         entityMapList = new ArrayList();
         while(rs.next()){
             String mapPrivilegeId = rs.getString(1);
             String entityIdVal = rs.getString(2);
             String privilegeId = rs.getString(3);
             String entityName = rs.getString(4);
             String privilegeName = rs.getString(5);
             
             String[] entMapList = {mapPrivilegeId, entityIdVal, privilegeId, entityName, privilegeName};
             entityMapList.add(entMapList);
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
         //Debug.print("RoleManagementDAOImpl.selectAllMappingDetailsForEntity():" + entityMapList);
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectAllMappingDetailsForEntity():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectAllMappingDetailsForEntity():" + e.getMessage());
     }
     return entityMapList;
 }
 
 public ArrayList getPermissionBasedOnEntityRole(String  roleId, String entityId)  throws RemoteException{
     Debug.print("GeneralDBAction getPermissionBasedOnEntityRole");
     ArrayList results =(ArrayList)selectPermissionBasedRoleEntity(roleId, entityId);
     return results;
 } 
 
 //============================================= Get Permissions based on Role, Entity  =========================================      
 public ArrayList selectPermissionBasedRoleEntity(String roleId, String entityId){
     Debug.print("GeneralDBAction.selectPermissionBasedRoleEntity():");
     ArrayList roleEntityMapList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
         String selectStatement="SELECT A.role_name, B.entity_name, C.privilege_name, D.permission_name, E.privilege_id, E.permission_id  from " +
         		"tblRoleMaster A, tblEntityMaster B, tblPrivilegeMaster C, tblPermissionMaster D, tblMapRole E " +
                 " WHERE E.role_id = A.role_id and E.entity_id = B.entity_id and  " +
                 " E.privilege_id = C.privilege_id and E.permission_id = D.permission_id and " +
                 " E.role_id = ? and E.entity_id = ? order by C.privilege_name" ;

         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,roleId);
         prepStmt.setString(2,entityId);
         
         Debug.print(selectStatement);
         rs = prepStmt.executeQuery();
         roleEntityMapList = new ArrayList();
         while(rs.next()){
             String roleName = rs.getString(1);
             String entityName = rs.getString(2);
             String privilegeName = rs.getString(3);
             String permissionName = rs.getString(4);
             String privilegeIdVal = rs.getString(5);
             String permissionId = rs.getString(6);
             String[] entMapList = {roleName, entityName, privilegeName, permissionName, privilegeIdVal, permissionId};
             roleEntityMapList.add(entMapList);
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
         //Debug.print("RoleManagementDAOImpl.selectPermissionBasedRoleEntity():" + roleEntityMapList);
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectPermissionBasedRoleEntity():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectPermissionBasedRoleEntity():" + e.getMessage());
     }
     return roleEntityMapList;
 }

 public ArrayList getMappingDetailsForRoleSubPerm()  throws RemoteException{
     Debug.print("GeneralDBAction getPermissionBasedOnEntityRole");
     ArrayList results =(ArrayList)selectAllSubPermission();
     return results;
 }
 
 public ArrayList selectAllSubPermission() {
     Debug.print("GeneralDBAction.getAllPermission():");
     ArrayList permissionList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
         
         String selectStatement="SELECT permission_id,sub_permission_name,active_status from tblSubMenuList";
        
         Debug.print(" selectStatement "+selectStatement);
       
         prepStmt = con.prepareStatement(selectStatement);
         rs = prepStmt.executeQuery();
         permissionList = new ArrayList();
         while(rs.next()){

             String permissionId = rs.getString(1);
             String subPermissionId = rs.getString(2);
             String status = rs.getString(3);
               
             String[] perList = {permissionId, subPermissionId,status};
             permissionList.add(perList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
      
     }
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.getAllPermission():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.getAllPermission():" + e.getMessage());
     }
     return permissionList;
 }

 public ArrayList getAllPermission() throws RemoteException {
     Debug.print("GeneralDBAction getAllPermission");
     ArrayList results =(ArrayList)selectAllPermission();
     return results;
  }
 
 
//=============================================Getting All Permission details=========================================      
 public ArrayList selectAllPermission() {
     Debug.print("GeneralDBAction.getAllPermission():");
     ArrayList permissionList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     
     makeConnection();
	try {
       
         String selectStatement=" SELECT permission_id, permission_name from tblPermissionMaster order by permission_name" ;
     
         Debug.print(" selectStatement "+selectStatement);
      
         prepStmt = con.prepareStatement(selectStatement);
         rs = prepStmt.executeQuery();
         permissionList = new ArrayList();
         while(rs.next()){
             
             String privilegeId = rs.getString(1);
             String permissionId = rs.getString(2);
            
             String[] perList = {privilegeId,permissionId};
             permissionList.add(perList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
        
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.getAllPermission():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.getAllPermission():" + e.getMessage());
     }
     return permissionList;
 }
 
 
 public ArrayList getAllMapPrivilege(String roleId, String entityId) throws RemoteException {
     Debug.print("GeneralDBAction getAllMapPrivilege");
     ArrayList results =(ArrayList)selectAllMapPrivilege(roleId, entityId);
     return results;
  }

 
 //=============================================Getting All Privilege details=========================================
 public ArrayList selectAllMapPrivilege(String roleId, String entityId){
     Debug.print("GeneralDBAction.getAllPrivilege():");
     ArrayList privilegeList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
        
     String selectStatement="select 'Map' chk, privilege_id , privilege_name from tblPrivilegeMaster where privilege_id in( select privilege_id from tblMapRole where role_id=? and entity_id=? ) "
             +" union "
             +" select 'All' chk, privilege_id , privilege_name from tblPrivilegeMaster where privilege_id not in( select privilege_id from tblMapRole where role_id=? and entity_id=? ) "
             +" and privilege_id in(select a.privilege_id from tblMapPermission a where a.access_name != '') order by privilege_name";


         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1, roleId);
         prepStmt.setString(2, entityId);
         prepStmt.setString(3, roleId);
         prepStmt.setString(4, entityId);

         rs = prepStmt.executeQuery();

         privilegeList = new ArrayList();
         while(rs.next()){
             String chk = rs.getString(1);
              String privilegeId = rs.getString(2);
             String privilegeName = rs.getString(3);

             String[] priList = {chk, privilegeId, privilegeName};
             privilegeList.add(priList);
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
         //Debug.print("RoleManagementDAOImpl.getAllPrivilege():" + privilegeList);
     }
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectAllMapPrivilege():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectAllMapPrivilege():" + e.getMessage());
     }
     return privilegeList;
 }
 
 
 public ArrayList getAllMapPermission(String roleId, String entityId) throws RemoteException {
     Debug.print("GeneralDBAction getAllMapPrivilege");
     ArrayList results =(ArrayList)selectAllMapPermission(roleId, entityId);
     return results;
  }
 public ArrayList selectAllMapPermission(String roleId, String entityId){
     Debug.print("GeneralDBAction.getAllPermission():");
     ArrayList permissionList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
       
       

         String selectStatement="select distinct 'Map' chk, a.privilege_id, a.permission_id , a.access_name from tblMapPermission a, tblMapRole b where a.privilege_id = b.privilege_id and a.permission_id = b.permission_id and b.role_id =? and b.entity_id =? and a.access_name ! = '' "
                 +"union"
                 +" select distinct 'All' chk, b.privilege_id, a.permission_id , b.access_name from tblPermissionMaster a, tblMapPermission b where a.permission_id = b.permission_id and b.access_name !='' "
                 +" and a.permission_id not in(select permission_id from tblMapRole where privilege_id = b.privilege_id and role_id =? and entity_id =?) order by a.access_name " ;


         Debug.print(" selectStatement "+selectStatement);
        
         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1, roleId);
         prepStmt.setString(2, entityId);
         prepStmt.setString(3, roleId);
         prepStmt.setString(4, entityId);
        
         rs = prepStmt.executeQuery();
         permissionList = new ArrayList();
         while(rs.next()){

             String chk = rs.getString(1);
             String privilegeId = rs.getString(2);
             String permissionId = rs.getString(3);
               String accessName = rs.getString(4);
             String[] perList = {chk, privilegeId,permissionId, accessName};
             permissionList.add(perList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
       
     }
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.getAllPermission():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.getAllPermission():" + e.getMessage());
     }
     return permissionList;
 }
 
 
 //==============================Mapping  Role  with Entities and Privilege==========================================================
 
 public boolean generateMappingRoleWithEntitiesAndPrivileges(String roleId, String entityId, ArrayList priPerList) throws RemoteException {
     Debug.print("GeneralDBAction generateMappingRoleWithEntitiesAndPrivileges() : " + roleId + ": Entity :" + entityId);
     boolean result =false;
     boolean flag = false;
     if(roleId!=null && roleId.trim().length()!=0 && entityId!=null && entityId.trim().length()!=0){
         flag =(boolean)deleteRow("role_id", roleId, "entity_id" , entityId , "tblMapRole");
     }
     
     Debug.print("GeneralDBAction generateMappingRoleWithEntities(): Deleted Enities Result:" + flag);
     if(flag){
         Iterator itPriPerList = priPerList.iterator();
         while(itPriPerList.hasNext()){
             String []  strPriPerList = (String [])itPriPerList.next();
             String privilegeId = strPriPerList[0];
             String permissionId = strPriPerList[1];
             if(privilegeId!=null && permissionId!=null && privilegeId.trim().length()!=0 && permissionId.trim().length()!=0){
            	 result=(boolean)insertRoleEntityPrivilegeMapping(roleId, entityId, privilegeId, permissionId);
             }
         }
         result = true;
     }
      return result;
  } 
 
 
//=============================================Delete Mapping Records with fieldValue details========================================= 
 public boolean deleteRow(String fieldName1, String fieldValue1, String fieldName2, String fieldValue2, String tableName) {
    Debug.print("GeneralDBAction.deleteRow()");
    boolean result = false;
    makeConnection();
    try{
        String deleteStatement = "delete from " + tableName + "  where " + fieldName1  + " = ? and " + fieldName2 + " = ?" ;
        PreparedStatement prepStmt = con.prepareStatement(deleteStatement);
        prepStmt.setString(1, fieldValue1);
        prepStmt.setString(2, fieldValue2);
        prepStmt.executeUpdate();
        prepStmt.close();
        releaseConnection();
        result = true;
    }
    catch(SQLException sql){
       releaseConnection();
       Debug.print("SQL Exception in GeneralDBAction deleteRow:" + sql.getMessage());
    }
    catch(Exception e){
        releaseConnection();
        Debug.print("General Exception  in GeneralDBAction deleteRow:" + e.getMessage());
    }        
    return result;
}
 
//=============================================  Mapping Entites with privilege details=========================================      
 public boolean insertRoleEntityPrivilegeMapping(String roleId, String entityId, String privilegeId, String permissionId) {
    Debug.print("GeneralDBAction.insertRoleEntityPrivilegeMapping():");
    PreparedStatement prepStmt = null;
    makeConnection();
    try {
        String insertStatement = "insert into tblMapRole (role_id , entity_id, privilege_id, permission_id) " +
                " values( ? , ? , ? , ?)";
        prepStmt = con.prepareStatement(insertStatement);
        prepStmt.setString(1, roleId);
        prepStmt.setString(2, entityId);
        prepStmt.setString(3, privilegeId);
        prepStmt.setString(4, permissionId);
        prepStmt.executeUpdate();
        prepStmt.close();
        releaseConnection();
    } 
    catch(SQLException sql){
        releaseConnection();
        Debug.print("SQL Exception in GeneralDBAction.insertRoleEntityPrivilegeMapping():" + sql.getMessage());
    }
    catch(Exception e){
        releaseConnection();
        Debug.print("General Exception  in GeneralDBAction.insertRoleEntityPrivilegeMapping():" + e.getMessage());
    }
    return true;
} 
 
 public ArrayList getAllEntity() throws RemoteException { 
     Debug.print("GeneralDBAction getAllEntity");
     ArrayList results =(ArrayList)selectAllEntity();
     return results;    
  }
 
//=============================================Getting All Enities details=========================================      
 public ArrayList selectAllEntity(){
     Debug.print("GeneralDBAction.selectAllEntity():");
     ArrayList entitiesList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
         String selectStatement = " SELECT entity_id, entity_name from tblEntityMaster order by entity_name";
         prepStmt = con.prepareStatement(selectStatement);
         rs = prepStmt.executeQuery();
         entitiesList = new ArrayList();
         while(rs.next()){
             String entityId = rs.getString(1);
             String entityName = rs.getString(2);
             String[] entList = {entityId, entityName};
             entitiesList.add(entList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
        // Debug.print("RoleManagementDAOImpl.selectAllEntity():" + entitiesList);
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectAllEntity():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectAllEntity():" + e.getMessage());
     }
     return entitiesList;
 }  
 
 public boolean generateMappingRoleWithEntities(String roleId, ArrayList entitesList) throws RemoteException {
     Debug.print("GeneralDBAction generateMappingRoleWithEntities()" + roleId);
     boolean result =false;
     Iterator itEntityList = entitesList.iterator();
     boolean flag =(boolean)deleteRow("role_id", roleId, "tblMapEntity","");
     Debug.print("GeneralDBAction generateMappingRoleWithEntities(): Deleted Enities Result:" + flag);
     if(flag){
         if(entitesList!=null && entitesList.size()!=0){
             while(itEntityList.hasNext()){
                 String entityId = (String)itEntityList.next();
                 if(entityId!=null && entityId.trim().length()!=0){
                	 result=insertRoleEntityMapping(roleId, entityId);
                 }
             }
         }
         result = true;
     }
      return result;
  }
 
 
//=============================================  Mapping Entites with privilege details=========================================      
 public boolean insertRoleEntityMapping(String roleId, String entityId) {
     Debug.print("GeneralDBAction.insertRoleEntityMapping():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String insertStatement = "insert into tblMapEntity (role_id , entity_id) " +
                 " values( ? , ? )";
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, roleId);
         prepStmt.setString(2, entityId);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.insertRoleEntityMapping():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.insertRoleEntityMapping():" + e.getMessage());
     }
     return true;
 }
 
 
 
 public boolean createRole(String roleName, String roledesc, String status) throws RemoteException{
	
	        Debug.print("GeneralDBAction createRole");
	        boolean result = false;
	        if(roleName!=null && roleName.trim().length()!=0 && isRoleNameExist(roleName)){
	
	            result = (boolean)insertRole(roleName,roledesc,status);
	
	        }
	        Debug.print("GeneralDBAction createRole");
	        return result;
	    } 
 
 
 public boolean isRoleNameExist(String roleName) {
     Debug.print("GeneralDBAction.isRoleNameExist():" + roleName);
     boolean result = true;
     makeConnection();
	try {
         String selectStatement = "select role_id from tblRoleMaster where role_name = ? " ;
         PreparedStatement prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,roleName);
         ResultSet rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("GeneralDBAction:: Could not find any from roleName" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction isRoleNameExist:" + e.getMessage());
     }
     Debug.print("GeneralDBAction isRoleNameExist():" + result);
     return result;
 }  
 
 public boolean insertRole(String roleName,String roledesc,String status) {
	
	            Debug.print("GeneralDBAction.insertRole():");
	            PreparedStatement prepStmt = null;
	            makeConnection();
	            try {
		
	                String insertStatement = "insert into tblRoleMaster (role_name,role_desc,active_status) " +
	                        " values( ?,?,?  )";
		
	                prepStmt = con.prepareStatement(insertStatement);
	                prepStmt.setString(1, roleName);
	
	                 prepStmt.setString(2, roledesc);
	                  prepStmt.setString(3, status);
	
	                prepStmt.executeUpdate();
	                prepStmt.close();
	                releaseConnection();
	            } 
	            catch(SQLException sql){
	                releaseConnection();
	                Debug.print("SQL Exception in GeneralDBAction.insertRole():" + sql.getMessage());
	            }
	            catch(Exception e){
	                releaseConnection();
	                Debug.print("General Exception  in GeneralDBAction.insertRole():" + e.getMessage());
	            }
	            return true;
	        } 
 
 
 public boolean editRole(String roleId, String roleName,String roledesc,String status) throws RemoteException{
	    
	        Debug.print("GeneralDBAction editRole");
	        boolean result = false;

	       
	        if(roleId!=null&& roleId.trim().length()!=0 && roleName!=null && roleName.trim().length()!=0){
	            boolean chkResult =isRoleNameEditExist(roleId, roleName);
	        
	            Debug.print("GeneralDBAction editRole chkResult:" + chkResult);
	            if(chkResult==true){
	
	                result =updateRole(roleId, roleName,roledesc,status);
	
	            }
	        }
	        Debug.print("GeneralDBAction editRole Result:" + result);
	        return result;
	    }
 
 public boolean isRoleNameEditExist(String roleId, String roleName) {
	    
	        Debug.print("GeneralDBAction.isRoleNameEditExist():" + roleName);
	        boolean result = true;
	        makeConnection();
	   	try {
	            String selectStatement = "select role_id from tblRoleMaster where role_name = ? and role_id != ? " ;
	            PreparedStatement prepStmt = con.prepareStatement(selectStatement);
	            prepStmt.setString(1,roleName);
	            prepStmt.setString(2,roleId);
	            
	            ResultSet rs = prepStmt.executeQuery();
	            if (rs.next()){
	                result = false;
	            }
	            
	            rs.close();
	            prepStmt.close();
	            releaseConnection();
	            Debug.print("GeneralDBAction isRoleNameEditExist result:" + result);  
	        } 
	        catch (SQLException e) {
	            releaseConnection();
	            Debug.print("GeneralDBAction Could not find any from isRoleNameEditExist" + e.getMessage());
	        }
	        catch(Exception e){
	            releaseConnection();
	            Debug.print("General Exception  in GeneralDBAction isRoleNameEditExist:" + e.getMessage());
	        }
	        Debug.print("GeneralDBAction isRoleNameEditExist():" + result);
	        return result;
	    } 
 
 public boolean updateRole(String roleId, String roleName,String roledesc,String status) {
	    
	        Debug.print("GeneralDBAction.updateRole():");
	        PreparedStatement prepStmt = null;
	        makeConnection();
	        try {
	            String insertStatement = "update tblRoleMaster set role_name = ?,role_desc =? " +
		
	                    " ,active_status = ? where role_id = ?";
		
	                prepStmt = con.prepareStatement(insertStatement);
	                prepStmt.setString(1, roleName);
	               
	                 prepStmt.setString(2, roledesc);
	                prepStmt.setString(3, status);
	                 prepStmt.setString(4, roleId);
	             
	                prepStmt.executeUpdate();
	                prepStmt.close();
	       

	            releaseConnection();
	        }
	        
	        catch(SQLException sql){
	            releaseConnection();
	            Debug.print("SQL Exception in GeneralDBAction.updateRole():" + sql.getMessage());
	        }
	        catch(Exception e){
	            releaseConnection();
	            Debug.print("General Exception  in GeneralDBAction.updateRole():" + e.getMessage());
	        }
	        return true;
	    }
 
 public boolean createEntity(String entityName) throws RemoteException{
     Debug.print("GeneralDBAction createEntity");
     boolean result = false;
     if(entityName!=null && entityName.trim().length()!=0){
         if(isEntityNameExist(entityName)){
             result =insertEntity(entityName);
         }
     }
     Debug.print("GeneralDBAction createEntity");
     return result;
 }
 
 
 public boolean isEntityNameExist(String entityName) {
     Debug.print("GeneralDBAction.isEntityNameExist():" + entityName);
     boolean result = true;
     makeConnection();
	try {
         String selectStatement = "select entity_id from tblEntityMaster where entity_name = ? " ;
         PreparedStatement prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,entityName);
         ResultSet rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("GeneralDBAction Could not find any from entityName" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction isEntityNameExist:" + e.getMessage());
     }
     Debug.print("isEntityNameExist():" + result);
     return result;
 }
 
 public boolean insertEntity(String entityName) {
     Debug.print("GeneralDBAction.insertEntity():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String insertStatement = "insert into tblEntityMaster (entity_name) " +
                 " values(?)";
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, entityName);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.insertEntity():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.insertEntity():" + e.getMessage());
     }
     return true;
 } 
 
 public String [] getEntity(String entityId){
     Debug.print("GeneralDBAction.selectEntity():");
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     String[] entList = {};
     makeConnection();
	try {
         String selectStatement=" SELECT entity_id, entity_name from tblEntityMaster where entity_id = ? " ;
         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,entityId);
         rs = prepStmt.executeQuery();
         if(rs.next()){
             String entityIdVal = rs.getString(1);
             String entityName = rs.getString(2);
             String[] tempEntList = {entityIdVal, entityName};
             entList = tempEntList;
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
        
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectEntity():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectEntity():" + e.getMessage());
     }
     return entList;
 }
 
 public boolean editEntity(String entityId, String entityName) throws RemoteException{
     Debug.print("GeneralDBAction editEntity");
     boolean result = false;
     if(entityId!=null && entityId.trim().length()!=0 && entityName!=null && entityName.trim().length()!=0){
         boolean chkResult =isEntityNameEditExist(entityId, entityName);
         Debug.print("GeneralDBAction editEntity chkResult:" + chkResult);
         if(chkResult==true){
             result =updateEntity(entityId, entityName);
         }
     }
     Debug.print("GeneralDBAction editEntity Result:" + result);
     return result;
 } 
 
 public boolean isEntityNameEditExist(String entityId, String entityName) {
     Debug.print("GeneralDBAction.isEntityNameEditExist():" + entityName);
     boolean result = true;
     makeConnection();
	try {
         String selectStatement = "select entity_id from tblEntityMaster where entity_name = ? and entity_id != ?" ;
         PreparedStatement prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,entityName);
         prepStmt.setString(2,entityId);
         
         ResultSet rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
         
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("GeneralDBAction Could not find any from isEntityNameEditExist" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction isEntityNameEditExist:" + e.getMessage());
     }
     Debug.print("isEntityNameEditExist():" + result);
     return result;
 }   
 
 public boolean updateEntity(String entityId, String entityName) {
     Debug.print("GeneralDBAction.updateEntity():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String insertStatement = "update tblEntityMaster set entity_name = ? " +
                 " where entity_id = ? ";
         
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, entityName);
         prepStmt.setString(2, entityId);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
     }
     
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.updateEntity():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.updateEntity():" + e.getMessage());
     }
     return true;
 }  
 
 
 public boolean createPermission(String permissionName) throws RemoteException{
     Debug.print("GeneralDBAction createPermission");
     boolean result = false;
     if(isPermissionNameExist(permissionName)){
         result =insertPermission(permissionName);
     }
     Debug.print("GeneralDBAction createPermission");
     return result;
 }
 
 public boolean isPermissionNameExist(String permissionName) {
     Debug.print("GeneralDBAction.isPermissionNameExist():" + permissionName);
     boolean result = true;
     makeConnection();
	try {
         String selectStatement = "select permission_id from tblPermissionMaster where permission_name = ? " ;
         PreparedStatement prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,permissionName);
         ResultSet rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("GeneralDBAction Could not find any from permissionName" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction isPermissionNameExist:" + e.getMessage());
     }
     Debug.print("GeneralDBAction isPermissionNameExist():" + result);
     return result;
 }

 public boolean insertPermission(String permissionName){
     Debug.print("GeneralDBAction.insertPermission():");
     PreparedStatement prepStmt = null;
     boolean result = false;
     makeConnection();
     try {
         String insertStatement = "insert into tblPermissionMaster (permission_name) " +
                 " values(?)";
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, permissionName);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
         result = true;
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.insertPermission():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.insertPermission():" + e.getMessage());
     }
     return result;
 }
 
 
 public String [] getPermission(String permissionId){
     Debug.print("GeneralDBAction.selectPrivilege():");
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     String[] perList = {};
     makeConnection();
	try {
         String selectStatement=" SELECT permission_id, permission_name from tblPermissionMaster where permission_id = ? " ;
         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,permissionId);
         rs = prepStmt.executeQuery();
         if(rs.next()){
             String permissionIdVal = rs.getString(1);
             String permissionName = rs.getString(2);
             String[] tempPerList = {permissionIdVal, permissionName};
             perList = tempPerList;
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
        // Debug.print("RoleManagementDAOImpl.selectPrivilege():" + perList);
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectPrivilege():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectPrivilege():" + e.getMessage());
     }
     return perList;
 }   
 
 
 public boolean editPermission(String permissionId, String permissionName) throws RemoteException{
     Debug.print("GeneralDBAction editPermission");
     boolean result = false;
     boolean chkResult =isPermissionNameEditExist(permissionId, permissionName);
     Debug.print("GeneralDBAction editPermission chkResult:" + chkResult);
     if(chkResult==true){
         result =updatePermission(permissionId, permissionName);
     }
     Debug.print("GeneralDBAction editPermission Result:" + result);
     return result;
 }
 
 public boolean isPermissionNameEditExist(String permissionId, String permissionName){
     Debug.print("GeneralDBAction.isPermissionNameEditExist():" + permissionName);
     boolean result = true;
     makeConnection();
	try {
         String selectStatement = "select permission_id from tblPermissionMaster where permission_name = ? and permission_id != ?" ;
         PreparedStatement prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,permissionName);
         prepStmt.setString(2,permissionId);
         
         ResultSet rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
         
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("GeneralDBAction Could not find any from isPermissionNameEditExist" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction isPermissionNameEditExist:" + e.getMessage());
     }
     Debug.print("GeneralDBAction isPrivilegeNameExist():" + result);
     return result;
 } 
 
 public boolean updatePermission(String permissionId, String permissionName) {
     Debug.print("GeneralDBAction.updatePermission():");
     PreparedStatement prepStmt = null;
     boolean result = false;
     makeConnection();
     try {
         String insertStatement = "update tblPermissionMaster set permission_name = ? " +
                 " where permission_id = ?";
         
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, permissionName);
         prepStmt.setString(2, permissionId);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
         result = true;
     }
     
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.updatePermission():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.updatePermission():" + e.getMessage());
     }
     return result;
 }    
 
 public boolean createPrivilege(String privilegeName) throws RemoteException{
     Debug.print("GeneralDBAction createPrivilege");
     boolean result = false;
     if(privilegeName!=null && privilegeName.trim().length()!=0){
         if(isPrivilegeNameExist(privilegeName)){
             result =insertPrivilege(privilegeName);
         }
     }
     return result;
 }
 
 public boolean isPrivilegeNameExist(String privilegeName) {
     Debug.print("GeneralDBAction.isPrivilegeNameExist():" + privilegeName);
     boolean result = true;
     makeConnection();
	try {
         String selectStatement = "select privilege_id from tblPrivilegeMaster where privilege_name = ? " ;
         PreparedStatement prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,privilegeName);
         ResultSet rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("GeneralDBAction Could not find any from privilegeName" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction isPrivilegeNameExist:" + e.getMessage());
     }
     Debug.print("isPrivilegeNameExist():" + result);
     return result;
 }
 
 public boolean insertPrivilege(String privilegeName) {
     Debug.print("GeneralDBAction.insertPrivilege():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String insertStatement = "insert into tblPrivilegeMaster (privilege_name) " +
                 " values( ?  )";
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, privilegeName);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.insertPrivilege():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.insertPrivilege():" + e.getMessage());
     }
     return true;
 } 
 
 public ArrayList getAllPrivilege(){
     Debug.print("GeneralDBAction.getAllPrivilege():");
     ArrayList privilegeList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
         String selectStatement=" SELECT privilege_id, privilege_name, privilege_path from tblPrivilegeMaster order by privilege_name";
         prepStmt = con.prepareStatement(selectStatement);
         rs = prepStmt.executeQuery();
         privilegeList = new ArrayList();
         while(rs.next()){
             String privilegeId = rs.getString(1);
             String privilegeName = rs.getString(2);
             String privilegePath = rs.getString(3);
             String[] priList = {privilegeId, privilegeName, privilegePath};
             privilegeList.add(priList);
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
        
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.getAllPrivilege():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.getAllPrivilege():" + e.getMessage());
     }
     return privilegeList;
 }

 public String [] getPrivilege(String privilegeId){
     Debug.print("GeneralDBAction.selectPrivilege():");
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     String[] priList = {};
     makeConnection();
	try {
         String selectStatement=" SELECT privilege_id, privilege_name, privilege_path from tblPrivilegeMaster where privilege_id = ? " ;
         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,privilegeId);
         rs = prepStmt.executeQuery();
         if(rs.next()){
             String privilegeIdVal = rs.getString(1);
             String privilegeName = rs.getString(2);
             String privilegePath = rs.getString(3);
             String tempPriList[] = {privilegeIdVal, privilegeName, privilegePath};
             priList = tempPriList;
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
      
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectPrivilege():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectPrivilege():" + e.getMessage());
     }
     return priList;
 } 
 
 public boolean editPrivilege(String privilegeId, String privilegeName) throws RemoteException{
     Debug.print("GeneralDBAction editPrivilege");
     boolean result = false;
     if(privilegeId!=null && privilegeId.trim().length()!=0){
         boolean chkResult =isPrivilegeNameEditExist(privilegeId, privilegeName);
         Debug.print("GeneralDBAction editPrivilege chkResult:" + chkResult);
         if(chkResult==true){
             result =updatePrivilege(privilegeId, privilegeName);
         }
     }
     Debug.print("GeneralDBAction editPrivilege Result:" + result);
     return result;
 }
 
 public boolean isPrivilegeNameEditExist(String privilegeId, String privilegeName) {
     Debug.print("GeneralDBAction.isPrivilegeNameEditExist():" + privilegeName);
     boolean result = true;
     makeConnection();
	try {
         String selectStatement = "select privilege_id from tblPrivilegeMaster where privilege_name = ? and privilege_id != ?" ;
         PreparedStatement prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,privilegeName);
         prepStmt.setString(2,privilegeId);
         
         ResultSet rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
         
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("Could not find any from isPrivilegeNameEditExist" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in isPrivilegeNameEditExist:" + e.getMessage());
     }
     Debug.print("isPrivilegeNameExist():" + result);
     return result;
 }  
 
 
 public boolean updatePrivilege(String privilegeId, String privilegeName){
     Debug.print("GeneralDBAction.updatePrivilege():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String insertStatement = "update tblPrivilegeMaster set privilege_name = ? " +
                 " where privilege_id = ?";
         
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, privilegeName);
         prepStmt.setString(2, privilegeId);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
     }
     
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.updatePrivilege():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.updatePrivilege():" + e.getMessage());
     }
     return true;
 }  
 
 public ArrayList getMappingDetailsForPermissionAndPrivilege(String privilegeId){
     Debug.print("GeneralDBAction.selectAllMappingDetailsForPrivilege():");
     ArrayList permissionMapList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
         String selectStatement=" SELECT a.map_permission_id , b.permission_name ,a.access_name, a.access_url " +
         		"from tblMapPermission a , tblPermissionMaster b where a.permission_id = b.permission_id and a.privilege_id = ? ";
         
         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,privilegeId);
         Debug.print(selectStatement);
         rs = prepStmt.executeQuery();
         permissionMapList = new ArrayList();
         while(rs.next()){
             String mapPermissionId = rs.getString(1);
             String permissionName = rs.getString(2);
             String accessName = rs.getString(3);
             String accessUrl = rs.getString(4);
             String[] priMapList = {mapPermissionId, permissionName, accessName, accessUrl};
             permissionMapList.add(priMapList);
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
       
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectAllMappingDetailsForPrivilege():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectAllMappingDetailsForPrivilege():" + e.getMessage());
     }
     return permissionMapList;
 }
 
 public boolean generateMappingEnitityWithPrivileges(String entityId, ArrayList privilegeList) throws RemoteException {
     Debug.print("GeneralDBAction generateMappingEnitityWithPrivileges()" + entityId);
     boolean result =false;
     boolean flag = deleteRow("entity_id", entityId, "tblMapPrivilege","");
     Debug.print("GeneralDBAction generateMappingEnitityWithPrivileges(): Deleted Enities Result:" + flag);
     if(flag){
         if(privilegeList!=null && privilegeList.size()!=0){
             Iterator itPrivilege = privilegeList.iterator();
             while(itPrivilege.hasNext()){
                 String privilegeId = (String)itPrivilege.next();
                 if(privilegeId!=null && privilegeId.trim().length()!=0){
                     insertEntityPrivilegeMapping(entityId, privilegeId);
                 }
             }
         }
         result = true;
     }
      return result;
  }
 
 
 public boolean insertEntityPrivilegeMapping(String entityId, String privilegeId) {
     Debug.print("GeneralDBAction.insertEntityPrivilegeMapping():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String insertStatement = "insert into tblMapPrivilege (entity_id , privilege_id) " +
                 " values( ? , ? )";
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, entityId);
         prepStmt.setString(2, privilegeId);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.insertEntityPrivilegeMapping():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.insertEntityPrivilegeMapping():" + e.getMessage());
     }
     return true;
 }
 
 
 public void editMappingPermissionToPrivilege(ArrayList mapPriPerList,String privId) throws RemoteException{
     Debug.print("GeneralDBAction.editMappingPermissionToPrivilege()");
     Iterator itMapPriPer = mapPriPerList.iterator();
     while(itMapPriPer.hasNext()){
         String priList[] = (String [])itMapPriPer.next();
         String mapPermissionId = priList[0];
         String accessName = priList[1];
         String accessUrl = priList[2];
         
         if(accessName!=null && accessName.trim().length()!=0 ){
             Debug.print("GeneralDBAction.editMappingPermissionToPrivilege() accessName not empty");
             if(isAccessNameExistinEdit(mapPermissionId,accessName,"","")){
                 updatePermissionPrivilegeMapping( mapPermissionId, accessName, accessUrl,privId);
             }
             else{
             	insertPermissionPrivilegeMapping(privId, mapPermissionId, accessName, accessUrl);
             }
         }
         else{
         	if(isAccessNameExistinEdit("","",privId,mapPermissionId)){
         		Debug.print("GeneralDBAction.editMappingPermissionToPrivilege() empty accessName");
         		updatePermissionPrivilegeMapping( mapPermissionId, accessName, accessUrl,privId);
         	}
         	else {
         		insertPermissionPrivilegeMapping(privId, mapPermissionId, accessName, accessUrl);
         	}
         }
     }
 }
 
 
 public boolean isAccessNameExistinEdit(String mapPermissionId, String accessName,String privId, String permissionId) {
     Debug.print("GeneralDBAction.isAccessNameExistinEdit():" + accessName);
     boolean result = true;
     String selectStatement=null;
     PreparedStatement prepStmt=null;
     ResultSet rs=null;
     makeConnection();
	try {
		 	
		if(!mapPermissionId.equals("") && !accessName.equals("")) {
			
			selectStatement = "select map_permission_id from tblMapPermission where access_name = ? and map_permission_id != ?" ;
         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,accessName);
         prepStmt.setString(2,mapPermissionId);
         rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
		}
         
         if(!privId.equals("") && !permissionId.equals("")) {            	

	            selectStatement = "select count(1) from tblMapPermission where privilege_id = ?" ;
	       		prepStmt = con.prepareStatement(selectStatement);
	       		prepStmt.setString(1,privId);
	       		
	       		rs = prepStmt.executeQuery();
	       		
	            if (rs.next()){
	                int recCnt = rs.getInt(1);
	                    if(recCnt==12){
	                    Debug.print("If Inside recCnt==="+recCnt);
	                    result=true;
	                }
	                else {
	                	 Debug.print("else Inside recCnt==="+recCnt);
	                	result = false;
	                }
	            }
         }
         
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("GeneralDBAction Could not find any from accessName" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction isAccessNameExistinEdit:" + e.getMessage());
     }
     Debug.print("GeneralDBAction isAccessNameExistinEdit():" + result);
     return result;
 } 
 
 
 public boolean updatePermissionPrivilegeMapping(String mapPermissionId, String accessName, String accessUrl,String privId){
     Debug.print("GeneralDBAction.updatePermissionPrivilegeMapping():");
     PreparedStatement prepStmt = null;
     makeConnection();
     String statementQuery="";
     try {
     	
     		statementQuery = "update tblMapPermission set access_name = ? , access_url = ? " +
     				" where map_permission_id = ?";   		
     
                 
         
         prepStmt = con.prepareStatement(statementQuery);
         prepStmt.setString(1, accessName);
         prepStmt.setString(2, accessUrl);
         
        
         prepStmt.setString(3, mapPermissionId);
       
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
     }
     
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.updatePermissionPrivilegeMapping():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.updatePermissionPrivilegeMapping():" + e.getMessage());
     }
     return true;
 }
 
 
 public boolean insertPermissionPrivilegeMapping(String privilegeId, String permissionId, String accessName, String accessUrl){
     Debug.print("GeneralDBAction.insertPermissionPrivilegeMapping():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String insertStatement = "insert into tblMapPermission (privilege_id , permission_id, access_name, access_url) " +
                 " values( ? , ? , ? , ? )";
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, privilegeId);
         prepStmt.setString(2, permissionId);
         prepStmt.setString(3, accessName);
         prepStmt.setString(4, accessUrl);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.insertPermissionPrivilegeMapping():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.insertPermissionPrivilegeMapping():" + e.getMessage());
     }
     return true;
 }
 
 public void createMappingPermissionToPrivilege(String privilegeId, ArrayList mapPriPerList) throws RemoteException{
     Debug.print("GeneralDBAction getAllPermission");
     Iterator itMapPriPer = mapPriPerList.iterator();
     while(itMapPriPer.hasNext()){
         String priList[] = (String [])itMapPriPer.next();
         String permissionId = priList[0];
         String accessName = priList[1];
         String accessUrl = priList[2];
         if(accessName.trim().length()!=0 && accessName !=null){
             if(isAccessNameExist(accessName)){
                 insertPermissionPrivilegeMapping(privilegeId, permissionId, accessName, accessUrl);
             }
             else{
                  insertPermissionPrivilegeMapping(privilegeId, permissionId, "", accessUrl);
             }
         }
         else{
             insertPermissionPrivilegeMapping(privilegeId, permissionId, accessName, accessUrl);
         }
     }
 }
 
 public boolean isAccessNameExist(String accessName) {
     Debug.print("GeneralDBAction.isAccessNameExist():" + accessName);
     boolean result = true;
     makeConnection();
	try {
         String selectStatement = "select map_permission_id from tblMapPermission where access_name = ? " ;
         PreparedStatement prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,accessName);
         ResultSet rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("GeneralDBAction Could not find any from accessName" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction isAccessNameExist:" + e.getMessage());
     }
     Debug.print("GeneralDBAction isAccessNameExist():" + result);
     return result;
 }
 
 public boolean deleteRole(String chkRoleIdArr[]) throws RemoteException{
     Debug.print("GeneralDBAction deleteRole");
     boolean result = false;


     if(chkRoleIdArr!=null){

         //boolean chkResult =dao.isRoleNameExist(roleId);
         boolean chkResult =isRoleNameExist(chkRoleIdArr[0]);

         Debug.print("GeneralDBAction deleteRole chkResult:" + chkResult);
         if(chkResult==true){
             //result = dao.deleteRole(roleId);
             result =deleteRoleDet(chkRoleIdArr);
         }
     }
     Debug.print("GeneralDBAction deleteRole Result:" + result);
     return result;
 }
 
 public boolean deleteRoleDet(String chkRoleIdArr[]) {
     Debug.print("GeneralDBAction.deleteRole():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String deleteStatement = "delete from tblRoleMaster where role_id = ?";
                 
         for(int i=0;i<chkRoleIdArr.length;i++)
         {
             prepStmt = con.prepareStatement(deleteStatement);
             //prepStmt.setString(1, roleId);
             prepStmt.setString(1, chkRoleIdArr[i]);

             Debug.print("GeneralDBAction.deleteRole():"+deleteStatement+"=="+chkRoleIdArr[i]);
             prepStmt.executeUpdate();
             prepStmt.close();
         }

         releaseConnection();
     }

     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.deleteRole:" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.deleteRole:" + e.getMessage());
     }
     return true;
 }
 
 public String getExternalAppURL(String perName)
 {
     Debug.print("GeneralDBAction.getExternalAppURL():");
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
     String perUrl = "";
     try
     {
         String sqlQuery = "select access_url from tblmappermission where access_name=?";
         prepStmt = con.prepareStatement(sqlQuery);
         prepStmt.setString(1, perName);
         rs = prepStmt.executeQuery();
         rs.next();
         perUrl = rs.getString(1);
         rs.close();
         prepStmt.close();
         releaseConnection();
     }
     catch(SQLException sql)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("SQL Exception in GeneralDBAction.getExternalAppURL():").append(sql.getMessage()).toString());
     }
     catch(Exception e)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("General Exception  in GeneralDBAction.getExternalAppURL():").append(e.getMessage()).toString());
     }
     return perUrl;
 }
 
 
 
 public boolean isLifecycleDBExist(String lifecycleName)
 {  
 	boolean result=false;
 	String name="";
 	makeConnection();
       try {
    	   if(lifecycleName!=null){
     	  String selectStmt="select lifecycleProName from tblLifecycleprocessinsert where lifecycleProName = ?";          	  
           
         
           prepStmt = con.prepareStatement(selectStmt);
           prepStmt.setString(1, lifecycleName);
           rs=prepStmt.executeQuery();
           if(rs.next())
           {
         	
         	   result = true;
           }
          
          
           
           System.out.println("GeneralDBAction isLifecycleDBExist() Name :" + name);
           prepStmt.close();
           releaseConnection();}
    	   else{
    		   result = false;   
    	   }
       } catch(SQLException sql){
           releaseConnection();
           System.out.println("SQL Exception in GeneralDBAction.isLifecycleDBExist():" + sql.getMessage());
       } catch(Exception e){
           releaseConnection();
           System.out.println("General Exception  in GeneralDBAction.isLifecycleExist():" + e.getMessage());
       }
 	
 	
 	return result;
 }    
 
 
 public String adddocumentfromcustomer(String userId,String fileename,String saveFile)
 {
 	 
 	String allow_date=null;
		    
		    	  
		        try {
		        	makeConnection();
		        	 String str="insert into tblProcessDetails(user_id,file_name,file_path) values (?,?,?)";
				     				     
				        prepStmt = con.prepareStatement(str);
			            prepStmt.setString(1,userId);
			            prepStmt.setString(2,fileename);
			            prepStmt.setString(3,saveFile);
			            
			            prepStmt.executeUpdate();

			 	       prepStmt.close();
			       
			       releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			            releaseConnection();
			        }
		       
		    return allow_date;
 }

 
 public void getProcessList(ArrayList<String> firstNameList,ArrayList<String> lastNameList,ArrayList<String> fileNameList,ArrayList<String> filePathList){
     Debug.print("GeneralDBAction.selectAll Process Details For Developer():");
     ArrayList<String> processList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
         String selectStatement=" SELECT a.first_name , a.last_name ,b.file_name, b.file_path " +
         		"from tblUserMaster a , tblProcessDetails b where a.user_id = b.user_id";
         
         prepStmt = con.prepareStatement(selectStatement);
         Debug.print(selectStatement);
         rs = prepStmt.executeQuery();
         processList = new ArrayList<String>();
         while(rs.next()){
             firstNameList.add(rs.getString("first_name"));
             lastNameList.add(rs.getString("last_name"));
             fileNameList.add(rs.getString("file_name"));
             filePathList.add(rs.getString("file_path"));
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
       
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectAllMappingDetailsForPrivilege():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectAllMappingDetailsForPrivilege():" + e.getMessage());
     }
 }
 
 
 public String getPasswordByLoginId(String userid)
 {
     Debug.print("GeneralDBAction.getPasswordByLoginId():");
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
     String password = "";
     try
     {
         String sqlQuery = "select password from tblUserMaster where user_id=?";
         prepStmt = con.prepareStatement(sqlQuery);
         prepStmt.setString(1, userid);
         rs = prepStmt.executeQuery();
         rs.next();
         password = rs.getString(1);
         rs.close();
         prepStmt.close();
         releaseConnection();
     }
     catch(SQLException sql)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("SQL Exception in GeneralDBAction.getExternalAppURL():").append(sql.getMessage()).toString());
     }
     catch(Exception e)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("General Exception  in GeneralDBAction.getExternalAppURL():").append(e.getMessage()).toString());
     }
     return password;
 }
 
 public String getEmailIdByPassword(String userId){
	 Debug.print("GeneralDBAction.getEmailIdByPassword():");
	 PreparedStatement prepstmt = null;
	 ResultSet rs = null;
	 makeConnection();
	 String emailid = "";
	 try{
		 String sqlQuery = "Select email_id from tblUserMaster where user_id=?";
		 prepstmt = con.prepareStatement(sqlQuery);
		 prepstmt.setString(1, userId);
		 rs = prepstmt.executeQuery();
		 rs.next();
		 emailid = rs.getString(1);
		 rs.close();
		 prepstmt.close();
		 releaseConnection();
	 }
	 catch(SQLException sql)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("SQL Exception in GeneralDBAction.getEmailIdByPassword():").append(sql.getMessage()).toString());
     }
     catch(Exception e)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("General Exception  in GeneralDBAction.getEmailIdByPassword():").append(e.getMessage()).toString());
     }
	 
	 return emailid;
	 
 }
 
 
 public String getRoleNameByRoleId(String roleId){
	 Debug.print("GeneralDBAction.getRoleNameByRoleId():");
	 PreparedStatement prepstmt = null;
	 ResultSet rs = null;
	 makeConnection();
	 String roleName = "";
	 try{
		 String sqlQuery = "Select role_name from tblRoleMaster where role_id=?";
		 prepstmt = con.prepareStatement(sqlQuery);
		 prepstmt.setString(1, roleId);
		 rs = prepstmt.executeQuery();
		 rs.next();
		 roleName = rs.getString(1);
		 rs.close();
		 prepstmt.close();
		 releaseConnection();
	 }
	 catch(SQLException sql)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("SQL Exception in GeneralDBAction.getRoleNameByRoleId():").append(sql.getMessage()).toString());
     }
     catch(Exception e)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("General Exception  in GeneralDBAction.getRoleNameByRoleId():").append(e.getMessage()).toString());
     }
	 
	 return roleName;
	 
 }
 
 //======================================Artifact Management===============================================
 
 public ArrayList getCount(){
     int cnt = 0;
     ArrayList cntRecord = new ArrayList();
     PreparedStatement prepStmt = null;
     String selectStatement="";
     makeConnection();
     System.out.println("GeneralDBAction: getCount()");
     try {
   
              selectStatement = "select count(*) from tblFrameworkMaster";
             
             prepStmt = con.prepareStatement(selectStatement);
            
             ResultSet rs = prepStmt.executeQuery();
             if(rs.next()){
                 cnt = rs.getInt(1);
                 
                  selectStatement = "select A.layer_value_id, A.layer_value, B.master_name, B.master_id from " +
                 		"tblframeworklayermap A, tblframeworkmaster B where " +
                 		"A.master_id=B.master_id and master_sequence=?";
                  
                  prepStmt = con.prepareStatement(selectStatement);
                  prepStmt.setInt(1, cnt);
                  rs = prepStmt.executeQuery();
                  
                  while(rs.next()){
                 	 
                 	 String layerValId = rs.getString(1);
                      String layerValName = rs.getString(2);
                      String masterId = rs.getString(3);
                      String masterName = rs.getString(4);
                      String[] cntList = {layerValId, layerValName,masterId,masterName,String.valueOf(cnt)};
                      cntRecord.add(cntList);	 
                 	 
                  }
             }
             rs.close();
             prepStmt.close();
        
         releaseConnection();
         
     } catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.getCount():" + sql.getMessage());
     } catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.getCount():" + e.getMessage());
     }
     return cntRecord;
 }
 
 public boolean insertArtifactMapDetails(HLCMenuListVO objArti)
 {
     Debug.print("RoleManagementDAOImpl.insertArtifactMapDetails():");
     Debug.print("RoleManagementDAOImpl.insertArtifactMapDetails():"+objArti);
     
     Debug.print("RoleManagementDAOImpl.objArti.getGroupsId()():"+objArti.getGroupsId());
     Debug.print("RoleManagementDAOImpl.objArti.getProcessDomainId()():"+objArti.getProcessDomainId());
     
     PreparedStatement prepStmt = null;
     boolean result = false;
     
  
     makeConnection();
     try
     {
     	

     	
   if(objArti.getViewPtId()!=null && objArti.getLobLayerId()==null && objArti.getViewId()==null &&  objArti.getGroupsId()==null && objArti.getProcessDomainId()==null && objArti.getArtifactId()!=null && objArti.getArtifactDesc()!=null){
     	
         String insertStatement = "insert into tblMapArtifact (view_point_value_id, artifact_id, artifact_description) values( ?,?,?)";
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, objArti.getViewPtId());         
         prepStmt.setString(2, objArti.getArtifactId());                     
         prepStmt.setString(3, objArti.getArtifactDesc());
   }else if(objArti.getViewPtId()!=null && objArti.getLobLayerId()!=null && objArti.getViewId()==null && objArti.getGroupsId()==null && objArti.getProcessDomainId()==null && objArti.getArtifactId()!=null && objArti.getArtifactDesc()!=null){
 	  
 	  String insertStatement = "insert into tblMapArtifact (view_point_value_id, lob_value_id, artifact_id, artifact_description) values( ?,?,?,?)";
       prepStmt = con.prepareStatement(insertStatement);
       prepStmt.setString(1, objArti.getViewPtId());
       prepStmt.setString(2, objArti.getLobLayerId());       
       prepStmt.setString(3, objArti.getArtifactId());                     
       prepStmt.setString(4, objArti.getArtifactDesc());  
 	  
   }else if(objArti.getViewPtId()!=null && objArti.getLobLayerId()!=null && objArti.getViewId()!=null && objArti.getGroupsId()==null && objArti.getProcessDomainId()==null && objArti.getArtifactId()!=null && objArti.getArtifactDesc()!=null){
 	  
 	  String insertStatement = "insert into tblMapArtifact (view_point_value_id, lob_value_id, view_value_id, artifact_id, artifact_description) values( ?,?,?,?,?)";
       prepStmt = con.prepareStatement(insertStatement);
       prepStmt.setString(1, objArti.getViewPtId());
       prepStmt.setString(2, objArti.getLobLayerId());     
       prepStmt.setString(3, objArti.getViewId());
       prepStmt.setString(4, objArti.getArtifactId());                     
       prepStmt.setString(5, objArti.getArtifactDesc());  
 	  
   }else if(objArti.getViewPtId()!=null && objArti.getLobLayerId()!=null && objArti.getViewId()!=null && objArti.getGroupsId()!=null && objArti.getProcessDomainId()==null && objArti.getArtifactId()!=null && objArti.getArtifactDesc()!=null){
 	  
 	  String insertStatement = "insert into tblMapArtifact (view_point_value_id, lob_value_id, view_value_id, group_value_id, artifact_id, artifact_description) values( ?,?,?,?,?,?)";
       prepStmt = con.prepareStatement(insertStatement);
       prepStmt.setString(1, objArti.getViewPtId());
       prepStmt.setString(2, objArti.getLobLayerId());     
       prepStmt.setString(3, objArti.getViewId());
       prepStmt.setString(4, objArti.getGroupsId());
       prepStmt.setString(5, objArti.getArtifactId());                     
       prepStmt.setString(6, objArti.getArtifactDesc());  
 	  
   }else if(objArti.getViewPtId()!=null && objArti.getLobLayerId()!=null && objArti.getViewId()!=null && objArti.getGroupsId()!=null && objArti.getProcessDomainId()!=null && objArti.getArtifactId()!=null && objArti.getArtifactDesc()!=null){
 	  
 	  String insertStatement = "insert into tblMapArtifact (view_point_value_id, lob_value_id, view_value_id, group_value_id, process_domain_value_id, artifact_id, artifact_description) values( ?,?,?,?,?,?,?)";
       prepStmt = con.prepareStatement(insertStatement);
       prepStmt.setString(1, objArti.getViewPtId());
       prepStmt.setString(2, objArti.getLobLayerId());
       prepStmt.setString(3, objArti.getViewId());  
       prepStmt.setString(4, objArti.getGroupsId());  
       prepStmt.setString(5, objArti.getProcessDomainId());  
       prepStmt.setString(6, objArti.getArtifactId());                     
       prepStmt.setString(7, objArti.getArtifactDesc());  
 	  
   }
   
        
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
         result = true;
     }
     catch(SQLException sql)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("SQL Exception in RoleManagementDAOImpl.insertArtifactMapDetails():").append(sql.getMessage()).toString());
     }
     catch(Exception e)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("General Exception  in RoleManagementDAOImpl.insertArtifactMapDetails():").append(e.getMessage()).toString());
     }
     
     Debug.print("RoleManagementDAOImpl.insertArtifactMapDetails():"+result);
     return result;
 }
 
 public ArrayList getAllGroup(){
 	  System.out.println("GeneralDBAction: getAllGroup()");
       ArrayList groupList = new ArrayList();
       PreparedStatement prepStmt = null;
       ResultSet rs = null;
       makeConnection();
  	try {

 String selectStatement = "select master_id, master_name, master_sequence from tblframeworkmaster " +
 		"where active_status='1' and show_master='1' order by master_sequence";
               
 prepStmt = con.prepareStatement(selectStatement);
 rs = prepStmt.executeQuery();
          
           while(rs.next()){
               String masterId = rs.getString(1);
               String masterName = rs.getString(2);
               String masterSeq = rs.getString(3);
               
               String[] grpList = {masterId, masterName,masterSeq};
               groupList.add(grpList);
           }
           rs.close();
           prepStmt.close();
           releaseConnection();
          
       } 
       catch(SQLException sql){
           releaseConnection();
           System.out.println("SQL Exception in GeneralDBAction.getAllGroup():" + sql.getMessage());
       }
       catch(Exception e){
           releaseConnection();
           e.printStackTrace();
       }
       return groupList;
   }
 
 public ArrayList getGrpDetails(){
	  System.out.println("RoleManagementDAOImpl: getGrpDetails()");
     ArrayList groupList = new ArrayList();
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {

String selectStatement = "select b.master_id, b.master_name,a.layer_value,a.layer_value_id, b.master_sequence from tblframeworklayermap a, " +
		"tblframeworkmaster b where a.master_id = b.master_id " +
		"and b.active_status='1' and b.show_master='1' order by b.master_sequence";
             
prepStmt = con.prepareStatement(selectStatement);

rs = prepStmt.executeQuery();
        
         while(rs.next()){
             String masterId = rs.getString(1);
             String masterName = rs.getString(2);
             String layerVal = rs.getString(3);
             String layerValId = rs.getString(4);
             Integer seq = rs.getInt(5);
       
             String[] grpList = {masterId,masterName,layerVal, layerValId,String.valueOf(seq)};
             groupList.add(grpList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
        
     } 
     catch(SQLException sql){
         releaseConnection();
         System.out.println("SQL Exception in RoleManagementDAOImpl.getGrpDetails():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         e.printStackTrace();
     }
     return groupList;
 }
 
 
 public ArrayList getAllViewMapList(String viewPointId){
 	  System.out.println("RoleManagementDAOImpl: getAllViewMapList()");
       ArrayList viewPointList = new ArrayList();
       PreparedStatement prepStmt = null;
       ResultSet rs = null;
       makeConnection();
  	try {

 String selectStatement = "select (select view_point_name from tblviewpointmaster where view_point_id = a.view_point_value_id ) as View_Point, " +
 		" (select layer_value from tblframeworklayermap where layer_value_id = a.lob_value_id) as LOB,(select layer_value from tblframeworklayermap " +
 		" where layer_value_id =a.view_id) as Views,(select layer_value from tblframeworklayermap where layer_value_id = a.group_value_id) " +
 		" as GroupId,(select layer_value from tblframeworklayermap where layer_value_id = a.process_domain_value_id)  as Process_Domain_Id " +
 		" from tblframeworkmapping a,tblviewpointmaster b where a.view_point_value_id = b.view_point_id and a.view_point_value_id = ?";                
 prepStmt = con.prepareStatement(selectStatement);
 prepStmt.setString(1, viewPointId);

 rs = prepStmt.executeQuery();
          
           while(rs.next()){
               String View_Point = rs.getString(1);
               String LOB = rs.getString(2);
               String Views = rs.getString(3);
               String Groups = rs.getString(4);
               String Process_Domain = rs.getString(5);
         
               String[] viewPoint = {View_Point,LOB,Views, Groups,Process_Domain};
               viewPointList.add(viewPoint);
           }
           rs.close();
           prepStmt.close();
           releaseConnection();
          
       } 
       catch(SQLException sql){
           releaseConnection();
           System.out.println("SQL Exception in RoleManagementDAOImpl.getAllViewMapList():" + sql.getMessage());
       }
       catch(Exception e){
           releaseConnection();
           e.printStackTrace();
       }
       return viewPointList;
   }
 
 /*
  * 
  * Dhivya Here: View Point Mapping Existence
  * 
  */
 
 public boolean viewPointMapExists(String viewPntId, String lobId, String viewId, String grpId, String domProcId)
 {
     Debug.print("RoleManagementDAOImpl.viewPointMapExists() View Pnt:"+viewPntId);
     Debug.print("RoleManagementDAOImpl.viewPointMapExists() LOB:"+lobId);
     Debug.print("RoleManagementDAOImpl.viewPointMapExists() View:"+viewId);
     Debug.print("RoleManagementDAOImpl.viewPointMapExists() Grp:"+grpId);
     Debug.print("RoleManagementDAOImpl.viewPointMapExists() ProDom:"+domProcId);
    
     
     
     
     PreparedStatement prepStmt = null;
     boolean result = false;
     int cnt=0;
     
   
     makeConnection();
     try
     {
     	
         String selectStatement = "select count(*) from tblframeworkmapping where view_point_value_id=? and " +
         		"lob_value_id=? and view_id=? and group_value_id=? and process_domain_value_id=?";
         
         prepStmt = con.prepareStatement(selectStatement);
  		prepStmt.setString(1, viewPntId);  			
		prepStmt.setString(2, lobId);
		prepStmt.setString(3,viewId);  			
		prepStmt.setString(4, grpId);
		prepStmt.setString(5, domProcId);
		
                     
	   ResultSet rs = prepStmt.executeQuery();
    if(rs.next()){
         cnt = rs.getInt(1);
        if(cnt>0){
     	   result=true;   
        }
    }
           rs.close();
         prepStmt.close();
         releaseConnection();
         
     }
     catch(SQLException sql)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("SQL Exception in RoleManagementDAOImpl.viewPointMapExists():").append(sql.getMessage()).toString());
     }
     catch(Exception e)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("General Exception  in RoleManagementDAOImpl.viewPointMapExists():").append(e.getMessage()).toString());
     }
     
     Debug.print("RoleManagementDAOImpl.viewPointMapExists():"+result);
     return result;
 }
 
//==========================Dhivya Ends Here:=================================================  
 public Vector getLOBs(String viewPntId){
	  System.out.println("RoleManagementDAOImpl: selectLOBs()");
	Vector lobsLst = new Vector();
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {

String selectStatement = " select A.lob_value_id, B.layer_value from tblframeworkmapping A, tblFrameworkLayerMap B where " +
		"A.lob_value_id=B.layer_value_id and A.view_point_value_id=?";
          

prepStmt = con.prepareStatement(selectStatement);
prepStmt.setString(1, viewPntId);
rs = prepStmt.executeQuery();
        
         while(rs.next()){
             String lobValueId=rs.getString(1);
             String lobValueName= rs.getString(2);
                           
             String[] lobList = {lobValueId, lobValueName};
             lobsLst.add(lobList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
        
     } 
     catch(SQLException sql){
         releaseConnection();
         System.out.println("SQL Exception in RoleManagementDAOImpl.selectLOBs():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         System.out.println("General Exception  in RoleManagementDAOImpl.selectLOBs():" + e.getMessage());
     }
     return lobsLst;
 }

 
 public Vector getViews(String viewPntId, String lobId){
	  System.out.println("RoleManagementDAOImpl: selectViews()");
	  Vector viewObj = new Vector();
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     String selectStatement="";
     makeConnection();
	try {

		
		selectStatement = "select A.view_id, B.layer_value from tblframeworkmapping A," +
				" tblFrameworkLayerMap B where A.view_id=B.layer_value_id and " +
				"A.view_point_value_id=? and " +
				"A.lob_value_id=?";
		
		 prepStmt = con.prepareStatement(selectStatement);
		 prepStmt.setString(1, viewPntId);
		 prepStmt.setString(2, lobId);

rs = prepStmt.executeQuery();
        
         while(rs.next()){
             String viewId = rs.getString(1);
             String viewName = rs.getString(2);
             String[] viewList = {viewId, viewName};
             viewObj.add(viewList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
        
     } 
     catch(SQLException sql){
         releaseConnection();
         System.out.println("SQL Exception in RoleManagementDAOImpl.selectViews():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         System.out.println("General Exception  in RoleManagementDAOImpl.selectViews():" + e.getMessage());
     }
     return viewObj;
 }

public Vector getGroups(String viewPntId, String lobId){
	  System.out.println("RoleManagementDAOImpl: selectGroups()");
	  Vector grpObj = new Vector();
   PreparedStatement prepStmt = null;
   ResultSet rs = null;
   String selectStatement="";
   makeConnection();
	try {

		
		selectStatement = "select A.group_value_id, B.layer_value from tblframeworkmapping A, tblFrameworkLayerMap B where " +
				"A.group_value_id=B.layer_value_id and A.view_point_value_id=? and " +
				"A.lob_value_id=?";
		
		 prepStmt = con.prepareStatement(selectStatement);
		prepStmt.setString(1, viewPntId);
	 prepStmt.setString(2, lobId);

rs = prepStmt.executeQuery();
      
       while(rs.next()){
           String grpId = rs.getString(1);
           String grpName = rs.getString(2);
           String[] grpList = {grpId, grpName};
           grpObj.add(grpList);
       }
       rs.close();
       prepStmt.close();
       releaseConnection();
      
   } 
   catch(SQLException sql){
       releaseConnection();
       System.out.println("SQL Exception in RoleManagementDAOImpl.selectGroups():" + sql.getMessage());
   }
   catch(Exception e){
       releaseConnection();
       System.out.println("General Exception  in RoleManagementDAOImpl.selectGroups():" + e.getMessage());
   }
   return grpObj;
}

public Vector getProcessDomain(String viewPntId, String lobId, String grpId){
	  System.out.println("RoleManagementDAOImpl: selectProcessDomain()");
	  Vector proDomObj = new Vector();
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     String selectStatement="";
     makeConnection();
	try {

		
		selectStatement = "select A.process_domain_value_id, B.layer_value from tblframeworkmapping A, tblFrameworkLayerMap B where " +
				"A.process_domain_value_id=B.layer_value_id and A.view_point_value_id=? and " +
				"A.lob_value_id=? and A.group_value_id=?";
		
		 prepStmt = con.prepareStatement(selectStatement);
		prepStmt.setString(1, viewPntId);
		 prepStmt.setString(2, lobId);
		prepStmt.setString(3, grpId);

rs = prepStmt.executeQuery();
        
         while(rs.next()){
             String proDomId = rs.getString(1);
             String proDomName= rs.getString(2);
             String[] proDomList = {proDomId, proDomName};
             proDomObj.add(proDomList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
        
     } 
     catch(SQLException sql){
         releaseConnection();
         System.out.println("SQL Exception in RoleManagementDAOImpl.selectProcessDomain():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         System.out.println("General Exception  in RoleManagementDAOImpl.selectProcessDomain():" + e.getMessage());
     }
     return proDomObj;
 }


public boolean artifactMapExists(String viewPntId, String lobId, String viewId, String grpId, String domProcId, String artifactId)
{
    Debug.print("RoleManagementDAOImpl.artifactMapExists():"+viewPntId);
    Debug.print("RoleManagementDAOImpl.artifactMapExists():"+lobId);
    Debug.print("RoleManagementDAOImpl.artifactMapExists():"+viewId);
    Debug.print("RoleManagementDAOImpl.artifactMapExists():"+grpId);
    Debug.print("RoleManagementDAOImpl.artifactMapExists():"+domProcId);
    Debug.print("RoleManagementDAOImpl.artifactMapExists():"+artifactId); 
    
    
    PreparedStatement prepStmt = null;
    boolean result = false;
    int cnt=0;
    
    
    if(lobId.equals("")){
    	lobId=null;
    	
    }
    if(viewId.equals("")){
    	viewId=null;
    	
    }
    if(grpId.equals("")){
    	grpId=null;
    	
    }
    
    if(domProcId.equals("")){
    	
    	domProcId=null;
    }
    makeConnection();
    try
    {
    	if(viewPntId!=null && lobId==null && viewId==null && grpId==null && domProcId==null && artifactId!=null){
    	
        String selectStatement = "select count(*) from tblMapArtifact where view_point_value_id=? and artifact_id=?";
        
        prepStmt = con.prepareStatement(selectStatement);
 		prepStmt.setString(1, viewPntId);  			
		prepStmt.setString(2, artifactId);
    	}else if(viewPntId!=null && lobId!=null && viewId==null && grpId==null && domProcId==null && artifactId!=null){
    		String selectStatement = "select count(*) from tblMapArtifact where view_point_value_id=? and lob_value_id=? " +
    				"and artifact_id=?";	
    	
    		 prepStmt = con.prepareStatement(selectStatement);
      		prepStmt.setString(1, viewPntId);
   		 prepStmt.setString(2, lobId);
   		prepStmt.setString(3, artifactId);
   		
    	}
    	else if(viewPntId!=null && lobId!=null && viewId!=null && grpId==null && domProcId==null && artifactId!=null){
    		String selectStatement = "select count(*) from tblMapArtifact where view_point_value_id=? and lob_value_id=? " +
    				"and view_value_id=? and artifact_id=?";	
    	
    		 prepStmt = con.prepareStatement(selectStatement);
      		prepStmt.setString(1, viewPntId);
   		 prepStmt.setString(2, lobId);
   		 prepStmt.setString(3, viewId);
   		prepStmt.setString(4, artifactId);
   		
    	}
    	else if(viewPntId!=null && lobId!=null && viewId!=null && grpId!=null && domProcId==null && artifactId!=null){
    		String selectStatement = "select count(*) from tblMapArtifact where view_point_value_id=? and lob_value_id=? " +
    				"and view_value_id=? and group_value_id=? and artifact_id=?";	
    	
    		 prepStmt = con.prepareStatement(selectStatement);
      		prepStmt.setString(1, viewPntId);
   		 prepStmt.setString(2, lobId);
   		 prepStmt.setString(3, viewId);
   		prepStmt.setString(4, grpId);
   		prepStmt.setString(5, artifactId);
   		
    	}else if(viewPntId!=null && lobId!=null && viewId!=null && grpId!=null && domProcId!=null && artifactId!=null){
    		String selectStatement = "select count(*) from tblMapArtifact where view_point_value_id=? and lob_value_id=? " +
    				"and view_value_id=? and group_value_id=? and process_domain_value_id=? and artifact_id=?";	
    	
    		 prepStmt = con.prepareStatement(selectStatement);
      		prepStmt.setString(1, viewPntId);
   		 prepStmt.setString(2, lobId);
   		prepStmt.setString(3, viewId);
   		prepStmt.setString(4, grpId);
   		prepStmt.setString(5, domProcId);
   		prepStmt.setString(6, artifactId);
    	}
       
       
       
	   ResultSet rs = prepStmt.executeQuery();
   if(rs.next()){
        cnt = rs.getInt(1);
       if(cnt>0){
    	   result=true;   
       }
   }
          rs.close();
        prepStmt.close();
        releaseConnection();
        
    }
    catch(SQLException sql)
    {
        releaseConnection();
        Debug.print((new StringBuilder()).append("SQL Exception in RoleManagementDAOImpl.artifactMapExists():").append(sql.getMessage()).toString());
    }
    catch(Exception e)
    {
        releaseConnection();
        Debug.print((new StringBuilder()).append("General Exception  in RoleManagementDAOImpl.artifactMapExists():").append(e.getMessage()).toString());
    }
    
    Debug.print("RoleManagementDAOImpl.artifactMapExists():"+result);
    return result;
}

public ArrayList getAllViewsBasedOnViewPoint(String viewPointId){
	  System.out.println("RoleManagementDAOImpl: getAllViewsBasedOnViewPoint()");
    ArrayList viewList = new ArrayList();
    PreparedStatement prepStmt = null;
    ResultSet rs = null;
    makeConnection();
	try {

String selectStatement = "select a.layer_value_id,a.layer_value from tblframeworklayermap a,tblviewpointmaster b where a.view_point_id=b.view_point_id and a.view_point_id = ?";
         

prepStmt = con.prepareStatement(selectStatement);
prepStmt.setString(1, viewPointId);

rs = prepStmt.executeQuery();
       
        while(rs.next()){
            String layerId = rs.getString(1);
            String layerName = rs.getString(2);
            String[] viList = {layerId, layerName};
            viewList.add(viList);
        }
        rs.close();
        prepStmt.close();
        releaseConnection();
       
    } 
    catch(SQLException sql){
        releaseConnection();
        System.out.println("SQL Exception in RoleManagementDAOImpl.getAllViewsBasedOnViewPoint():" + sql.getMessage());
    }
    catch(Exception e){
        releaseConnection();
        e.printStackTrace();
    }
    return viewList;
}


public boolean insertFrameworkMapDetails(String viewPointId,HLCMenuListVO objMap, HLCMenuListVO objArti)
{
    Debug.print("RoleManagementDAOImpl.insertFrameworkMapDetails():");
    Debug.print("RoleManagementDAOImpl.insertFrameworkMapDetails():"+viewPointId);
    
    PreparedStatement prepStmt = null;
    boolean result = false;
    makeConnection();
    try
    {
        String insertStatement = "insert into tblframeworkmapping (view_point_value_id, lob_value_id, view_id, group_value_id, process_domain_value_id) values( ?,?,?,?,?)";
        prepStmt = con.prepareStatement(insertStatement);
        prepStmt.setString(1, viewPointId);
        prepStmt.setString(2, objMap.getLobLayerId());
        prepStmt.setString(3, objMap.getViewPtId());
        prepStmt.setString(4, objMap.getGroupsId());
        prepStmt.setString(5, objMap.getProcessDomainId());
      
        prepStmt.executeUpdate();
        prepStmt.close();
        releaseConnection();
        result = true;
    }
    catch(SQLException sql)
    {
        releaseConnection();
        Debug.print((new StringBuilder()).append("SQL Exception in RoleManagementDAOImpl.insertFrameworkMapDetails():").append(sql.getMessage()).toString());
    }
    catch(Exception e)
    {
        releaseConnection();
        Debug.print((new StringBuilder()).append("General Exception  in RoleManagementDAOImpl.insertFrameworkMapDetails():").append(e.getMessage()).toString());
    }
    
    Debug.print("RoleManagementDAOImpl.insertFrameworkMapDetails():"+result);
    return result;
}


// Membership action dB start here-----------------------------------------------------------------------------------


public ArrayList getAllDonationDetails(){
    Debug.print("DonationDAO.getAllDonationDetails():");
    ArrayList donationList = new ArrayList();
    PreparedStatement prepStmt = null;
    makeConnection();
    try {
         String selectStatement = "select donation_id, donation_name, active_status, donation_price,precheck_status from tblDonationDetails " +
         		"WHERE active_status = ? order by priority_value ";
                
        prepStmt = con.prepareStatement(selectStatement);
        prepStmt.setBoolean(1, true);
        ResultSet rs = prepStmt.executeQuery();
        while(rs.next()){
            HLCDonationVO objDonVO = new HLCDonationVO();
            String donationId = rs.getString(1);
            String donationName = rs.getString(2);
            boolean status = rs.getBoolean(3);
            String donationPrice = rs.getString(4);
            boolean precheckStatus = rs.getBoolean(5);
            
            objDonVO.setDonationId(donationId);
            objDonVO.setDonationName(donationName);
            objDonVO.setDonationPrice(donationPrice);
            objDonVO.setActiveStatus(status);
            objDonVO.setPrecheckStatus(precheckStatus);
            donationList.add(objDonVO);
        }
        rs.close();
        prepStmt.close();
        releaseConnection();
    }
catch(SQLException sql){
    releaseConnection();
    Debug.print("SQL Exception in DonationDAO.getAllDonationDetails():" + sql.getMessage());
}
catch(Exception e){
    releaseConnection();
    Debug.print("General Exception  in DonationDAO.getAllDonationDetails():" + e.getMessage());
}
return donationList;
}

public ArrayList getAllPublicationDetails(){
    Debug.print("PublicationDAO.getAllPublicationDetails():");
    ArrayList publicationList = new ArrayList();
    PreparedStatement prepStmt = null;
    makeConnection();
    try {
         String selectStatement = "select publication_id, publication_name from tblMemberSubscription";
                   
        Debug.print("Result Query:"+ selectStatement);        
        prepStmt = con.prepareStatement(selectStatement);
        ResultSet rs = prepStmt.executeQuery();
        while(rs.next()){
            
            HLCPublicationVO objDonVO = new HLCPublicationVO();
            String publicationId = rs.getString(1);
            String publicationName = rs.getString(2);
           
            Debug.print("publicationId:"+ publicationId);       
            Debug.print("publicationName:"+ publicationName);       
            objDonVO.setPublicationId(publicationId);
            objDonVO.setPublicationName(publicationName);
             
            publicationList.add(objDonVO);
        }
        rs.close();
        prepStmt.close();
        releaseConnection();
    }
catch(SQLException sql){
    releaseConnection();
    Debug.print("SQL Exception in PublicationDAO.getAllPublicationDetails():" + sql.getMessage());
}
catch(Exception e){
    releaseConnection();
    Debug.print("General Exception  in PublicationDAO.getAllPublicationDetails():" + e.getMessage());
}
return publicationList;
}

//Membership action dB End here----------------------------------------------------------------------------------- 


public boolean addMembershipTypeMaster(HLCMembershipTypeMaster objMemberType) throws RemoteException {
    Debug.print("objMemberType:" + objMemberType.getUserTypeId());
    boolean result = false;
   
    result = isMembershipTypeExist(objMemberType.getUserTypeId(),objMemberType.getMembershipTypeId(),objMemberType.getMembershipTypeName(), objMemberType.getMembership_year());
   
    if (result) {
        return false;
    } else {
        try {
            boolean res = insertMemberType(objMemberType);
            if(res==true){
            	result=res;	
            }else{
            	result=false;	
            }
        } catch (Exception exp) {
            throw new EJBException("createMembershipTypeMaster : " + exp.getMessage());
        }
    }
    return true;
}
/**
 * Name         :isMembershipTypeExist
 * Description  :This method will check Membership Type Existance
 * @ param      :None
 * @return      :member Identification number
 * @throws      :RemoteException, FinderException
 */

public boolean isMembershipTypeExist(String userTypeId,String membershipTypeId,String membershipTypeName, int membership_year) {
     Debug.print("isMembershipTypeExist userTypeId :" +userTypeId );
     Debug.print("isMembershipTypeExist membershipTypeId :" + membershipTypeId);
    
    Debug.print("isMembershipTypeExist membershipTypeName :" + membershipTypeName);
    Debug.print("isMembershipTypeExist membership_year :" + membership_year);
    boolean status = false;
    try {
        makeConnection();
       
            Debug.print("if");
        String selectStatement = "SELECT a.membership_type_id FROM tblMembershipTypeMaster " +
        		"a where a.user_type_id= ? and a.membership_type_name = ? and membership_year = datepart(year,getdate())";
        Debug.print("selectStatement :" + selectStatement);
        prepStmt = con.prepareStatement(selectStatement);
        prepStmt.setString(1, userTypeId);
        prepStmt.setString(2, membershipTypeName);
   
        rs = prepStmt.executeQuery();
        if (rs.next()) {
            status = true;
        }
        Debug.print("record existance status :" + status);
        rs.close();
        prepStmt.close();
    } catch (SQLException sqe) {
        Debug.print("SQLException in isMembershipTypeExist :");
        sqe.printStackTrace();
    } catch (Exception e) {
        Debug.print("Exception in isMembershipTypeExist :" + e);
    } finally {
        releaseConnection();
    }
    return status;
}
public boolean insertMemberType(HLCMembershipTypeMaster objMemTypeMaster) throws CreateException {

    Debug.print("insertMemberType::");
    boolean res=false;
    if(objMemTypeMaster==null){
            throw new EJBException("ejbCreate: objMemTypeMaster argument is null or empty");
    }
    String membershipAmount=objMemTypeMaster.getMembershipAmount();
    double amt = Double.parseDouble(membershipAmount);
    //for bug ends
     makeConnection();
    try {
       
        String insertStatement = "insert into tblMembershipTypeMaster ( membership_type_name, membership_amount, user_type_id, priority_value, transaction_type_id,active_status, membership_year,duration ) values ( ? , ? , ? , ? , ? , ?, datepart(year,getdate()),?)";
         Debug.print("Query Log :"+insertStatement);

         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, objMemTypeMaster.getMembershipTypeName());
         prepStmt.setDouble(2, amt);
         prepStmt.setString(3, objMemTypeMaster.getUserTypeId());
         prepStmt.setString(4, objMemTypeMaster.getPeriodValue());
         prepStmt.setString(5, objMemTypeMaster.getTransaction_type_id());
         prepStmt.setInt(6,objMemTypeMaster.getActive_Status());
        // prepStmt.setInt(7, objMemTypeMaster.getMembership_year());
         prepStmt.setString(7, objMemTypeMaster.getDuration());
         int cnt = prepStmt.executeUpdate();
         System.out.println("successfully inserted into MembershipTypeMaster  : "+cnt);
         if(cnt>=1){
        	 res=true; 
         }
         prepStmt.close();
         releaseConnection();
    } catch (Exception ex) {
        throw new EJBException("ejbCreate: MembershipTypeMaster  --- " + ex.getMessage());
    }
    return res;
}

public boolean editHumanMembershipTypeMaster(HLCMembershipTypeMaster objMemberType) throws RemoteException, FinderException {
    System.out.print("GeneralDBAction MembershipType ID : " + objMemberType.getMembershipTypeId());
    boolean result = false;

    if (objMemberType == null || objMemberType.getMembershipTypeId() == null || objMemberType.getMembershipTypeId().trim().length() == 0) {
        result = false;
        throw new EJBException("MembershipType ID can't be empty");
    }
   
    else {
        if (memberTypeIdExists(objMemberType.getMembershipTypeId()) == false) {
           
            result = false;
        } else {
        	
        	try {
                System.out.println("GenerealDBAction: Edit MembershipType");
                String membershipAmount=objMemberType.getMembershipAmount();
                double amt = Double.parseDouble(membershipAmount);
                
                makeConnection();
                String updateStatement = "update tblMembershipTypeMaster " +
                		"set membership_type_name = ?, membership_amount = ?, duration = ?, active_status = ? , priority_value = ? , transaction_type_id = ? , membership_year = ?  where membership_type_id = ?";
                Debug.print("Query Log :"+updateStatement);

                PreparedStatement prepStmt = con.prepareStatement(updateStatement);
               
                prepStmt.setString(1, objMemberType.getMembershipTypeName());
                Debug.print("objMemberType.getMembershipTypeName() in DBAction:: "+objMemberType.getMembershipTypeName());
                prepStmt.setDouble(2, amt);
                Debug.print(membershipAmount);
                prepStmt.setString(3, objMemberType.getDuration());
                Debug.print("duration"+objMemberType.getDuration());
                prepStmt.setInt(4, objMemberType.getActive_Status());
                System.out.print(objMemberType.getActive_Status());

             //   prepStmt.setString(5, userTypeId);
             //   Debug.print("set usertypeID "+userTypeId);
                prepStmt.setString(5, objMemberType.getPeriodValue());
                Debug.print(objMemberType.getPeriodValue());
                prepStmt.setString(6, objMemberType.getTransaction_type_id());
                  Debug.print(objMemberType.getTransaction_type_id());
                prepStmt.setInt(7, objMemberType.getMembership_year());
                prepStmt.setString(8, objMemberType.getMembershipTypeId());
                Debug.print("set membership type id"+objMemberType.getMembershipTypeId());
                int rowCount = prepStmt.executeUpdate();
                Debug.print("ejbStore Sucessfully Updated." + rowCount);
                if(rowCount>=1){
                	result = true;	
                }
                prepStmt.close();
            } catch (Exception ex) {
               throw new EJBException("ejbStore: " + ex.getMessage());
               // ex.printStackTrace();
            }finally {
                releaseConnection();
            }
                
        }
    }
    return result;
}

/**
 * Name         :memberExists
 * Description  :This method will check for the existing of memberId and call the findByPrimaryKey method
 * @ param      :None
 * @return      :boolean value
 * @throws      :none
 */
private boolean memberTypeIdExists(String membershipTypeId) {
    boolean result = false;
//Debug.print("Kavery Session Bean contactTypeIdExists in side loop: "+contactTypeId);
    if (membershipTypeId != null) {
        try {
            //  Debug.print("Kavery Session Bean contactTypeIdExists in side loop: "+contactTypeId);
            String memeTypId = selectMembId(membershipTypeId);
           if(memeTypId!=null){
        	   result = true;   
           }
           
        } catch (Exception ex) {
          //  result = true;
            System.out.println("Exception:" + ex);
        }
    }
    Debug.print("Kavery Session Bean memberTypeIdExists  " + result);
    return result;
}

public String selectorder_id()  throws RemoteException {
    
    char[] CHARSET_AZ_09 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
	//random alphanew=new random();
	//alphanew.randomString(CHARSET_AZ_09, 20);
	System.out.println(randomalpha(CHARSET_AZ_09, 8));
	String alpha_randomid=randomalpha(CHARSET_AZ_09, 8);
  
return alpha_randomid;
}
public String selectorder_id(String email)
{
 String map_id=null;
  
     
      try {
       makeConnection();
        String str="SELECT order_id FROM tblSignUpDetails WHERE e_mail=?";
              
        prepStmt = con.prepareStatement(str);
           prepStmt.setString(1,email);
          
           rs = prepStmt.executeQuery();
           if (rs.next()){
            map_id = rs.getString(1);
                         }
            
      
           rs.close();
      prepStmt.close();
      
      releaseConnection(); 
   } 
      catch (Exception ex) {
        ex.printStackTrace();
            //Debug.print("Exception:" + ex.getMessage());
       }finally {
           releaseConnection();
       }
     
  return map_id;
}
public String selectInstitutionId(String email)
{
 String map_id=null;
  
     
      try {
       makeConnection();
        String str="SELECT customer_id FROM tblSignUpDetails WHERE e_mail=?";
              
        prepStmt = con.prepareStatement(str);
           prepStmt.setString(1,email);
          
           rs = prepStmt.executeQuery();
           if (rs.next()){
            map_id = rs.getString(1);
                         }
            
      
           rs.close();
      prepStmt.close();
      
      releaseConnection(); 
   } 
      catch (Exception ex) {
        ex.printStackTrace();
            //Debug.print("Exception:" + ex.getMessage());
       }finally {
           releaseConnection();
       }
     
  return map_id;
}

public String selectMembId(String membershipTypeId) throws FinderException {
    boolean result = false;
    String membershipTypeID=null;
    try {
       makeConnection();
       String selectStatement = "SELECT membership_type_id FROM tblMembershipTypeMaster " +
       		"WHERE membership_type_id = ? order by priority_value";

       PreparedStatement prepStmt = con.prepareStatement(selectStatement);
       prepStmt.setString(1, membershipTypeId.trim());
       ResultSet rs = prepStmt.executeQuery();
       if( rs.next()) {
    	   membershipTypeID = rs.getString(1);
       }
       prepStmt.close();
    }catch (Exception e){
        e.printStackTrace();
    }finally {
        releaseConnection();
    }
    return membershipTypeID;
}
   
    public String selectsubscription_id(String email)
    {
     String map_id=null;
      
         
          try {
           makeConnection();
            String str="SELECT subscription_id FROM tblSignUpDetails WHERE e_mail=?";
                  
            prepStmt = con.prepareStatement(str);
               prepStmt.setString(1,email);
              
               rs = prepStmt.executeQuery();
               if (rs.next()){
                map_id = rs.getString(1);
                             }
                
          
               rs.close();
          prepStmt.close();
          
          releaseConnection(); 
       } 
          catch (Exception ex) {
            ex.printStackTrace();
                //Debug.print("Exception:" + ex.getMessage());
           }finally {
               releaseConnection();
           }
         
      return map_id;
    }
    
    public static String randomString(char[] characterSet, int length) {
        java.util.Random random = new SecureRandom();
        char[] result = new char[length];
        for (int i = 0; i < result.length; i++) {
            // picks a random index out of character set > random character
            int randomCharIndex = random.nextInt(characterSet.length);
            result[i] = characterSet[randomCharIndex];
        }
        return new String(result);
    }
    public String updateusersignup(String firstname,String lastname,String e_mail,String mobileno,String institution_name, String country, String state, String city, String credit_card_type, String credit_card_no, String cvv_no,String name_on_card, String expiry_date, String productPrice, String pay_subscriptionType, String purchaseType, String productPlan, String coupon_valid, String coupon_status, String coupon_value, String coupon_description, String coupon_code, String street_name, String zipcode) throws RemoteException
    {
    	String username=null;
    	String comp_id=selectcompany_id();
    	String reg_id = selectRegistration_id();
		
//		if(lastname.length()>=4){
//			username=lastname.substring(0, 4);					
//		}
//		
//		else if(lastname.length()!=0 && lastname!=null){
//			if(firstname.length()>=4){
//				username=firstname.substring(0, 4);						
//			}
//			else if(firstname.length()<4 && firstname.length()==3){
//				username=firstname+lastname.substring(0, 1);						
//			}			
//		}
//		else{
			if(firstname.length()>=4){
				username=firstname.substring(0, 4);						
			}
			else if(firstname.length()<4 && firstname.length()==3){
				username=firstname+'W';						
			}				
		//}
		
		int countcmid=reg_id.length()-4;
		  username=username+"MF"+reg_id.substring(countcmid);

		System.out.println(username);
		


		  final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			Random rnd = new Random();
			int len=8;							
			StringBuilder sb = new StringBuilder( len );
			   for( int i = 0; i < len; i++ ) {
			     sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );			
			   }							  
		String password=sb.toString();

		System.out.println(password);
    
    System.out.println("comp_id in insert method ::::::::::::::::::"+comp_id);
    //String sub_id=selectSubscriptionID();
    //String order_id = selectOrderID();
    String sub_id = getRandomNumber();
    String order_id = generateRandomString();
    
    System.out.println("coupon_valid in db action::::::::::"+coupon_valid);
    int coupon_valid_int = 1;
    Date expiryDate = new java.sql.Date(Calendar.getInstance().getTimeInMillis());
    
    if(coupon_valid != null && coupon_valid != "null" && !(coupon_valid.equalsIgnoreCase("null"))){
		coupon_valid_int = Integer.parseInt(coupon_valid);
		//System.out.println("inside coupon valid coupon_valid_int "+coupon_valid_int);
	

			System.out.println(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(expiryDate));
			
			Calendar cal1 = Calendar.getInstance();
			cal1.setTime(expiryDate);
			cal1.set(Calendar.MONTH, (cal1.get(Calendar.MONTH)+coupon_valid_int));
			expiryDate = cal1.getTime();
			//System.out.println(expiryDate);
			System.out.println(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(expiryDate));
			//String dateinsql = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(expiryDate);
			//Date newdate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").parse(dateinsql);
			//java.sql.Date d1 = new java.sql.Date(newdate.getTime());
			//System.out.println("new date "+d1);
			
				}else{
					
					System.out.println(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(expiryDate));
				    
				    Calendar cal1 = Calendar.getInstance();
				    cal1.setTime(expiryDate);
				    cal1.set(Calendar.MONTH, (cal1.get(Calendar.MONTH)+coupon_valid_int));
				    expiryDate = cal1.getTime();
					//System.out.println(expiryDate);
					System.out.println(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(expiryDate));
				}
    
    String regStatusId=null;   

    try{

    makeConnection(); 

    String insertStmt=  "update tblSignUpDetails SET first_name = ?, last_name = ?, e_mail = ?, mobile = ?, institution_name = ?, country = ?, state = ?, city = ?, credit_card_type = ?, credit_card_no = ?, cvv_no = ?, name_on_card = ?, expiry_date = ?, product_price = ? , subscription_type = ? , subscription_id = ? , order_id = ?, purchase_type = ? , product_plan = ?  , registration_id = ? , product_expiry_date = ? ,coupon_code = ? ,coupon_value = ? ,coupon_status = ?, street = ?, zipcode = ? where e_mail = ? ";

      prepStmt = con.prepareStatement(insertStmt);
      
      prepStmt.setString(1,firstname);
      prepStmt.setString(2,lastname);
      prepStmt.setString(3, e_mail);
      prepStmt.setString(4,mobileno);
      prepStmt.setString(5,institution_name);
      prepStmt.setString(6,country);
      prepStmt.setString(7,state);
      prepStmt.setString(8,city);
      prepStmt.setString(9,credit_card_type);
      prepStmt.setString(10,credit_card_no);
      prepStmt.setString(11,cvv_no);
      prepStmt.setString(12, name_on_card);
      prepStmt.setString(13, expiry_date);
      //prepStmt.setString(14,comp_id);
      prepStmt.setString(14,productPrice);
      prepStmt.setString(15,pay_subscriptionType);
      prepStmt.setString(16,sub_id);
      prepStmt.setString(17,order_id);
      prepStmt.setString(18,purchaseType);
      prepStmt.setString(19,productPlan);
      //prepStmt.setString(21,username);
      //prepStmt.setString(22,password);
      prepStmt.setString(20,reg_id);
      prepStmt.setString(21,new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(expiryDate));
      prepStmt.setString(22,coupon_code);
      prepStmt.setString(23,coupon_value);
      prepStmt.setString(24,coupon_status);
      prepStmt.setString(25, street_name);
      prepStmt.setString(26, zipcode);
      prepStmt.setString(27, e_mail);
      
     
      
      
      int cnt= prepStmt.executeUpdate();
      if(cnt>0){
          System.out.println("Customer data's are successfully updated on database----------------->");
    	  regStatusId=reg_id;  
        }
       prepStmt.close();

    } 
    catch (SQLException sqe) {
    sqe.printStackTrace();
      releaseConnection();
            
    } finally {
      releaseConnection();
    }
    return regStatusId;

    }
    
 public String selectcompany_id()  throws RemoteException {
        
        String empid = null;
        String regYearMonth = null;
        
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		   //get current date time with Date()
		   Date date = new Date();
		   System.out.println("Here is registred date :::::::::::::::::"+dateFormat.format(date));
		   String dateval = dateFormat.format(date);
		   String [] regSplitDate = dateval.split("/");
		   String regYear = regSplitDate[0];
		  String regMonth = regSplitDate[1];
		  String regshortYear = regYear.substring(2);
		  regYearMonth = regshortYear+regMonth;
		  System.out.println("regYearMonth :::::::"+regYearMonth);
        
        PreparedStatement prepSelect = null;
        makeConnection();
        try {
        	System.out.println("inside the try :::::::::::::::::::");
            String selectStatement = "SELECT MAX(CAST(SUBSTRING(customer_id, 7, len(customer_id)-6) AS int)) FROM tblSignUpDetails";
            System.out.println("before prepare stmt ::::::::::::::::");
            prepSelect = con.prepareStatement(selectStatement);
            
            ResultSet rs = prepSelect.executeQuery();
            while (rs.next()) {
             empid = rs.getString(1);
             System.out.println("emp id in while loop"+empid);
            }
            if (empid == null)
             empid = "0";
           
            long nextId = Long.valueOf(empid).longValue();
            
            if(nextId==0){
            	
                //nextId = 10101000;
     		   
     		   nextId = 1;
     		   System.out.println("nextId in ==0 :::::::::::"+nextId);
            } else{
            	
                nextId = nextId+1;
                System.out.println("nextId in != 0 :::::::::::"+nextId);
            }
            rs.close();
            prepSelect.close();
            empid = regYearMonth+"KW"+Long.toString(nextId);
            System.out.println("empid in select cust id :::::::::::::::::"+empid);
           
            //prepStmt.close();
            releaseConnection();
           
        } catch(SQLException sql){
        	System.out.println(sql);
            releaseConnection();
                  }
       
        return empid;
    }

    public String selectsubscription_id()  throws RemoteException {
        
        char[] CHARSET_AZ_09 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
    	//random alphanew=new random();
    	//alphanew.randomString(CHARSET_AZ_09, 20);
    	System.out.println(randomString(CHARSET_AZ_09, 16));
    	String alpha_random=randomString(CHARSET_AZ_09, 16);
      
    return alpha_random;
}
public static String randomalpha(char[] characterSet, int length) {
    java.util.Random random = new SecureRandom();
    char[] result = new char[length];
    for (int i = 0; i < result.length; i++) {
        // picks a random index out of character set > random character
        int randomCharIndex = random.nextInt(characterSet.length);
        result[i] = characterSet[randomCharIndex];
    }
    return new String(result);
}

public String selectcustomer_id(String email)
{
 String map_id=null;
  
     
      try {
       makeConnection();
        String str="SELECT customer_id FROM tblSignUpDetails WHERE e_mail=?";
              
        prepStmt = con.prepareStatement(str);
           prepStmt.setString(1,email);
          
           rs = prepStmt.executeQuery();
           if (rs.next()){
            map_id = rs.getString(1);
                         }
            
      
           rs.close();
      prepStmt.close();
      
      releaseConnection(); 
   } 
      catch (Exception ex) {
        ex.printStackTrace();
            //Debug.print("Exception:" + ex.getMessage());
       }finally {
           releaseConnection();
       }
     
  return map_id;
}

public String selectcustomer_id()  throws RemoteException {
	 String count = null;
   String empid = null;
   PreparedStatement prepSelect = null;
  
   makeConnection();
   try {
       String selectStatement = "SELECT max(cast(count as int)) from tblSignUpDetails";
       
       prepSelect = con.prepareStatement(selectStatement);
       
       ResultSet rs = prepSelect.executeQuery();
       while (rs.next()) {
        empid = rs.getString(1);
       }
       if (empid == null)
        empid = "0";
       
       long nextId = Long.valueOf(empid).longValue();
       
       if(nextId==0){
           nextId = 01;
       } else{
           nextId = nextId+1;
           
       }
       rs.close();
       prepSelect.close();
       empid = Long.toString(nextId);
      
       //prepStmt.close();
       releaseConnection();
      
   } catch(SQLException sql){
       releaseConnection();
             }
  
   return empid;
}


/*----------------------------------user sign up action-----------------------------------------------*/
public String insertsignup(String firstname,String lastname,String e_mail,String mobileno,String institution_name, String country, String state, String city, String credit_card_type, String credit_card_no, String cvv_no,String name_on_card, String expiry_date, String productPrice, String pay_subscriptionType, String purchaseType, String productPlan, String coupon_valid, String coupon_status, String coupon_value, String coupon_description, String coupon_code, String street_name, String zipcode) throws RemoteException, ParseException
{
	String username=null;
	String comp_id=selectcompany_id();
	String reg_id = selectRegistration_id();
	
//	if(lastname.length()>=4){
//		username=lastname.substring(0, 4);					
//	}
//	
//	else if(lastname.length()!=0 && lastname!=null){
//		if(firstname.length()>=4){
//			username=firstname.substring(0, 4);						
//		}
//		else if(firstname.length()<4 && firstname.length()==3){
//			username=firstname+lastname.substring(0, 1);						
//		}			
//	}
//	else{
		if(firstname.length()>=4){
			username=firstname.substring(0, 4);						
		}
		else if(firstname.length()<4 && firstname.length()==3){
			username=firstname+'W';						
		}				
	//}
	
	int countcmid=reg_id.length()-4;
	  username=username+"KW"+reg_id.substring(countcmid);

	System.out.println(username);
	


	  final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		Random rnd = new Random();
		int len=8;							
		StringBuilder sb = new StringBuilder( len );
		   for( int i = 0; i < len; i++ ) {
		     sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );			
		   }							  
	String password=sb.toString();

	System.out.println(password);
String regStatusId=null;   

System.out.println("comp_id in insert method ::::::::::::::::::"+comp_id);
//String sub_id=selectSubscriptionID();
//String order_id = selectOrderID();
String sub_id = getRandomNumber();
String order_id = generateRandomString();

System.out.println("coupon_valid in db action::::::::::"+coupon_valid);
int coupon_valid_int = 1;
Date expiryDate = new java.sql.Date(Calendar.getInstance().getTimeInMillis());

if(purchaseType.equalsIgnoreCase("try_now")){
	
	if(coupon_valid != null && coupon_valid != "null" && !(coupon_valid.equalsIgnoreCase("null"))){
		coupon_valid_int = Integer.parseInt(coupon_valid);
		//System.out.println("inside coupon valid coupon_valid_int "+coupon_valid_int);
	

System.out.println(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(expiryDate));

Calendar cal1 = Calendar.getInstance();
cal1.setTime(expiryDate);
cal1.set(Calendar.MONTH, (cal1.get(Calendar.MONTH)+coupon_valid_int));
expiryDate = cal1.getTime();
//System.out.println(expiryDate);
System.out.println(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(expiryDate));
//String dateinsql = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(expiryDate);
//Date newdate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").parse(dateinsql);
//java.sql.Date d1 = new java.sql.Date(newdate.getTime());
//System.out.println("new date "+d1);

	}else{
		
		System.out.println(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(expiryDate));
	    
	    Calendar cal1 = Calendar.getInstance();
	    cal1.setTime(expiryDate);
	    cal1.set(Calendar.MONTH, (cal1.get(Calendar.MONTH)+coupon_valid_int));
	    expiryDate = cal1.getTime();
		//System.out.println(expiryDate);
		System.out.println(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(expiryDate));
	}


try{


makeConnection(); 
String insertStmt=  "Insert into tblSignUpDetails(first_name,last_name,e_mail,mobile,institution_name,country,state,city,credit_card_type,credit_card_no,cvv_no,name_on_card,expiry_date,customer_id, product_price, subscription_type, subscription_id, order_id, purchase_type, product_plan, user_name, user_password, registration_id, product_expiry_date, coupon_code, coupon_value, coupon_status, street, zipcode) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";


prepStmt = con.prepareStatement(insertStmt);

prepStmt.setString(1,firstname);
prepStmt.setString(2,lastname);
prepStmt.setString(3, e_mail);
prepStmt.setString(4,mobileno);
prepStmt.setString(5,institution_name);
prepStmt.setString(6,country);
prepStmt.setString(7,state);
prepStmt.setString(8,city);
prepStmt.setString(9,credit_card_type);
prepStmt.setString(10,credit_card_no);
prepStmt.setString(11,cvv_no);
prepStmt.setString(12, name_on_card);
prepStmt.setString(13, expiry_date);
prepStmt.setString(14,comp_id);
prepStmt.setString(15,productPrice);
prepStmt.setString(16,pay_subscriptionType);
prepStmt.setString(17,sub_id);
prepStmt.setString(18,order_id);
prepStmt.setString(19,purchaseType);
prepStmt.setString(20,productPlan);
prepStmt.setString(21,username);
prepStmt.setString(22,password);
prepStmt.setString(23,reg_id);
prepStmt.setString(24,new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(expiryDate));
prepStmt.setString(25,coupon_code);
prepStmt.setString(26,coupon_value);
prepStmt.setString(27,coupon_status);
prepStmt.setString(28, street_name);
prepStmt.setString(29, zipcode);
  
  
  
 
  
  
  int cnt= prepStmt.executeUpdate();
  if(cnt>0){
      
	  regStatusId=reg_id;  
    }
   prepStmt.close();

} 
catch (SQLException sqe) {
  releaseConnection();
 sqe.printStackTrace();       
} finally {
  releaseConnection();
}

}else if(purchaseType.equalsIgnoreCase("buy_now")){
	 System.out.println(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(expiryDate));
	    
	    Calendar cal1 = Calendar.getInstance();
	    cal1.setTime(expiryDate);
	    cal1.set(Calendar.MONTH, (cal1.get(Calendar.MONTH)+coupon_valid_int));
	    expiryDate = cal1.getTime();
		//System.out.println(expiryDate);
		System.out.println(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(expiryDate));

    try{


    makeConnection(); 
    String insertStmt=  "Insert into tblSignUpDetails(first_name,last_name,e_mail,mobile,institution_name,country,state,city,credit_card_type,credit_card_no,cvv_no,name_on_card,expiry_date,customer_id, product_price, subscription_type, subscription_id, order_id, purchase_type, product_plan, user_name, user_password, registration_id, product_expiry_date, coupon_code, coupon_value, coupon_status, street, zipcode) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    

    prepStmt = con.prepareStatement(insertStmt);
    
    prepStmt.setString(1,firstname);
    prepStmt.setString(2,lastname);
    prepStmt.setString(3, e_mail);
    prepStmt.setString(4,mobileno);
    prepStmt.setString(5,institution_name);
    prepStmt.setString(6,country);
    prepStmt.setString(7,state);
    prepStmt.setString(8,city);
    prepStmt.setString(9,credit_card_type);
    prepStmt.setString(10,credit_card_no);
    prepStmt.setString(11,cvv_no);
    prepStmt.setString(12, name_on_card);
    prepStmt.setString(13, expiry_date);
    prepStmt.setString(14,comp_id);
    prepStmt.setString(15,productPrice);
    prepStmt.setString(16,pay_subscriptionType);
    prepStmt.setString(17,sub_id);
    prepStmt.setString(18,order_id);
    prepStmt.setString(19,purchaseType);
    prepStmt.setString(20,productPlan);
    prepStmt.setString(21,username);
    prepStmt.setString(22,password);
    prepStmt.setString(23,reg_id);
    prepStmt.setString(24,new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS").format(expiryDate));
    prepStmt.setString(25,coupon_code);
    prepStmt.setString(26,coupon_value);
    prepStmt.setString(27,coupon_status);
    prepStmt.setString(28, street_name);
    prepStmt.setString(29, zipcode);

      
      int cnt= prepStmt.executeUpdate();
      if(cnt>0){
          
    	  regStatusId=reg_id;  
        }
       prepStmt.close();

    } 
    catch (SQLException sqe) {
      releaseConnection();
     sqe.printStackTrace();       
    } finally {
      releaseConnection();
    }
}
return regStatusId;

}
  
/** * This method generates random string * @return */
public String generateRandomString()
{ 
	  final String CHAR_LIST = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	  final int RANDOM_STRING_LENGTH = 8;
	StringBuffer randStr = new StringBuffer();
	for(int i=0; i<RANDOM_STRING_LENGTH; i++)
	{ 
		int number = getRandomNumberForAlphaNum(); 
		char ch = CHAR_LIST.charAt(number); 
		randStr.append(ch); 
		} 
	return randStr.toString(); 
	} 
/** * This method generates random numbers * @return int */ 
private int getRandomNumberForAlphaNum() 
{ 
	final String CHAR_LIST = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	final int RANDOM_STRING_LENGTH = 8;
	int randomInt = 0; Random randomGenerator = new Random();
	randomInt = randomGenerator.nextInt(CHAR_LIST.length());
	if (randomInt - 1 == -1)
	{ 
		return randomInt;
	} else 
{
	return randomInt - 1;
}
	} 

private String getRandomNumber() 
{ 
	String randomInt = new String(); 
	Random r = new Random();
	String otp = new String();
	for(int i=0 ; i < 16 ; i++) {
		randomInt += r.nextInt(10);
	}
	
	return randomInt;
}
public String selectTryInstitutionId(String email, String regStatusId)
{
 String map_id=null;
  
     
      try {
       makeConnection();
        String str="SELECT customer_id FROM tblSignUpDetails WHERE e_mail=? and purchase_type='try_now' and registration_id=?";
              
        prepStmt = con.prepareStatement(str);
           prepStmt.setString(1,email);
           prepStmt.setString(2,regStatusId);
          
           rs = prepStmt.executeQuery();
           if (rs.next()){
            map_id = rs.getString(1);
                         }
            
      
           rs.close();
      prepStmt.close();
      
      releaseConnection(); 
   } 
      catch (Exception ex) {
        ex.printStackTrace();
            //Debug.print("Exception:" + ex.getMessage());
       }finally {
           releaseConnection();
       }
     
  return map_id;
}

public String selectTryCustomerOrderId(String email, String regStatusId)
{
 String order_id=null;
  
     
      try {
       makeConnection();
        String str="SELECT order_id FROM tblSignUpDetails WHERE e_mail=? and purchase_type='try_now' and registration_id = ?";
              
        prepStmt = con.prepareStatement(str);
           prepStmt.setString(1,email);
           prepStmt.setString(2,regStatusId);
          
           rs = prepStmt.executeQuery();
           if (rs.next()){
        	   order_id = rs.getString(1);
                         }
            
      
           rs.close();
      prepStmt.close();
      
      releaseConnection(); 
   } 
      catch (Exception ex) {
        ex.printStackTrace();
            //Debug.print("Exception:" + ex.getMessage());
       }finally {
           releaseConnection();
       }
     
  return order_id;
}

public String selectBuyInstitutionId(String email, String regStatusId)
{
 String map_id=null;
  
     
      try {
       makeConnection();
        String str="SELECT customer_id FROM tblSignUpDetails WHERE e_mail=? and purchase_type='buy_now' and registration_id = ?";
              
        prepStmt = con.prepareStatement(str);
           prepStmt.setString(1,email);
           prepStmt.setString(2,regStatusId);
          
           rs = prepStmt.executeQuery();
           if (rs.next()){
            map_id = rs.getString(1);
                         }
            
      
           rs.close();
      prepStmt.close();
      
      releaseConnection(); 
   } 
      catch (Exception ex) {
        ex.printStackTrace();
            //Debug.print("Exception:" + ex.getMessage());
       }finally {
           releaseConnection();
       }
     
  return map_id;
}
public String selectCustomerOrderId(String email, String regStatusId)
{
 String order_id=null;
  
     
      try {
       makeConnection();
        String str="SELECT order_id FROM tblSignUpDetails WHERE e_mail=? and purchase_type='buy_now' and registration_id = ?";
              
        prepStmt = con.prepareStatement(str);
           prepStmt.setString(1,email);
           prepStmt.setString(2,regStatusId);
          
           rs = prepStmt.executeQuery();
           if (rs.next()){
        	   order_id = rs.getString(1);
                         }
            
      
           rs.close();
      prepStmt.close();
      
      releaseConnection(); 
   } 
      catch (Exception ex) {
        ex.printStackTrace();
            //Debug.print("Exception:" + ex.getMessage());
       }finally {
           releaseConnection();
       }
     
  return order_id;
}

public String getUserIdbyEmailPlan(String email, String pay_productPlan, String pay_subscriptionType)
{

String userid=null;

   
    try {
     makeConnection();
      String str="SELECT user_id FROM tblSignUpDetails WHERE e_mail=? and product_plan=? and subscription_type=?";
            
      prepStmt = con.prepareStatement(str);
         prepStmt.setString(1,email);
         prepStmt.setString(2,pay_productPlan);
         prepStmt.setString(3,pay_subscriptionType);
         
         
         rs = prepStmt.executeQuery();
         if (rs.next()){
          userid = rs.getString(1);
                       }
          
    
         rs.close();
    prepStmt.close();
    
    releaseConnection(); 
 } 
    catch (Exception ex) {
      ex.printStackTrace();
          //Debug.print("Exception:" + ex.getMessage());
     }finally {
         releaseConnection();
     }
   
return userid;
}
   

//===================profile pic starts here====================

public String getuserid(String usrname){
	 Debug.print("GeneralDBAction.getRoleNameByRoleId():");
	 PreparedStatement prepstmt = null;
	 ResultSet rs = null;
	 makeConnection();
	 String userid = "";
	 try{
		 String sqlQuery = "Select user_id from tblUserMaster where login_name=?";
		 prepstmt = con.prepareStatement(sqlQuery);
		 prepstmt.setString(1, usrname);
		 rs = prepstmt.executeQuery();
		 rs.next();
		 userid = rs.getString(1);
		 rs.close();
		 prepstmt.close();
		 releaseConnection();
	 }
	 catch(SQLException sql)
 {
     releaseConnection();
     Debug.print((new StringBuilder()).append("SQL Exception in GeneralDBAction.getRoleNameByRoleId():").append(sql.getMessage()).toString());
 }
 catch(Exception e)
 {
     releaseConnection();
     Debug.print((new StringBuilder()).append("General Exception  in GeneralDBAction.getRoleNameByRoleId():").append(e.getMessage()).toString());
 }
	 
	 return userid;
	 
}

public String getuser_status(String login){
	 Debug.print("GeneralDBAction.getRoleNameByRoleId():");
	 PreparedStatement prepstmt = null;
	 ResultSet rs = null;
	 makeConnection();
	 String userid = "";
	 try{
		 String sqlQuery = "Select user_id from tblUserMaster where login_name=?";
		 prepstmt = con.prepareStatement(sqlQuery);
		 prepstmt.setString(1, login);
		
		 rs = prepstmt.executeQuery();
		 rs.next();
		 userid = rs.getString(1);
		 rs.close();
		 prepstmt.close();
		 releaseConnection();
	 }
	 catch(SQLException sql)
 {
     releaseConnection();
     Debug.print((new StringBuilder()).append("SQL Exception in GeneralDBAction.getRoleNameByRoleId():").append(sql.getMessage()).toString());
 }
 catch(Exception e)
 {
     releaseConnection();
     Debug.print((new StringBuilder()).append("General Exception  in GeneralDBAction.getRoleNameByRoleId():").append(e.getMessage()).toString());
 }
	 
	 return userid;
	 
}

public String getpicture_path(String user_id){
	 Debug.print("GeneralDBAction.getRoleNameByRoleId():");
	 PreparedStatement prepstmt = null;
	 ResultSet rs = null;
	 makeConnection();
	 String filepath = "";
	 try{
		 String sqlQuery = "Select picture_path from tbluserpictures where user_id=?";
		 prepstmt = con.prepareStatement(sqlQuery);
		 prepstmt.setString(1, user_id);
		 rs = prepstmt.executeQuery();
		 rs.next();
		 filepath = rs.getString(1);
		 rs.close();
		 prepstmt.close();
		 releaseConnection();
	 }
	 catch(SQLException sql)
 {
     releaseConnection();
     Debug.print((new StringBuilder()).append("SQL Exception in GeneralDBAction.getRoleNameByRoleId():").append(sql.getMessage()).toString());
 }
 catch(Exception e)
 {
     releaseConnection();
     Debug.print((new StringBuilder()).append("General Exception  in GeneralDBAction.getRoleNameByRoleId():").append(e.getMessage()).toString());
 }
	 
	 return filepath;
	 
}
public String adduserpicture(String user_id,String fileLocation)
{
	 
	String status=null;
		    
		    	  
		        try {
		        	makeConnection();
		        	 String str="insert into tbluserpictures(user_id,picture_path) values (?,?)";
				     				     
				        prepStmt = con.prepareStatement(str);
			            prepStmt.setString(1,user_id);
			            prepStmt.setString(2,fileLocation);
			            
			            
			            prepStmt.executeUpdate();
                    status="Insert Successfully";
			 	       prepStmt.close();
			       
			       releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			            releaseConnection();
			        }
		       
		    return status;
}   
//--------------------inserting for contacts---------------------------------------
public boolean insertUserEnquriyDetails(String name,String email,String phone,String message, String company)
{
	Debug.print("user same sucess:"+name);
	Debug.print("user same sucess:"+email);
	Debug.print("user same sucess:"+phone);
	Debug.print("user same sucess:"+message);
	Debug.print("user same sucess:"+company);
	
	PreparedStatement preStmt = null;
  boolean result = false;
  makeConnection();
  try
  {
      String insertStmt = "insert into tblUserEnquiryDetails(name,e_mail,phone,msg,company_name)values(?,?,?,?,?)";
      preStmt = con.prepareStatement(insertStmt);
      preStmt.setString(1,name);
      preStmt.setString(2,email);
      preStmt.setString(3,phone);
      preStmt.setString(4,message);
      preStmt.setString(5,company);
     
      preStmt.executeUpdate();
      preStmt.close();
      releaseConnection();
      result = true;
  }
catch(SQLException sql)
      {
          releaseConnection();
          Debug.print((new StringBuilder()).append("SQL Exception in insertUserEnquriyDetails:").append(sql.getMessage()).toString());
      }
      catch(Exception e)
      {
          releaseConnection();
          Debug.print((new StringBuilder()).append("General Exception  in insertUserEnquriyDetails:").append(e.getMessage()).toString());
      }
      
      Debug.print("result sucess:"+result);
      return result;
  }


public String selectRegistration_id()  throws RemoteException {
    
    String empid = null;
    PreparedStatement prepSelect = null;
    makeConnection();
    try {
        String selectStatement = "SELECT max(cast(registration_id as int)) from tblSignUpDetails";
        
        prepSelect = con.prepareStatement(selectStatement);
        
        ResultSet rs = prepSelect.executeQuery();
        while (rs.next()) {
         empid = rs.getString(1);
        }
        if (empid == null)
         empid = "0";
        
        long nextId = Long.valueOf(empid).longValue();
        
        if(nextId==0){
            nextId = 10101000;
        } else{
            nextId = nextId+1;
        }
        rs.close();
        prepSelect.close();
        empid = Long.toString(nextId);
       
        //prepStmt.close();
        releaseConnection();
       
    } catch(SQLException sql){
        releaseConnection();
              }
   
    return empid;
}


public String selectRegistrationId(String email, String regStatusId)
{
 String reg_id=null;
  
     
      try {
       makeConnection();
        String str="SELECT registration_id FROM tblSignUpDetails WHERE e_mail=? and registration_id=?";
              
        prepStmt = con.prepareStatement(str);
           prepStmt.setString(1,email);
           prepStmt.setString(2,regStatusId);
          
           rs = prepStmt.executeQuery();
           if (rs.next()){
            reg_id = rs.getString(1);
                         }
            
      
           rs.close();
      prepStmt.close();
      
      releaseConnection(); 
   } 
      catch (Exception ex) {
        ex.printStackTrace();
            //Debug.print("Exception:" + ex.getMessage());
       }finally {
           releaseConnection();
       }
     
  return reg_id;
}


public String selectCustomerUserName(String email, String regStatusId)
{
 String CustomerUserName=null;
  
     
      try {
       makeConnection();
        String str="SELECT user_name FROM tblSignUpDetails WHERE e_mail=? and registration_id=?";
              
        prepStmt = con.prepareStatement(str);
           prepStmt.setString(1,email);
           prepStmt.setString(2,regStatusId);
          
           rs = prepStmt.executeQuery();
           if (rs.next()){
        	   CustomerUserName = rs.getString(1);
                         }
            
      
           rs.close();
      prepStmt.close();
      
      releaseConnection(); 
   } 
      catch (Exception ex) {
        ex.printStackTrace();
            //Debug.print("Exception:" + ex.getMessage());
       }finally {
           releaseConnection();
       }
     
  return CustomerUserName;
}


public String selectCustomerpassword(String email, String regStatusId)
{
 String Customerpassword=null;
  
     
      try {
       makeConnection();
        String str="SELECT user_password FROM tblSignUpDetails WHERE e_mail=? and registration_id=?";
              
        prepStmt = con.prepareStatement(str);
           prepStmt.setString(1,email);
           prepStmt.setString(2,regStatusId);
          
           rs = prepStmt.executeQuery();
           if (rs.next()){
        	   Customerpassword = rs.getString(1);
                         }
            
      
           rs.close();
      prepStmt.close();
      
      releaseConnection(); 
   } 
      catch (Exception ex) {
        ex.printStackTrace();
            //Debug.print("Exception:" + ex.getMessage());
       }finally {
           releaseConnection();
       }
     
  return Customerpassword;
}



//--------------------finished----------------------------------------------------

  
    
  //=============================Mastrer Account starts here=======================================
    
  //=============================updateprofile=======================================
public String updateprofile(String new_email,String username, String password,String e_mail) {
		
		System.out.println(" ---------------------from inside database----------------------");	
	     System.out.println("username:"+username);
	     System.out.println("password:"+password);
	     System.out.println("e_mail:"+e_mail);
	     System.out.println("new_email:"+new_email);
	     String result=null;
	     try{
	      makeConnection(); 
	     String insertStmt=  "update tblSignUpDetails SET user_name = ?, user_password = ?, e_mail =? where e_mail=?";
	      
	     prepStmt = con.prepareStatement(insertStmt);
	       
	        prepStmt.setString(1,username);
	        prepStmt.setString(2,password);
	        prepStmt.setString(3,e_mail);
	        prepStmt.setString(4,new_email);            
	        
	      int cnt= prepStmt.executeUpdate();
	       if(cnt>0){        
	        result ="User update successfully";  
	       }
	       prepStmt.close();
	       System.out.println("==========username:"+username);
		     System.out.println("=======password:"+password);
		     System.out.println("======e_mail:"+e_mail);
		     System.out.println("=======new_email:"+new_email);
	    } 
	    catch (SQLException sqe) {
	    	sqe.printStackTrace();
	        releaseConnection();
	              
	    } finally {
	        releaseConnection();
	    }
	  return result;
	     
	    }

//=============================updateproductpackage=======================================
public String updateproductpackage(String new_email,String plantype,String subscriptiontype, String paymentHistory,String subscriptionExpiry) {
	System.out.println(" from inside databaseuser");	
     System.out.println("plantype:"+plantype);
     System.out.println("subscriptiontype:"+subscriptiontype);
     System.out.println("paymentHistory:"+paymentHistory);
     System.out.println("subscriptionExpiry:"+subscriptionExpiry);
     String packageresult="User update Failed";
     try{
      makeConnection(); 
     String insertStmt=  "update tblSignUpDetails SET product_plan = ?, subscription_type = ?, product_price = ? where e_mail=?";
        
     prepStmt = con.prepareStatement(insertStmt);
       
        prepStmt.setString(1,plantype);
        prepStmt.setString(2,subscriptiontype);
        prepStmt.setString(3,paymentHistory);
        prepStmt.setString(4,new_email);
        
         
       int cnt= prepStmt.executeUpdate();
       if(cnt>0){        
        packageresult ="User update successfully";  
       }
       prepStmt.close();
      
    } 
    catch (SQLException sqe) {
    	sqe.printStackTrace();
        releaseConnection();
              
    } finally {
        releaseConnection();
    }
  return packageresult;
     
}
//=============================updatesignupuserdetails=======================================
public String updatesignupuserdetails(String new_email,String username, String password,String e_mail,String institutionname) {
		
		System.out.println(" from inside database updatesignupuserdetails");	
	     System.out.println("username:"+username);
	     System.out.println("password:"+password);
	     System.out.println("e_mail:"+e_mail);
	     System.out.println("new_email:"+new_email);
	     System.out.println("institutionname:"+institutionname);
	     String result=null;
	     try{
	      makeConnection(); 
	     String insertStmt=  "update tblSignUpDetails SET user_name = ?, user_password = ?, e_mail =?, institution_name=? where e_mail=?";
	      
	     prepStmt = con.prepareStatement(insertStmt);
	       
	        prepStmt.setString(1,username);
	        prepStmt.setString(2,password);
	        prepStmt.setString(3,e_mail);
	        prepStmt.setString(4,institutionname);  
	        prepStmt.setString(5,new_email);
	        
	      int cnt= prepStmt.executeUpdate();
	       if(cnt>0){        
	        result ="User update successfully";  
	       }
	       prepStmt.close();
	       System.out.println(" ========from inside database updatesignupuserdetails");	
		     System.out.println("======username:"+username);
		     System.out.println("==========password:"+password);
		     System.out.println("====e_mail:"+e_mail);
		     System.out.println("========new_email:"+new_email);
		     System.out.println("======institutionname:"+institutionname);
	    } 
	    catch (SQLException sqe) {
	    	sqe.printStackTrace();
	        releaseConnection();
	              
	    } finally {
	        releaseConnection();
	    }
	  return result;
	     
	    }

//=============================getemail_id=======================================
public String getemail_id(String userId){
  	 Debug.print("GeneralDBAction.getRoleNameByRoleId():");
  	 PreparedStatement prepstmt = null;
  	 ResultSet rs = null;
  	 makeConnection();
  	 String emailId = "";
  	 try{
  		 String sqlQuery = "Select email_id from tblUserMaster where user_id=?";
  		 prepstmt = con.prepareStatement(sqlQuery);
  		 prepstmt.setString(1, userId);
  		 rs = prepstmt.executeQuery();
  		 rs.next();
  		 emailId = rs.getString(1);
  		 rs.close();
  		 prepstmt.close();
  		 releaseConnection();
  	 }
  	 catch(SQLException sql)
       {
           releaseConnection();
           Debug.print((new StringBuilder()).append("SQL Exception in GeneralDBAction.getRoleNameByRoleId():").append(sql.getMessage()).toString());
       }
       catch(Exception e)
       {
           releaseConnection();
           Debug.print((new StringBuilder()).append("General Exception  in GeneralDBAction.getRoleNameByRoleId():").append(e.getMessage()).toString());
       }
  	 
  	 return emailId;
  	 
   }
//===========================product getprofile_details starts here=========================================
public ArrayList getprofile_details(String emailId)
    {
	 ArrayList prof_det= new ArrayList(); 
    	String username=null;
    	String password=null;
    	String institution_name=null;
    	String e_mail=null;
    	String customer_id=null;
       try {
		        	makeConnection();
		        	 String str="SELECT user_name,user_password,institution_name,e_mail,customer_id FROM tblSignUpDetails WHERE e_mail=?";
				     				     
				        prepStmt = con.prepareStatement(str);
			            prepStmt.setString(1,emailId);
			            
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	username = rs.getString(1);
			            	password = rs.getString(2);
			            	institution_name=rs.getString(3);
			            	e_mail=rs.getString(4);
			            	customer_id=rs.getString(5);
			            	
			            	 
			            	String[] temp={username,password,institution_name,e_mail,customer_id};
			            	  System.out.println("-----IN DB---------emailId"+emailId);
					            System.out.println("-----IN DB---------username"+username);
					            System.out.println("-----IN DB---------password"+password);
					            System.out.println("-----IN DB---------institution_name"+institution_name);
					            System.out.println("-----IN DB---------e_mail"+e_mail);
			            	prof_det.add(temp);
			                          }
			            
			          
			            
			            rs.close();
			       prepStmt.close();
			       
			       releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			            releaseConnection();
			        }
		       
		    return prof_det;
    }

//===========================product package starts here=========================================
public ArrayList getproduct_package(String emailId)
    {
	 ArrayList prod_package= new ArrayList(); 
    	String Productplan=null;
    	String subscription_plan=null;
    	String amount=null;
    
       try {
		        	makeConnection();
		        	 String str="SELECT product_plan,subscription_type,product_price FROM tblSignUpDetails WHERE e_mail=?";
				     				     
				        prepStmt = con.prepareStatement(str);
			            prepStmt.setString(1,emailId);
			            
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	Productplan = rs.getString(1);
			            	subscription_plan = rs.getString(2);
			            	amount=rs.getString(3);
			                String[] temp={Productplan,subscription_plan,amount};
			            	prod_package.add(temp);
			                          }
				     			    
			       
			            rs.close();
			       prepStmt.close();
			       
			       releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			            releaseConnection();
			        }
		       
		    return prod_package;
    }

//===========================getdate=========================================
    public String getdate(String emailId) {
		Debug.print("GeneralDBAction.getRoleNameByRoleId():");
		 PreparedStatement prepstmt = null;
		 ResultSet rs = null;
		 makeConnection();
		 String date = "";
		 try{
			 String sqlQuery = "Select date from tblSignUpDetails where e_mail=?";
			 prepstmt = con.prepareStatement(sqlQuery);
			 prepstmt.setString(1, emailId);
			 rs = prepstmt.executeQuery();
			 rs.next();
			 date = rs.getString(1);
			 rs.close();
			 prepstmt.close();
			 releaseConnection();
		 }
		 catch(SQLException sql)
	     {
	         releaseConnection();
	         Debug.print((new StringBuilder()).append("SQL Exception in GeneralDBAction.getRoleNameByRoleId():").append(sql.getMessage()).toString());
	     }
	     catch(Exception e)
	     {
	         releaseConnection();
	         Debug.print((new StringBuilder()).append("General Exception  in GeneralDBAction.getRoleNameByRoleId():").append(e.getMessage()).toString());
	     }
		 
		 return date;
		
	}

  //===========================getsecurity_details=========================================
    public ArrayList getsecurity_details(String emailId)
	    {
		 ArrayList security_det= new ArrayList(); 
	    	String Productplan=null;
	    	String subscription_plan=null;
	    	String amount=null;
	    
	       try {
			        	makeConnection();
			        	 String str="SELECT product_Plan,mobile,e_mail FROM tblSignUpDetails WHERE e_mail=?";
					     				     
					        prepStmt = con.prepareStatement(str);
				            prepStmt.setString(1,emailId);
				            
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	Productplan = rs.getString(1);
				            	subscription_plan = rs.getString(2);
				            	amount=rs.getString(3);
				                String[] temp={Productplan,subscription_plan,amount};
				                security_det.add(temp);
				                          }
					     			    
				       
				            rs.close();
				       prepStmt.close();
				       
				       releaseConnection(); 
				    } 
			        catch (Exception ex) {
				        	ex.printStackTrace();
				             //Debug.print("Exception:" + ex.getMessage());
				        }finally {
				            releaseConnection();
				        }
			       
			    return security_det;
	    }
    
  
  //==================================update Security===============================
    public String updatesecurity(String plantype, String mobile, String e_mail ){
    	System.out.println(" from inside databaseuser");	
       System.out.println("plantype:"+plantype);
       System.out.println("mobile:"+mobile);
       System.out.println("e_mail:"+e_mail);
     // System.out.println("last_login:"+last_login);
      String packageresult="User update Failed";
       try{
        makeConnection(); 
       String insertStmt=  "update tblSignUpDetails SET product_plan = ?, mobile = ?, e_mail = ? last_login=? where e_mail=?";
          
       prepStmt = con.prepareStatement(insertStmt);
         
          prepStmt.setString(1,plantype);
          prepStmt.setString(2,mobile);
          prepStmt.setString(3,e_mail);
         //prepStmt.setString(4,last_login);
         prepStmt.setString(5,e_mail);
          
           
         int cnt= prepStmt.executeUpdate();
         if(cnt>0){        
          packageresult ="User update successfully";  
          System.out.print("==============Security=================");
          System.out.print("plantype"+plantype);
          System.out.print("mobile"+mobile);
          System.out.println("e_mail"+e_mail);
        //System.out.println("login_date"+last_login);
         }
         prepStmt.close();
        
      } 
      catch (SQLException sqe) {
      	sqe.printStackTrace();
          releaseConnection();
                
      } finally {
          releaseConnection();
      }
    return packageresult;
       
    }
//------------------------------LastLoginDetails---------------------------------------------------
    public String getLastLoginDetails(String userId) {
		Debug.print("GeneralDBAction.getRoleNameByRoleId():");
		 PreparedStatement prepstmt = null;
		 ResultSet rs = null;
		 makeConnection();
		 String last_login = "";
		 try{
			 String sqlQuery = "Select login_date from tblUserMaster where user_id=?";
			 prepstmt = con.prepareStatement(sqlQuery);
			 prepstmt.setString(1, userId);
			 rs = prepstmt.executeQuery();
			 rs.next();
			 last_login = rs.getString(1);
			 rs.close();
			 prepstmt.close();
			 releaseConnection();
		 }
		 catch(SQLException sql)
	     {
	         releaseConnection();
	         Debug.print((new StringBuilder()).append("SQL Exception in GeneralDBAction.getRoleNameByRoleId():").append(sql.getMessage()).toString());
	     }
	     catch(Exception e)
	     {
	         releaseConnection();
	         Debug.print((new StringBuilder()).append("General Exception  in GeneralDBAction.getRoleNameByRoleId():").append(e.getMessage()).toString());
	     }
		 
		 return last_login;
		
	}
    
/*------------------------------*/    
    
    
public String getYesCartCustomerId(String emailid){
    	
    	
    	String returnCustomerId = null;

    	    try {
    	    	makeMySqlConnection();
    	        String insertStmt=  "select customer_id from tcustomer where email=?";
    	               
    	         prepStmt = con.prepareStatement(insertStmt);
    	            prepStmt.setString(1,emailid);
    	           
    	            rs = prepStmt.executeQuery();
    	            if (rs.next()){
    	            	returnCustomerId = rs.getString(1);
    	                          }
    	             
    	       
    	            rs.close();
    	       prepStmt.close();
    	       
    	       releaseConnection(); 
    	    } 
    	       catch (Exception ex) {
    	         ex.printStackTrace();
    	             //Debug.print("Exception:" + ex.getMessage());
    	        }finally {
    	            releaseConnection();
    	        }
    	      
    	   return returnCustomerId;

    
    }
    
    
    
    public String putYesCartPassword(String password, String emailId){
    	
    	
    	String returnPassStatus = "fail";


    	    try{


    	    	makeMySqlConnection(); 
    	    String insertStmt=  "update tcustomer set password = ? where email = ? ";
    	      

    	      prepStmt = con.prepareStatement(insertStmt);
    	      
    	      prepStmt.setString(1,password);
    	      prepStmt.setString(2,emailId);
    	      	      
    	      
    	      int cnt= prepStmt.executeUpdate();
    	      if(cnt>0){
    	          
    	    	  returnPassStatus="success";  
    	    	  System.out.println("Yescart password updated successfully :::::::::::::::::");
    	        }
    	       prepStmt.close();

    	    } 
    	    catch (SQLException sqe) {
    	      releaseConnection();
    	     sqe.printStackTrace();       
    	    } finally {
    	      releaseConnection();
    	    }
    	    return returnPassStatus;

    
    }
    

    public ArrayList getCustomerDetailsById(String customerId){
    	ArrayList custDetails = null;
    	 makeConnection();
    		try {
    	       
    	       

    	         String selectStatement="select * from tblSignUpDetails where customer_id=?" ;


    	         Debug.print(" selectStatement "+selectStatement);
    	        
    	         prepStmt = con.prepareStatement(selectStatement);
    	         prepStmt.setString(1, customerId);
    	       
    	        
    	         rs = prepStmt.executeQuery();
    	         custDetails = new ArrayList();
    	         while(rs.next()){

    	        	
    	             String first_name = rs.getString(1);
    	             String last_name = rs.getString(2);
    	             String e_mail = rs.getString(3);
    	             String mobile = rs.getString(4);
    	             String institution_name = rs.getString(5);
    	             String country = rs.getString(6);
    	             String state = rs.getString(7);
    	             String city = rs.getString(8);
    	             String credit_card_type = rs.getString(9);
    	             String credit_card_no = rs.getString(10);
    	             String cvv_no = rs.getString(11);
    	             String name_on_card = rs.getString(12);
    	             String expiry_date = rs.getString(13);
    	             String customer_id = rs.getString(14);
    	             String date = rs.getString(15);
    	             String product_price = rs.getString(17);
    	             String subscription_type = rs.getString(18);
    	             String subscription_id = rs.getString(19);
    	             String order_id = rs.getString(20);
    	             String purchase_type = rs.getString(21);
    	             String product_plan = rs.getString(22);
    	             String user_name = rs.getString(23);
    	             String user_password = rs.getString(24);
    	             String registration_id = rs.getString(25);
    	             System.out.println("first_name in the db action :::::::::::::::::::::::"+first_name);
    	             
    	             
    	             String[] custList = {first_name, last_name,e_mail, mobile, institution_name, country, state,city, credit_card_type, credit_card_no,
    	            		 cvv_no, name_on_card, expiry_date, customer_id, date,product_price, subscription_type, subscription_id,
    	            		 order_id, purchase_type, product_plan,user_name, user_password, registration_id};
    	             custDetails.add(custList);
    	         }
    	         rs.close();
    	         prepStmt.close();
    	         releaseConnection();
    	       
    	     }
    	    
    	     catch(Exception e){
    	         releaseConnection();
    	         Debug.print("General Exception  in GeneralDBAction.getAllPermission():" + e.getMessage());
    	     }
    	
    	return custDetails;
    }
    
    
   public boolean  changeCustomerPass(String getCustomerId){
	   makeConnection();
	   boolean result = false;
	   
	   final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		Random rnd = new Random();
		int len=8;							
		StringBuilder sb = new StringBuilder( len );
		   for( int i = 0; i < len; i++ ) {
		     sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );			
		   }							  
	String updatePassword=sb.toString();

	System.out.println(updatePassword);
		try {
	       
	       

	         String selectStatement="update tblSignUpDetails set user_password = ? where customer_id=?" ;


	         Debug.print(" selectStatement "+selectStatement);
	        
	         prepStmt = con.prepareStatement(selectStatement);
	         prepStmt.setString(1, updatePassword);
	         prepStmt.setString(2, getCustomerId);
	       
	        
	        
	         int cnt= prepStmt.executeUpdate();
		       if(cnt>0){        
		        result =true;  
		       }
		       prepStmt.close();
		}catch(Exception e){
			System.err.println();
		}finally{
			releaseConnection();
		}
	   return result;
   }
    
    
    
    
    
    
//===================================SQL Query End here=================================================    
    public void makeConnection() {
        try {
            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource) ic.lookup(dbName);
            con = ds.getConnection();
            // Debug.print(" Opening a connection...");
        } catch (Exception ex) {
            //Debug.print("Unable to connect to database. " + ex.getMessage());
        }
    }
    
    public void releaseConnection() {
        try {
            //prepStmt.close();
            //rs.close();
            if(!con.isClosed()){
                con.close();
            }
            //Debug.print(" Closing a connection...");
        } catch (SQLException ex) {
            //Debug.print("releaseConnection: " + ex.getMessage());
        }
    
    }
    
    /*---------------------------mysql connection started here------------------------------*/
    public void makeMySqlConnection() {
	    try {
	        InitialContext ic = new InitialContext();
	        DataSource ds = (DataSource) ic.lookup(mySqldbName);
	        con = ds.getConnection();
	        // Debug.print(" Opening a connection...");
	    } catch (Exception ex) {
	        //Debug.print("Unable to connect to database. " + ex.getMessage());
	    }
	}
    
    public void mySqlReleaseConnection() {
        try {
            //prepStmt.close();
            //rs.close();
            if(!con.isClosed()){
                con.close();
            }
            //Debug.print(" Closing a connection...");
        } catch (Exception ex) {
            //Debug.print("releaseConnection: " + ex.getMessage());
        }
    
    }
    
    
    
  /*---------------------------mysql connection ended here------------------------------*/
    
    public ArrayList getCouponDetails(String coupon_code) {
		Debug.print("GeneralDBAction.getCouponDetails():");
	     ArrayList coupon_details = null;
	     PreparedStatement prepStmt = null;
	     ResultSet rs = null;
	     makeConnection();
		try {
	         
	         String selectStatement="SELECT coupon_status, coupon_offer, coupon_description, valid_month from tblCouponDetails where coupon_code=?";
	        
	         Debug.print(" selectStatement "+selectStatement);
	       
	         prepStmt = con.prepareStatement(selectStatement);
	         prepStmt.setString(1,coupon_code);
	         rs = prepStmt.executeQuery();
	         coupon_details = new ArrayList();
	         while(rs.next()){

	             String coupon_status = rs.getString(1);
	             String coupon_value = rs.getString(2);
	             String coupon_description = rs.getString(3);
	             String valid_month = rs.getString(4);
	               
	             String[] couponList = {coupon_status, coupon_value,coupon_description, valid_month};
	             coupon_details.add(couponList);
	         }
	         rs.close();
	         prepStmt.close();
	         releaseConnection();
	      
	     }
	     catch(SQLException sql){
	         releaseConnection();
	         Debug.print("SQL Exception in GeneralDBAction.getCouponDetails():" + sql.getMessage());
	     }
	     catch(Exception e){
	         releaseConnection();
	         Debug.print("General Exception  in GeneralDBAction.getCouponDetails():" + e.getMessage());
	     }
	     return coupon_details;
	}

	public boolean getCouponStatusIndb(String coupon_code) {
		
		boolean result=false;
	 	makeConnection();
	       try {
	    	   if(coupon_code!=null){
	     	  String selectStmt="select coupon_code from tblCouponDetails where coupon_code = ? and coupon_status='active'";          	  
	           
	         
	           prepStmt = con.prepareStatement(selectStmt);
	           prepStmt.setString(1, coupon_code);
	           rs=prepStmt.executeQuery();
	           if(rs.next())
	           {
	         	
	         	   result = true;
	           }
	          
	          
	           
	           prepStmt.close();
	           releaseConnection();}
	    	   else{
	    		   result = false;   
	    	   }
	       } catch(SQLException sql){
	           releaseConnection();
	           System.out.println("SQL Exception in GeneralDBAction.getCouponStatusIndb():" + sql.getMessage());
	       } catch(Exception e){
	           releaseConnection();
	           System.out.println("General Exception  in GeneralDBAction.getCouponStatusIndb():" + e.getMessage());
	       }
	 	
		return result;
	}
	
	public String getcouponoffer(String coupon)
    {
    	 
    	String off=null;
		    
		    	  
		        try {
		        	makeConnection();
		        	 String str="SELECT coupon_offer FROM tblCouponDetails WHERE coupon_code=? and coupon_status='active'";
				     				     
				        prepStmt = con.prepareStatement(str);
			            prepStmt.setString(1,coupon);
			            
			            
			            rs = prepStmt.executeQuery();
			            if (rs.next()){
			            	off = rs.getString(1);
			            	System.out.println("offer inside the dBAction----------------"+off);
			                          }
				      rs.close();
			       prepStmt.close();
			       
			       releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	releaseConnection();
			        }
		       
		    return off;
    }
 
 public void  updatecouponstatus(String couponcode)
    {
    	 
    	String couponstatus="deactive";
		    
		    	  
		        try {
		        	makeConnection();
		        	 String str="update tblCouponDetails set coupon_status=? WHERE coupon_code=?";
				     				     
				        prepStmt = con.prepareStatement(str);
			            prepStmt.setString(1,couponstatus);
			            prepStmt.setString(2,couponcode);
			            
			            prepStmt.executeUpdate();
				      rs.close();
			       prepStmt.close();
			       
			       releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			        	releaseConnection();
			        }
		       
		    
    }
    
 public boolean updatePaymentStatus(String transactionId, String emailId,
			String registrationId, String paymentStatus, String productStatus) {
		boolean updatetransStatus = false;
		try {
				if(transactionId != null && !(transactionId.equalsIgnoreCase("null"))){
			    	makeConnection();
			    	 String str="update tblSignUpDetails set transaction_id=? , payment_status = ?, product_status = ? WHERE registration_id = ? and e_mail = ?";
				     				     
				        prepStmt = con.prepareStatement(str);
			            prepStmt.setString(1,transactionId);
			            prepStmt.setString(2,paymentStatus);
			            prepStmt.setString(3,productStatus);
			            prepStmt.setString(4,registrationId);
			            prepStmt.setString(5,emailId);
			            
			            prepStmt.executeUpdate();
			            updatetransStatus = true;
				      rs.close();
				      prepStmt.close();
			       
			       releaseConnection(); 
				}else if(transactionId == null || transactionId.equalsIgnoreCase("null")){
					makeConnection();
			    	 String str="update tblSignUpDetails set payment_status = ?, product_status = ? WHERE registration_id = ? and e_mail = ?";
				     				     
				        prepStmt = con.prepareStatement(str);
			            prepStmt.setString(1,paymentStatus);
			            prepStmt.setString(2,productStatus);
			            prepStmt.setString(3,registrationId);
			            prepStmt.setString(4,emailId);
			            
			            prepStmt.executeUpdate();
			            updatetransStatus = true;
				      rs.close();
				      prepStmt.close();
			       
			       releaseConnection(); 
				}
		    } 
		    catch (Exception ex) {
		        	ex.printStackTrace();
		        	updatetransStatus = false;
		        	}finally {
		        	releaseConnection();
		        }
		return updatetransStatus;
	}
 public boolean checkUserNameExist(String loginName) throws SQLException {	       
     boolean result = false;
     try {
     	makeConnection();
         
         String selectStatement = "select user_id from tblUserMaster where login_name = ? ";
         
         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1, loginName);
         
         rs = prepStmt.executeQuery();
         if (rs.next()) {
             result = true;
         }
         rs.close();	            
         prepStmt.close();
     } catch (SQLException sqe) {
     	releaseConnection();	           
         //sqe.printStackTrace();
     } finally {
     	releaseConnection();
     }
     return result;
 }
 
 public boolean updateProductStatus(String emailId,
			String registrationId, String productStatus) {
		boolean updatetransStatus = false;
		try {
	    	makeConnection();
	    	 String str="update tblSignUpDetails set product_status = ? WHERE registration_id = ? and e_mail = ?";
		     				     
		        prepStmt = con.prepareStatement(str);
	            prepStmt.setString(1,productStatus);
	            prepStmt.setString(2,registrationId);
	            prepStmt.setString(3,emailId);
	            
	            prepStmt.executeUpdate();
	            updatetransStatus = true;
		      rs.close();
	       prepStmt.close();
	       
	       releaseConnection(); 
		    } 
		    catch (Exception ex) {
		        	ex.printStackTrace();
		        	updatetransStatus = false;
		        	}finally {
		        	releaseConnection();
		        }
		return updatetransStatus;
	}
 
}
	


