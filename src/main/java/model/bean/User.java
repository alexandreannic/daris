package model.bean;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;


/**
 * La classe User représente un utilisateur de l'application pouvant créer et
 * participer à des événements.
 * 
 * @author Alexandre Annic
 *
 */
@Entity
@Table(name = "User")
public class User
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long		id;

	/**
	 * Adresse email. Doit être unique dans la bdd.
	 */
	@Email
	private String		email;

	/**
	 * Mot de passe encrypté.
	 */
	@NotBlank
	private String		password;

	/**
	 * Prénom
	 */
	@NotBlank
	private String		firstName;

	/**
	 * Nom de famille
	 */
	@NotBlank
	private String		lastName;

	/**
	 * Ville de l'utilisateur. Il s'agit en pratique d'une constante puisque
	 * l'application ne concerne que la ville de Paris. Cependant par soucis
	 * d'évolutivité.
	 */
	private String		city;

	/**
	 * Rue de numero de rue
	 */
	private String		address;

	/**
	 * Code postal
	 */
	private String		ZIPCode;

	private String		picture;

	/**
	 * Users followed (Twitter like)
	 */
//	private List<User>	followed;


	public Long getId()
	{
		return id;
	}


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


//	public List<User> getFollowed()
//	{
//		return followed;
//	}
//
//
//	public void setFollowed(List<User> followed)
//	{
//		this.followed = followed;
//	}
}