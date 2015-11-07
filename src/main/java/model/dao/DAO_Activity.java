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
	/**
	 * Methode permettant de r�cup�rer toutes les localit�s
	 * 
	 * @return liste des activit�s r�cup�r�s
	 */
	public List<Activity> findAll()
	{
		return em.createQuery("SELECT a FROM Activity a").getResultList();
	}

}