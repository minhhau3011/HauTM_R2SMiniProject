package com.test.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{
	
}
