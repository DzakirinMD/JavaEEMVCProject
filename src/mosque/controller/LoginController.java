package mosque.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mosque.dao.KariahDAO;
import mosque.model.KariahBean;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private KariahDAO dao;
	private static String DASHBOARD = "/kariah/index.jsp";
    HttpServletRequest request;
    HttpServletResponse response;
    String forward="";
    String action="";
    
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        dao = new KariahDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		action = request.getParameter("action");
		
    	try {
			
			KariahBean user = new KariahBean();
			user.setKariahic(request.getParameter("ic"));
			user.setPassword(request.getParameter("password"));

			user = KariahDAO.login(user);

			if(user.isValid())
			{
//				HttpSession session = request.getSession(true);
//				session.setAttribute("currentSessionUser", user.getKariahic());
//				session.setAttribute("sessionKariahname", user.getKariahname());
//				response.sendRedirect("/Test/kariah/index.jsp"); // logged-in page
				
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser", user.getKariahic());
				session.setAttribute("sessionKariahname", user.getKariahname());
				
				forward = DASHBOARD;
	            String ic = request.getParameter("ic");//current section bean
	            user = dao.getUserByIC(ic);
	            request.setAttribute("user", user); //masukkan Staff object dalam session user
	            
	            RequestDispatcher view = request.getRequestDispatcher(forward);
	 	        view.forward(request, response);
				
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('User or password incorrect');");
				out.println("</script>");
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
