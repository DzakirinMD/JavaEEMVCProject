package mosque.model;

public class EventBean {
	
	private String eventid;
	private String eventname;
	private String eventstaffincharges;
	private int eventfee ;
	private String eventdatestarttime ;
	private String eventdateendtime  ;
	private String staffid;
	private String indoorvenue;
	private String indoorguestname;
	private String outdoorplace;
	private String organizername;
	
	public String getOutdoorplace() {
		return outdoorplace;
	}
	public void setOutdoorplace(String outdoorplace) {
		this.outdoorplace = outdoorplace;
	}
	public String getOrganizername() {
		return organizername;
	}
	public void setOrganizername(String organizername) {
		this.organizername = organizername;
	}
	public String getIndoorvenue() {
		return indoorvenue;
	}
	public void setIndoorvenue(String indoorvenue) {
		this.indoorvenue = indoorvenue;
	}
	public String getIndoorguestname() {
		return indoorguestname;
	}
	public void setIndoorguestname(String indoorguestname) {
		this.indoorguestname = indoorguestname;
	}
	public String getEventid() {
		return eventid;
	}
	public void setEventid(String i) {
		this.eventid = i;
	}
	public String getEventname() {
		return eventname;
	}
	public void setEventname(String eventname) {
		this.eventname = eventname;
	}
	public String getEventstaffincharges() {
		return eventstaffincharges;
	}
	public void setEventstaffincharges(String eventstaffincharges) {
		this.eventstaffincharges = eventstaffincharges;
	}
	public int getEventfee() {
		return eventfee;
	}
	public void setEventfee(int i) {
		this.eventfee = i;
	}
	public String getEventdatestarttime() {
		return eventdatestarttime;
	}
	public void setEventdatestarttime(String dtstart) {
		this.eventdatestarttime = dtstart;
	}
	public String getEventdateendtime() {
		return eventdateendtime;
	}
	public void setEventdateendtime(String dtend) {
		this.eventdateendtime = dtend;
	}
	public String getStaffid() {
		return staffid;
	}
	public void setStaffid(String i) {
		this.staffid = i;
	}
	
}