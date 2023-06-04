<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html lang="kr">
<script>
  function Check_Form() {
    document.forms["My_Form"].submit();
  }
</script>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/container.css" type="text/css" />
  <link rel="stylesheet" href="css/side.css" type="text/css" />
  <link rel="stylesheet" href="css/write.css" type="text/css" />
  <title>공지사항내용2</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
  <style>*{font-family: 'Nanum Gothic', sans-serif;}</style>
</head>
<body>
<%
  String userID = null;
  if(session.getAttribute("userID") != null){
    userID = (String) session.getAttribute("userID");
  }
%>

<%
  if(userID == null){

  }else{

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
            <li><a href="#">알림/소식</a>
              <ul class="sidebar-li">
                <li><a href="html/content.html">공지사항</a></li>
                <li><a href="#2">뉴스소식</a></li>
              </ul>
            </li>
            <li><a href="#2">농기구</a>
              <ul class="sidebar-li">
                <li><a href="#">기구 대여</a></li>
                <li class="desc"><a href="#1">-사용법</a></li>
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
            <li><a href="#6">이용안내</a>
              <ul class="sidebar-li">
                <li><a href="#1">개인정보처리방침</a></li>
                <li><a href="#">사이트 이용안내</a></li>
                <li class="desc"><a href="#1">-신고방법</a></li>
                <li class="desc"><a href="#1">-후원방법</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <!------------네비 메뉴나열-------------->

    <div class="nav-left">
      <ul class="nav-menu">
        <li><a href="#">알림/소식</a>
          <ul class="submenu">
            <li><a href="html/content.html">공지사항</a></li>
            <li><a href="#2">뉴스소식</a></li>
          </ul>
        </li>
        <li><a href="#2">농기구</a>
          <ul class="submenu">
            <li><a href="#">기구 대여</a></li>
            <li><a href="#1">사용법</a></li>
          </ul>
        </li>
        <li><a href="Crop.jsp">작물·재배법</a>
          <ul class="submenu">
            <li><a href="Crop.jsp">작물 재배법</a></li>
            <li><a href="#2">밭 관리법</a></li>
          </ul>
        </li>
        <li><a href="#6">이용안내</a>
          <ul class="submenu">
            <li><a href="#1">개인정보처리방침</a></li>
            <li><a href="#">사이트 이용안내</a></li>
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

      <article class="box-writer">
        <form id="writer" action="../Notice_Write_Action.jsp" name="My_Form" method="post">
          <div class="writer">
            <div class="writer-td">
              <h2>글쓰기</h2>
              <div>
                <input id="subject" class="write-subject" type="text" name="bbsTitle" placeholder="제목을 입력하세요." maxlength=30>
              </div>
              <div>
                <textarea id="textContent" class="write-text" name="bbsContent" placeholder="내용을 입력하세요."></textarea>
              </div>
            </div>
          </div>
          <div class="complete-btn">
            <button type="button" id="btn_complete" class="b tn_complete" onclick="Check_Form()">작성</button>
          </div>
        </form><!--글쓰기 end-->

      </article><!--메인내용 end-->
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
</footer><!--푸터 end-->
</body>
</html>