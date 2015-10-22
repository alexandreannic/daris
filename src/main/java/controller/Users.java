package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import model.bean.User;
import model.dao.DAO_User;


@Controller
public class Users
{
	@Autowired
	private DAO_User service;


	/**
	 * Affiche la page permettant à un utilisateur de modifier ses paramêtres
	 */
	@RequestMapping(value = "/settings")
	public String viewSetting(HttpSession session)
	{
		
		return "user/settings/settings";
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
			flash.addFlashAttribute("ALERT_ERROR", "nok!");
			return "redirect:/";
		}

		flash.addFlashAttribute("ALERT_SUCCESS", "ok!");
		service.create(user);
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
			flash.addFlashAttribute("ALERT_ERROR", "nok uname !");
			return "redirect:/";
		}
		if (password.equals("")) {
			flash.addFlashAttribute("ALERT_ERROR", "nok pwd null!");
			return "redirect:/";
		}

		User user = service.findByEmail(email);

		// Verifie que l'utilisateur existe
		if (user == null) {
			flash.addFlashAttribute("ALERT_ERROR", "nok email !");
			return "redirect:/";
		}

		// Verifie que le mot de passe est correct
		if (!user.getPassword().equals(password)) {
			flash.addFlashAttribute("ALERT_ERROR", "nok pwd !");
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
