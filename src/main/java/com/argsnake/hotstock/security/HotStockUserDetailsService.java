package com.argsnake.hotstock.security;

import java.util.Optional;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.argsnake.hotstock.entity.User;
import com.argsnake.hotstock.repository.UserRepository;


@Service
public class HotStockUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    public HotStockUserDetailsService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public HotStockUserDetails loadUserByUsername(String username) {
        Optional<User> user = userRepository.findByUsername(username);
        return user.map(HotStockUserDetails::new)
                .orElseThrow(() -> new UsernameNotFoundException("User " + username + " not found"));
    }
}
