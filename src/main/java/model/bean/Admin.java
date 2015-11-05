package model.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;


/**
 * La classe Admin repr�sente un administrateur de l'application pouvant 
 * cr�er et g�rer les lieux d'int�rtes et les �v�nements
 * 
 * @author Mehdi Sliem
 *
 */
@Entity
@Table(name = "Admin")
public class Admin
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long	adminId;

	/**
	 * Identificateur. Doit �tre unique dans la bdd.
	 */
	@NotBlank
	private String	idf;

	/**
	 * Mot de passe encrypt�.
	 */
	@NotBlank
	private String	password;

	/**
	 * Pr�nom
	 */
	@NotBlank
	private String	firstName;

	/**
	 * Nom de famille
	 */
	@NotBlank
	private String	lastName;

	// Getters & Setters
	public Long getAdminId() {
		return adminId;
	}

	public void setAdminId(Long adminId) {
		this.adminId = adminId;
	}

	public String getIdf() {
		return idf;
	}

	public void setIdf(String idf) {
		this.idf = idf;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
}