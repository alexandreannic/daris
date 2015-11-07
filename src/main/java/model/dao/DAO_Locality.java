package model.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import model.bean.Locality;


/**
 * Cette classe impl�mente les fonctions permettant d'acc�der aux donn�es
 * peristantes concernant un point d'int�r�t.
 */
@Repository
public class DAO_Locality extends DAO<Locality, Long>
{
	/**
	 * Methode permettant de r�cup�rer toutes les localit�s
	 * 
	 * @return liste des localit�s r�cup�r�s
	 */
	public List<Locality> findAll()
	{
		return em.createQuery("SELECT l FROM Locality l").getResultList();
	}
	
	/**
	 * Recherche une localit� � partir d'une partie du nom
	 * 
	 * @return
	 */
	public List<Locality> find(String info)
	{
		List<Locality> all = em.createQuery("SELECT l FROM Locality l WHERE l.name LIKE '%" + info + "%'").getResultList();
		return (List<Locality>) all;
	}
	
	/**
	 * Methode permettant d'ajouter une nouvelle localit�
	 * 
	 * @param l localit� � ajouter
	 * @return 'vrai' si la localit� a �t� ajout� � la base, 'faux' si elle
	 * existe d�ja
	 */
	public boolean addLocality(Locality l){
		
		// V�rifier que la nouvelle localit� n'�xiste pas d�ja dans la base
		if(em.createQuery("SELECT l FROM Locality l "
				+ "WHERE l.name = '" + l.getName() + "'")
				.getResultList().isEmpty())
		{
			
			// Si c'est le cas, l'ajouter et retourner 'vrai'
			em.createQuery("*** Requ�te SQL d'ajout !!! ***");
			return true;
		}
		
		// Si la localit� �xiste d�ja, retourner 'faux'
		else
		{
			return false;
		}
	}

}