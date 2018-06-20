package com.sign.controller;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.INTERNAL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sign.dto.User;
import com.sign.service.AddService;
import com.sign.service.UserService;
import com.sign.util.PropertyReadUtil;

@Controller
@RequestMapping("/login")
public class LoginAction {
	@Autowired
	private AddService addService;
	@Autowired
	private UserService userService;
	private HttpSession session;
	@RequestMapping("/index")
	public String sayHello(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		request.setAttribute("say", "测试sayHello");
		int infoById = userService.hasUser("miner", "0622");
		request.setAttribute("say", "test Say Hello");
		request.setAttribute("sayto", infoById);
		return "index";
	}

	@RequestMapping("/inde")
	public String index(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String phone = request.getParameter("name");
		request.setAttribute("phone", phone);
		return "inde";
	}

	@RequestMapping("/main")
	public String main(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		return "main";
	}

	@RequestMapping("/about")
	public String about(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String phone = request.getParameter("name");
		request.setAttribute("phone", phone);
		return "about-us";
	}

	@RequestMapping("/system")
	public String system(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, NumberFormatException, UnsupportedEncodingException {
		session = request.getSession();
		//科目
		List<String> subjects = addService.findAllSubject();
		session.setAttribute("subjects", subjects);
		//题目类型
		List<String> types = addService.findAllQuestionType();
		session.setAttribute("types", types);
		
		String html = request.getParameter("html");
		PropertyReadUtil propertyReadUtil = new PropertyReadUtil();
		Integer startTime = Integer.parseInt(propertyReadUtil.timeProperty("/config/property/time.properties"));
		SimpleDateFormat nowTime = new SimpleDateFormat("yyyy");
		Integer endTime = Integer.parseInt(nowTime.format(new Date()));
		session.setAttribute("startTime", startTime);
		session.setAttribute("endTime", endTime);
		request.setAttribute("html", html);
		switch (html) {
		case "1":
			request.setAttribute("titleName", "记录");
			break;
		case "2":
			request.setAttribute("titleName", "出题");
			break;
		case "3":
			request.setAttribute("titleName", "添题");
			break;
		case "4":
			request.setAttribute("titleName", "题库");
			break;

		default:
			break;
		}
		return "system";
	}

	@ResponseBody
	@RequestMapping(value = "/html-handle", method = RequestMethod.POST)
	public void htmlHandle(@RequestParam("html") Integer html, HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		request.setAttribute("html", html);
		System.out.println(">>>" + request.getAttribute("html"));
	}

	@ResponseBody
	@RequestMapping(value = "/registerSuccess", method = RequestMethod.POST)
	public Map<String, Object> success(@RequestBody User user, HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		session = request.getSession();
		/*
		 * 1.判断
		 * */
		userService.register(user);
		user = userService.findUserByPhone(Long.parseLong(user.getPhone()));
		System.out.println("--->>>"+user);
		//传递过来的用户信息添加到数据库中，注册
		Map<String, Object> map = new HashMap<String, Object>();
		if (user.getId() != -1) {//注册成功
			session.setAttribute("user", user);
			if(user.getName().indexOf("管理员")!=-1){
				map.put("code", "1");
			}else{
				map.put("code", "0");
			}
		} else {
			map.put("code", "1");
		}
		return map;
	}

}
