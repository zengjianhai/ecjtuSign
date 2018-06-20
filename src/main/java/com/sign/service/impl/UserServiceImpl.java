
package com.sign.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sign.dao.IUserDao;
import com.sign.dto.UpdatePasswordInfo;
import com.sign.dto.User;
import com.sign.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private IUserDao userDao;
	public int hasUser(String name,String passwd){
		return userDao.findUserByName(name, passwd);
	}
	@Override
	public Integer register(User user) {
		return userDao.register(user);
	}
	@Override
	public User findUserById(int id) {
		return userDao.findUserById(id);
	}
	@Override
	public User findUserByPhone(Long phone) {
		return userDao.findUserByPhone(phone);
	}
	@Override
	public void addUpdatePasswordInfo(UpdatePasswordInfo updatePasswordInfo) {
		userDao.addUpdatePasswordInfo(updatePasswordInfo);
	}
	@Override
	public UpdatePasswordInfo findUpdatePasswordInfoByPhone(String phone) {
		return userDao.findUpdatePasswordInfoByPhone(phone);
	}
	@Override
	public List<UpdatePasswordInfo> findAllUpdatePasswordInfo() {
		return userDao.findAllUpdatePasswordInfo();
	}
	@Override
	public void delAllUpdatePasswordInfo() {
		// TODO Auto-generated method stub
		userDao.delAllUpdatePasswordInfo();
	}
	@Override
	public void delUpdatePasswordInfo(String phone) {
		// TODO Auto-generated method stub
		userDao.delUpdatePasswordInfo(phone);
	}
	@Override
	public void updatePassword(String phone) {
		userDao.updatePassword(phone);
	}
	@Override
	public void updateAllPassword(List<UpdatePasswordInfo> updatePasswordInfos) {
		userDao.updateAllPassword(updatePasswordInfos);
	}
}