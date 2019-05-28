<%--
  Created by IntelliJ IDEA.
  User: dongwookjung
  Date: 2019-05-28
  Time: 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.io.PrintWriter" %>
<%@ page import="bbs.*" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="test/html, charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/bootstrap.css" >
    <link rel="stylesheet" href="./css/custom.css">
    <title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
    String userID = null;
    if(session.getAttribute("userID")!=null){
        userID = (String)session.getAttribute("userID");
    }
    if(userID == null){
        PrintWriter script = response.getWriter();
        script.println("<script> alert('로그인을 하세.'); location.href = 'login.jsp' </script>");
    }
    int bbsID = 0;
    if(request.getParameter("bbsID") != null){
        bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }
    if (bbsID == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script> alert('유효하지 않은 글입니다.'); location.href = 'bbs.jsp' </script>");
    }
    Bbs bbs = new BbsDao().getBbs(bbsID);
    if(!userID.equals(bbs.getUserID())){
        PrintWriter script = response.getWriter();
        script.println("<script> alert('권한이 없습니다.'); location.href = 'bbs.jsp' </script>");
    }
%>
<nav class="navbar navbar-default">

    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapse" data-toggle="collapse"
                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a href="main.jsp" class="navbar-brand" >JSP 게시판 웹 사이트</a >
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="main.jsp" >메인</a ></li>
            <li class="active"><a href="bbs.jsp" >게시판</a ></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                   role="button" aria-haspopup="true" aria-expanded="false">회원관리<span class="caret"></span></a >
                <ul class="dropdown-menu">
                    <li><a href="logout.jsp" >로그아웃</a ></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd" >
            <thead>
            <tr>
                <th colspan="2" style="background-color: #eeeeee; text-align: center;" >게시판 글 수 양식</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle()%>"/></td>
            </tr>
            <tr>
                <td><textarea type="text" class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px" ><%=bbs.getBbsContent()%></textarea></td>
            </tr>
            </tbody>
        </table>
        <input type="submit" class="btn btn-primary pull-right" value="글쓰기"/>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./js/bootstrap.js"></script >
</body>
</html>