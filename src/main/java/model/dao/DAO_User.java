package model.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.springframework.stereotype.Repository;
import model.bean.User;


@Repository
public class DAO_User extends DAO<User, Long>
{

	public List<User> findAll()
	{
		return em.createQuery("SELECT u FROM User u").getResultList();
	}
}