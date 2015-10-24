package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import model.bean.User;
import model.dao.DAO_User;
import utils.Messages_i18n;


/**
 * Ce controller implémente l'ensemble des routes relatives à un utilisateur.
 * 
 * @author Alexandre Annic
 *
 */
@Controller
@RequestMapping(value = "/user")
public class Users
{
	@Autowired
	private DAO_User		dao_user;

	@Autowired
	private Messages_i18n	messages;


	/**
	 * Affiche la page permettant à un utilisateur de modifier ses paramêtres
	 */
	@RequestMapping(value = "/settings")
	public String viewSetting(HttpSession session)
	{

		return "user/settings";
	}


	/**
	 * Ajoute un utilisateur
	 * @user utilisateur s'étant inscrit
	 */
	@Transactional
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(@Valid User user, BindingResult result, RedirectAttributes flash)
	{
		if (result.hasErrors()) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.errorOccurred"));
			return "redirect:/";
		}

		flash.addFlashAttribute("ALERT_SUCCESS", messages.get("user.controller.success.signup"));
		dao_user.create(user);

		return "redirect:/";
	}


	/**
	 * Authentifie un utilisateur
	 * @param email
	 * @param password
	 */
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String signin(String email, String password, RedirectAttributes flash, HttpSession session)
	{
		// Verifie que les entrées sont valides
		if (email.length() < 3 || email.length() > 32) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("user.controller.error.email"));
			return "redirect:/";
		}
		if (password.equals("")) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("Veuillez saisir un mot de passe"));
			return "redirect:/";
		}

		User user = dao_user.findByEmail(email);

		// Verifie que l'email existe
		if (user == null) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("L'adresse email n'existe pas"));
			return "redirect:/";
		}

		// Verifie que le mot de passe est correct
		if (!user.getPassword().equals(password)) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("Le mot de passe est incorrect"));
			return "redirect:/";
		}

		session.setAttribute("user", user);

		return "redirect:/dashboard";
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
