<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  pageContext.setAttribute("APP_PATH", request.getContextPath());%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<script type="text/javascript"  src="${APP_PATH}/static/js/jquery-3.0.0.min.js"></script>	
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript"  src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${APP_PATH}/static/css/style.css">
</head>
<body>

	<div class="col-md-4 col-md-offset-4" id="loginform">
	<br/>	
	<h1 class="text-center">Welcome To Login</h1>
	<br/>
	<h6 class="text-center">提示：${error}</h6>
	<form action="login" method="post">

	  <div class="input-group input-group-lg form-group">
		  <span class="input-group-addon" id="basic-addon1">Name</span>
		  <input type="text" class="form-control" placeholder="Jack's username" name="username">	  
		</div>
		<br/>
		<br/>
		<div class="input-group input-group-lg form-group">
		  <input type="password" class="form-control" placeholder="Jack's password" name="password">
		  <span class="input-group-addon" id="basic-addon2">Password</span>
	  </div>
	  <br/>
	
	  <div class="col-md-12">
	    <div class="col-md-4">
	  	   <label >
		      <input type="checkbox"/> Remember 
		   </label>
	  	</div>
	  	<div class="col-md-4 col-md-offset-4">
	  	   <label >
		      <input type="checkbox"/> Auto-login
		   </label>
	  	</div>     
	  </div>
	  <br/><br/> 
	  <br/> 
	  
  
	  <div class="col-md-12">
	  	<div class="col-md-3 col-md-offset-2">	  		
	  	 <button type="button" class="btn btn-default btn-lg btn-success" onclick="window.location.href='toregister'">Register</button>
	  	</div>
	  	<div class="col-md-3 col-md-offset-2">
	  	 <button type="submit" class="btn btn-default btn-lg btn-info" >Login</button>
	  	</div>
	  </div>
	    
	</form>	
	<br/><br/> 
	<br/><br/> 
	<br/>

	</div>

<%-- <form action="${pageContext.request.contextPath}/user/checkLogin" method="post">
        <table>
            <tr>
                <td>用户名:</td>
                <td><input id="username" name="username" type="text"></td>
            </tr>
            <tr>
                <td>密码:</td>
                <td><input id="password" name="password" type="password"></td>
            </tr>
            <tr >
                <td><input type="submit" value="登录"  ></td>
                <td><input type="button" value="注册" onclick="window.location.href='/user/register'"> </td>
            </tr>

        </table>
    </form> --%>
	
</body>
</html>