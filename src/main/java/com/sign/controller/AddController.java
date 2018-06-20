package com.sign.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sign.dto.ExaminationQuestions;
import com.sign.service.AddService;

@Controller
@RequestMapping("/add")
public class AddController {
	@Autowired
	private AddService addServic;
	@ResponseBody
	@RequestMapping(value="/addQuestion",method = RequestMethod.POST)
	public Map<String, Object> addQuestion(@RequestBody ExaminationQuestions examination_questions,HttpServletRequest request, HttpServletResponse response) throws SQLException {
		System.out.println(examination_questions);
		/**
		 * 1.获取到题目的信息
		 * 2.判断是否添加过，没有就添加到数据库
		 */
		ExaminationQuestions initialQuestions = examination_questions;
		ExaminationQuestions questions = addServic.findQuestion(examination_questions);
		Map<String, Object> map = new HashMap<String, Object>();
		if(questions!=null){
			map.put("code", "0");
		}else{
			if(examination_questions!=null){
				addServic.addQuestion(initialQuestions);
			}
			map.put("code", "1");
		}
		return map;
	}


}
