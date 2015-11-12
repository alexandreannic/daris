package controller;

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
import model.bean.Locality;
import model.bean.User;
import model.dao.DAO_Locality;
import utils.Messages_i18n;


/**
 * Ce controller impl�mente l'ensemble des routes relatives � un point d'int�r�t
 */
@Controller
@RequestMapping(value = "/locality")
public class Localities
{
	@Autowired
	private DAO_Locality	dao_locality;

	@Autowired
	private Messages_i18n	messages;


	@RequestMapping(value = "/index")
	public String index(HttpSession session)
	{
		// V�rifie que l'utilisateur est connect�
		User user = (User) session.getAttribute("user");
		if (user == null) { return "redirect:/"; }

		return "locality/index";
	}


	/**
	 * Ajout d'une nouvelle localit� apr�s validation du formulaire de cr�ation
	 */
	@Transactional
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addLocality(@Valid Locality locality, BindingResult result, RedirectAttributes flash, ModelMap pModel)
	{
		// v�rifier d'il ya des erreurs
		if (result.hasErrors()) {
			
			for(ObjectError er : result.getAllErrors()) {
				System.out.println(er);
			}
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.errorOccurred"));
			return "redirect:/admin/dashboard";
		}

		// ajouter la localit�
		flash.addFlashAttribute("ALERT_SUCCESS", "Localit� cr��e avec succ�s");
		dao_locality.create(locality);

		// pr�parer l'affichage de la localit� cr��
		pModel.addAttribute("locality", locality);

		return "redirect:/admin/dashboard";
	}


	/**
	 * Edition d'une localit�
	 * 
	 * @param pIdCourse
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(@RequestParam(value = "localityId") final Integer localityId, RedirectAttributes flash, HttpSession session,
			ModelMap pModel)
	{
		if(! (Boolean) session.getAttribute("session_admin")) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.remove.error"));
			return "redirect:/";
		}

		// Envoyer vers
		pModel.addAttribute("locality", dao_locality.find(localityId));

		return "locality/edit";
	}


	@RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, HttpSession session, RedirectAttributes flash, ModelMap pModel)
	{
		// Ce serait dommage de ne pas voir le joli logo de chargement !
		try {
			Thread.sleep(400);
		}
		catch (InterruptedException e) {
			e.printStackTrace();
		}

		// R�cup�re le point d'int�r�t
		Locality locality = dao_locality.find(id);
		if (locality == null) { return ""; }

		pModel.addAttribute("locality", locality);

		return "locality/view";
	}


	/**
	 * Suppression d'une localit�
	 */
	@Transactional
	@RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
	public String remove(@PathVariable("id") Long id, HttpSession session, RedirectAttributes flash, ModelMap pModel)
	{
		// V�rifie que l'administrateur est connect�
		if(! (Boolean) session.getAttribute("session_admin")) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.remove.error"));
			return "redirect:/";
		}

		dao_locality.delete(id);

		flash.addFlashAttribute("ALERT_SUCCESS", messages.get("view.remove.success"));
		
		return "redirect:/admin/dashboard";
	}


	/**
	 * Retourne en asynchrone la liste des localit�s commen�ants par le param�tre info
	 */
	@RequestMapping(value = "/getLocalities", method = RequestMethod.GET)
	public @ResponseBody List<Locality> getLocalities(@RequestParam(value="info") String info)
	{
        return dao_locality.findAccordingTo(info);
	}

}