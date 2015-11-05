package model.bean;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;


/**
 * La classe Event représente un évènement créé par un utilisateur
 * et pouvant comprendre plusieurs participants
 * 
 * @author Mehdi Sliem
 *
 */
@Entity
@Table(name = "Event")
public class Event
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long	eventId;

	/**
	 * Nom de l'évènement
	 */
	@NotBlank
	private String	name;

	/**
	 * Description de l'évènement
	 */
	@NotBlank
	private String	description;
	
	/**
	 * Créateur de l'évènement
	 */
	@OneToOne
	@JoinColumn(name="userId")
	private User creator;
	
	/**
	 * Liste des participants
	 */
	@JoinTable(name="event_participant")
	@ManyToMany
	private Collection<User> participants;
	
	/**
	 * Liste des activités prévues
	 */
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "relatedEvent")
	private Collection<Activity> activities;
	
	/**
	 * Cover photo of the event
	 */
	private String	picture;

	// Getters & Setters
	public Long getEventId() {
		return eventId;
	}

	public void setEventId(Long eventId) {
		this.eventId = eventId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}

	public Collection<User> getParticipants() {
		return participants;
	}

	public void setParticipants(Collection<User> participants) {
		this.participants = participants;
	}

	public Collection<Activity> getActivities() {
		return activities;
	}

	public void setActivities(Collection<Activity> activities) {
		this.activities = activities;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
}