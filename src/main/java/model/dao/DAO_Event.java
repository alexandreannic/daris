package model.dao;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import model.bean.Event;
import model.bean.Locality;


/**
 * Cette classe implémente les fonctions permettant d'accèder aux données
 * peristantes concernant un évènement.
 * @author Mehdi Sliem
 *
 */
@Repository
public class DAO_Event extends DAO<Event, Long>
{

	public List<Event> findAll()
	{
		return em.createQuery("SELECT e FROM Event e").getResultList();
	}


	public Event findById(String id)
	{
		List results = em.createQuery(
				"SELECT e "
			+ 	"FROM Event e "
			+ 	"WHERE u.id = '" + id + "'"
		)
		.getResultList();
		
		if (results.isEmpty()) 	return null;
		else 					return (Event) results.get(0);
	}
	
	public List<Event> findByLocality(Locality loc)
	{
		List results = em.createQuery(
				"SELECT e "
			+ 	"FROM Event e, Activity a, Locality l "
			+ 	"WHERE e.eventId = a.activityId AND "
			+   "a.localityId IN "
			+   	"SELECT a.localityId"
			+   	"FROM Locality lo"
			+ 		"WHERE lo.name = '" + loc + "'"
		)
		.getResultList();
		
		if (results.isEmpty()) 	return null;
		else 					return results;
	}
	
	public List<Event> findByDate(Date date)
	{
		List results = em.createQuery(
				"SELECT e "
			+ 	"FROM Event e, Activity a"
			+ 	"WHERE e.eventId = a.activityId AND a.from = '"
			+ 	date + "'"
		)
		.getResultList();
		
		if (results.isEmpty()) 	return null;
		else 					return results;
	}
	
	public List<Event> findByBetweenDates(Date from, Date to)
	{
		List results = em.createQuery(
				"SELECT e "
			+ 	"FROM Event e, Activity a"
			+ 	"WHERE e.eventId = a.activityId AND a.from'"
			+ 	"' BETWEEN '" + from + "' AND '" + to + "'"
		)
		.getResultList();
		
		if (results.isEmpty()) 	return null;
		else 					return results;
	}
	
	public void remove(Integer eventID){
		// supprimer d'abord les activités liés
		
		// supprmier l'évènement en question
	}
}