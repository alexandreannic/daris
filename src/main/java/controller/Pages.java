package controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import model.bean.User;


@Controller
public class Pages
{
	@RequestMapping(value = "/")
	public String index(ModelMap pModel, HttpSession session)
	{
		User user = (User) session.getAttribute("user");
		if (user != null) { return "redirect:/dashboard"; }
		pModel.addAttribute("user", new User());
		return "index/index";
	}


	@RequestMapping(value = "/dashboard")
	public String dashboard(ModelMap pModel, HttpSession session)
	{
		// TODO Certainement pas la bonne façon de gérer la session
		User user = (User) session.getAttribute("user");

		if (user == null) { return "redirect:/"; }

		return "dashboard/dashboard";
	}
}