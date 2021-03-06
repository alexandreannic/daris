package model.dao;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import org.springframework.stereotype.Repository;
import model.bean.Locality;
import model.bean.User;


/**
 * Cette classe impl�mente les fonctions permettant d'acc�der aux donn�es
 * peristantes concernant un utilisateur.
 */
@Repository
public class DAO_User extends DAO<User, Long>
{

	public List<User> findAll()
	{
		return em.createQuery("SELECT u FROM User u").getResultList();
	}

	/*
	 * Recherche user � partir un id
	 */
	public User findById(Long id){
		List results = em.createQuery(
				"SELECT u "
				+ "FROM User u "
				+ "WHERE u.id = '" + id + "'"
		)
		.getResultList();
		
		if(results.isEmpty()) return null;
		else return (User) results.get(0);
	}
	
	
	public User findByEmail(String email)
	{
		List results = em.createQuery(
				"SELECT u "
			+ 	"FROM User u "
			+ 	"WHERE u.email = '" + email + "'"
		)
		.getResultList();
		
		if (results.isEmpty()) 	return null;
		else 					return (User) results.get(0);
	}
	
	/**
	 * Recherche un user � partir d'une partie du nom
	 * 
	 * @return
	 */
	public List<User> findAccordingTo(String info)
	{
		List<User> all = em.createQuery("SELECT u FROM User u WHERE u.firstName LIKE '%" + info + "%'").getResultList();
		return (List<User>) all;
	}
	
	public boolean isFollowing(User user, User follow)
	{
		int count = (int) em.createQuery(
				"SELECT COUNT(u) "
			+ 	"FROM User u "
			+	"WHERE u.id = " +  user.getId()
			+	"WHERE :user in ELEMENTS(u.followed)"
			)
		.setParameter("user", follow)
		.getSingleResult();
		
		return (count > 0);
	}
	
//	public Long getCountByDate(Calendar calendar)
//	{
//		Date date = new Date(calendar.getTimeInMillis();
//		
//		return em.createQuery(
//				"SELECT COUNT(u) "
//			+ 	"FROM User u "
//			+	"WHERE u.date = '" + date + "'"
//		).getSingleResult();
//	}
}