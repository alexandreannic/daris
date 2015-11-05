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

/**
 * La classe Activity représente une activité planfiée pour un
 * évènement dans une Locality particulière
 * 
 * @author Mehdi Sliem
 *
 */
@Entity
@Table(name = "Activity")
public class Activity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long	activityId;
	
	/**
	 * Lieux d'interêt à visiter
	 */
	@OneToOne
	@JoinColumn(name="name")
	private Locality locality;
	
	/**
	 * Date de début l'activité
	 */
	@NotBlank
	private Date from;
	
	/**
	 * Date de fin l'activité
	 */
	@NotBlank
	private Date to;
	
	/**
	 * Commentaires et remarques sur l'activité
	 */
	@NotBlank
	private String comment;
	
	@ManyToOne(optional = false)
	@JoinColumn(name = "event", referencedColumnName = "eventId")
	private Event relatedEvent;

	// Getters & Setters
	public Long getActivityId() {
		return activityId;
	}

	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}

	public Locality getLocality() {
		return locality;
	}

	public void setLocality(Locality locality) {
		this.locality = locality;
	}

	public Date getFrom() {
		return from;
	}

	public void setFrom(Date from) {
		this.from = from;
	}

	public Date getTo() {
		return to;
	}

	public void setTo(Date to) {
		this.to = to;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
}
