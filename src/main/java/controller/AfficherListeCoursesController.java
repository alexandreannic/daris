package controller;

import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/afficherListeCourses")
public class AfficherListeCoursesController
{

	@RequestMapping(method = RequestMethod.GET)
	public String afficher(ModelMap pModel)
	{
		pModel.addAttribute("listeCourses", new ArrayList<String>());
		return "listeCourses";
	}
}