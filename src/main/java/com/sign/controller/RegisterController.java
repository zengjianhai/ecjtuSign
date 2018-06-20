package com.sign.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sign")
public class RegisterController {

	@RequestMapping("/register")
	public String register(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		return "register";
	}
}
