<%--
  Created by IntelliJ IDEA.
  User: dongwookjung
  Date: 2019-05-27
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDao" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.*" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />

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
    if(userID == null){
        PrintWriter script = response.getWriter();
        script.println("<script> alert('로그인이 필요합니.'); location.href = 'login.jsp' </script>");
    } else {
        if(bbs.getBbsTitle()==null || bbs.getBbsContent()==null){
            PrintWriter script = response.getWriter();
            script.println("<script> alert('입력이 모두 되지 않았습니다.'); history.back(); </script>");
        }
        else{
            BbsDao bbsDao = new BbsDao();
            int result = bbsDao.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
            if(result < 0){
                PrintWriter script = response.getWriter();
                script.println("<script> alert('글쓰기에 실패했습니다.'); history.back(); </script>");
            } else {
                PrintWriter script = response.getWriter();
                script.println("<script> location.href='bbs.jsp' </script>");
            }
        }
    }



%>

</body >
</html >
