package com.argsnake.hotstock.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.argsnake.hotstock.entity.Order;

public interface OrderProductRepository extends PagingAndSortingRepository<Order, Long> {

}
