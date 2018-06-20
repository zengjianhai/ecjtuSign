package com.sign.dto;

public class SearchInfo {
	@Override
	public String toString() {
		return "SearchInfo [subject=" + subject + ", types=" + types + ", question=" + question + ", date=" + date
				+ ", page=" + page + "]";
	}
	private String subject;
	private String types;
	private String question;
	private String date;
	private int page;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
}
