<%--
  Created by IntelliJ IDEA.
  User: dongwookjung
  Date: 2019-05-24
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="test/html, charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/bootstrap.css" >
    <link rel="stylesheet" href="./css/custom.css">
    <title>JSP 게시판 웹 사이트</title>
</head>
<body>
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
            <li><a href="bbs.jsp" >게시판</a ></li>
        </ul>

        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                   role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a >
                <ul class="dropdown-menu">
                    <li class="active"><a href="login.jsp" >로그인</a ></li>
                    <li><a href="join.jsp" >회원가입</a ></li>
                </ul>
            </li>
        </ul>
    </div>

</nav>
<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px">
            <form action="loginAction.jsp" method="post" >
                <h3 style="text-align: center">로그인 화면</h3>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20" />
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20" />
                </div>
                <input type="submit" class="btn btn-primary form-control" value="로그인" >
            </form >

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./js/bootstrap.js"></script >
</body>
</html>