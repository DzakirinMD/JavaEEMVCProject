package mosque.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mosque.dao.OutdoorEventDAO;
import mosque.model.OutdoorEventBean;
import mosque.dao.IndoorEventDAO;
import mosque.dao.EventDAO;
import mosque.model.EventBean;
import mosque.model.IndoorEventBean;
import mosque.model.StaffBean;
import mosque.dao.StaffDAO;



/**
 * Servlet implementation class EventController
 */
@WebServlet("/EventController")
public class EventController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String INDOOR = "/event/createEventIndoor.jsp";
	private static String OUTDOOR = "/event/createEventOutdoor.jsp";
    private static String VIEWEVENT = "/event/viewEvent.jsp";
    private static String DASHBOARD = "/staff/dashboard.jsp";
    
    private EventDAO dao;
    private IndoorEventDAO idao;
    private OutdoorEventDAO odao;
    private StaffDAO sdao;
    String forward=""; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventController() {
        super();
        dao = new EventDAO();
        idao = new IndoorEventDAO();
        odao = new OutdoorEventDAO();
        sdao = new StaffDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("viewEvent")){
			forward = VIEWEVENT;        
            String id = request.getParameter("id");//current section bean
            StaffBean user = sdao.getUserByID(id); //guna staff sebab nak capture dia punya session
            request.setAttribute("user", user);
        }
		else if (action.equalsIgnoreCase("createIndoorEvent")){
			forward = INDOOR;        
            String id = request.getParameter("id");//current section bean
            StaffBean user = sdao.getUserByID(id); //guna staff sebab nak capture dia punya session
            request.setAttribute("user", user);
        }
		else if (action.equalsIgnoreCase("createOutdoorEvent")){
			forward = INDOOR; 
			String id = request.getParameter("id");//current section bean
			StaffBean user = sdao.getUserByID(id); //guna staff sebab nak capture dia punya session
            request.setAttribute("events", dao.getAllEvent()); 
        }
		
	    else {
	           forward = DASHBOARD;
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
		user.setStaffEmail(request.getParameter("email"));//email tu nama dari textfield dalam interface register...

		EventBean event = new EventBean();
		event.setEventid(request.getParameter("eventid"));
		event.setEventname(request.getParameter("eventname"));
		event.setEventstaffincharges(request.getParameter("eventstaffincharges"));
		event.setEventfee(request.getParameter("eventfee"));
		event.setEventdatestarttime(request.getParameter("eventdatestarttime"));
		event.setEventdateendtime(request.getParameter("eventdateendtime"));
		event.setStaffid(request.getParameter("staffid"));
		
		IndoorEventBean iEventBean = new IndoorEventBean();
		iEventBean.setEventid(request.getParameter("eventid"));
		iEventBean.setIndoorvenue(request.getParameter("indoorvenue"));
		iEventBean.setIndoorguestname(request.getParameter("indoorguestname"));
		
		OutdoorEventBean oEventBean = new OutdoorEventBean();
		oEventBean.setEventid(request.getParameter("eventid"));
		oEventBean.setOutdoorplace(request.getParameter("outdoorplace"));
		oEventBean.setOutdoordate(request.getParameter("outdoordate"));
		oEventBean.setOrganizername(request.getParameter("organizername"));
		
		System.out.println("baru bind data");
		String eventid = request.getParameter("eventid");
		String ieventid = request.getParameter("indoorvenue");
		String oeventid = request.getParameter("outdoorplace");
		String email = request.getParameter("email");
		
		user.setStaffEmail(email);
		
		user = StaffDAO.getUser(user);

		if(!user.isValid()){//untuk nk tgk user valid atau x..
        	try { 
        		if (oeventid == null) { //kalau outdoor event xda id masuk data dalam indoor event
        			dao.add(event);
    				idao.add(iEventBean);
    				System.out.println("Event Created");
        		} else if (ieventid == null) { //kalau indoor event xda id masuk data dalam indoor event
        			dao.add(event);
    				odao.add(oEventBean);
    				System.out.println("Event Created");
				}
			
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
        	// tanya lecturer mcm mana nk grab session
        	
        	HttpSession session = request.getSession(true);
			session.getAttribute("currentSessionUser");
			response.sendRedirect("/Test/staff/index.jsp"); // logged-in page
        	
//            RequestDispatcher view = request.getRequestDispatcher(INDEX);
//            String aemail = request.getParameter("email");//current section bean
//            request.setAttribute("user", sdao.getUserByEmail(aemail));
//            view.forward(request, response);  

        }
		
        else{ // when user is already valid
        	        	
            RequestDispatcher view = request.getRequestDispatcher(VIEW);
            request.setAttribute("user", sdao.getUserByEmail(email));
            view.forward(request, response);
        }
		
      
	}

}
