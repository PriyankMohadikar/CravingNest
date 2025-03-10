package com.grownited.filter;

import java.io.IOException;
import java.util.ArrayList;

import org.apache.catalina.User;
import org.springframework.stereotype.Component;

import com.grownited.entity.UserEntity;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Component
public class LoginFilterCheck implements Filter {

	ArrayList<String> publicURL = new ArrayList<>();

	public LoginFilterCheck() {
		publicURL.add("/");
		publicURL.add("/login");
		publicURL.add("/signup");
		publicURL.add("/forgetpassword");
		publicURL.add("/updatepassword");
		publicURL.add("/sendotp");
		publicURL.add("/authenticate");
		publicURL.add("/logout");
		publicURL.add("/saveuser");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;

		String url = req.getRequestURL().toString();
		String uri = req.getRequestURI();
		System.out.println("Filter calling " + uri);

		if (publicURL.contains(uri) || uri.contains(".css") || uri.contains(".js") || uri.contains("images")) {
			System.out.println("Public URL");
			chain.doFilter(request, response);
		} else {
			HttpSession session = req.getSession();
			UserEntity user = (UserEntity) session.getAttribute("user");
			System.out.println(user);
			if (user == null) {
				System.out.println("No usr");
				req.getRequestDispatcher("login").forward(request, response);
			} else {
				System.out.println("User Present");
				chain.doFilter(request, response);
			}
		}//if_else_main

	}
}
