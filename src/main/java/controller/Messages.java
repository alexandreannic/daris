package controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import model.bean.Event;
import model.bean.Message;
import model.bean.User;
import model.dao.DAO_Event;
import model.dao.DAO_Message;
import model.dao.DAO_User;
import utils.Messages_i18n;


/**
 * Ce controller implémente l'ensemble des routes relatives à un utilisateur.
 */
@Controller
@RequestMapping(value = "/message")
public class Messages
{
	@Autowired
	private DAO_User		dao_user;

	@Autowired
	private DAO_Event		dao_event;
	
	@Autowired
	private DAO_Message		dao_message;
	
	@Autowired
	private Messages_i18n	messages;


	@Transactional
	@RequestMapping(value = "/send", method = RequestMethod.POST)
	public String send(String text, String to, String events, RedirectAttributes flash, ModelMap pModel,
			HttpSession session)
	{
		// Vérifie que l'utilisateur est connecté
		User user = (User) session.getAttribute("user");
		if (user == null) { 
			flash.addFlashAttribute("ALERT_ERROR", messages.get("view.pleaseConnect"));
			return "redirect:/"; 
		}
		
		// C'est sympa de voir le logo de chargement !
		try {
			Thread.sleep(400);
		}
		catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		String[] parse_events = (events.length() > 0) ? events.split(" ") : new String[0];
		String[] parse_users = (to.length() > 0) ? to.split(" ") : new String[0];
		List<Event> list_events = new ArrayList<>();
		List<User> list_users = new ArrayList<>();
		
		for(int i = 0; i < parse_events.length; i++) {
			Long id = Long.parseLong(parse_events[i]);
			list_events.add(dao_event.find(id));
		}
		
		for(int i = 0; i < parse_users.length; i++) {
			Long id = Long.parseLong(parse_users[i]);
			list_users.add(dao_user.find(id));
		}
		
		Message message = new Message();
		message.setText(text);
		message.setEvents(list_events);
		message.setTo(list_users);
		message.setFrom(user);
		message.setDateSent(new Date(Calendar.getInstance().getTime().getTime()));
		
		dao_message.create(message);
		
		return "redirect:/dashboard";
	}

}