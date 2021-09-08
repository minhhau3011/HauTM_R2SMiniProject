package com.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.test.entity.Account;

@Service
public class UserDetailService implements UserDetailsService{
	@Autowired AccountService accService;
	@Autowired Account account;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		account = accService.findById(username);
		if(account == null) {
			throw new UsernameNotFoundException("Đăng nhập thất bại!");
		}
		return new UserDetail(account);
	}

}
