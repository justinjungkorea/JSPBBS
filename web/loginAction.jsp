<%--
  Created by IntelliJ IDEA.
  User: dongwookjung
  Date: 2019-05-24
  Time: 00:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDao" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="test/html, charset=UTF-8">
    <title>JSP 게시판 웹 사이트</title>
</head>
    <body >
        <%
            String userID = null;
            if(session.getAttribute("userID")!=null){
                userID = (String)session.getAttribute("userID");
            }
            if(userID != null){
                PrintWriter script = response.getWriter();
                script.println("<script> alert('이미 로그인이 되어있습니다.'); location.href = 'main.jsp' </script>");
            }
            UserDao userDao = new UserDao();
            int result = userDao.login(user.getUserID(), user.getUserPassword());
            if(result == 1){
                session.setAttribute("userID", user.getUserID());
                PrintWriter script = response.getWriter();
                script.println("<script> location.href = 'main.jsp' </script>");
            } else if(result == 0){
                PrintWriter script = response.getWriter();
                script.println("<script> alert('비밀번호가 틀립니다'); history.back(); </script>");
            } else if(result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script> alert('존재하지 않는 아이디입니다.'); history.back(); </script>");
            } else if(result == -2){
                PrintWriter script = response.getWriter();
                script.println("<script> alert('데이터베이스 오류가 발생했습니다.'); history.back(); </script>");
            }
        %>
    </body>
</html>
