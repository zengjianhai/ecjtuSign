package com.sign.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import com.sign.dto.RecordInfo;
import com.sign.dto.ScoreAndCountInfo;
import com.sign.dto.SearchInfo;
import com.sign.dto.TestInfo;
import com.sign.service.RecordService;

@Controller
@RequestMapping("/record")
public class RecordController {
	@Autowired
	private RecordService recordService;
	private HttpSession session;

	@ResponseBody
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public Map<String, Object> search(@RequestBody SearchInfo searchInfo, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		session = request.getSession();
		List<RecordInfo> recordInfos = recordService.findRecords(searchInfo);
		session.setAttribute("records", recordInfos);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "0");
		return map;
	}

	@RequestMapping("/show")
	public String show(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		return "records_show";
	}

	@ResponseBody
	@RequestMapping(value = "/preview", method = RequestMethod.POST)
	public Map<String, Object> preview(@RequestBody RecordInfo recordInfo, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		session = request.getSession();
		System.out.println(recordInfo);
		TestInfo testInfo = new TestInfo();
		Map<String, ScoreAndCountInfo> sac = new HashMap<>();
		Map<String, List<ExaminationQuestions>> mapQuestions = new HashMap<>();
		
		String[] types = recordInfo.getTitles().split("[|]");
		List<String> listIds = new ArrayList<>();
		for (String string : types) {
			String[] ids = string.split("[.]");
			for (String string2 : ids) {
				listIds.add(string2);
			}
		}
		System.out.println(listIds);
		List<ExaminationQuestions> questions = recordService.findQuestionByIdList(listIds);
		
		String[] titleScore = recordInfo.getTitlesScore().split("[|]");
		String score = "";
		for (int i = 0; i < titleScore.length; i++) {
			ScoreAndCountInfo scoreAndCountInfo = new ScoreAndCountInfo();
			scoreAndCountInfo.setCount(titleScore[i].split("[.]").length);
			if(titleScore[i]==""||titleScore[i]==null){
				break;
			}
			score = titleScore[i].split("[.]")[0].split("-")[1];
			scoreAndCountInfo.setScore(Integer.parseInt(score));
			String type = titleScore[i].split("[.]")[0].split("_")[0];
			sac.put(type, scoreAndCountInfo);
			List<ExaminationQuestions> list = new ArrayList<>(); 
			for (ExaminationQuestions question : questions) {
				if (question.getTypes().equals(type)) {
					list.add(question);
				}
			}
			mapQuestions.put(type, list);
		}
		System.out.println(questions);
		testInfo.setSubject(recordInfo.getSubject());
		testInfo.setTestName(recordInfo.getTestName());
		testInfo.setScoreAndCount(sac);
		testInfo.setMap(mapQuestions);
		session.setAttribute("test", testInfo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "0");
		return map;
	}

}
