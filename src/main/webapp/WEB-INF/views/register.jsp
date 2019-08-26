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

<h3>注册页面</h3>
    <hr/>
    <form action="${pageContext.request.contextPath}/register" method="post">
        <table>
            <tr>
                <td>用户名</td>
                <td>
                    <input type="text" name="username" id="username">
                </td>
            </tr>
            <tr height="35px">
                <td>密码</td>
                <td>
                    <input type="text" name="password" id="password">
                </td>
            </tr>
            <tr>
                <td colspan="2" >
                    <input type="submit" id="register" value="注册"/>
                </td>
            </tr>
        </table>
    </form>

</body>
</html>