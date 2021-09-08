package com.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dao.AccountDAO;
import com.test.dao.AuthorityDAO;
import com.test.entity.Account;
import com.test.entity.Authorities;
import com.test.service.AuthorityService;

@Service
public class AuthorityServiceImpl implements AuthorityService{
	@Autowired
	AuthorityDAO dao;
	
	@Autowired
	AccountDAO acdao;
	
	@Override
	public List<Authorities> findAll() {
		return dao.findAll();
	}

	@Override
	public List<Authorities> findAuthoritiesOfAdministrator() {
		// TODO Auto-generated method stub
		List<Account> accounts = acdao.getAdministrators();
		return dao.authoritiesOf(accounts);
	}

	@Override
	public void delete(Integer id) {
		dao.deleteById(id);
		
	}

	@Override
	public Authorities create(Authorities auth) {
		// TODO Auto-generated method stub 
		return dao.save(auth);
	}

}
