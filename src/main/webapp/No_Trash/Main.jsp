<%--
  Created by IntelliJ IDEA.
  User: itaegyeom
  Date: 2023/03/28
  Time: 9:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>메인 페이지</title>
</head>
<body>
<%
    String id = (String)session.getAttribute("user_id");
    String name = (String)session.getAttribute("user_name");
%>
<form name="Profile">
    <fieldset width="300px" margin="auto" >
        <%=id %>(<%=name %>)님 안녕하세요<br>

        <a href="Login.jsp">로그아웃 </a>
        <a href="ChangeInfo.jsp">정보수정 </a>
        <a href="Delete.jsp">회원탈퇴</a><br>
    </fieldset>
</form>
</body>
</html>
