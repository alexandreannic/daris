package utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Component;


/**
 * Cette classe implémente une fonction utilitaire permettant de faciliter la
 * récupération d'un MessageSource
 */
@Component
public class Messages_i18n
{
	@Autowired
	private MessageSource messagesSource;


	/**
	 * Récupère un message sans paramètre
	 * @param id
	 * @return
	 */
	public String get(String id)
	{
		return messagesSource.getMessage(id, null, LocaleContextHolder.getLocale());
	}
}