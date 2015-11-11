package utils;

import java.sql.Date;
import java.util.Calendar;
import org.springframework.stereotype.Component;


/**
 * Cette classe impl�mente une fonction utilitaire permettant de faciliter la
 * r�cup�ration d'un MessageSource
 */
@Component
public class Utils
{
	public static Date SQLNow()
	{
		return new Date(Calendar.getInstance().getTime().getTime());
	}
}