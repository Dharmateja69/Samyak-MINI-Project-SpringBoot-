package com.spring.boot.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.spring.boot.model.Event;

@Repository
public interface  EventRepo extends JpaRepository<Event,Long>{ 

	@Query("SELECT e FROM Event e WHERE e.id = :id")
    Event findEventById(@Param("id") Long id);
	
}
