package com.sign.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sign.dto.UpdatePasswordInfo;
import com.sign.service.AddService;
import com.sign.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AddService addService;
	@Autowired
	private UserService userService;
	@ResponseBody
	@RequestMapping(value = "/addst", method = RequestMethod.POST)
	public Map<String, Object> addQuestion(@RequestParam String subject, @RequestParam String type,
			HttpServletRequest request, HttpServletResponse response) throws SQLException {
		if (subject.length() > 0) {
			addService.addSubject(subject);
		}
		if (type.length() > 0) {
			addService.addType(type);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "0");
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/delst", method = RequestMethod.POST)
	public Map<String, Object> delSt(@RequestParam String subjects, @RequestParam String types,
			HttpServletRequest request, HttpServletResponse response) throws SQLException {
		System.out.println(subjects + ":" + types);
		if (subjects.length() > 0) {
			List<String> listSubjects = new ArrayList<>();
			String[] str_subjects = subjects.split(",");
			for (int i = 0; i < str_subjects.length; i++) {
				listSubjects.add(str_subjects[i]);
			}
			addService.delSubject(listSubjects);
		}
		if (types.length() > 0) {
			List<String> listTypes = new ArrayList<>();
			String[] str_types = types.split(",");
			for (int i = 0; i < str_types.length; i++) {
				listTypes.add(str_types[i]);
			}
			addService.delType(listTypes);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "0");
		return map;
	}

	
	@ResponseBody
	@RequestMapping(value = "/delask", method = RequestMethod.POST)
	public Map<String, Object> delAsk(@RequestParam String phone,
			HttpServletRequest request, HttpServletResponse response) throws SQLException {
		if (phone.length() > 0) {
			userService.delUpdatePasswordInfo(phone);
			userService.updatePassword(phone);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "0");
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/delallask", method = RequestMethod.POST)
	public Map<String, Object> delAllAsk(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		List<UpdatePasswordInfo> infos = userService.findAllUpdatePasswordInfo();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "0");
		if(infos == null){
			return map;
		}
		userService.updateAllPassword(infos);
		userService.delAllUpdatePasswordInfo();
		return map;
	}

}
