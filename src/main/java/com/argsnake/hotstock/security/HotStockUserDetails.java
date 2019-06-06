package com.argsnake.hotstock.security;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.argsnake.hotstock.entity.User;

import lombok.Value;

@Value
public class HotStockUserDetails implements UserDetails {


    /**
	 *
	 */
	private static final long serialVersionUID = 6667689046296225262L;

	private Collection<? extends GrantedAuthority> authorities;

    private Long id;

    private String password;

    private String username;

    public HotStockUserDetails(User user) {
        this.id = user.getId();
        this.username = user.getUsername();
        this.password = user.getPassword();
        this.authorities = Collections.singleton(new SimpleGrantedAuthority(user.getRole()));
    }

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
    }
}
