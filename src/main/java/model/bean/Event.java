package model.bean;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
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
import javax.validation.constraints.NotNull;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.validator.constraints.NotBlank;


/**
 * La classe Event représente un événement créé par un utilisateur et pouvant
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
	 * Nom de l'événement
	 */
	@NotBlank
	private String			name;

	/**
	 * Description de l'événement
	 */
	private String			description;

	/**
	 * Date de l'événement. Il ne peut pas durer plus d'une journée.
	 */
	@NotNull
	private Date			day;

	/**
	 * Créateur de l'événement
	 */
	@OneToOne
	@JoinColumn(name = "user_id")
	private User			creator;

	/**
	 * Liste des participants
	 */
	@JsonIgnore
	@JoinTable(name = "event_participant",
		joinColumns = @JoinColumn(name = "event_id", referencedColumnName="id"),
		inverseJoinColumns = @JoinColumn(name = "participants_id", referencedColumnName="id"))
	@ManyToMany(fetch = FetchType.EAGER)
	private List<User>		participants = new ArrayList<>();

	/**
	 * Liste des activités prévues
	 */
//	@JsonIgnore
	// @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	// @OneToMany(fetch = FetchType.EAGER)
    @OneToMany(fetch = FetchType.EAGER)
//	@OneToMany(mappedBy = "event", fetch = FetchType.EAGER)
	private List<Activity>	activities = new ArrayList<>();

	/**
	 * Cover photo of the event
	 */
	private String			picture;

	/**
	 * Max number of persons
	 */
	@Column(name = "max_user")
	private int				max;


	public int getParticipantsCount()
	{
		return participants.size();
	}


	public int getActivitiesCount()
	{
		return activities.size();
	}


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


	public int getMax()
	{
		return max;
	}


	public void setMax(int max)
	{
		this.max = max;
	}


	public Date getDay()
	{
		return day;
	}


	public void setDay(Date day)
	{
		this.day = day;
	}
}