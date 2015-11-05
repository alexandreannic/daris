package controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import model.bean.Locality;
import model.bean.User;
import model.dao.DAO_Locality;


/**
 * Ce controller implémente l'ensemble des routes relatives à un point d'intérêt
 * 
 * @author Alexandre Annic
 *
 */
@Controller
@RequestMapping(value = "/locality")
public class Localities
{
	@Autowired
	DAO_Locality dao_locality;


	@RequestMapping(value = "/index")
	public String index(HttpSession session)
	{
		// Vérifie que l'utilisateur est connecté
		User user = (User) session.getAttribute("user");
		if (user == null) { return "redirect:/"; }

		return "locality/index";
	}


	@RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") Long id, HttpSession session, RedirectAttributes flash, ModelMap pModel)
	{
		// Ce serait dommage de ne pas voir le joli logo de chargement !
		try {
			Thread.sleep(500);
		}
		catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		// Vérifie que l'utilisateur est connecté
		User user = (User) session.getAttribute("user");
		if (user == null) { return ""; }

		// Récupére le point d'intérêt
		Locality locality = dao_locality.find(id);
		if (locality == null) { return ""; }

		pModel.addAttribute("locality", locality);

		return "locality/view";
	}
}