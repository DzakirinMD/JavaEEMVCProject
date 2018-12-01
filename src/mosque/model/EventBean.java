package mosque.model;

import java.sql.Date;

public class EventBean {
	
	private int eventid;
	private String eventname;
	private String eventstaffincharges;
	private int eventfee ;
	private Date eventdatestarttime ;
	private Date eventdateendtime  ;
	private int staffid;
	
	public int getEventid() {
		return eventid;
	}
	public void setEventid(int i) {
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
	public int getStaffid() {
		return staffid;
	}
	public void setStaffid(int i) {
		this.staffid = i;
	}
	
}