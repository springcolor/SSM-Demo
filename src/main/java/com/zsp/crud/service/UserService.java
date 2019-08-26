package com.zsp.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zsp.crud.bean.User;
import com.zsp.crud.dao.UserMapper;

@Service
public class UserService {
	@Autowired
	UserMapper userMapper;
	
	public User getUser(Integer id) {
		User user = userMapper.selectByPrimaryKey(id);
		return user;
	}
	
	public void deleteUser(Integer id) {
		userMapper.deleteByPrimaryKey(id);
	}
	
	public void updateUser(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}
	
	public void register(User user) {
		userMapper.register(user);
	}
	
	public User logincheck(User user) {
	    User u = userMapper.logincheck(user);
	    return u;
	}
	
}
