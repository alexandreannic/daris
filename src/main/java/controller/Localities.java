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
	private DAO_User dao_user;
	
	@RequestMapping(value = "/index")
	public String index(HttpSession session)
	{
		User user = (User) session.getAttribute("user");

		if (user == null) {
			return "redirect:/";
		}
		
		return "locality/index";
	}
}