package com.sign.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sign.dto.User;
import com.sign.service.UserService;

@Controller
@RequestMapping("/validate")
public class ValidateController {
	@Autowired
	private UserService userService;
	private HttpSession session;
	
	@ResponseBody
	@RequestMapping(value ="/userValidate", method = RequestMethod.POST)
	public Map<String, Object> userValidate(@RequestParam("phone") Long phone,HttpServletRequest request, HttpServletResponse response) throws SQLException {
		session = request.getSession();
		User user = userService.findUserByPhone(phone);
		Map<String, Object> map = new HashMap<String, Object>();
		/*
		 * 从数据库中查找看是否存在用户，返回
		 * 1、存在返回0
		 * 2、不存在返回1
		 */
		if (user != null) {
			//如果用户存在，把用户信息查询放进来
			//2.登录时，只需要密码进行比较
			session.setAttribute("user", user);
			map.put("code", "0");
		} else {
			map.put("code", "-1");
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value ="/userSuccess", method = RequestMethod.POST)
	public Map<String, Object> loginValidate(@RequestBody User user,HttpServletRequest request) throws SQLException {
		session = request.getSession();
		//获取传过来的密码
		String password = user.getPassword();
		//从session中获取用户信息
		user = (User)session.getAttribute("user");
		//从用户信息拿取进行密码比较
		Map<String, Object> map = new HashMap<String, Object>();
		if (password.equals(user.getPassword())) {//"密码正确"
			map.put("code", "0");
			if(user.getName().indexOf("管理员")!=-1){
				map.put("code", "1");
			}else{
				map.put("code", "0");
			}
		} else {
			map.put("code", "-1");
		}
		return map;
	}
}
