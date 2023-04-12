<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="Notice.bbs" %>
<%@ page import="Notice.bbs_DAO" %>


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

  if(userID == null){    //로그인이 안돼있는 경우

    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('로그인이 필요합니다.')");
    script.println("location.href = 'login.jsp'");
    script.println("</script>");

  }

  int bbsID = 0;

  if(request.getParameter("bbsID") != null){
    bbsID = Integer.parseInt(request.getParameter("bbsID"));
  }

  if(bbsID == 0){
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('유효하지 않은 글입니다.')");
    script.println("location.href = 'bbs.jsp'");
    script.println("</script>");
  }

  bbs bbs = new bbs_DAO().getBbs(bbsID);

  if(!userID.equals(bbs.getUserID())){    //유저 아이디를 확인 다를경우 알림문 출력

    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('권한이 없습니다.')");
    script.println("location.href = 'Notice.jsp'");
    script.println("</script>");

  }
%>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <ul class="navbar-nav navbar-white">
    <li class="nav-item"><a class="nav-link" href="main.jsp">메인</a></li>
    <li class="nav-item active"><a class="nav-link" href="Notice.jsp">게시판</a></li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"> 회원관리 </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
      </div>
    </li>
  </ul>
</nav>

<div class="container">
  <div class="row">
    <form method="post" action="Notice_Update_Action.jsp?bbsID=<%= bbsID %>">
      <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
        <thead>
        <tr>
          <th colspan="2" style="background-color: #eeeeee; text-align: center;">글 수정하기</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
        </tr>
        <tr>
          <td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2020" style="height: 350px;"><%= bbs.getBbsContent() %></textarea></td>
        </tr>
        </tbody>
      </table>
      <input type="submit" class="btn btn-outline-primary" value="수정">
    </form>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
