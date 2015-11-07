package model.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import model.bean.Locality;


/**
 * Cette classe implémente les fonctions permettant d'accèder aux données
 * peristantes concernant un point d'intérêt.
 */
@Repository
public class DAO_Locality extends DAO<Locality, Long>
{
	/**
	 * Methode permettant de récupérer toutes les localités
	 * 
	 * @return liste des localités récupérés
	 */
	public List<Locality> findAll()
	{
		return em.createQuery("SELECT l FROM Locality l").getResultList();
	}
	
	/**
	 * Recherche une localité à partir d'une partie du nom
	 * 
	 * @return
	 */
	public List<Locality> find(String info)
	{
		List<Locality> all = em.createQuery("SELECT l FROM Locality l WHERE l.name LIKE '%" + info + "%'").getResultList();
		return (List<Locality>) all;
	}
	
	/**
	 * Methode permettant d'ajouter une nouvelle localité
	 * 
	 * @param l localité à ajouter
	 * @return 'vrai' si la localité a été ajouté à la base, 'faux' si elle
	 * existe déja
	 */
	public boolean addLocality(Locality l){
		
		// Vérifier que la nouvelle localité n'éxiste pas déja dans la base
		if(em.createQuery("SELECT l FROM Locality l "
				+ "WHERE l.name = '" + l.getName() + "'")
				.getResultList().isEmpty())
		{
			
			// Si c'est le cas, l'ajouter et retourner 'vrai'
			em.createQuery("*** Requête SQL d'ajout !!! ***");
			return true;
		}
		
		// Si la localité éxiste déja, retourner 'faux'
		else
		{
			return false;
		}
	}

}