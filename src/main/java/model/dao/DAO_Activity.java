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
	/**
	 * Methode permettant de récupérer toutes les localités
	 * 
	 * @return liste des activités récupérés
	 */
	public List<Activity> findAll()
	{
		return em.createQuery("SELECT a FROM Activity a").getResultList();
	}

}