package com.sign.dto;

import java.util.Date;

public class UpdatePasswordInfo {
	private String name;
	private String sex;
	private String bir;
	private String phone;
	@Override
	public String toString() {
		return "UpdatePasswordInfo [name=" + name + ", sex=" + sex + ", bir=" + bir + ", phone=" + phone
				+ ", createTime=" + createTime + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBir() {
		return bir;
	}
	public void setBir(String bir) {
		this.bir = bir;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	private Date createTime = new Date();
}
