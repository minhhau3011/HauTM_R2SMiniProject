package com.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.entity.Roles;

public interface RoleDAO extends JpaRepository<Roles, String>{

}
