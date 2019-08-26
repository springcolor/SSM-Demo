package com.zsp.crud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zsp.crud.bean.User;
import com.zsp.crud.service.UserService;

@Controller
public class UserController {
    
    @Autowired
    UserService userService;
    
  //转向登录页面
  	@RequestMapping("tologin")
  	public String tologin(){
  		return "login";	
  	}
  	//登录验证
  	@RequestMapping("login")
  	public String  login(@RequestParam("username") String username,@RequestParam("password") String password,Model model){
  		User user = new User();
  		user.setUserName(username);
  		user.setUserPwd(password);
  		if(userService.logincheck(user) != null){
  			model.addAttribute("username",username);
  			return "success";
  		}
  	    else{
  	    	model.addAttribute("error","账号或密码错误");
  	    	return "login";
  	    }
  		}
  	//转向注册页面
  	@RequestMapping("toregister")
  	public String toregister(){
  		return "register";	
  	}
  	//注册
  	@RequestMapping("register")
  	public String  register(@RequestParam("username") String username,@RequestParam("password") String password,Model model){
  		User user = new User();
  		user.setUserName(username);
  		user.setUserPwd(password);
  		userService.register(user);	
  		model.addAttribute("username",username);
  		return "success";
       }

}