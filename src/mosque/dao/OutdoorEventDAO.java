package mosque.dao;

import java.sql.*;
import java.security.NoSuchAlgorithmException;

import mosque.model.OutdoorEventBean;
import mosque.connection.ConnectionManager;

public class OutdoorEventDAO {
		
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
    static String eventid,outdoorplace,organizername;
    
    //add new user (register)
    public void add(OutdoorEventBean bean) throws NoSuchAlgorithmException{
    
    	eventid = bean.getEventid();
    	outdoorplace = bean.getOutdoorplace();
    	organizername= bean.getOrganizername();
    
      
    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("insert into outdoor (eventid, outdoorplace, organizername) values (?,?,?)");
    		ps.setString(1,eventid);
    		ps.setString(2,outdoorplace);
    		ps.setString(3,organizername);
    		ps.executeUpdate();
    		
    		System.out.println("Creating outdoor event:");
    		System.out.println("Your outdoor event id is " + eventid);
            
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