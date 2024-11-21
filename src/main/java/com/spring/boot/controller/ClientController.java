package com.spring.boot.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.spring.boot.model.Event;
import com.spring.boot.model.User;
import com.spring.boot.service.EventServiceImpl;
import com.spring.boot.service.UserServiceImpl;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;



@Controller
public class ClientController {

	@Autowired
	private EventServiceImpl empl;
	@Autowired
	private UserServiceImpl umpl;

	@GetMapping("/")
	public String Home() {
		return "home";
	}

	@GetMapping("/home")
	public String getHomepage() {
		return "home";
	}

	@GetMapping("/add-user")
	public String AddUserview() {
		return "add-user";
	}

	@GetMapping("/user-dashboard")
	public String userDashboardView() {
		return "user-Dashboard";
	}
	
	@GetMapping("/create-admin")
	public String createAdminview() {
		return "create-admin";
	}

	@PostMapping("/create-admin")
	public String createAdmin(@ModelAttribute User user,Model model) {
		//TODO: process POST request
		user.setAdmin(true);
		HttpStatus status = umpl.addAdmin(user);
		if(status==HttpStatus.CREATED)
		{
			model.addAttribute("message",
					"User ID created successfully with ID and name: " + user.getId() + " " + user.getName());
			return "login";
		}
		else {
		
		model.addAttribute("message", "There has been some error creating an admin.");
		return "create-admin";
	}
	}
	
	
	@PostMapping("/add-user")
	public String AddUser(@ModelAttribute User user, Model model) {
		// TODO: process POST request
		HttpStatus status = umpl.addUser(user);
		if (status == HttpStatus.CREATED) {
			model.addAttribute("message",
					"User ID created successfully with ID and name: " + user.getId() + " " + user.getUsername());
			return "redirect:login";
		} else {

			model.addAttribute("message", "Failed to add user.");
			return "add-user";
		}
	}

	@GetMapping("/login")
	public String Loginview() {

		return "login";
	}

	@PostMapping("/Login")
	public String Logining(@ModelAttribute("user") User loginUser, HttpServletRequest http, Model model) {
		// TODO: process POST request

		boolean Isauthenticate = umpl.authenticate(loginUser.getUsername(), loginUser.getPassword());

		if (Isauthenticate) {
			User user = umpl.findByUsername(loginUser.getUsername());
			// Store the user in session
			http.getSession().setAttribute("user", user);
			// Check if user is admin and redirect accordingly
			if (user.isAdmin()) {
				model.addAttribute("message", "Welcome Admin, " + user.getName() + "!");
				return "admin-Dashboard";
			} else {
				model.addAttribute("message", "Welcome, " + user.getName() + "!");
				return "user-Dashboard";
			}
		} else {

			model.addAttribute("message", "Invalid username or password.");
			return "login";
		}

	}

	@GetMapping("/Logout")
	public String Logout(HttpSession session, RedirectAttributes redirectAttributes) {
		session.invalidate();
		redirectAttributes.addFlashAttribute("message", "You have successfully logged out.");
		return "redirect:login";
	}

	@GetMapping("/add-event")
	public String addeventview(Model model) {

		List<User> alluser = umpl.getAllUsers();

		model.addAttribute("allUsers", alluser);
		model.addAttribute("event", new Event());

		return "add-event";
	}

	@PostMapping("/add-event")
	public String Addevent(@ModelAttribute Event event,HttpServletRequest http,Model model) {
		
		HttpStatus status = empl.createEvent(event);
		
		if(status==HttpStatus.CREATED)
		{
			http.getSession().setAttribute("message",
					"Event created successfully with ID and title: " + event.getId() + " " + event.getTitle());
			return "redirect:/admin-dashboard";
		}else {
	model.addAttribute("message", "There has been some error creating an event.");
		return "add-event";
	}}
	
	@GetMapping("/admin-dashboard")
	public String admindashboardview() {
		return "admin-Dashboard";
	}

      @GetMapping("/manageEventsView")
    public String manageEventview(Model model) {
    	  List<Event> allevents= empl.getAllEvents();
    	  model.addAttribute("allEvents", allevents);
          return "manage-events";
      }

		@GetMapping("/editEvent/{id}")
		public String editEventView(@PathVariable("id") Long eventid, Model model) {

			Event event = empl.getEventById(eventid); // Fetch the event by ID

			model.addAttribute("allUsers", umpl.getAllUsers()); // Add this line
			model.addAttribute("event", event); // Pass the whole event object to the view
			return "edit-event";
		}
	
		@PostMapping("/editEvent/{id}")
		public String editevnet(@PathVariable("id") Long eventId, @ModelAttribute Event updatedEvent,
				HttpServletRequest request, Model model) {
			// TODO: process POST request
			updatedEvent.setId(eventId);
			HttpStatus status = empl.updateEvent(updatedEvent);

			if (status == HttpStatus.OK) {

				request.getSession().setAttribute("message", "Event updated successfully: " + updatedEvent.getTitle());
				return "redirect:/manageEventsView";
			} else {

				model.addAttribute("message", "Error updating the event.");
				model.addAttribute("event", updatedEvent);
				model.addAttribute("allUsers", umpl.getAllUsers());
				return "edit-event";
			}

		}
	
	// DELETE Event
	@GetMapping("/deleteEvent/{id}")
	public String deleteEvent(@PathVariable("id") Long eventId, HttpServletRequest request, Model model) {
		HttpStatus status = empl.deleteEvent(eventId); // Delete the event by ID

		if (status == HttpStatus.OK) {
			// Redirect to manage events after successful deletion

			request.getSession().setAttribute("message", "Event deleted successfully.");
			return "redirect:/manageEventsView";
		} else {

			model.addAttribute("message", "Error deleting the event.");
			return "manageEventsView";
		}

	}
	
	// User Register events view
		@GetMapping("/register-events")
    public String registerEventView(Model model) {
			
			List<Event> allEvents = empl.getAllEvents(); // Fetch all events
			model.addAttribute("allEvents", allEvents); // Add events to the model
			return "register-events";
		}
	
		@GetMapping("/registerEvent/{eventId}")
    public String registerEvent(@PathVariable("eventId") Long eventId, HttpSession session,Model model) {
			

			User user = (User) session.getAttribute("user"); // Get the logged-in user from session
			if (user != null) {
				HttpStatus status = empl.registerUserToEvent(empl.getEventById(eventId), user);
				if (status == HttpStatus.OK) {
					model.addAttribute("message", "You have successfully registered for the event.");
				} else if (status == HttpStatus.NOT_FOUND) {
					model.addAttribute("message", "Event not found.");
				} else {
					model.addAttribute("message", "Error occurred while registering for the event. Please try again.");
				}
			} else {
				model.addAttribute("message", "Please login to register for an event.");
			}

			// Fetch the updated list of events to display after registration attempt
			model.addAttribute("allEvents", empl.getAllEvents());
			return "register-events";
		}

		@GetMapping("/registered-events")
		public String viewRegisteredEvents(HttpSession session,Model model) {
			User user = (User) session.getAttribute("user"); // Get the logged-in user
			if (user != null) {
				List<Event> registeredEvents = empl.getRegisteredEventsForUser(user); // Fetch events by user
				 // Load the JSP view
				model.addAttribute("registeredEvents", registeredEvents);     // Pass the registered events to the view
				return "registered-events";
			} else {
				
				model.addAttribute("message", "Please log in to view registered events.");
				return "login";
			}
		}

	
	
	
	
	
	
	
	
	
}
