package utils;

import java.sql.Date;
import java.util.Calendar;
import org.springframework.stereotype.Component;


/**
 * Cette classe implémente une fonction utilitaire permettant de faciliter la
 * récupération d'un MessageSource
 */
@Component
public class Utils
{
	public static Date SQLNow()
	{
		return new Date(Calendar.getInstance().getTime().getTime());
	}
}