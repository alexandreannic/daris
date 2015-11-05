package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import model.bean.Activity;
import model.dao.DAO_Activity;

/**
 * Ce controller implémente l'ensemble des routes relatives à une activité
 * 
 * @author Mehdi Sliem
 *
 */
@Controller
@RequestMapping(value = "/activity")
public class Activities {
	
	@Autowired
	private DAO_Activity dao_activity;
	

	/**
	 * Ajout d'une nouvelle activité après validation du formulaire de création
	 * 
	 * @param activity
	 * @param flash
	 * @param request
	 * @return
	 */
	@Transactional
	@RequestMapping(value = "/add", method = RequestMethod.POST, 
			produces = MediaType.APPLICATION_JSON_VALUE, 
			consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Activity addActivity(@RequestBody Activity activity, RedirectAttributes flash) {
		System.out.println("***********");
		flash.addFlashAttribute("ALERT_SUCCESS", "Activité créée avec succès");
		return dao_activity.create(activity);
	}

}