package mosque.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import mosque.dao.StaffDAO;
import mosque.model.StaffBean;


/**
 * Servlet implementation class UserController
 */
@WebServlet("/StaffAccountController")
public class StaffAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LOGIN = "staff-login.jsp";
	private static String REGISTER = "/staff-register.jsp";
	private static String UPDATE = "/staff/updateAccount.jsp";
    private static String VIEW = "/staff/viewAccount.jsp";
    private static String DASHBOARD = "/staff/index.jsp";
    private StaffDAO dao;
    String forward="";

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffAccountController() {
        super();
        dao = new StaffDAO();

        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("updateAccount")){
			forward = UPDATE;
            String email = request.getParameter("email");//current section bean
            StaffBean user = dao.getUserByEmail(email);
            request.setAttribute("user", user);
        } else if (action.equalsIgnoreCase("viewAccount")){
			forward = VIEW;   
			String email= request.getParameter("email");
	        StaffBean user = dao.getUserByEmail(email);
	        request.setAttribute("user", user);
	           
	    } else if (action.equalsIgnoreCase("registerStaff")){
			forward = REGISTER;   
			String email= request.getParameter("email");
	        StaffBean user = dao.getUserByEmail(email);
	        request.setAttribute("user", user);
	           
	    } else if (action.equalsIgnoreCase("dashboard")){
			forward = DASHBOARD;   
			String email= request.getParameter("email");
	        StaffBean user = dao.getUserByEmail(email);
	        request.setAttribute("user", user);
	           
	    }
	    else {
	           forward = REGISTER;
	    }
		RequestDispatcher view = request.getRequestDispatcher(forward);
	       view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		StaffBean user = new StaffBean();
		
		user.setStaffID(request.getParameter("staffID"));
		user.setStaffName(request.getParameter("name"));
		user.setStaffAddress(request.getParameter("address"));
		user.setStaffNoTel(request.getParameter("notel"));
		user.setStaffEmail(request.getParameter("email"));
		user.setStaffPos(request.getParameter("position"));
		user.setManagerID(request.getParameter("managerid"));
		user.setPassword(request.getParameter("password"));
		
		String email = request.getParameter("email");
		
		user.setStaffEmail(email);
		
		user = StaffDAO.getUser(user);

		if(!user.isValid()){//untuk nk tgk user valid atau x..
        	try {
				dao.add(user);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
			forward = DASHBOARD;   
			String id= request.getParameter("idadmin");
	        StaffBean currentUser = dao.getUserByID(id);
	        request.setAttribute("user", currentUser);
            
            System.out.println("Current user is : " + id );
	        
	        RequestDispatcher view = request.getRequestDispatcher(forward);
		    view.forward(request, response);
	       	    
		       
//        	HttpSession session = request.getSession(true);
//			session.setAttribute("currentSessionUser", user.getStaffEmail());
//			session.setAttribute("sessionStaffname", user.getStaffName());
//			session.setAttribute("sessionStaffID", user.getStaffID());
//			response.sendRedirect("/Test/staff/logout.jsp");
//        	response.sendRedirect(DASHBOARD);
        }
		
        else{ // when user is already valid
        	try {
        		System.out.println("User is already valid. Updating Account...");
    			dao.updateAccount(user);
    			
    		} catch (NoSuchAlgorithmException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		
    		}
        	
            RequestDispatcher view = request.getRequestDispatcher(LOGIN);
            request.setAttribute("user", dao.getUserByEmail(email));
            view.forward(request, response);
        }
        

	}

}
