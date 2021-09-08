package com.test.service;


import java.util.List;

import com.test.entity.Account;

public interface AccountService {
	
	public Account findById(String username);

	public List<Account> getAdministrators();

	public List<Account> findAll();

	public Account create(Account account);

	public Account update(Account account);
	
	public void deletefindById(String id);
}
