package controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import model.bean.Locality;
import model.bean.User;
import model.bean.User_stats;
import model.dao.DAO_User;
import utils.Messages_i18n;


/**
 * Ce controller implémente l'ensemble des routes relatives à un utilisateur.
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
			flash.addFlashAttribute("ALERT_ERROR", messages.get("user.controller.error.pwdEmpty"));
			return "redirect:/";
		}

		// Vérifie admin
		if (email.equals("admin") && password.equals("d033e22ae348aeb5660fc2140aec35850c4da997")) {
			session.setAttribute("session_admin", true);
			return "redirect:/";
		}

		User user = dao_user.findByEmail(email);

		// Verifie que l'email existe
		if (user == null) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("user.controller.error.emailNoExist"));
			return "redirect:/";
		}

		// Verifie que le mot de passe est correct
		if (!user.getPassword().equals(password)) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("user.controller.error.pwdIncorrect"));
			return "redirect:/";
		}

		session.setAttribute("user", user);

		return "redirect:/";
	}


	@RequestMapping(value = "/getStats")
	public @ResponseBody List<User_stats> getShopInJSON()
	{
		String dateFormat = messages.get("dateFormat");
		SimpleDateFormat format = new SimpleDateFormat(dateFormat);
		
		List<User_stats> stats = new ArrayList<>();
		
		Calendar calendar = Calendar.getInstance();
		
		for(int i = 1; i <= calendar.get(Calendar.DAY_OF_MONTH); i++) {
			Calendar day = Calendar.getInstance();
			day.set(Calendar.DAY_OF_MONTH, i);
			
			User_stats stat = new User_stats();
			stat.setDay(format.format(day.getTime()));
			
			Map<String, Object> args = new HashMap<String, Object>();
			args.put("inscription",  new Date(day.getTimeInMillis()));
			stat.setCount(dao_user.countAll(args));
			
			stats.add(stat);
		}
		return stats;
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


	@Transactional
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String edit(User user, BindingResult result, RedirectAttributes flash, HttpSession session)
	{
		if (result.hasErrors()) {
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.errorOccurred"));
			return "redirect:/user/settings/";
		}

		User u = (User) session.getAttribute("user");
		u.setFirstName(user.getFirstName());
		u.setLastName(user.getLastName());
		u.setAddress(user.getAddress());
		u.setCity(user.getCity());

		dao_user.update(u);

		flash.addFlashAttribute("ALERT_SUCCESS", messages.get("user.controller.success.edit"));

		return "redirect:/user/settings";
	}
	
	@RequestMapping(value = "/getUsers", method = RequestMethod.GET)
	public @ResponseBody List<User> getUsers(@RequestParam(value="info") String info)
	{
        return dao_user.findAccordingTo(info);
	}
}
