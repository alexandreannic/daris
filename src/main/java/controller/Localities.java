package controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import model.bean.Admin;
import model.bean.Locality;
import model.bean.User;
import model.dao.DAO_Locality;
import utils.Messages_i18n;

/**
 * Ce controller impl�mente l'ensemble des routes relatives � un point d'int�r�t
 * 
 * @author Mehdi Sliem
 *
 */
@Controller
@RequestMapping(value = "/locality")
public class Localities {
	@Autowired
	private DAO_Locality dao_locality;

	@Autowired
	private Messages_i18n messages;

	@RequestMapping(value = "/index")
	public String index(HttpSession session) {
		// V�rifie que l'utilisateur est connect�
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/";
		}

		return "locality/index";
	}

	/**
	 * Affiche le tableau de bord de l'administrateur
	 */
	@RequestMapping(value = "/dashboardAdmin")
	public String dashboardAdmin(ModelMap pModel, HttpSession session) {
		// TODO Certainement pas la meilleure fa�on de g�rer la session
		Admin admin = (Admin) session.getAttribute("admin");

		if (admin == null) {
			return "redirect:/";
		}

		// Envoyer la liste des localit�s �xistantes
		List<Locality> localityList = dao_locality.findAll();
		pModel.addAttribute("localityList", localityList);

		return "dashboardAdmin";
	}

	/**
	 * Ajout d'une nouvelle localit� apr�s validation du formulaire de cr�ation
	 * 
	 * @param locality
	 * @param result
	 * @param flash
	 * @param pModel
	 * @return
	 */
	@Transactional
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addLocality(@Valid Locality locality, BindingResult result, RedirectAttributes flash,
			ModelMap pModel) {
		// v�rifier d'il ya des erreurs
		if (result.hasErrors()) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.errorOccurred"));
			return "createLocality";
		}

		// ajouter la localit�
		flash.addFlashAttribute("ALERT_SUCCESS", "Localit� cr��e avec succ�s");
		dao_locality.create(locality);

		// pr�parer l'affichage de la localit� cr��
		pModel.addAttribute("locality", locality);

		return "dashboardAdmin";
	}

	/**
	 * Edition d'une localit�
	 * 
	 * @param pIdCourse
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(@RequestParam(value = "localityId") final Integer localityId, HttpSession session,
			ModelMap pModel) {
		// V�rifie que l'utilisateur est connect�
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/";
		}

		// Envoyer vers
		pModel.addAttribute("locality", dao_locality.find(localityId));

		return "locality/edit";
	}

	/**
	 * Visualisation d'une localit�
	 * 
	 * @param pIdCourse
	 * @param session
	 * @param flash
	 * @param pModel
	 * @return
	 */
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(@RequestParam(value = "localityId") final Long localityId, HttpSession session,
			RedirectAttributes flash, ModelMap pModel) {
		// V�rifie que l'utilisateur est connect�
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/";
		}

		// R�cup�re le point d'int�r�t
		Locality locality = dao_locality.find(localityId);
		if (locality == null) {
			return "redirect:/";
		}

		pModel.addAttribute("locality", locality);

		return "localityView";
	}

	/**
	 * Suppression d'une localit�
	 * 
	 * @param pIdCourse
	 * @param session
	 * @param flash
	 * @param pModel
	 * @return
	 */
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(@RequestParam(value = "localityId") final Long localityId, HttpSession session,
			RedirectAttributes flash, ModelMap pModel) {
		// V�rifie que l'utilisateur est connect�
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/admin";
		}

		// Supprimer le point d'int�r�t
		session.setAttribute("locality", dao_locality.find(localityId));
		dao_locality.delete(localityId);

		// Envoyer la nouvelle liste des localit�s �xistantes
		List<Locality> localityList = dao_locality.findAll();
		pModel.addAttribute("localityList", localityList);

		return "dashboardAdmin";
	}

	/**
	 * Retourne en asynchrone la liste des localit�s commen�ants par tagName
	 * 
	 * @param tagName
	 * @return
	 */
	@RequestMapping(value = "/getLocalities", method = RequestMethod.GET)
	public @ResponseBody List<Locality> getLocalities(@RequestParam String tagName) {
		System.out.println("***********");
		return dao_locality.find(tagName);
	}
	
}