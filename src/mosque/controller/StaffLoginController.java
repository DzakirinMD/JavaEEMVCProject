package mosque.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mosque.dao.StaffDAO;
import mosque.model.StaffBean;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/StaffLoginController")
public class StaffLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StaffDAO dao;
	private static String DASHBOARD = "/staff/index.jsp";
    HttpServletRequest request;
    HttpServletResponse response;
    String forward="";
    String action="";
    
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffLoginController() {
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
		
		action = request.getParameter("action");
		
    	try {
			
			StaffBean user = new StaffBean();
			user.setStaffEmail(request.getParameter("email"));
			user.setPassword(request.getParameter("password"));

			user = StaffDAO.login(user); // parse data to check

			if(user.isValid())
			{
//				HttpSession session = request.getSession(true);
//				session.setAttribute("currentSessionUser", user.getStaffEmail());
//				session.setAttribute("sessionStaffname", user.getStaffName());
//				session.setAttribute("sessionStaffID", user.getStaffID());
//				response.sendRedirect("/Test/staff/index.jsp"); // logged-in page
							
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser", user.getStaffEmail());
				session.setAttribute("sessionStaffname", user.getStaffName());
				session.setAttribute("sessionStaffID", user.getStaffID());
				
				forward = DASHBOARD;
	            String email = request.getParameter("email");//current section bean
	            user = dao.getUserByEmail(email);
	            request.setAttribute("user", user); //masukkan Staff object dalam session user
	            
	            RequestDispatcher view = request.getRequestDispatcher(forward);
	 	        view.forward(request, response);		
			}
			else
			{
				response.sendRedirect("/Test/invalidLogin.jsp");
			}
			
		}

		catch (Throwable ex) {
			System.out.println(ex);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
