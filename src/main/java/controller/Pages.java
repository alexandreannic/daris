package controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import model.bean.User;


@Controller
public class Pages
{
	/**
	 * Si l'utilisateur n'est pas connecté : affiche la page d'accueil Sinon
	 * affiche le tableau de bord de l'utilisateur
	 */
	@RequestMapping(value = "/")
	public String index(ModelMap pModel, HttpSession session)
	{
		// Vérifie que l'utilisateur est bien connecté
		User user = (User) session.getAttribute("user");
		if (user != null) {
			return "redirect:/dashboard";
		}

		// Envoi un bean vide à la vue pour générer un formulaire
		// permettant de créer un utilisateur
		pModel.addAttribute("user", new User());

		return "index/index";
	}


	/**
	 * Affiche le tableau de bord de l'utilisateur connecté
	 */
	@RequestMapping(value = "/dashboard")
	public String dashboard(ModelMap pModel, HttpSession session)
	{
		// TODO Certainement pas la meilleure façon de gérer la session
		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "redirect:/";
		}

		return "dashboard/dashboard";
	}
}