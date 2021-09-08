package com.test.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.test.entity.Order;

public interface OrderService {
	Order create(JsonNode orderData);

	Object findById(Long id);

	Object findByUsername(String username);
}
