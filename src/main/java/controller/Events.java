package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import model.bean.Event;
import model.bean.User;
import model.dao.DAO_Event;
import utils.Messages_i18n;


/**
 * Ce controller impl�mente l'ensemble des routes relatives � un �v�nement.
 * 
 * @author Mehdi Sliem
 *
 */
@Controller
@RequestMapping(value = "/event")
public class Events
{
	@Autowired
	DAO_Event dao_event;
	
	@Autowired
	private Messages_i18n	messages;
	
	/**
	 * Affiche un �v�nement particulier
	 * 
	 * @param pIdCourse
	 * @param session
	 * @param flash
	 * @param pModel
	 * @return
	 */
	@RequestMapping(value = "/view/", method = RequestMethod.GET)
	public String view(@RequestParam(value="eventId")  final Integer eventId, 
			HttpSession session, RedirectAttributes flash, ModelMap pModel)
	{
		// V�rifie que l'utilisateur est connect�
		User user = (User) session.getAttribute("user");
		if (user == null) { return "redirect:/"; }

		// R�cup�re l'�v�nement
		Event event = dao_event.find(eventId);
		if (event == null) { return "redirect:/"; }

		pModel.addAttribute("event", event);
		pModel.addAttribute("activityList", event.getActivities());
		pModel.addAttribute("participantList", event.getParticipants());

		return "viewEvent";
	}
	
	
	/**
	 * Ajout d'un nouvel �v�nement apr�s validation du formulaire de cr�ation
	 * 
	 * @param event
	 * @param result
	 * @param flash
	 * @return
	 */
	@Transactional
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addEvent(@Valid Event event, BindingResult result, RedirectAttributes flash,
			ModelMap pModel, HttpSession session)
	{
		// v�rifier d'il ya des erreurs
		if (result.hasErrors()) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.errorOccurred"));
			return "redirect:/dashboard";
		}

		// Ajouter l'uniquer activit� saisie (le temps de r�gler les probl�mes de l'async)
		
		
		// ajouter l'�v�nement
		flash.addFlashAttribute("ALERT_SUCCESS", messages.get("user.controller.success.signup"));
		dao_event.create(event);
		
		// pr�parer l'affichage de l'�v�nement cr��
		pModel.addAttribute("event", event);
		pModel.addAttribute("activityList", event.getActivities());
		pModel.addAttribute("participantList", event.getParticipants());

		return "viewEvent";
	}
	
	/**
	 * Supprimer un �v�nement
	 * 
	 * @param eventId
	 * @param session
	 * @param flash
	 * @param pModel
	 * @return
	 */
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(@RequestParam(value="eventId")  final Integer eventId, 
			HttpSession session, RedirectAttributes flash, ModelMap pModel)
	{
		// V�rifie que l'utilisateur est connect�
		User user = (User) session.getAttribute("user");
		if (user == null) { return "redirect:/dashbiard"; }

		// Supprimer l'�v�nement
		dao_event.remove(eventId);

		return "dashboard";
	}
}
