package model.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


/**
 * Relation follower/followed entre utilisateur type Twitter.
 */
@Entity
@Table(name = "User_relation")
public class User_relation
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long	id;

	@ManyToOne()
	@JoinColumn(name = "user_id")
	private User	follower;

	/**
	 * the user to whom the friendship was asked
	 */
	@ManyToOne()
	@JoinColumn(name = "followed")
	private User	followed;


	public Long getId()
	{
		return id;
	}


	public void setId(Long id)
	{
		this.id = id;
	}


	public User getFollower()
	{
		return follower;
	}


	public void setFollower(User follower)
	{
		this.follower = follower;
	}


	public User getFollowed()
	{
		return followed;
	}


	public void setFollowed(User followed)
	{
		this.followed = followed;
	}

}