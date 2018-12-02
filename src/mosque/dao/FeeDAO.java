package mosque.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import mosque.connection.ConnectionManager;
import mosque.model.FeeBean;

public class FeeDAO {
		
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
	static String feeid,feestatus,receiptnumber,timeofpayment;

    //list Fee for Registration
      public List<FeeBean> getAllFee() {
      	
        List<FeeBean> fees = new ArrayList<FeeBean>();
        
        try {
        	currentCon = ConnectionManager.getConnection();
        	stmt = currentCon.createStatement();
        
        	 String q = "select feeid,feestatus, NVL(TO_CHAR(receiptnumber), 'Receipt number not yet uploaded ') as receiptnumber,to_char(timeofpayment, 'DD-MON-YYYY HH:MM') as timeofpayment \r\n" + 
        	 		"from fee";
            ResultSet rs = stmt.executeQuery(q);
            
            while (rs.next()) {
            	FeeBean fee = new FeeBean();
            	fee.setFeeid(rs.getString("feeid"));
            	fee.setFeestatus(rs.getString("feestatus"));
            	fee.setReceiptnumber(rs.getString("receiptnumber"));
            	fee.setTimeofpayment(rs.getString("timeofpayment"));
          	  fees.add(fee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return fees;
      }
      
    
 


    

}