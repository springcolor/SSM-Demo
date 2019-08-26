<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>My JSP 'success.jsp' starting page</title>   
  </head> 
<body>
    
    <p>this is success page!</p>
    <p>Hello ${username}</p>
    <form action="${pageContext.request.contextPath}/tologin">
        <table>
            <tr>
                <td><input type="submit" value="退出登录"></td>
            </tr>
        </table>
    </form>

  </body>
</html>
