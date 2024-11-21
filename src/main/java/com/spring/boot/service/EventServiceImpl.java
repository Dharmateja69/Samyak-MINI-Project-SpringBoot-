package com.spring.boot.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.boot.model.Event;
import com.spring.boot.model.User;
import com.spring.boot.repo.EventRepo;
import com.spring.boot.repo.UserRepo;

import jakarta.persistence.EntityNotFoundException;

@Service
public class EventServiceImpl {

	@Autowired
	private EventRepo erepo;
	@Autowired
	private UserRepo usrepo;

	@Transactional
	public HttpStatus createEvent(Event e) {
		// TODO Auto-generated method stub
		try {
			erepo.save(e);
			System.out.println("Event created successfuly !!");
			return HttpStatus.CREATED;
		} catch (Exception e1) {
			// TODO: handle exception
			System.out.println("Error in creating the event: " + e1.getMessage());
			return HttpStatus.INTERNAL_SERVER_ERROR;
		}

	}

	@Transactional
	public HttpStatus registerUserToEvent(Event e, User user) {
		// TODO Auto-generated method stub

		try {
			if (e.getRegisteredUsers() != null) {
				e.setRegisteredUsers(new ArrayList<>());
			}
			// Add the user to the list of registered users
			e.getRegisteredUsers().add(user);

			// save the event
			erepo.save(e);
			return HttpStatus.OK;

		} catch (Exception ex) {
			// TODO: handle exception
			System.out.println("Error registering user to event: " + ex.getMessage());
			return HttpStatus.INTERNAL_SERVER_ERROR;

		}

	}

	public List<User> getUsersRegisteredToEvent(Event e) {
		// TODO Auto-generated method stub

		try {
			List<User> alluser = usrepo.findAll();
			List<User> registeredusers = new ArrayList<User>();
			// Iterate through all users
			for (User user : alluser) {
				// Check if this user is in the registered users list for the event
				for (User registeredusers1 : e.getRegisteredUsers()) {
					if (user.getId() == registeredusers1.getId()) {
						// Add the user to the result list
						registeredusers.add(user);
						break;// No need to check further; move to the next user
					}
				}
			}
			return registeredusers;

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}

	}

	public Event getEventById(Long eventId) {
		// TODO Auto-generated method stub
		try {
			return erepo.findEventById(eventId);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error fetching event by ID: " + e.getMessage());
			return null;
		}

	}

	public List<Event> getAllEvents() {
		// TODO Auto-generated method stub
		return erepo.findAll();
	}

	@Transactional
	public HttpStatus updateEvent(Event updatedEvent) {
		// TODO Auto-generated method stub
		try {
			// Safely retrieve the entity
			Event existingEvent = erepo.findById(updatedEvent.getId())
					.orElseThrow(() -> new EntityNotFoundException("Event not found with ID: " + updatedEvent.getId()));
			if (existingEvent != null) {
				existingEvent.setTitle(updatedEvent.getTitle());
				existingEvent.setDescription(updatedEvent.getDescription());
				existingEvent.setRegisteredUsers(updatedEvent.getRegisteredUsers());
				existingEvent.setAmnt(updatedEvent.getAmnt());
				existingEvent.setResourcePerson(updatedEvent.getResourcePerson());
				erepo.save(existingEvent);
				return HttpStatus.OK;
			} else {
				return HttpStatus.NOT_FOUND; // Event not found

			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error updating event: " + e.getMessage());
			return HttpStatus.INTERNAL_SERVER_ERROR; // Handle any exceptions
		}
	}

	public HttpStatus deleteEvent(Long eventId) {
		// TODO Auto-generated method stub
		try {
			Optional<Event> e = erepo.findById(eventId);
			if (e != null) {
				erepo.deleteById(eventId);
				return HttpStatus.OK;
			} else {
				return HttpStatus.NOT_FOUND;
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error deleting event: " + e.getMessage());
			return HttpStatus.INTERNAL_SERVER_ERROR;
		}

	}

	public List<Event> getRegisteredEventsForUser(User user) {
		try {
			List<Event> allevents = erepo.findAll();
			List<Event> registredevents = new ArrayList<>();
			for (Event event : allevents) {
				for (User registered : event.getRegisteredUsers()) {
					if (registered.getId() == user.getId()) {
						registredevents.add(event);
						break;
					}
				}
			}
			return registredevents;
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}



}
