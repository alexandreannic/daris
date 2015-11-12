package model.bean;

import java.sql.Time;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


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
	@Column(name = "date_from")
	private String		from;

	/**
	 * Date de fin l'activité
	 */
	// @NotBlank
	@Column(name = "date_to")
	private String		to;

	// @ManyToOne(optional = false)
	// @JoinColumn(name = "event_id")
	// private Event event;


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


	public String getFrom()
	{
		return from;
	}


	public void setFrom(String from)
	{
		this.from = from;
	}


	public String getTo()
	{
		return to;
	}


	public void setTo(String to)
	{
		this.to = to;
	}

	// public Event getEvent()
	// {
	// return event;
	// }
	//
	//
	// public void setEvent(Event event)
	// {
	// this.event = event;
	// }
}
