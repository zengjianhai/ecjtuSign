package com.sign.service;

import java.util.List;

import com.sign.dto.UpdatePasswordInfo;
import com.sign.dto.User;

public interface UserService {
	public int hasUser(String name, String passwd);
	
	public Integer register(User user);
	
	public User findUserById(int id);
	
	public User findUserByPhone(Long phone);
	
	public void addUpdatePasswordInfo(UpdatePasswordInfo updatePasswordInfo);
	
	public UpdatePasswordInfo findUpdatePasswordInfoByPhone(String phone);
	
	public List<UpdatePasswordInfo> findAllUpdatePasswordInfo();
	
	public void delAllUpdatePasswordInfo();
	
	public void delUpdatePasswordInfo(String phone);
	
	public void updatePassword(String phone);
	public void updateAllPassword(List<UpdatePasswordInfo> updatePasswordInfos);
}
