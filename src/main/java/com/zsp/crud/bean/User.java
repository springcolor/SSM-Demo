package com.zsp.crud.bean;

public class User {
   
	private Integer userId;

    private String userName;

    private String userPwd;
    
    private Integer age;

    public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(Integer userId, String userName, String userPwd, Integer age) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.age = age;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd + ", age=" + age + "]";
	}
	 
	

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd == null ? null : userPwd.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}