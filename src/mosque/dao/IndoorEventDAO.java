package mosque.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.security.NoSuchAlgorithmException;

import mosque.model.EventBean;
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
    
    //list order by email (customer)
    public List<IndoorEventBean> getAllIndoorEvent() {
    	
      List<IndoorEventBean> ievents = new ArrayList<IndoorEventBean>();
      
      try {
      	currentCon = ConnectionManager.getConnection();
      	stmt = currentCon.createStatement();
      
      	  String q = "select * from indoor";
          ResultSet rs = stmt.executeQuery(q);
          
          while (rs.next()) {
        	  IndoorEventBean ievent = new IndoorEventBean();
        	  
        	  ievent.setEventid(rs.getString("eventid"));
        	  ievent.setIndoorvenue(rs.getString("indoorvenue"));
        	  ievent.setIndoorguestname(rs.getString("indoorguestname"));        	  
        	  ievents.add(ievent);
          }
      } catch (SQLException e) {
          e.printStackTrace();
      }

      return ievents;
    }
    

}