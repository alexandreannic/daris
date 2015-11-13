package model.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import model.bean.Activity;


/**
 * Cette classe implémente les fonctions permettant d'accèder aux données
 * peristantes concernant un point d'intérêt.
 */
@Repository
public class DAO_Activity extends DAO<Activity, Long>
{
	public List<Activity> findByEventId(Long id)
	{
//		List results = em.createQuery(
//				"SELECT a "
//			+	"FROM Activity a, Event e "
//			+ 	"WHERE a.id = e.activity."
//		);
		return null;
	}
}