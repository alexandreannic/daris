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
	 * Si l'utilisateur n'est pas connect� : affiche la page d'accueil Sinon
	 * affiche le tableau de bord de l'utilisateur
	 */
	@RequestMapping(value = "/")
	public String index(ModelMap pModel, HttpSession session)
	{
		// V�rifie que l'utilisateur est bien connect�
		User user = (User) session.getAttribute("user");
		if (user != null) {
			return "redirect:/dashboard";
		}

		// Envoi un bean vide � la vue pour g�n�rer un formulaire
		// permettant de cr�er un utilisateur
		pModel.addAttribute("user", new User());

		return "index/index";
	}


	/**
	 * Affiche le tableau de bord de l'utilisateur connect�
	 */
	@RequestMapping(value = "/dashboard")
	public String dashboard(ModelMap pModel, HttpSession session)
	{
		// TODO Certainement pas la meilleure fa�on de g�rer la session
		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "redirect:/";
		}

		return "dashboard/dashboard";
	}
}