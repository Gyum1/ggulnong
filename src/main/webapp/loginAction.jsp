<%@ page language="java" contentType="text/html; charset=UTF-8"

         pageEncoding="UTF-8"%>

<%@ page import="User.User_DAO" %>

<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>    <!-- 받는 모든 문자열을 UTF-8로 인코딩한다. -->

<jsp:useBean id="user" class="User.User" scope="page" />    <!-- 현재 페이지에서만 자바빈을 사용가능하게 설정 -->

<jsp:setProperty name="user" property="userID" />

<jsp:setProperty name="user" property="userPassword" />



<!DOCTYPE html>

<html>

<head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <title>Kanari 웹 사이트</title>

</head>

<body>

<%
  String userID = null;
  if(session.getAttribute("userID") != null){
    userID = (String) session.getAttribute("userID");
  }

  if(userID != null){
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('이미 로그인이 되어있습니다.')");
    script.println("location.href = 'main1.jsp'");
    script.println("</script>");
  }

  User_DAO userDAO = new User_DAO();

  int result = userDAO.login(user.getUserID(), user.getUserPassword());

  if(result == 1){
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("location.href = 'main1.jsp'");
    script.println("</script>");
    session.setAttribute("userID", user.getUserID());
  }

  else if(result == 0){
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('비밀번호가 틀립니다.')");
    script.println("history.back()");
    script.println("</script>");
  }

  else if(result == -1){
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('존재하지 않는 아이디 입니다.')");
    script.println("history.back()");
    script.println("</script>");
  }

  else {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('데이터 베이스 오류 발생')");
    script.println("history.back()");
    script.println("</script>");
  }
%>
</body>
</html>