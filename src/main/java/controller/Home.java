package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import model.bean.User;


@Controller
public class Home
{
	@RequestMapping(value = "/")
	public String index(ModelMap pModel)
	{
		pModel.addAttribute("user", new User());
		return "home/home";
	}
}
