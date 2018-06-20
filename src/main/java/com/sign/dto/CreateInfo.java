package com.sign.dto;

import java.util.Map;

public class CreateInfo {
	@Override
	public String toString() {
		return "CreateInfo [subject=" + subject + ", testName=" + testName + ", map=" + map + "]";
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
	public Map<String, String> getMap() {
		return map;
	}
	public void setMap(Map<String, String> map) {
		this.map = map;
	}
	private String subject;
	private String testName;
	private Map<String, String> map;
}
