package model.bean;

import java.sql.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;


/**
 * La classe User repr�sente un utilisateur de l'application pouvant cr�er et
 * participer � des �v�nements.
 */
@Entity
@Table(name = "User")
public class User
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long			id;

	/**
	 * Adresse email. Doit �tre unique dans la bdd.
	 */
	@Email
	private String			email;

	/**
	 * Mot de passe encrypt�.
	 */
	@NotBlank
	private String			password;

	/**
	 * Pr�nom
	 */
	@NotBlank
	private String			firstName;

	/**
	 * Nom de famille
	 */
	@NotBlank
	private String			lastName;

	/**
	 * Ville de l'utilisateur. Il s'agit en pratique d'une constante puisque
	 * l'application ne concerne que la ville de Paris. Cependant par soucis
	 * d'�volutivit�.
	 */
	private String			city;

	/**
	 * Rue de numero de rue
	 */
	private String			address;

	/**
	 * Code postal
	 */
	private String			ZIPCode;

	private String			picture;

	private Date			inscription;

	/**
	 * List des �venements auxquels participe l'utilisateur
	 */
//	@JsonIgnore
//	@ManyToMany(fetch = FetchType.EAGER, mappedBy = "participants")
//	@ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.MERGE}, mappedBy = "participants")
//	@ManyToMany(mappedBy="participants")
//	private List<Event>		events;

	@JsonIgnore
	@OneToMany(mappedBy = "from")
	private List<Message>	messages;

	// @OneToMany(mappedBy = "follower")
	// private List<User_relation> followed = new ArrayList<>();

	@JsonIgnore
	@JoinTable(name = "user_relation")
	@ManyToMany(fetch = FetchType.EAGER)
	private List<User>		followed;

	// @ManyToMany(mappedBy = "followed")
	// private List<User> followers;


	public String getFullName()
	{
		return firstName + " " + lastName;
	}


	public List<Message> getMessages()
	{
		return messages;
	}


	public void setMessages(List<Message> messages)
	{
		this.messages = messages;
	}


	public Long getId()
	{
		return id;
	}


	public List<User> getFollowed()
	{
		return followed;
	}


	public void setFollowed(List<User> followed)
	{
		this.followed = followed;
	}


	// public List<User> getFollowers()
	// {
	// return followers;
	// }
	//
	//
	// public void setFollowers(List<User> followers)
	// {
	// this.followers = followers;
	// }

	public void setId(Long id)
	{
		this.id = id;
	}


	public String getEmail()
	{
		return email;
	}


	public void setEmail(String email)
	{
		this.email = email;
	}


	public String getPassword()
	{
		return password;
	}


	public void setPassword(String password)
	{
		this.password = password;
	}


	public String getFirstName()
	{
		return firstName;
	}


	public void setFirstName(String firstName)
	{
		this.firstName = firstName;
	}


	public String getLastName()
	{
		return lastName;
	}


	public void setLastName(String lastName)
	{
		this.lastName = lastName;
	}


	public String getCity()
	{
		return city;
	}


	public void setCity(String city)
	{
		this.city = city;
	}


	public String getAddress()
	{
		return address;
	}


	public void setAddress(String address)
	{
		this.address = address;
	}


	public String getZIPCode()
	{
		return ZIPCode;
	}


	public void setZIPCode(String zIPCode)
	{
		ZIPCode = zIPCode;
	}


	public String getPicture()
	{
		return picture;
	}


	public void setPicture(String picture)
	{
		this.picture = picture;
	}


	public Date getInscription()
	{
		return inscription;
	}


	public void setInscription(Date inscription)
	{
		this.inscription = inscription;
	}
//
//
//	public List<Event> getEvents()
//	{
//		return events;
//	}
//
//
//	public void setEvents(List<Event> events)
//	{
//		this.events = events;
//	}
}