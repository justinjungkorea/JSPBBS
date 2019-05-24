<%--
  Created by IntelliJ IDEA.
  User: dongwookjung
  Date: 2019-05-24
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    request.setCharacterEncoding("UTF-8");
%>

<html >
<head >
    <meta http-equiv="Content-Type" content="test/html, charset=UTF-8">
    <title >JSP 게시판 웹 사이트</title >
</head >
<body >
<%
    session.invalidate();
%>
<script>
    location.href='main.jsp';
</script >

</body >
</html >
