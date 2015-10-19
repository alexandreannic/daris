package controller;

import javax.servlet.http.HttpSession;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import model.bean.User;


@Controller
public class Dashboard
{


	@RequestMapping(value = "/dashboard")
	public String index(ModelMap pModel, HttpSession session)
	{
		// TODO Certainement pas la bonne façon de gérer la session
		User user = (User) session.getAttribute("user");
		
		if(user == null) {
			return "redirect:/";
		}
		
		
		return "dashboard/dashboard";
	}
}