package controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import model.bean.Activity;
import model.bean.Event;
import model.bean.Locality;
import model.bean.User;
import model.dao.DAO_Locality;


/**
 * Ce controlleur implémente différentes routes qui ne sont pas relatives à une
 * entité.
 */
@Controller
public class Pages
{	
	@Autowired
	private DAO_Locality	dao_locality;
	
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
		else if(session.getAttribute("session_admin") != null
		&& (Boolean) session.getAttribute("session_admin")) {
			return "redirect:/admin/dashboard";
		}

		// Envoi un bean vide à la vue pour générer un formulaire
		// permettant de créer un utilisateur
		pModel.addAttribute("user", new User());

		return "index";
	}
	
	
	/**
	 * Affiche le tableau de bord de l'utilisateur connecté
	 */
	@RequestMapping(value = "/dashboard")
	public String dashboard(ModelMap pModel, HttpSession session)
	{
		User user = (User) session.getAttribute("user");

		if (user == null) { return "redirect:/"; }

		return "dashboard";
	}
	
	
	/**
	 * Tableau de bord d'un admin
	 */
	@RequestMapping(value = "/admin/dashboard")
	public String dashboardAdmin(ModelMap pModel, HttpSession session)
	{
		if(!(Boolean) session.getAttribute("session_admin")) {
			return "redirect:/";
		}
		pModel.addAttribute("locality", new Locality());
		
		List<Locality> localityList = dao_locality.findAll();
		pModel.addAttribute("localities", localityList);
		
		return "admin/dashboard";
	}
	
	
	/**
	 * Si l'administrateur est connecté, l'envoyer vers la page du
	 * formulaire de création d'une localité
	 * 
	 * @param pModel
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/createLocality")
	public String createLocality(ModelMap pModel, HttpSession session)
	{
		// Vérifie que l'administrateur est bien connecté

		// Envoi un bean vide à la vue pour générer un formulaire
		// permettant de créer une localité
		pModel.addAttribute("locality", new Locality());

		return "createLocality";
	}
	
	/**
	 * So l'utilisateur clique sur le bouton de création d'un évènement,
	 * il est dirigé vers la page du formulaire de création
	 * 
	 * @param pModel
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/createEvent")
	public String createEvent(ModelMap pModel, HttpSession session)
	{
		// Vérifie que l'utilisateur est bien connecté
		User user = (User) session.getAttribute("user");
		if (user == null) { return "redirect:/"; }

		// Envoi un bean vide à la vue pour générer un formulaire
		// permettant de créer un évènement
		pModel.addAttribute("event", new Event());
		pModel.addAttribute("activity", new Activity());

		return "createEvent";
	}

	@RequestMapping(value = "/404")
	public String error404(ModelMap pModel)
	{
		return "error/404";
	}

}