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
@Scope("session")
public class Dashboard
{
	private User user = new User();
	
//	@ModelAttribute("user")
//    public User getUser(HttpSession session) 
//    {
//        return (User) session.getAttribute("user");
//    }


	@RequestMapping(value = "/dashboard")
	public String index(ModelMap pModel)
	{
		System.out.println("user ! : " + user.getId());
		return "dashboard/dashboard";
	}
}