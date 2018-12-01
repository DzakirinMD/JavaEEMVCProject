package mosque.dao;

import java.sql.*;
import java.security.NoSuchAlgorithmException;

import mosque.model.IndoorEventBean;
import mosque.connection.ConnectionManager;

public class IndoorEventDAO {
		
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
    static String eventid,indoorvenue,indoorguestname;

    //add new user (register)
    public void add(IndoorEventBean bean) throws NoSuchAlgorithmException{
    	
    	eventid = bean.getEventid();
    	indoorvenue = bean.getIndoorvenue();
    	indoorguestname = bean.getIndoorguestname();
      
    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("INSERT INTO INDOOR (EVENTID, INDOORVENUE, INDOORGUESTNAME) VALUES (?,?,?)");
    		   		
    		ps.setString(1,eventid);
    		ps.setString(2,indoorvenue);
    		ps.setString(3,indoorguestname);
    		ps.executeUpdate();
    		
    		System.out.println("Creating indoor event:");
    		System.out.println("Your indoor event id is " + eventid);
            
    	}

    	catch (Exception ex) {
    		System.out.println("failed: An Exception has occurred! " + ex);
    	}

    	finally {
    		if (ps != null) {
    			try {
    				ps.close();
    			} catch (Exception e) {
    			}
    			ps = null;
    		}
    		
    		if (currentCon != null) {
    			try {
    				currentCon.close();
    			} catch (Exception e) {
    			}
    			currentCon = null;
    		}
    	}
    }
    

}