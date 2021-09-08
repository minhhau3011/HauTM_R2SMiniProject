package com.test.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.test.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String>{
	
	@Query("SELECT DISTINCT ar.account FROM Authorities ar")
	List<Account> getAdministrators();

	
}
