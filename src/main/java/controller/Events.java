package controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import model.bean.User;


/**
 * Ce controller implémente l'ensemble des routes relatives à un événement.
 * 
 * @author Alexandre Annic
 *
 */
@Controller
@RequestMapping(value = "/event")
public class Events
{
	@RequestMapping(value = "/index")
	public String event(ModelMap pModel, HttpSession session)
	{
		// TODO Certainement pas la bonne façon de gérer la session
		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "redirect:/";
		}

		return "event/index";
	}
}
