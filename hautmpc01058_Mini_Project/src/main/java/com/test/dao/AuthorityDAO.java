package com.test.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.test.entity.Account;
import com.test.entity.Authorities;

public interface AuthorityDAO extends JpaRepository<Authorities, Integer>{
	@Query("SELECT DISTINCT a FROM Authorities a WHERE a.account IN ?1")
	List<Authorities> authoritiesOf(List<Account> accounts);
}
