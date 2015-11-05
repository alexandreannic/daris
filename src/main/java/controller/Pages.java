package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import model.bean.Activity;
import model.bean.Admin;
import model.bean.Event;
import model.bean.Locality;
import model.bean.User;


/**
 * Ce controlleur impl�mente diff�rentes routes qui ne sont pas relatives � une
 * entit�.
 * 
 * @author Alexandre Annic
 * @author Mehdi Sliem
 *
 */
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
		if (user != null) { return "redirect:/dashboard"; }

		// Envoi un bean vide � la vue pour g�n�rer un formulaire
		// permettant de cr�er un utilisateur
		pModel.addAttribute("user", new User());

		return "index";
	}
	
	/**
	 * Si l'administrateur n'est pas connect� : affiche la page d'accueil administrateur
	 *  Sinon affiche le tableau de bord de l'administrateur
	 */
	@RequestMapping(value = "/admin")
	public String indexAdmin(ModelMap pModel, HttpSession session)
	{
		// V�rifie que l'utilisateur est bien connect�
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin != null) { return "redirect:/locality/dashboardAdmin"; }
		
		return "admin";
	}
	
	
	/**
	 * Affiche le tableau de bord de l'utilisateur connect�
	 */
	@RequestMapping(value = "/dashboard")
	public String dashboard(ModelMap pModel, HttpSession session)
	{
		// TODO Certainement pas la meilleure fa�on de g�rer la session
		User user = (User) session.getAttribute("user");

		if (user == null) { return "redirect:/"; }

		return "dashboard";
	}
	
	
	/**
	 * Affiche le tableau de bord administrateur
	 */
	@RequestMapping(value = "/dashboardAdmin")
	public String dashboardAdmin(ModelMap pModel, HttpSession session)
	{
		// TODO Certainement pas la meilleure fa�on de g�rer la session
		Admin admin = (Admin) session.getAttribute("admin");

		if (admin == null) { return "redirect:/"; }

		return "dashboardAdmin";
	}
	
	/**
	 * Si l'administrateur est connect�, l'envoyer vers la page du
	 * formulaire de cr�ation d'une localit�
	 * 
	 * @param pModel
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/createLocality")
	public String createLocality(ModelMap pModel, HttpSession session)
	{
		// V�rifie que l'administrateur est bien connect�
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) { return "admin"; }

		// Envoi un bean vide � la vue pour g�n�rer un formulaire
		// permettant de cr�er une localit�
		pModel.addAttribute("locality", new Locality());

		return "createLocality";
	}
	
	/**
	 * So l'utilisateur clique sur le bouton de cr�ation d'un �v�nement,
	 * il est dirig� vers la page du formulaire de cr�ation
	 * 
	 * @param pModel
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/createEvent")
	public String createEvent(ModelMap pModel, HttpSession session)
	{
		// V�rifie que l'utilisateur est bien connect�
		User user = (User) session.getAttribute("user");
		if (user == null) { return "redirect:/"; }

		// Envoi un bean vide � la vue pour g�n�rer un formulaire
		// permettant de cr�er un �v�nement
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