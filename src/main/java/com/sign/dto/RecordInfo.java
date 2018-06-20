package com.sign.dto;

import java.util.Date;

public class RecordInfo {
	private String id;
	private String testName;
	private String subject;
	private Date createTime = new Date();
	private String grade;
	private String userName;
	private String titlesScore;
	private String titles;
	private int score;
	@Override
	public String toString() {
		return "RecordInfo [id=" + id + ", testName=" + testName + ", subject=" + subject + ", createTime=" + createTime
				+ ", grade=" + grade + ", userName=" + userName + ", titlesScore=" + titlesScore + ", titles=" + titles
				+ ", score=" + score + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTitlesScore() {
		return titlesScore;
	}
	public void setTitlesScore(String titlesScore) {
		this.titlesScore = titlesScore;
	}
	public String getTitles() {
		return titles;
	}
	public void setTitles(String titles) {
		this.titles = titles;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
}
