package model.dao;

import java.util.List;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;
import model.bean.User;


/**
 * Cette classe implémente les fonctions permettant d'accèder aux données
 * peristantes concernant un utilisateur.
 * @author Alexandre Annic
 *
 */
@Repository
public class DAO_User extends DAO<User, Long>
{

	public List<User> findAll()
	{
		return em.createQuery("SELECT u FROM User u").getResultList();
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
}