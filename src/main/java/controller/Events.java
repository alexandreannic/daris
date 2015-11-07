package controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import model.bean.Activity;
import model.bean.Event;
import model.bean.User;
import model.dao.DAO_Event;
import utils.Messages_i18n;


/**
 * Ce controller implémente l'ensemble des routes relatives à un événement.
 */
@Controller
@RequestMapping(value = "/event")
public class Events
{
	@Autowired
	DAO_Event				dao_event;

	@Autowired
	private Messages_i18n	messages;


	/**
	 * Affiche un évènement particulier
	 */
	@Transactional
	@RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, HttpSession session, RedirectAttributes flash, ModelMap pModel)
	{
		// Vérifie que l'utilisateur est connecté
		User user = (User) session.getAttribute("user");
		if (user == null) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.pleaseConnect"));
			return "redirect:/";
		}

		// Récupére l'évènement
		Event event = dao_event.find(id);
		if (event == null) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.ressourceNotExists"));
			return "redirect:/dashboard";
		}

		pModel.addAttribute("event", event);
		pModel.addAttribute("activities", event.getActivities());
		pModel.addAttribute("participantList", event.getParticipants());

		return "event/view";
	}


	/**
	 * Ajout d'un nouvel évènement après validation du formulaire de création
	 */
	@Transactional
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addEvent(@Valid Event event, BindingResult result, RedirectAttributes flash, ModelMap pModel,
			HttpSession session)
	{
		System.out.println("ADDD ! + ");
		for (Activity a : event.getActivities()) {
			System.out.println(a.getFrom());
			// System.out.println(a.getLocality().getName());
		}
		if (result.hasErrors()) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.errorOccurred"));
			return "redirect:/dashboard";
		}

		// ajouter l'évènement
		flash.addFlashAttribute("ALERT_SUCCESS", messages.get("user.controller.success.signup"));
		dao_event.create(event);

		// préparer l'affichage de l'évènement créé
		pModel.addAttribute("event", event);
		pModel.addAttribute("activityList", event.getActivities());
		pModel.addAttribute("participantList", event.getParticipants());

		return "viewEvent";
	}


	/**
	 * Supprimer un évènement
	 */
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(@RequestParam(value = "eventId") final Integer eventId, HttpSession session,
			RedirectAttributes flash, ModelMap pModel)
	{
		// Vérifie que l'utilisateur est connecté
		User user = (User) session.getAttribute("user");
		if (user == null) { 
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.pleaseConnect"));
			return "redirect:/"; 
		}

		// Supprimer l'évènement
		dao_event.remove(eventId);

		return "dashboard";
	}


	@RequestMapping(value = "/getEvents", method = RequestMethod.GET)
	public @ResponseBody List<Event> getEvents(@RequestParam(value = "info") String info)
	{
		return dao_event.findAccordingTo(info);
	}
}
