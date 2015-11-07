package model.bean;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
 * La classe Event repr�sente un �v�nement cr�� par un utilisateur et pouvant
 * comprendre plusieurs participants
 */
@Entity
@Table(name = "Event")
public class Event
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long			id;

	/**
	 * Nom de l'�v�nement
	 */
	@NotBlank
	private String			name;

	/**
	 * Description de l'�v�nement
	 */
	@NotBlank
	private String			description;

	/**
	 * Cr�ateur de l'�v�nement
	 */
	@OneToOne
	@JoinColumn(name = "user_id")
	private User			creator;

	/**
	 * Liste des participants
	 */
	@JoinTable(name = "event_participant")
	@ManyToMany
	private List<User>		participants;

	/**
	 * Liste des activit�s pr�vues
	 */
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "event")
//	@OneToMany(fetch = FetchType.EAGER)
	private List<Activity>	activities	= new ArrayList<>();;

	/**
	 * Cover photo of the event
	 */
	private String			picture;


	public Long getId()
	{
		return id;
	}


	public void setId(Long id)
	{
		this.id = id;
	}


	public String getName()
	{
		return name;
	}


	public void setName(String name)
	{
		this.name = name;
	}


	public String getDescription()
	{
		return description;
	}


	public void setDescription(String description)
	{
		this.description = description;
	}


	public User getCreator()
	{
		return creator;
	}


	public void setCreator(User creator)
	{
		this.creator = creator;
	}


	public List<User> getParticipants()
	{
		return participants;
	}


	public void setParticipants(List<User> participants)
	{
		this.participants = participants;
	}


	public List<Activity> getActivities()
	{
		return activities;
	}


	public void setActivities(List<Activity> activities)
	{
		this.activities = activities;
	}


	public String getPicture()
	{
		return picture;
	}


	public void setPicture(String picture)
	{
		this.picture = picture;
	}
}