package com.spring.boot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SamyakSpringbootApplication {

	public static void main(String[] args) {
		SpringApplication.run(SamyakSpringbootApplication.class, args);
		System.out.println("hi this running on port 8081 !!");
	}

}
