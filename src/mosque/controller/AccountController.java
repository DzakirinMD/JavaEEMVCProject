package mosque.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import mosque.dao.KariahDAO;
import mosque.model.KariahBean;
import mosque.model.StaffBean;


/**
 * Servlet implementation class UserController
 */
@WebServlet("/AccountController")
public class AccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String LOGIN = "/login.jsp";
	private static String REGISTER = "/register.jsp";
	private static String UPDATE = "/kariah/updateAccount.jsp";
	private static String DASHBOARD = "/kariah/index.jsp";
    private static String VIEW = "/kariah/viewAccount.jsp";
    private KariahDAO dao;
    String forward="";

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountController() {
        super();
        dao = new KariahDAO();

        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getParameter("action");
		
		if (action.equalsIgnoreCase("dashboard")){
			forward = DASHBOARD;   
			String ic= request.getParameter("ic");
	        KariahBean user = dao.getUserByIC(ic);
	        request.setAttribute("user", user);
	    } else if (action.equalsIgnoreCase("viewAccount")){
			forward = VIEW;   
			String ic= request.getParameter("ic");
	        KariahBean user = dao.getUserByIC(ic);
	        request.setAttribute("user", user);
	           
	    } else if (action.equalsIgnoreCase("updateAccount")){
			forward = UPDATE;
            String ic = request.getParameter("ic");//current section bean
            KariahBean user = dao.getUserByIC(ic);
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
		
		KariahBean user = new KariahBean();
		user.setKariahic(request.getParameter("ic"));//email tu nama dari textfield dalam interface register...
		user.setKariahname(request.getParameter("name"));
		user.setKariahaddress(request.getParameter("address"));
		user.setKariahnotel(request.getParameter("notel"));
		user.setKariahemail(request.getParameter("email"));
		user.setKariahgender(request.getParameter("gender"));
		user.setPassword(request.getParameter("password"));
		
		String ic = request.getParameter("ic");
		
		user.setKariahic(ic);
		
		user = KariahDAO.getUser(user);

		if(!user.isValid()){//untuk nk tgk user valid atau x..
        	try {
				dao.add(user);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
        	response.sendRedirect("kariah-login.jsp");
        }
		
        else{ // when user is already valid
        	try {
        		System.out.println("User is already valid. Updating Account...");
    			dao.updateAccount(user);
    		} catch (NoSuchAlgorithmException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
        	
        	HttpSession session = request.getSession(true);
			session.setAttribute("currentSessionUser", user.getKariahic());
			session.setAttribute("sessionKariahname", user.getKariahname());
			
			forward = VIEW;
           
            user = dao.getUserByIC(ic);
            request.setAttribute("user", user); //masukkan Staff object dalam session user
            
            RequestDispatcher view = request.getRequestDispatcher(forward);
 	        view.forward(request, response);
        }
        

	}

}
