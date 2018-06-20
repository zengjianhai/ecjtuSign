package com.sign.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorController {
	@RequestMapping("/404")
	public String four(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		return "error/404";
	}
	@RequestMapping("/500")
	public String five(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		return "error/500";
	}
}
