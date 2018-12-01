package mosque.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.security.NoSuchAlgorithmException;

import mosque.model.EventBean;
import mosque.model.StaffBean;
import pizza.model.OrderBean;
import mosque.connection.ConnectionManager;

public class EventDAO {
		
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
    int eventid;
	static String eventname,eventstaffincharges,eventdatestarttime,eventdateendtime;
	int staffid;
	int eventfee;
	
    //add new user (register)
    public void add(EventBean bean) throws NoSuchAlgorithmException{
    
    	eventid = bean.getEventid();
    	eventname = bean.getEventname();
    	eventstaffincharges = bean.getEventstaffincharges();
    	eventfee= bean.getEventfee();
    	eventdatestarttime = bean.getEventdatestarttime();
    	eventdateendtime = bean.getEventdateendtime();
    	staffid = bean.getStaffid();

    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("insert into event (eventid,eventname,eventstaffincharges,eventfee,eventdatestarttime,eventdateendtime,staffid)values(eventid_id_seq.NEXTVAL,?,?,?,?,?,?)");
    		ps.setString(1,eventid);
    		ps.setString(2,eventname);
    		ps.setString(3,eventstaffincharges);
    		ps.setString(4,eventfee);
    		ps.setString(5,eventdatestarttime);
    		ps.setString(6,eventdateendtime);
    		ps.setString(7,staffid);
    		ps.executeUpdate();
    		
    		System.out.println("Creating parent event:");
    		System.out.println("Your event id is " + eventid);
    		System.out.println("Your staff id is " + staffid);
    
            
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
    public List<EventBean> getAllEvent() {
    	
      List<EventBean> events = new ArrayList<EventBean>();
      
      try {
      	currentCon = ConnectionManager.getConnection();
      	stmt = currentCon.createStatement();
      
      	  String q = "select * from event";
          ResultSet rs = stmt.executeQuery(q);
          
          while (rs.next()) {
        	  EventBean event = new EventBean();
//        	  event.setOrderid(rs.getInt("orderid"));
//        	  event.setCrust(rs.getString("crust"));
//        	  event.setExtracheese(rs.getString("extracheese"));
//        	  event.setTopping(rs.getString("topping"));
//        	  event.setQuantity(rs.getInt("quantity"));
//        	  event.setEmail(rs.getString("email"));
        	  event.setEventid(rs.getInt("eventid"));
        	  event.setEventname(rs.getString("eventname"));
        	  event.setEventstaffincharges(rs.getString("eventstaffincharges"));
        	  event.setEventfee(rs.getInt("eventfee"));
        	  event.setEventdatestarttime(rs.getDate("eventdatestarttime"));
        	  event.setEventdateendtime(rs.getDate("eventdateendtime"));
        	  event.setStaffid(rs.getInt("staffid"));
              events.add(event);
          }
      } catch (SQLException e) {
          e.printStackTrace();
      }

      return events;
    }


    

}