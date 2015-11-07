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
 * Ce controller impl�mente l'ensemble des routes relatives � un �v�nement.
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
	 * Affiche un �v�nement particulier
	 */
	@Transactional
	@RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, HttpSession session, RedirectAttributes flash, ModelMap pModel)
	{
		// V�rifie que l'utilisateur est connect�
		User user = (User) session.getAttribute("user");
		if (user == null) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.pleaseConnect"));
			return "redirect:/";
		}

		// R�cup�re l'�v�nement
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
	 * Ajout d'un nouvel �v�nement apr�s validation du formulaire de cr�ation
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
	 */
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(@RequestParam(value = "eventId") final Integer eventId, HttpSession session,
			RedirectAttributes flash, ModelMap pModel)
	{
		// V�rifie que l'utilisateur est connect�
		User user = (User) session.getAttribute("user");
		if (user == null) { 
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.pleaseConnect"));
			return "redirect:/"; 
		}

		// Supprimer l'�v�nement
		dao_event.remove(eventId);

		return "dashboard";
	}


	@RequestMapping(value = "/getEvents", method = RequestMethod.GET)
	public @ResponseBody List<Event> getEvents(@RequestParam(value = "info") String info)
	{
		return dao_event.findAccordingTo(info);
	}
}
