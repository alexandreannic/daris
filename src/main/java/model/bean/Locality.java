package model.bean;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;


/**
 * La classe Locality repr�sente un point d'inter�t r�f�renc� par l'application
 * tel qu'un mus�e.
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
	private Long			localityId;

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
	private Locality_type	type;

	private String			description;

	@Range(min = 0, max = 5)
	private Integer			note;

	private String price;
	
	private Integer latitude;
	
	private Integer longetude;

	public Long getLocalityId() {
		return localityId;
	}

	public void setLocalityId(Long localityId) {
		this.localityId = localityId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZIPCode() {
		return ZIPCode;
	}

	public void setZIPCode(String zIPCode) {
		ZIPCode = zIPCode;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Locality_type getType() {
		return type;
	}

	public void setType(Locality_type type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getNote() {
		return note;
	}

	public void setNote(Integer note) {
		this.note = note;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Integer getLatitude() {
		return latitude;
	}

	public void setLatitude(Integer latitude) {
		this.latitude = latitude;
	}

	public Integer getLongetude() {
		return longetude;
	}

	public void setLongetude(Integer longetude) {
		this.longetude = longetude;
	}

	
}