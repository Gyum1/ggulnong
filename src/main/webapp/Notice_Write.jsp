<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>

<html>

<head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width" initial-scale="1">

  <link rel="stylesheet" href="css/bootstrap.min.css">

  <title>Kanari 웹 사이트</title>

</head>
<body>

<%
  String userID = null;
  if(session.getAttribute("userID") != null){
    userID = (String) session.getAttribute("userID");
  }
%>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <ul class="navbar-nav navbar-white">
    <li class="nav-item"><a class="nav-link" href="main1.jsp">메인</a></li>
    <li class="nav-item active"><a class="nav-link" href="Notice.jsp">게시판</a></li>
    <%
      if(userID == null){
    %>

    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"> Sign in </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="login_Practice.jsp">로그인</a>
        <a class="dropdown-item" href="join.jsp">회원가입</a>
      </div>
    </li>

    <%
    }    else{

    %>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"> 회원관리 </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
      </div>
    </li>
    <%
      }
    %>
  </ul>
</nav>

<div class="container">
  <div class="row">
    <form method="post" action="Notice_Write_Action.jsp">
      <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
        <thead>
        <tr>
          <th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 작성 양식</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
        </tr>
        <tr>
          <td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2020" style="height: 350px;"></textarea></td>
        </tr>
        </tbody>
      </table>
      <input type="submit" class="btn btn-primary pull-right" value="글 쓰기">
    </form>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
