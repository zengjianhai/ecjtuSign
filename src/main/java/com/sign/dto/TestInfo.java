package com.sign.dto;

import java.util.List;
import java.util.Map;

public class TestInfo {
	private String subject;
	private String testName;
	private Map<String, List<ExaminationQuestions>> map;
	public Map<String, ScoreAndCountInfo> getScoreAndCount() {
		return scoreAndCount;
	}
	public void setScoreAndCount(Map<String, ScoreAndCountInfo> scoreAndCount) {
		this.scoreAndCount = scoreAndCount;
	}
	private Map<String, ScoreAndCountInfo> scoreAndCount;
	@Override
	public String toString() {
		return "TestInfo [subject=" + subject + ", testName=" + testName + ", map=" + map + "]";
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	public Map<String, List<ExaminationQuestions>> getMap() {
		return map;
	}
	public void setMap(Map<String, List<ExaminationQuestions>> map) {
		this.map = map;
	}
}
