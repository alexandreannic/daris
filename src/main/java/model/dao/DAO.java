package model.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;


/**
 * Cette classe implémente les fonctions CRUD utilisées par toutes les entitées.
 */
public class DAO<T, ID extends Serializable>
{
	@PersistenceContext
	protected EntityManager	em;

	private Class<T>		type;


	public DAO()
	{
		Type t = getClass().getGenericSuperclass();
		ParameterizedType pt = (ParameterizedType) t;
		type = (Class) pt.getActualTypeArguments()[0];
	}


	/**
	 * Recherche l'entité T à partir de son identifiant.
	 * @param id
	 * @return
	 */
	public T find(final Object id)
	{
		return (T) em.find(type, id);
	}
	
	public List<T> findAll()
	{
        return em.createQuery("Select t from " + type.getSimpleName() + " t").getResultList();

	}


	/**
	 * Retourne le nombre d'entités stocké dans la base de données
	 * @param params
	 * @return
	 */
	public long countAll(final Map<String, Object> params)
	{

		final StringBuffer queryString = new StringBuffer("SELECT count(o) from ");

		queryString.append(type.getSimpleName()).append(" o ");
		queryString.append(this.getQueryClauses(params, null));

		final Query query = em.createQuery(queryString.toString());

		return (Long) query.getSingleResult();

	}


	/**
	 * Sauvegarde une instance de l'entité T dans la base de données
	 * @param t
	 * @return
	 */
	public T create(final T t)
	{
		em.persist(t);
		em.flush();
		return t;
	}


	public void delete(final Object id)
	{
		em.remove(em.getReference(type, id));
	}


	public T update(final T t)
	{
		return em.merge(t);
	}


	private String getQueryClauses(final Map<String, Object> params, final Map<String, Object> orderParams)
	{
		final StringBuffer queryString = new StringBuffer();
		if ((params != null) && !params.isEmpty()) {
			queryString.append(" where ");
			for (final Iterator<Map.Entry<String, Object>> it = params.entrySet().iterator(); it.hasNext();) {
				final Map.Entry<String, Object> entry = it.next();
				if (entry.getValue() instanceof Boolean) {
					queryString.append(entry.getKey()).append(" is ").append(entry.getValue()).append(" ");
				}
				else {
					if (entry.getValue() instanceof Number) {
						queryString.append(entry.getKey()).append(" = ").append(entry.getValue());
					}
					else {
						// string equality
						queryString.append(entry.getKey()).append(" = '").append(entry.getValue()).append("'");
					}
				}
				if (it.hasNext()) {
					queryString.append(" and ");
				}
			}
		}
		if ((orderParams != null) && !orderParams.isEmpty()) {
			queryString.append(" order by ");
			for (final Iterator<Map.Entry<String, Object>> it = orderParams.entrySet().iterator(); it.hasNext();) {
				final Map.Entry<String, Object> entry = it.next();
				queryString.append(entry.getKey()).append(" ");
				if (entry.getValue() != null) {
					queryString.append(entry.getValue());
				}
				if (it.hasNext()) {
					queryString.append(", ");
				}
			}
		}
		return queryString.toString();
	}

}
