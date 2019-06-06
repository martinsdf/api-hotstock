package com.argsnake.hotstock.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.argsnake.hotstock.entity.Department;

public interface DepartmentRepository extends PagingAndSortingRepository<Department, Long> {

}
