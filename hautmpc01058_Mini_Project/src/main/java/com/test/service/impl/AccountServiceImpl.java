package com.test.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dao.AccountDAO;
import com.test.entity.Account;
import com.test.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService{
	@Autowired
	AccountDAO adao;

	@Override
	public Account findById(String username) {
		// TODO Auto-generated method stub
		return adao.findById(username).get();
	}

	public List<Account> getAdministrators() {
		return adao.getAdministrators();
	}

	public List<Account> findAll() {
		return adao.findAll();
	}
	@Override
	public Account create(Account account) {
		// TODO Auto-generated method stub
		return adao.save(account);
	}
	@Override
	public Account update(Account account) {
		// TODO Auto-generated method stub
		return adao.save(account);
	}
	@Override
	public void deletefindById(String id) {
		// TODO Auto-generated method stub
		adao.deleteById(id);
	}
}
