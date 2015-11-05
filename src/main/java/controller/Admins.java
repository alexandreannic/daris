package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import model.bean.Admin;
import model.dao.DAO_Admin;
import utils.Messages_i18n;


/**
 * Ce controller implémente l'ensemble des routes relatives à un administrateur.
 * 
 * @author Mehdi Sliem
 *
 */
@Controller
@RequestMapping(value = "/admin")
public class Admins
{
	@Autowired
	private DAO_Admin		dao_admin;

	@Autowired
	private Messages_i18n	messages;


	/**
	 * Authentifie un adiministrateur
	 * @param idf
	 * @param password
	 */
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String signinAdmin(String idf, String password, RedirectAttributes flash, HttpSession session)
	{
		// Verifie que les entrées sont valides
		if (idf.length() < 3 || idf.length() > 32) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("admin.controller.error.idf"));
			return "redirect:/";
		}
		if (password.equals("")) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("user.controller.error.pwdEmpty"));
			return "redirect:/";
		}

		Admin admin = dao_admin.findByIdf(idf);

		// Verifie que l'identifiant existe
		if (admin == null) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("admin.controller.error.idfNoExist"));
			return "redirect:/";
		}

		// Verifie que le mot de passe est correct
		if (!admin.getPassword().equals(password)) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("user.controller.error.pwdIncorrect"));
			return "redirect:/";
		}

		session.setAttribute("admin", admin);

		return "redirect:/locality/dashboardAdmin";
	}


	/**
	 * Deconnecte un utilisateur
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();

		return "redirect:/";
	}
}
