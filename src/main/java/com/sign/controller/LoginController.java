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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sign.dto.UpdatePasswordInfo;
import com.sign.dto.User;
import com.sign.service.AddService;
import com.sign.service.UserService;


@Controller
@RequestMapping("/sign")
public class LoginController {
	@Autowired
	private UserService userService;
	@Autowired
	private AddService addService;
	private HttpSession session;
	@RequestMapping("/login")
	public String error(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		return "login";
	}
	
	@RequestMapping("/administrator")
	public String administrator(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		session = request.getSession();
		List<String> subjects = addService.findAllSubject();
		List<String> types = addService.findAllQuestionType();
		request.setAttribute("subjects", subjects);
		request.setAttribute("types", types);
		
		String html = request.getParameter("html");
		request.setAttribute("html", html);
		switch (html) {
		case "3":
			request.setAttribute("titleName", "设置管理");
			break;
		case "4":
			request.setAttribute("titleName", "用户请求");
			break;

		default:
			break;
		}
		return "administrator";
	}
	
	@RequestMapping("/update.password")
	public String updatePassword(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		return "update_password";
	}

	@ResponseBody
	@RequestMapping("/update")
	public Map<String, Object> update(@RequestBody UpdatePasswordInfo user,HttpServletRequest request, HttpServletResponse response) {
		User usercopy = userService.findUserByPhone(Long.parseLong(user.getPhone()));
		Map<String, Object> map = new HashMap<String, Object>();
		if(usercopy==null){
			map.put("code", "-1");
			return map;
		}
		if(user.getSex().equals(usercopy.getSex())&&user.getBir().equals(usercopy.getBir())
				&&user.getName().equals(usercopy.getName())){
			map.put("code", "0");
			UpdatePasswordInfo info = userService.findUpdatePasswordInfoByPhone(user.getPhone());
			if(info==null){
				userService.addUpdatePasswordInfo(user);
			}
		}else{
			map.put("code", "1");
		}
		return map;
	}
	
}
