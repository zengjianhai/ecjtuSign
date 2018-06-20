package com.sign.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sign.dto.UpdatePasswordInfo;
import com.sign.dto.User;

@Repository
public interface IUserDao {

	Integer findUserByName(String name, String passwd);

	Integer register(User user);
	
	User findUserById(int id);
	
	User findUserByPhone(Long phone);

	void addUpdatePasswordInfo(UpdatePasswordInfo updatePasswordInfo);

	UpdatePasswordInfo findUpdatePasswordInfoByPhone(String phone);

	List<UpdatePasswordInfo> findAllUpdatePasswordInfo();

	void delUpdatePasswordInfo(String phone);

	void addUpdatePasswordInfo(List<UpdatePasswordInfo> updatePasswordInfos);

	void delAllUpdatePasswordInfo();

	void updatePassword(String phone);

	void updateAllPassword(List<UpdatePasswordInfo> updatePasswordInfos);
}