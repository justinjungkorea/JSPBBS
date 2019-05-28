<%--
  Created by IntelliJ IDEA.
  User: dongwookjung
  Date: 2019-05-24
  Time: 01:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDao" %>
<%@ page import="java.io.PrintWriter" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<html >
<head >
    <meta http-equiv="Content-Type" content="test/html, charset=UTF-8">
    <title >JSP 게시판 웹 사이트</title >
</head >
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

            if(user.getUserID()==null || user.getUserPassword()==null || user.getUserEmail()==null || user.getUserGender()==null || user.getUserName()==null){
                PrintWriter script = response.getWriter();
                script.println("<script> alert('입력이 모두 되지 않았습니다.'); history.back(); </script>");
            }
            else{
                UserDao userDao = new UserDao();
                int result = userDao.join(user);
                System.out.println("joinAction.jsp - gender : "+user.getUserGender());
                if(result < 0){
                    PrintWriter script = response.getWriter();
                    script.println("<script> alert('이미 존재하는 아이디입니다.'); history.back(); </script>");
                } else {
                    session.setAttribute("userID", user.getUserID());
                    PrintWriter script = response.getWriter();
                    script.println("<script> location.href='main.jsp' </script>");
                }
            }
        %>

</body >
</html >

