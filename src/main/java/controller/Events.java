package controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import model.bean.User;


@Controller
public class Events
{
	@RequestMapping(value = "/event")
	public String event(ModelMap pModel, HttpSession session)
	{
		// TODO Certainement pas la bonne façon de gérer la session
		User user = (User) session.getAttribute("user");
		
		if(user == null) {
			return "redirect:/";
		}
		
		return "event/event";
	}
}
