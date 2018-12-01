package mosque.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;

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
            request.setAttribute("events", dao.getAllEvent()); 
        }
		else if (action.equalsIgnoreCase("createIndoorEvent")){
			forward = INDOOR;        
            String id = request.getParameter("id");//current section bean
            StaffBean user = sdao.getUserByID(id); //guna staff sebab nak capture dia punya session
            request.setAttribute("user", user);
        }
		else if (action.equalsIgnoreCase("createOutdoorEvent")){
			forward = OUTDOOR; 
			String id = request.getParameter("id");//current section bean
			StaffBean user = sdao.getUserByID(id); //guna staff sebab nak capture dia punya session
            request.setAttribute("user", user); 
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
		
   
		String startdate = request.getParameter("istartdatetime");
		System.out.println(startdate);

    
		StaffBean user = new StaffBean();
		user.setStaffID(request.getParameter("idadmin"));//set staffid

		EventBean event = new EventBean();
		int fee = Integer.parseInt(request.getParameter("ifee"));
		
		event.setEventid(request.getParameter("eventid"));
		event.setEventname(request.getParameter("iname"));
		event.setEventstaffincharges(request.getParameter("istaffincharges"));
		event.setEventfee(fee);
		event.setEventdatestarttime(request.getParameter("istartdatetime"));
		event.setEventdateendtime(request.getParameter("ienddatetime"));
		event.setStaffid(request.getParameter("staffid"));
		event.setStaffid(request.getParameter("idadmin")); // dy akan ambik current staff yg login untuk create event
				
		System.out.println("baru bind data");
		String indoor = request.getParameter("indoor");
		String outdoor = request.getParameter("outdoor");
		String email = request.getParameter("email");
		
//		user.setStaffEmail(email);
//		
//		user = StaffDAO.getUser(user);

		if(!user.isValid()){//untuk nk tgk user valid atau x..
        	try { 
        		dao.add(event);
       		
        		EventBean idforchild = dao.getEventbyID();
        		System.out.println(idforchild);
        		
        		if (indoor.equalsIgnoreCase("indoor")) { //kalau outdoor event xda id masuk data dalam indoor event
        			String i = idforchild.getEventid();
        			
        			
        			System.out.println(i);
        			
        			
        			IndoorEventBean iEventBean = new IndoorEventBean();
        			iEventBean.setEventid(i);
        			iEventBean.setIndoorvenue(request.getParameter("ivenue"));
        			iEventBean.setIndoorguestname(request.getParameter("igname"));
        			
    				idao.add(iEventBean);
    				System.out.println("Indoor Event Created !!!!!!");
        		} else if (outdoor.equalsIgnoreCase("outdoor")) { //kalau indoor event xda id masuk data dalam indoor event
        			String i = idforchild.getEventid();
        			
        			
        			System.out.println(i);
        			
        			
        			OutdoorEventBean oEventBean = new OutdoorEventBean();
        			oEventBean.setEventid(i);
        			oEventBean.setOutdoorplace(request.getParameter("ovenue"));
        			oEventBean.setOrganizername(request.getParameter("oname"));
        			
    				odao.add(oEventBean);
    				System.out.println("Outdoor Event Created !!!!!!");
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
        	        	
            RequestDispatcher view = request.getRequestDispatcher(VIEWEVENT);
            request.setAttribute("user", sdao.getUserByEmail(email));
            view.forward(request, response);
        }
		
      
	}

}
