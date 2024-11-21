package com.spring.boot.model;




import java.util.List;



import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;


@Entity
@Table(name="Event_data")
public class Event {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false, unique = true)
	private String title;

	private String description;

	private int amnt;
	
	
	
	// Relationship with the resource person (User)
		@ManyToOne
		@JoinColumn(name = "resource_person_id", referencedColumnName = "id")
		private User resourcePerson;
		
		// Relationship with the registered users (User)
        @ManyToMany(fetch = FetchType.EAGER)
		@JoinTable(name = "event_registered_users", joinColumns = @JoinColumn(name = "event_id"), inverseJoinColumns = @JoinColumn(name = "registered_user_id"))
		private List<User> registeredUsers;
		

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getAmnt() {
		return amnt;
	}

	public void setAmnt(int amnt) {
		this.amnt = amnt;
	}

	public User getResourcePerson() {
		return resourcePerson;
	}

	public void setResourcePerson(User resourcePerson) {
		this.resourcePerson = resourcePerson;
	}

	public List<User> getRegisteredUsers() {
		return registeredUsers;
	}

	public void setRegisteredUsers(List<User> registeredUsers) {
		this.registeredUsers = registeredUsers;
	}
	
	
	
	
	
	
	
}
