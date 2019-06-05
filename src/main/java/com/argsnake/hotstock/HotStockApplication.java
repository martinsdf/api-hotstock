package com.argsnake.hotstock;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;

@Configuration
@SpringBootApplication
@EnableGlobalMethodSecurity(securedEnabled = true)
public class HotStockApplication {
	public static void main(String[] args) {
		SpringApplication.run(HotStockApplication.class, args);
	}
}
