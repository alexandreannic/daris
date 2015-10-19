package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
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


	@RequestMapping(value = "/users")
	public String users(ModelMap pModel)
	{
		User u = (User) service.find((long) 1);
		pModel.addAttribute("users", service.findAll());
		pModel.addAttribute("personne", "Regis");
		return "users";
	}


	@Transactional
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String add(@Valid User user, BindingResult result, RedirectAttributes flash)
	{
		if (result.hasErrors()) {
			flash.addFlashAttribute("NOTIFICATION_ERROR", "nok!");
			return "redirect:/";
		}

		flash.addFlashAttribute("NOTIFICATION_SUCCESS", "ok!");
		service.create(user);
		return "redirect:/";
	}


	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String signin(String email, String password, RedirectAttributes flash, HttpSession session)
	{
		// Verifie que les entrées sont valides
		if (email.length() < 3 || email.length() > 32) {
			flash.addFlashAttribute("NOTIFICATION_ERROR", "nok uname !");
			return "redirect:/";
		}
		if (password.equals("")) {
			flash.addFlashAttribute("NOTIFICATION_ERROR", "nok pwd null!");
			return "redirect:/";
		}

		User user = service.findByEmail(email);

		// Verifie que l'utilisateur existe
		if (user == null) {
			flash.addFlashAttribute("NOTIFICATION_ERROR", "nok email !");
			return "redirect:/";
		}

		// Verifie que le mot de passe est correct
		if (!user.getPassword().equals(password)) {
			flash.addFlashAttribute("NOTIFICATION_ERROR", "nok pwd !");
			return "redirect:/";
		}

		session.setAttribute("user", user);

		return "redirect:/dashboard";
	}


	@RequestMapping(value = "/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/";
	}

}
