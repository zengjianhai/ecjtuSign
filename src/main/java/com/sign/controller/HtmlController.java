package com.sign.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sign.dto.UpdatePasswordInfo;
import com.sign.service.AddService;
import com.sign.service.UserService;

@Controller
@RequestMapping("/html")
public class HtmlController {
	@Autowired
	private UserService userService;
	@Autowired
	private AddService addService;
	private HttpSession session;
	@RequestMapping("/record")
	public String record(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		return "record";
	}
	@RequestMapping("/add")
	public String add(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		return "add";
	}
	@RequestMapping("/question")
	public String question(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		return "question";
	}
	@RequestMapping("/create-test")
	public String createTest(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		return "create-test";
	}
	
	@RequestMapping("/set")
	public String set(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		session = request.getSession();
		List<String> subjects = addService.findAllSubject();
		List<String> types = addService.findAllQuestionType();
		request.setAttribute("subjects", subjects);
		request.setAttribute("types", types);
		return "set";
	}
	@RequestMapping("/user_ask")
	public String userAsk(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		List<UpdatePasswordInfo> updatePasswordInfos = userService.findAllUpdatePasswordInfo();
		request.setAttribute("updatePasswordInfos", updatePasswordInfos);
		return "user_ask";
	}
	@RequestMapping("/subject_show")
	public String subjectShow(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		session = request.getSession();
		List<String> subjects = addService.findAllSubject();
		request.setAttribute("subjects", subjects);
		return "subject_show";
	}
	
	@RequestMapping("/type_show")
	public String typeShow(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		session = request.getSession();
		List<String> types = addService.findAllQuestionType();
		request.setAttribute("types", types);
		return "type_show";
	}
	

	@RequestMapping("/ask_show")
	public String askypeShow(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		session = request.getSession();
		return "ask_show";
	}
}
