package model.bean;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


/**
 * La classe Locality représente un point d'interêt référencé par l'application
 * tel qu'un musée.
 */
@Entity
@Table(name = "Message")
public class Message
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long		id;

	@ManyToOne
	private User		from;

	@JoinTable(name = "message_receivers")
	@ManyToMany(cascade = {CascadeType.ALL})
	private List<User>	to		= new ArrayList<>();

	@JoinTable(name = "message_events")
	@ManyToMany(cascade = {CascadeType.ALL})
	private List<Event>	event	= new ArrayList<>();

	private String		text;

	private Date		dateSent;


	public Long getId()
	{
		return id;
	}


	public void setId(Long id)
	{
		this.id = id;
	}


	public User getFrom()
	{
		return from;
	}


	public void setFrom(User from)
	{
		this.from = from;
	}


	public List<User> getTo()
	{
		return to;
	}


	public void setTo(List<User> to)
	{
		this.to = to;
	}


	public List<Event> getEvents()
	{
		return event;
	}


	public void setEvents(List<Event> events)
	{
		this.event = events;
	}


	public String getText()
	{
		return text;
	}


	public void setText(String text)
	{
		this.text = text;
	}


	public Date getDateSent()
	{
		return dateSent;
	}


	public void setDateSent(Date dateSent)
	{
		this.dateSent = dateSent;
	}
}