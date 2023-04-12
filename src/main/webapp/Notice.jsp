<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="Notice.bbs_DAO"%>
<%@ page import="Notice.bbs"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width" initial-scale="1">

  <link rel="stylesheet" href="css/bootstrap.min.css">

  <title>kanari 웹사이트</title>

  <style type="text/css">
    a, a:hover {
      color: #000000;
      text-decoration: none;
    }
  </style>
</head>
<body>
<%
  String userID = null;

  if (session.getAttribute("userID") != null) {
    userID = (String) session.getAttribute("userID");
  }

  int pageNumber = 1; //기본 페이지 1로 설정

  if (request.getParameter("pageNumber") != null) {
    pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
        <a class="dropdown-item" href="login.jsp">로그인</a>
        <a class="dropdown-item" href="join.jsp">회원가입</a>
      </div>
    </li>

    <%
    }    else    {

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
    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; margin:30px">
      <thead>
      <tr>
        <th style="background-color: #eeeeee; text-align: center;">번호</th>
        <th style="background-color: #eeeeee; text-align: center;">제목</th>
        <th style="background-color: #eeeeee; text-align: center;">작성자</th>
        <th style="background-color: #eeeeee; text-align: center;">작성일</th>
      </tr>
      </thead>
      <tbody>
      <%
        bbs_DAO bbsDAO = new bbs_DAO();
        ArrayList<bbs> list = bbsDAO.getList(pageNumber);
        for (int i = 0; i < list.size(); i++) {
      %>
      <tr>
        <td><%=list.get(i).getBbsID()%></td>
        <td><a href="Notice_View.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>
        <td><%=list.get(i).getUserID()%></td>
        <td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
      </tr>

      <%
        }
      %>
      </tbody>
    </table>

    <%
      if (pageNumber != 1) {    //현재 페이지가 1이 아니라면
    %>
    <a href="Notice.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left" style="margin:5px;">이전</a>
    <%
      }    if (bbsDAO.nextPage(pageNumber)) {    //다음 페이지가 존재할 경우

    %>
    <a href="Notice.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arrow-left" style="margin:5px;">다음</a>
    <%
      }
    %>

    <div class="col float-right">
      <div class="dropdown actionButtons float-right">
        <a href="Notice_Write.jsp" class="btn btn-primary pull-right">글쓰기</a>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>