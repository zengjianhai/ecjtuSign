package com.sign.dto;

import java.util.Date;

public class ExaminationQuestions {
	private String id;
	private String subject;
	private String types;
	private String question;
	private String questionImg;
	private String answer;
	private int changeRecord = 0;
	private int answerRecord = 0;
	private String extend;
	private String extend2;
	@Override
	public String toString() {
		return "ExaminationQuestions [id=" + id + ", subject=" + subject + ", types=" + types + ", question=" + question
				+ ", question_img=" + questionImg + ", answer=" + answer + ", changeRecord=" + changeRecord
				+ ", answerRecord=" + answerRecord + ", extend=" + extend + ", extend2=" + extend2 + ", grade=" + grade
				+ ", createTime=" + createTime + "]";
	}
	private String grade;
	private Date createTime = new Date();
	public int getChangeRecord() {
		return changeRecord;
	}
	public void setChangeRecord(int changeRecord) {
		this.changeRecord = changeRecord;
	}
	public int getAnswerRecord() {
		return answerRecord;
	}
	public void setAnswerRecord(int answerRecord) {
		this.answerRecord = answerRecord;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTypes() {
		return types;
	}
	public void setTypes(String types) {
		this.types = types;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getQuestionImg() {
		return questionImg;
	}
	public void setQuestionImg(String questionImg) {
		this.questionImg = questionImg;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getExtend() {
		return extend;
	}
	public void setExtend(String extend) {
		this.extend = extend;
	}
	public String getExtend2() {
		return extend2;
	}
	public void setExtend2(String extend2) {
		this.extend2 = extend2;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
