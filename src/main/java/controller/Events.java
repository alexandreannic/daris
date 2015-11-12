package controller;

import java.util.HashMap;
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
import model.dao.DAO_Activity;
import model.dao.DAO_Event;
import model.dao.DAO_Locality;
import model.dao.DAO_User;
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
	DAO_Locality			dao_locality;
	
	@Autowired
	DAO_Activity			dao_activity;
	
	@Autowired
	DAO_User				dao_user;
	
	@Autowired
	private Messages_i18n	messages;


	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(ModelMap pModel, HttpSession session, RedirectAttributes flash)
	{
		// Vérifie que l'utilisateur est connecté
		User user = (User) session.getAttribute("user");
		if (user == null) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.pleaseConnect"));
			return "redirect:/";
		}
		
		List<Event> created = dao_event.findCreatedBy(user.getId());
		List<Event> participated = dao_event.findParticipedBy(user);
		pModel.addAttribute("created", created);
		pModel.addAttribute("participated", participated);
		pModel.addAttribute("events_count", dao_event.countAll(new HashMap<String, Object>()));
		
		return "event/index";
	}
	
	
	/**
	 * Affiche un événement particulier
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

		// Récupére l'événement
		Event event = dao_event.findById(id);
		if (event == null) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.ressourceNotExists"));
			return "redirect:/dashboard";
		}

		pModel.addAttribute("event", event);
		pModel.addAttribute("activities", event.getActivities());
		pModel.addAttribute("participants", event.getParticipants());

		return "event/view";
	}
	
	@Transactional
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") Long id, HttpSession session, RedirectAttributes flash, ModelMap pModel)
	{
		// Vérifie que l'utilisateur est connecté
		User user = (User) session.getAttribute("user");
		if (user == null) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.pleaseConnect"));
			return "redirect:/";
		}

		// Récupére l'événement
		Event event = dao_event.findById(id);
		if (event == null) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.ressourceNotExists"));
			return "redirect:/dashboard";
		}

		pModel.addAttribute("event_edited", event);
		
		for(Activity e : event.getActivities()) {
			System.out.println("--> " + e.getLocality().getName());
		}
		
		// Envoi un bean vide lié au formulaire
		pModel.addAttribute("event", new Event());
//		pModel.addAttribute("activities", event.getActivities());
//		pModel.addAttribute("participants", event.getParticipants());

		return "event/edit";
	}
	
	

	/**
	 * 
	 * @param info
	 * @return
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(ModelMap pModel, HttpSession session, RedirectAttributes flash)
	{
		// Vérifie que l'utilisateur est connecté
		User user = (User) session.getAttribute("user");
		if (user == null) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.pleaseConnect"));
			return "redirect:/";
		}
		
		// Envoi un bean vide lié au formulaire
		pModel.addAttribute("event", new Event());
		
		// La page create et edited son partagée
		pModel.addAttribute("event_edited", new Event());
		
		return "event/create";
	}
	
	
	/**
	 * Ajout d'un nouvel événement après validation du formulaire de création
	 */
	@Transactional
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addEvent(@Valid Event event, BindingResult result, RedirectAttributes flash, ModelMap pModel,
			HttpSession session)
	{
		if (result.hasErrors()) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.errorOccurred"));
			return "redirect:/dashboard";
		}
		
		// Sauve les activités avant de sauver l'événement 
		for (Activity a : event.getActivities()) {
			dao_activity.create(a);
		}
		
		event = dao_event.create(event);
		flash.addFlashAttribute("ALERT_SUCCESS", messages.get("event.controller.create.success"));
		
		return "redirect:/event/view/" + event.getId();
	}


	/**
	 * Supprimer un événement
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

		// Supprimer l'événement
		dao_event.remove(eventId);

		return "dashboard";
	}


	@RequestMapping(value = "/getEvents", method = RequestMethod.GET)
	public @ResponseBody List<Event> getEvents(@RequestParam(value = "info") String info)
	{
		return dao_event.findAccordingTo(info);
	}
}
