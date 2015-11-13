package controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import model.bean.Activity;
import model.bean.Event;
import model.dao.DAO_Activity;
import model.dao.DAO_Event;


/**
 * Ce controller implémente l'ensemble des routes relatives à une activité
 */
@Controller
@RequestMapping(value = "/activity")
public class Activities
{

	@Autowired
	private DAO_Activity dao_activity;

	@Autowired
	private DAO_Event 	dao_event;

	/**
	 * Ajout d'une nouvelle activité après validation du formulaire de création
	 */
	@Transactional
	@RequestMapping(value = "/add", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Activity addActivity(@RequestBody Activity activity, RedirectAttributes flash)
	{
		flash.addFlashAttribute("ALERT_SUCCESS", "Activité créée");
		return dao_activity.create(activity);
	}
	
	
	@RequestMapping(value = "/getActivities", method = RequestMethod.GET)
	public @ResponseBody List<Activity> getActivities(@RequestParam(value = "id") Long id)
	{
		Event e = dao_event.findById(id);
		return e.getActivities();
	}
}