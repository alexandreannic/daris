package model.bean;

/**
 * La classe User repr�sente un utilisateur de l'application pouvant cr�er et
 * participer � des �v�nements.
 */
public class User_stats
{
	private String	day;

	private Long	count;


	public String getDay()
	{
		return day;
	}


	public void setDay(String day)
	{
		this.day = day;
	}


	public Long getCount()
	{
		return count;
	}


	public void setCount(Long count)
	{
		this.count = count;
	}

}