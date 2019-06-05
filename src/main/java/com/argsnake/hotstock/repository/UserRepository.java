package com.argsnake.hotstock.repository;

import java.util.Optional;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.argsnake.hotstock.entity.User;

public interface UserRepository extends PagingAndSortingRepository<User, Long> {

	Optional<User> findByUsername(String username);
}
