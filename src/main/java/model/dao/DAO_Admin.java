package model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import model.bean.Admin;
import model.bean.User;


/**
 * Cette classe implémente les fonctions permettant d'accèder aux données
 * peristantes concernant un administrateur.
 * @author Mehdi Sliem
 *
 */
@Repository
public class DAO_Admin extends DAO<Admin, Long>
{

	public List<User> findAll()
	{
		return em.createQuery("SELECT a FROM Admin a").getResultList();
	}


	public Admin findByIdf(String idf)
	{
		List results = em.createQuery(
				"SELECT a "
			+ 	"FROM Admin a "
			+ 	"WHERE a.idf = '" + idf + "'"
		)
		.getResultList();
		
		if (results.isEmpty()) 	return null;
		else 					return (Admin) results.get(0);
	}
}