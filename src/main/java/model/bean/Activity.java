package model.bean;

import java.sql.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;


/**
 * La classe Activity représente une activité planfiée pour un évènement dans
 * une Locality particulière
 */
@Entity
@Table(name = "Activity")
public class Activity
{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long		id;

	/**
	 * Lieux d'interêt à visiter
	 */
	@OneToOne
	@JoinColumn(name = "locality_id")
	private Locality	locality;

	/**
	 * Date de début l'activité
	 */
	// @NotBlank
	private Date		from;

	/**
	 * Date de fin l'activité
	 */
	// @NotBlank
	private Date		to;

	@ManyToOne(optional = false)
	@JoinColumn(name = "event_id")
	private Event		event;


	public Long getId()
	{
		return id;
	}


	public void setId(Long id)
	{
		this.id = id;
	}


	public Locality getLocality()
	{
		return locality;
	}


	public void setLocality(Locality locality)
	{
		this.locality = locality;
	}


	public Date getFrom()
	{
		return from;
	}


	public void setFrom(Date from)
	{
		this.from = from;
	}


	public Date getTo()
	{
		return to;
	}


	public void setTo(Date to)
	{
		this.to = to;
	}


	public Event getEvent()
	{
		return event;
	}


	public void setEvent(Event event)
	{
		this.event = event;
	}
}
