package model.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import model.bean.Activity;


/**
 * Cette classe impl�mente les fonctions permettant d'acc�der aux donn�es
 * peristantes concernant un point d'int�r�t.
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