package mosque.dao;

import java.util.*;
import java.sql.*;
import java.security.NoSuchAlgorithmException;
import mosque.model.StaffBean;
import mosque.connection.ConnectionManager;

public class StaffDAO {
		
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
    static String staffID,staffName,staffAddress,staffNoTel,staffEmail,staffPos,managerID,password;
    
    //login
    public static StaffBean login(StaffBean bean) throws NoSuchAlgorithmException {
    	
    	staffEmail = bean.getStaffEmail();
        password = bean.getPassword();

        String searchQuery = "select * from staff where staffEmail='" + staffEmail + "' AND password= '" + password +"'";
    
        System.out.println("Your Email is " + staffEmail);
        System.out.println("Your password is " + password);
        System.out.println("Query: " + searchQuery);

        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();

            // if user exists set the isValid variable to true
            if (more) {
            	String staffEmail = rs.getString("staffEmail");
            	String staffName = rs.getString("staffName");
            	String staffID = rs.getString("staffID");

                
           		System.out.println("Welcome " + staffEmail);
                bean.setStaffEmail(staffEmail);
                bean.setStaffName(staffName);
                bean.setStaffID(staffID);
                bean.setValid(true);          	
            	  
           	}
           

            else if (!more) {
            	System.out.println("Sorry, you are not a registered user! Please sign up first");
            	bean.setValid(false);
            }
           
        }

        catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
                stmt = null;
            }

            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {
                }

                currentCon = null;
            }
        }

        return bean;
    }
    
    //add new user (register)
    public void add(StaffBean bean) throws NoSuchAlgorithmException{
    
    	staffID = bean.getStaffID();
    	staffName = bean.getStaffName();//untuk ambil the value
    	staffAddress = bean.getStaffAddress();
    	staffNoTel= bean.getStaffNoTel();
    	staffEmail = bean.getStaffEmail();
    	staffPos = bean.getStaffPos();
    	managerID = bean.getManagerID();
        password = bean.getPassword();

    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("insert into staff (staffID,staffName,staffAddress,staffNoTel,staffEmail,staffPos,managerID,password)values(staff_id_seq.NEXTVAL,?,?,?,?,?,?,?)");
    		//ps.setString(1,staffID);
    		ps.setString(1,staffName);
    		ps.setString(2,staffAddress);
    		ps.setString(3,staffNoTel);
    		ps.setString(4,staffEmail);
    		ps.setString(5,staffPos);
    		ps.setString(6,managerID);
    		ps.setString(7,password);
    		ps.executeUpdate();
    		
    		
    		System.out.println("Creating user account:");
    		System.out.println("Your ID is is auto generated");
    		System.out.println("Your email is " + staffEmail);
    		System.out.println("Your password is " + password);
    
            
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
    
    public void deleteUser(String staffEmail) {
        try {
        	currentCon = ConnectionManager.getConnection();
        	ps=currentCon.prepareStatement("delete from staff where staffEmail=?");
            ps.setString(1, staffEmail);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //update account
    public void updateAccount(StaffBean bean) throws NoSuchAlgorithmException {

    	 
    	staffID = bean.getStaffID();
    	staffName = bean.getStaffName();//untuk ambil the value
    	staffAddress = bean.getStaffAddress();
    	staffNoTel = bean.getStaffNoTel();
    	staffEmail = bean.getStaffEmail();
    	staffPos = bean.getStaffPos();
    	managerID = bean.getManagerID();
        password = bean.getPassword();
       
        System.out.println(staffID);
        String searchQuery = "UPDATE staff SET staffEmail='" + staffEmail + "', staffAddress='" + staffAddress + "', staffNoTel='" + staffNoTel + "', staffPos='" + staffPos +"', managerID='" + managerID +"', password='" + password + "' WHERE staffID= '" + staffID + "'";
    	
    	try {

            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            stmt.executeUpdate(searchQuery);
            System.out.println("ic"+staffID);
            System.out.println("email"+staffEmail);
            System.out.println("Succesfully update Account");
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("sql Update Error");
        }
    }
    
    //get all user
    public List<StaffBean> getAllUser() {
        List<StaffBean> users = new ArrayList<StaffBean>();
        try {
        	currentCon = ConnectionManager.getConnection();
        	stmt = currentCon.createStatement();
            ResultSet rs = stmt.executeQuery("select * from staff");
            
            while (rs.next()) {
                StaffBean user = new StaffBean();
                user.setStaffEmail(rs.getString("staffEmail"));
                user.setPassword(rs.getString("password"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }
    
    //get user by email jstl
    public StaffBean getUserByEmail(String staffEmail) {
        StaffBean user = new StaffBean();
        try {
        	currentCon = ConnectionManager.getConnection();
            ps=currentCon.prepareStatement("select * from staff where staffEmail=?");
            
            ps.setString(1, staffEmail);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
    
                user.setStaffID(rs.getString("staffID"));
                user.setStaffName(rs.getString("staffName"));
                user.setStaffAddress(rs.getString("staffAddress"));
                user.setStaffNoTel(rs.getString("staffNoTel"));
                user.setStaffEmail(rs.getString("staffEmail"));
                user.setStaffPos(rs.getString("staffPos"));
                user.setManagerID(rs.getString("managerID"));
                user.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
    
    
    //get user by email jstl
    public StaffBean getUserByID(String idadmin) {
        StaffBean user = new StaffBean();
        try {
        	currentCon = ConnectionManager.getConnection();
            ps=currentCon.prepareStatement("select * from staff where staffid=?");
            
            ps.setString(1, idadmin);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
    
                user.setStaffID(rs.getString("staffID"));
                user.setStaffName(rs.getString("staffName"));
                user.setStaffAddress(rs.getString("staffAddress"));
                user.setStaffNoTel(rs.getString("staffNoTel"));
                user.setStaffEmail(rs.getString("staffEmail"));
                user.setStaffPos(rs.getString("staffPos"));
                user.setManagerID(rs.getString("managerID"));
                user.setPassword(rs.getString("password"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
    
    
    
    
    
  //get user by ic ni untuk jstl guna
public static StaffBean getUser(StaffBean bean)  {
    	
		staffID = bean.getStaffID();

        String searchQuery = "select * from staff where staffID='" + staffID + "'";

        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();

            // if user exists set the isValid variable to true
            if (more) {
            	String staffID = rs.getString("staffID");
           
                bean.setStaffID(staffID);
                bean.setValid(true);
           	}
           
            else if (!more) {
            	System.out.println("Sorry, the user is not a valid user");
            	bean.setValid(false);
            }
           
        }

        catch (Exception ex) {
            System.out.println("Log In failed: An Exception has occurred! " + ex);
        }

        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
                stmt = null;
            }

            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {
                }

                currentCon = null;
            }
        }

        return bean;
    }
}
