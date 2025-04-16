package com.grownited;

import java.util.Map;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;



@SpringBootApplication
@EnableAsync
public class CravingNestApplication {

	public static void main(String[] args) {
		SpringApplication.run(CravingNestApplication.class, args);
	}

	@Bean
	PasswordEncoder encoder() {
		return new BCryptPasswordEncoder(5);
	}
	
	@Bean
	Cloudinary cloudinary() {
		Map<String, String> config = ObjectUtils.asMap("cloud_name", "ddgys56ug", "api_key", "672296813314598",
				"api_secret", "wLBJUUxYUcc3MHWZL0d9do70qTQ");
		return new Cloudinary(config);
	}	

}
