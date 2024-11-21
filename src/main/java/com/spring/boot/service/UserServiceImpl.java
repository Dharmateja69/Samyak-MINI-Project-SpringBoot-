package com.spring.boot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.spring.boot.model.User;
import com.spring.boot.repo.UserRepo;

@Service
public class UserServiceImpl {

	@Autowired
	private UserRepo useR;

	public HttpStatus addUser(User user) {
		try {

			useR.save(user);
			System.out.println("added the data!!");
			return HttpStatus.CREATED;

		} catch (Exception ex) {
			System.out.println("Error adding user: " + ex.getMessage());
			return HttpStatus.INTERNAL_SERVER_ERROR;
		}

	}

	public HttpStatus addAdmin(User admin) {

		try {
			if (admin.isAdmin()) {
				useR.save(admin);
				System.out.println("added admin !!");
				return HttpStatus.CREATED;
			} else {
				System.out.println("Check if user is actually admin");
				return HttpStatus.FORBIDDEN;
			}
		} catch (Exception ex) {
			System.out.println("Error adding admin:" + ex.getMessage());
			return HttpStatus.INTERNAL_SERVER_ERROR;
		}

	}

	public List<User> getAllUsers() {
		try {
			return useR.findAll();
		} catch (Exception e) {
			System.out.println("Error fetching users: " + e.getMessage());
			return null;
		}
	}

	public User findByUsername(String username) {
		return useR.findByUsername(username);

	}


	public boolean authenticate(String username, String password) {
		
		User user= useR.findByUsername(username);
		if(user!=null && user.getPassword().equals(password))
		{
			return true;
		}
		else {
			return false;
		}
	}





}
