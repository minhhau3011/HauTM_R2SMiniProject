package com.test.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.test.service.AccountService;
import com.test.service.UserDetailService;

@Configuration
@EnableWebSecurity
@Component
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	@Autowired
	BCryptPasswordEncoder pe;
	
	@Autowired
	UserDetailService usService;
	
	@Autowired
	AccountService accoutService;
	//Cung cấp
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(usService).passwordEncoder(pe); 
	}
	/*--PHÂN QUYỀN SỬ DỤNG VÀ HÌNH THỨC ĐĂNG NHẬP--*/ 
	@Override 
	protected void configure(HttpSecurity http) throws Exception {
		//CSRF,CORS
		http.csrf().disable().cors().disable();
		
		//Phân quyền sử dụng
		http.authorizeRequests()
		.antMatchers("/order/**").authenticated()
		.antMatchers("/admin/**").hasAnyAuthority("ROLE_ADMIN")
		.antMatchers("/rest/authorities").hasAuthority("ROLE_ADMIN")
		.anyRequest().permitAll();
  
		
		//Giao diện đăng nhập
		http.formLogin()
		.loginPage("/security/login/form")
		.loginProcessingUrl("/security/login") //[login]
		.defaultSuccessUrl("/security/login/success",false)
		.failureUrl("/security/login/error");
		
		http.rememberMe()
		.tokenValiditySeconds(86400);
		
		http.exceptionHandling()
		.accessDeniedPage("/security/unauthoried");
		
		//Đăng xuất
		http.logout()
		.logoutUrl("/security/logoff")//[logout]
		.logoutSuccessUrl("/security/logoff/success");
	}
	//Cơ chế mã hóa mật khẩu
	@Bean
	public BCryptPasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	//Cho phép truy xuất REST API từ bên ngoài (domain khác)
	@Override
	public void configure(WebSecurity web) throws Exception{
		web.ignoring().antMatchers(HttpMethod.OPTIONS,"/**");
	}
}
