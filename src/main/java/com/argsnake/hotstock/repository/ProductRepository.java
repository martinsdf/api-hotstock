package com.argsnake.hotstock.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.argsnake.hotstock.entity.DepartmentProduct;

public interface ProductRepository extends PagingAndSortingRepository<DepartmentProduct, Long> {

}
