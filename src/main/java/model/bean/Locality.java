package model.bean;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.Table;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;


/**
 * La classe Locality représente un point d'interêt référencé par l'application
 * tel qu'un musée.
 * 
 * @author Alexandre Annic
 *
 */
@Entity
@Table(name = "Locality")
public class Locality
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long			id;

	@NotBlank
	private String			name;

	/**
	 * Rue de numero de rue
	 */
	@NotBlank
	private String			address;

	@NotBlank
	private String			ZIPCode;

	private String			picture;

	@Enumerated(EnumType.STRING)
	private Locality_type	locality_type;

	private String			description;

	@Range(min = 0, max = 5)
	private Integer			note;
}