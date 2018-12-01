package mosque.dao;

import java.util.*;
import java.sql.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import mosque.model.KariahBean;
import mosque.connection.ConnectionManager;

public class KariahDAO extends HttpServlet  {
	static Connection currentCon = null;
	static ResultSet rs = null; 
	static PreparedStatement ps=null;
	static Statement stmt=null;
    static String kariahic,kariahname,kariahaddress,kariahnotel,kariahemail,kariahgender,password;
    
    //login
    public static KariahBean login(KariahBean bean) throws NoSuchAlgorithmException {
    	
    	kariahic = bean.getKariahic();
        password = bean.getPassword();
        
        

        String searchQuery = "select * from KARIAH where kariahic='" + kariahic + "' AND password= '" + password +"'";
        
        System.out.println("Your IC is " + kariahic);
        System.out.println("Your password is " + password);
        System.out.println("Query: " + searchQuery);

        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();

            // if user exists set the isValid variable to true
            if (more) {
            	String kariahic = rs.getString("kariahic"); //data taken from db
            	String kariahname = rs.getString("kariahname"); //data taken from db
           
           		System.out.println("Welcome " + kariahic + " name" + kariahname);
                bean.setKariahic(kariahic);
                bean.setKariahname(kariahname);
                bean.setValid(true);
           	}
           
            // if user does not exist set the isValid variable to false
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
    public void add(KariahBean bean) throws NoSuchAlgorithmException{
    
    	kariahic = bean.getKariahic();
    	kariahname = bean.getKariahname();//untuk ambil the value
    	kariahaddress = bean.getKariahaddress();
    	kariahnotel= bean.getKariahnotel();
    	kariahemail = bean.getKariahemail();
    	kariahgender = bean.getKariahgender();
        password = bean.getPassword();

    	try {
    		currentCon = ConnectionManager.getConnection();
    		ps=currentCon.prepareStatement("insert into kariah (kariahic,kariahname,kariahaddress,kariahnotel,kariahemail,kariahgender,password)values(?,?,?,?,?,?,?)");
    		ps.setString(1,kariahic);
    		ps.setString(2,kariahname);
    		ps.setString(3,kariahaddress);
    		ps.setString(4,kariahnotel);
    		ps.setString(5,kariahemail);
    		ps.setString(6,kariahgender);
    		ps.setString(7,password);
    		ps.executeUpdate();
    		
    		System.out.println("Creating user account:");
    		System.out.println("Your IC is " + kariahic);
    		System.out.println("Your email is " + kariahemail);
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
    
    public void deleteUser(String kariahemail) {
        try {
        	currentCon = ConnectionManager.getConnection();
        	ps=currentCon.prepareStatement("delete from kariah where kariahemail=?");
            ps.setString(1, kariahemail);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //update account
    public void updateAccount(KariahBean bean) throws NoSuchAlgorithmException {

    	 
    	kariahic = bean.getKariahic();
    	kariahname = bean.getKariahname();//untuk ambil the value
    	kariahaddress = bean.getKariahaddress();
    	kariahnotel = bean.getKariahnotel();
    	kariahemail = bean.getKariahemail();
    	kariahgender = bean.getKariahgender();
        password = bean.getPassword();
       
        System.out.println(kariahic);
        String searchQuery = "UPDATE kariah SET kariahemail='" + kariahemail + "', kariahaddress='" + kariahaddress + "', kariahnotel='" + kariahnotel + "', password='" + password + "' WHERE kariahic= '" + kariahic + "'";
    	
    	try {

            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            stmt.executeUpdate(searchQuery);
            System.out.println("ic"+kariahic);
            System.out.println("email"+kariahemail);
            System.out.println("Succesfully update Account");
            
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("sql Update Error");
        }
    }
    
    //get all user
    public List<KariahBean> getAllUser() {
        List<KariahBean> users = new ArrayList<KariahBean>();
        try {
        	currentCon = ConnectionManager.getConnection();
        	stmt = currentCon.createStatement();
            ResultSet rs = stmt.executeQuery("select * from kariah");
            
            while (rs.next()) {
                KariahBean user = new KariahBean();
                user.setKariahemail(rs.getString("kariahemail"));
                user.setPassword(rs.getString("password"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }
    
    //get user by ic
    public KariahBean getUserByIC(String kariahic) {
        KariahBean user = new KariahBean();
        try {
        	currentCon = ConnectionManager.getConnection();
            ps=currentCon.prepareStatement("select * from kariah where kariahic=?");
            
            ps.setString(1, kariahic);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
    
                user.setKariahic(rs.getString("kariahic"));
                user.setKariahname(rs.getString("kariahname"));
                user.setKariahaddress(rs.getString("kariahaddress"));
                user.setKariahnotel(rs.getString("kariahnotel"));
                user.setKariahemail(rs.getString("kariahemail"));
                user.setKariahgender(rs.getString("kariahgender"));
                user.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
    
    
    
  //get user by ic ni untuk jstl guna
public static KariahBean getUser(KariahBean bean)  {
    	
	kariahic = bean.getKariahic();

        String searchQuery = "select * from kariah where kariahic='" + kariahic + "'";

        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            boolean more = rs.next();

            // if user exists set the isValid variable to true
            if (more) {
            	String kariahic = rs.getString("kariahic");
           
                bean.setKariahic(kariahic);
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
