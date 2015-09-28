package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import model.dao.DAO_User;


@Controller
public class Users
{
	@Autowired
	private DAO_User  service;


	@RequestMapping(value = "/users")
	public String users(ModelMap pModel)
	{
		pModel.addAttribute("users", service.findAll());
		return "users";
	}
}
