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
        <a class="dropdown-item" href="login.jsp">로그인</a>
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
    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; margin: 30px">
      <thead>
      <tr>
        <th colspan="3" style="background-color: #eeeeee; text-align: center;">글 보기</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td style="width: 20%">제목</td>
        <td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
      </tr>
      <tr>
        <td>작성자</td>
        <td colspan="2"><%= bbs.getUserID() %></td>
      </tr>
      <tr>
        <td>작성일</td>
        <td colspan="2"><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분"%></td>
      </tr>
      <tr>
        <td>내용</td>
        <td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
      </tr>
      </tbody>
    </table>
    <a href="Notice.jsp" class="btn btn-outline-primary" style="margin: 5px">목록</a>
    <%
      if(userID != null && userID.equals(bbs.getUserID())){
    %>
    <div class="col float-right">
      <div class="dropdown actionButtons float-right">
        <a href="Notice_Update.jsp?bbsID=<%= bbsID %>" class="btn btn-outline-secondary" style="margin: 5px">수정</a>
        <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="Notice_Delete_Action.jsp?bbsID=<%= bbsID %>" class="btn btn-outline-danger" style="margin: 5px">삭제</a>

      </div>
    </div>
    <%
      }
    %>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>