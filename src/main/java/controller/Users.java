package controller;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		return "users";
	}

	@Transactional
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String add(@Valid User user, BindingResult result)
	{
		System.out.println("PWD : " + user.getPassword());
		if (result.hasErrors()) {
			return "/";
		}
		else {
			service.create(user);
			return "/";
		}
	}
}
