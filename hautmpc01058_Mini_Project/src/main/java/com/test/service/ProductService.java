package com.test.service;

import java.util.List;

import com.test.entity.Products;

public interface ProductService {

	List<Products> findAll();

	Products findById(Integer id);

	List<Products> findByCategoryId(String cid);

	Products create(Products product);

	Products update(Products product);

	void delete(Integer id);


}
