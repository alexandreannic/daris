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
 * Ce controlleur impl�mente diff�rentes routes qui ne sont pas relatives � une
 * entit�.
 */
@Controller
public class Pages
{	
	@Autowired
	private DAO_Locality	dao_locality;
	
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
		else if(session.getAttribute("session_admin") != null
		&& (Boolean) session.getAttribute("session_admin")) {
			return "redirect:/admin/dashboard";
		}

		// Envoi un bean vide � la vue pour g�n�rer un formulaire
		// permettant de cr�er un utilisateur
		pModel.addAttribute("user", new User());

		return "index";
	}
	
	
	/**
	 * Affiche le tableau de bord de l'utilisateur connect�
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