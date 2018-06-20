package com.sign.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sign.dto.ExaminationQuestions;
import com.sign.dto.SearchInfo;
import com.sign.service.QuestionService;

@Controller
@RequestMapping("/question")
public class QuestionController {
	@Autowired
	private QuestionService questionService;
	private HttpSession session;

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> search(@RequestBody SearchInfo searchInfo, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		session = request.getSession();
		List<ExaminationQuestions> questions = questionService.search(searchInfo);
		Integer count = questions.size();
		session.setAttribute("questions", questions);
		session.setAttribute("questionCount", count);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "0");
		return map;
	}

	@RequestMapping("/show")
	public String show(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		return "questions_show";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(@RequestBody ExaminationQuestions questions, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		session = request.getSession();
		questionService.updateQuestion(questions);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "0");
		return map;
	}
}
