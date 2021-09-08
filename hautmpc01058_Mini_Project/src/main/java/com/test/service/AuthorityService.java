package com.test.service;

import java.util.List;

import com.test.entity.Authorities;

public interface AuthorityService {
	
	
	public List<Authorities> findAuthoritiesOfAdministrator();

	public List<Authorities> findAll();
	
	public void delete(Integer id);
	
	public Authorities create(Authorities auth);
}
