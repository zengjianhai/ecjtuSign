package com.sign.dto;


public class ScoreAndCountInfo {
	private int score;
	private int count;
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "ScoreAndCountInfo [score=" + score + ", count=" + count + "]";
	}
}
