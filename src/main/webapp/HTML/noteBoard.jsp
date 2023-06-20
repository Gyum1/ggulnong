<%--
  Created by IntelliJ IDEA.
  User: itaegyeom
  Date: 2023/04/19
  Time: 2:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="Notice.bbs_DAO"%>
<%@ page import="Notice.bbs"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/container.css" type="text/css" />
  <link rel="stylesheet" href="css/side.css" type="text/css" />
  <link rel="stylesheet" href="css/board.css" type="text/css" />
  <title>공지사항내용2</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
  <style>*{font-family: 'Nanum Gothic', sans-serif;}</style>
</head>
<body><%
  String userID = null;

  if (session.getAttribute("userID") != null) {
    userID = (String) session.getAttribute("userID");
  }

  int pageNumber = 1; //기본 페이지 1로 설정

  if (request.getParameter("pageNumber") != null) {
    pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
  }

%>
<header>
  <%
    String userid = (String)session.getAttribute("userID");
    if(userid == null){
  %>
  <div class="login-bar">
    <a href="login.html">로그인 / 회원가입</a>

  </div>
  <%
  }else{
  %>
  <div class="login-bar">
    <a><span style="color: black"><%= userid%>님</span></a><br>
    <a href="../../logoutAction.jsp">로그아웃</a>
  </div>
  <%
    }
  %>  <div class="logo">
  <a href="../HTML(동빈)/html/index.jsp">
    <img src="images/logo.png" alt="logo"><h1>꿀농</h1></a>
</div>
  <div class="rightHeader">
    <div class="search-bar">
      <form>
        <input type="text" class="input-search" placeholder="검색어를 입력하세요." />
        <input type="submit" class="input-search-submit" value="" />
      </form>
    </div>
  </div>
  <nav>
    <div class="nav-fir">
      <!------------네비 삼단버튼-------------->

      <div class="nav-sidebar-box">
        <input type="checkbox" id="menuicon">
        <label for="menuicon">
          <span></span>
          <span></span>
          <span></span>
        </label>
        <div class="sidebar">
          <ul class="sidebar-ul">
            <li><a href="alamBoard.jsp">알림/소식</a>
              <ul class="sidebar-li">
                <li><a href="alamBoard.jsp">공지사항</a></li>
                <li><a href="noteBoard.jsp">게시판</a></li>
              </ul>
            </li>
            <li><a href="machineRental.jsp">농기구</a>
              <ul class="sidebar-li">
                <li><a href="machineRental.jsp">기구 대여</a></li>
              </ul>
            </li>
            <li><a href="Crop.jsp">작물·재배법</a>
              <ul class="sidebar-li">
                <li class="desc"><a href="Crop.jsp">-농작물 관련</a></li>
                <li class="desc"><a href="#1">-반려 작물 관련</a></li>
                <li><a href="#2">밭 관리법</a></li>
                <li class="desc"><a href="#1">-텃밭 관련</a></li>
                <li class="desc"><a href="#1">-화분 관련</a></li>
              </ul>
            </li>
            <li><a href="html/useExBoard.html">이용안내</a>
              <ul class="sidebar-li">
                <li><a href="html/privacyBoard.html">개인정보처리방침</a></li>
                <li><a href="html/useExBoard.html">사이트 이용안내</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <!------------네비 메뉴나열-------------->

    <div class="nav-left">
      <ul class="nav-menu">
        <li><a href="alamBoard.jsp">알림/소식</a>
          <ul class="submenu">
            <li><a href="alamBoard.jsp">공지사항</a></li>
            <li><a href="noteBoard.jsp">게시판</a></li>
          </ul>
        </li>
        <li><a href="machineRental.jsp">농기구</a>
          <ul class="submenu">
            <li><a href="machineRental.jsp">기구 대여</a></li>
          </ul>
        </li>
        <li><a href="Crop.jsp">작물·재배법</a>
          <ul class="submenu">
            <li><a href="Crop.jsp">작물 재배법</a></li>
            <li><a href="#2">밭 관리법</a></li>
          </ul>
        </li>
        <li><a href="html/useExBoard.html">이용안내</a>
          <ul class="submenu">
            <li><a href="html/privacyBoard.html">개인정보처리방침</a></li>
            <li><a href="html/useExBoard.html">사이트 이용안내</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </nav>
</header><!--헤더 end-->

<div class="container">
  <section class="box">
    <aside class="box-sidebar">
      <h2>게시판</h2>
      <div class="side">
        <ul class="side-menu">
          <li><a href="alamBoard.jsp" >공지사항</a></li>
          <li class="on"><a href="noteBoard.jsp" >자유게시판</a></li>
        </ul>
      </div>
    </aside><!--사이드 메뉴 end-->

    <div class="box-contents">
      <div class="main-tit">
        <h3>자유게시판</h3>
      </div>

      <form id="srch" name="srch" action="#" method="post">
        <div class="search">
          <input type="text" placeholder="검색어를 입력하세요">
          <button>검색</button>
        </div>
      </form>

      <div class="write-btn">
        <button type="button" id="btn_write" class="btn_write" onclick="location.href='noteWrite.jsp'">글쓰기</button>
      </div><!--상단 end-->

      <div class="box-list">
        <table class="list">
          <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>추천</th>
          </tr>
          </thead>
          <tbody>
          <%
            bbs_DAO bbsDAO = new bbs_DAO();
            ArrayList<bbs> list = bbsDAO.getList(pageNumber);
            for (int i = 0; i < list.size(); i++) {
          %>
          <tr>
            <td class="list-num"><%=list.get(i).getBbsID()%></td>
            <td><a href="noteView.jsp?bbsID=<%=list.get(i).getBbsID()%>"><span style="color: black"><%=list.get(i).getBbsTitle()%></span></a></td>
            <td class="list-writer"><%=list.get(i).getUserID()%></td>
            <td class="list-date"><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
            <td class="list-count">20</td>
            <td class="list-push">2</td>
          </tr>

          <%
            }
          %>

          </tbody>
        </table>
      </div><!--메인내용 end-->

      <div class="paging">
        <span class="on">
            <a href="alamBoard.jsp?pageNumber=1" title="현재">1</a>
        </span>
        <span>
            <a href="alamBoard.jsp?pageNumber=2">2</a>
        </span>
        <a href="#1" class="next" title="다음"></a>
        <a href="#1" class="last" title="마지막">>></a>
      </div><!--페이징 end-->

    </div>
  </section>
</div>

<footer>
  <div id="footer-div">
    <ul>
      <li><a href="#">회사 소개</a></li>
      <li><a href="#">개인정보처리방침</a></li>
      <li><a href="#">이용약관</a></li>
      <li><a href="#">사이트맵</a></li>
    </ul>
  </div>
  <div id="company">
    <p >경기도 안양시 동안구 임곡로 29 전산관 (대표전화) 123-456-7890</p>
  </div>
</footer>
</body>
</html>