package mosque.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.joda.time.DateTime;

import java.security.NoSuchAlgorithmException;

import mosque.model.EventBean;
import mosque.model.StaffBean;
import mosque.connection.ConnectionManager;

public class EventDAO {
		
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	static String eventid,eventname,eventstaffincharges,staffid,eventdatestarttime,eventdateendtime;
	static int eventfee;

		
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
    		ps=currentCon.prepareStatement("INSERT INTO EVENT (EVENTID, EVENTNAME, EVENTSTAFFINCHARGES, EVENTFEE, EVENTDATESTARTTIME, EVENTDATEENDTIME, STAFFID) VALUES (eventid_id_seq.NEXTVAL,?,?,?, TO_DATE(?,   'mm/dd,YYYY, HH:MI AM',    'NLS_DATE_LANGUAGE = American'), TO_DATE(   ?,   'mm/dd,YYYY, HH:MI AM',    'NLS_DATE_LANGUAGE = American'),?)");		
    		ps.setString(1,eventname);
    		ps.setString(2,eventstaffincharges);
    		ps.setInt(3,eventfee);
    		ps.setString(4,eventdatestarttime);
    		ps.setString(5,eventdateendtime);
    		ps.setString(6,staffid);
    		ps.executeUpdate();
    		
    		System.out.println("Creating parent event:");
    		System.out.println("Your event end time is " + eventdateendtime);
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
    
    
    //get event id
    public EventBean getEventbyID() {
    	EventBean eventid = new EventBean();
        try {
        	currentCon = ConnectionManager.getConnection();
            ps=currentCon.prepareStatement("\r\n" + 
            		"SELECT eventid FROM (select eventid from event ORDER BY eventid DESC) alias_name WHERE rownum <= 1 ORDER BY rownum DESC");
            
        
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
    
            	eventid.setEventid(rs.getString("eventid"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return eventid;
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
        	  event.setEventid(rs.getString("eventid"));
        	  event.setEventname(rs.getString("eventname"));
        	  event.setEventstaffincharges(rs.getString("eventstaffincharges"));
        	  event.setEventfee(rs.getInt("eventfee"));
        	  event.setEventdatestarttime(rs.getString("eventdatestarttime"));
        	  event.setEventdateendtime(rs.getString("eventdateendtime"));
        	  event.setStaffid(rs.getString("staffid"));
              events.add(event);
          }
      } catch (SQLException e) {
          e.printStackTrace();
      }

      return events;
    }


    

}