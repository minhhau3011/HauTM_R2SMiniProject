package com.test.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rest/test")
public class TestRestController {
	@Autowired PasswordEncoder pe;
	
	@GetMapping
	public String test() {
		return pe.encode("123");
	}
}
