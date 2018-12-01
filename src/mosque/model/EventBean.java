package mosque.model;

import java.sql.Date;

public class EventBean {
	
	private String eventid;
	private String eventname;
	private String eventstaffincharges;
	private int eventfee ;
	private Date eventdatestarttime ;
	private Date eventdateendtime  ;
	private String staffid;
	
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
	public Date getEventdatestarttime() {
		return eventdatestarttime;
	}
	public void setEventdatestarttime(Date date) {
		this.eventdatestarttime = date;
	}
	public Date getEventdateendtime() {
		return eventdateendtime;
	}
	public void setEventdateendtime(Date date) {
		this.eventdateendtime = date;
	}
	public String getStaffid() {
		return staffid;
	}
	public void setStaffid(String i) {
		this.staffid = i;
	}
	
}