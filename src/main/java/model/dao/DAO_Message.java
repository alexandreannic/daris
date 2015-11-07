package model.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import model.bean.Message;
import model.bean.User;


/**
 * Cette classe impl�mente les fonctions permettant d'acc�der aux donn�es
 * peristantes concernant un utilisateur.
 */
@Repository
public class DAO_Message extends DAO<Message, Long>
{

	public List<Message> findAllForUser(User user)
	{
		return em.createQuery(
				"SELECT m "
			+ 	"FROM Message m JOIN m.to receivers "
			+ 	"WHERE receivers.id = " + user.getId()).getResultList();
	}

}