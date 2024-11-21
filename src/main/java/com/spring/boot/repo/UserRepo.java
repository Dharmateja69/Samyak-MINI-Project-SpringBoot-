package com.spring.boot.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.spring.boot.model.User;

@Repository
public interface UserRepo extends JpaRepository<User,Long>{

	
	@Query("SELECT u FROM User u WHERE u.username = :username")
	 User findByUsername(@Param("username") String username);
}
