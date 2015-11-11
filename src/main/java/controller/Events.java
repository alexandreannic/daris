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
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import model.bean.Activity;
import model.bean.Event;
import model.bean.Locality;
import model.bean.User;
import model.dao.DAO_Event;
import model.dao.DAO_Locality;
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
				
		return "event/create";
	}
	
	
	/**
	 * Ajout d'un nouvel évènement après validation du formulaire de création
	 */
	@Transactional
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addEvent(@Valid Event event, BindingResult result, RedirectAttributes flash, ModelMap pModel,
			HttpSession session)
	{
		System.out.println("__________________________________");
//		System.out.println(event.getName());
//		System.out.println(event.getDescription());

		Activity act = new Activity();
		act.setLocality(dao_locality.find((long)1));
		List<Activity> acts = new ArrayList<>();
		acts.add(act);
		event.setActivities(acts);
		System.out.println(event.toString());
//		for (Activity a : event.getActivities()) {
//			Locality loc = new Locality();
//			a.setLocality(dao_locality.find(1));
////			System.out.println("- loc id " + a.getLocality().getId());
////			System.out.println("- loc name " + a.getLocality().getName());
////			System.out.println("- from: " + a.getFrom());
////			System.out.println("- to " + a.getTo());
//			// System.out.println(a.getLocality().getName());
//		}
		if (result.hasErrors()) {
			System.out.println("count : " + result.getErrorCount());
			for(ObjectError o :result.getAllErrors()) 
				System.out.println("===>" + o.toString());
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.errorOccurred"));
			return "redirect:/dashboard";
		}

		// ajouter l'évènement
		flash.addFlashAttribute("ALERT_SUCCESS", messages.get("user.controller.success.signup"));
		dao_event.create(event);

		// préparer l'affichage de l'évènement créé
		pModel.addAttribute("event", event);
		pModel.addAttribute("activites", event.getActivities());
		pModel.addAttribute("participants", event.getParticipants());
		
//		Event event2 = dao_event.find((long) 1);
//		for(Activity ac : event2.getActivities()){
//			System.out.println(ac.getLocality().getId());
//			System.out.println(ac.getLocality().getName());
//		}
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
