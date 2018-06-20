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

import com.sign.dto.CreateInfo;
import com.sign.dto.ExaminationQuestions;
import com.sign.dto.RecordInfo;
import com.sign.dto.ScoreAndCountInfo;
import com.sign.dto.TestInfo;
import com.sign.dto.User;
import com.sign.service.CreateService;

@Controller
@RequestMapping("/create")
public class CreateController {
	private HttpSession session;
	@Autowired
	private CreateService createService;

	@ResponseBody
	@RequestMapping(value = "/create-test", method = RequestMethod.POST)
	public Map<String, Object> search(@RequestBody CreateInfo createInfo, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		session = request.getSession();
		Map<String, List<ExaminationQuestions>> mapQuestions = new HashMap<>();
		//测试实体
		TestInfo testInfo = new TestInfo();
		Map<String, ScoreAndCountInfo> sac = new HashMap<>();
		
		StringBuilder titles = new StringBuilder();
		StringBuilder titlesScore = new StringBuilder();
		int score = 0;
		for (String key : createInfo.getMap().keySet()) {
			String value = createInfo.getMap().get(key);
			String[] val = value.split(",");
			int count = Integer.parseInt(val[0]);
			
			//处理题型对应的数目和分值
			ScoreAndCountInfo scoreAndCountInfo = new ScoreAndCountInfo();
			scoreAndCountInfo.setCount(count);
			scoreAndCountInfo.setScore(Integer.parseInt(val[1]));
			sac.put(key, scoreAndCountInfo);
			
			List<ExaminationQuestions> questions = createService.findQuesetionByTypes(createInfo.getSubject(), key,
					count);
			mapQuestions.put(key, questions);
			for (int i = 0; i < questions.size(); i++) {
				if (i == questions.size() - 1) {
					titles.append(questions.get(i).getId());
					titlesScore.append(questions.get(i).getId()+"-"+val[0]);
				} else {
					titles.append(questions.get(i).getId() + ".");
					titlesScore.append(questions.get(i).getId()+"-"+val[0]+".");
				}
			}
			titles.append("|");
			titlesScore.append("|");
			score = score + count*Integer.parseInt(val[1]);
		}
		System.out.println(session.getAttribute("user"));
		System.out.println(titles.toString());
		System.out.println(mapQuestions);

		/**
		 * 添加记录
		 */
		/*User user = (User) session.getAttribute("user");
		RecordInfo recordInfo = new RecordInfo();
		recordInfo.setUserName(user.getId() + "");
		recordInfo.setSubject(createInfo.getSubject());
		recordInfo.setTestName(createInfo.getTestName());
		recordInfo.setTitles(titles.toString());
		recordInfo.setScore(score);
		recordInfo.setTitlesScore(titlesScore.toString());
		createService.addRecord(recordInfo);*/
		/*
		 * 测试信息
		 */
		testInfo.setSubject(createInfo.getSubject());
		testInfo.setTestName(createInfo.getTestName());
		testInfo.setScoreAndCount(sac);
		testInfo.setMap(mapQuestions);
		
//		System.out.println(recordInfo);
		//存放题目，在预览页面显示
		session.setAttribute("test", testInfo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "0");
		return map;
	}
	
	@RequestMapping("/preview")
	public String preview(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		return "preview";
	}
}
