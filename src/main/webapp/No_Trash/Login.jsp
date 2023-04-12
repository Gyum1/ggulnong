<%--
  Created by IntelliJ IDEA.
  User: itaegyeom
  Date: 2023/03/27
  Time: 6:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인 페이지</title>
</head>
<body>
<form action="Login_Proc.jsp" method="post">
    아이디:<input type="text" name="vUserId" placeholder="아이디(E-mail)을 입력해 주세요"><br>
    비밀번호:<input type="password" name="vPwd" placeholder="비밀번호를 입력해 주세요"><br>
    <a href="Find_Id.jsp">아이디 찾기</a> &nbsp <a href="Find_Pwd">비밀번호 찾기</a><br>
    <input type="submit" value="로그인">
</form>
</body>
</html>
