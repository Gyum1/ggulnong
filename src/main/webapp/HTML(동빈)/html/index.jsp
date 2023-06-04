<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>꿀농</title>
  <link rel="stylesheet" href="../css/style.css">
  <link rel="shortcut icon" href="../images/title-logo.png" type="image/x-icon">
</head>
<body>
<%
  String userID = null;
  if(session.getAttribute("userID") != null){
    userID = (String) session.getAttribute("userID");
  }
%>
<div class="container">

  <!------------헤더-------------->
  <header>
    <%
      String userid = (String)session.getAttribute("userID");
      if(userid == null){
    %>
    <div class="login-bar">
      <a href="../html/login.html">로그인</a> / <a href = "../html/signup.html">회원가입</a>

    </div>
    <%
    }else{
    %>
    <div class="login-bar">
      <a><%= userid%>님</a><br>
      <a href="../../logoutAction.jsp">로그아웃</a>
    </div>
    <%
      }
    %>

    <div class="logo">
      <a href="../html/index.html">
        <img src="../images/logo.png" alt="logo"><h1>꿀농</h1></a>
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
              <li><a href="alarmBoard.jsp">알림/소식</a>
                <ul class="sidebar-li">
                  <li><a href="alarmBoard.jsp">공지사항</a></li>
                  <li><a href="#2">뉴스소식</a></li>
                </ul>
              </li>
              <li><a href="#1">농기구</a>
                <ul class="sidebar-li">
                  <li><a href="#2">기구 대여</a></li>
                  <li class="desc"><a href="../../HTML/html/farmEquip.html">-사용법</a></li>
                </ul>
              </li>
              <li><a href="../../HTML/Crop.jsp">작물·재배법</a>
                <ul class="sidebar-li">
                  <li class="desc"><a href="../../HTML/Crop.jsp">-농작물 관련</a></li>
                  <li class="desc"><a href="#1">-반려 식물 관련</a></li>
                  <li><a href="#2">밭 관리법</a></li>
                  <li class="desc"><a href="#1">-텃밭 관련</a></li>
                  <li class="desc"><a href="#1">-화분 관련</a></li>
                </ul>
              </li>
              <li><a href="#6">이용안내</a>
                <ul class="sidebar-li">
                  <li><a href="../../HTML/html/privacyBoard.html">개인정보처리방침</a></li>
                  <li><a href="../../HTML/html/useExBoard.html">사이트 이용안내</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!------------네비 메뉴나열-------------->

      <div class="nav-left">
        <ul class="nav-menu">
          <li><a href="alarmBoard.jsp">알림/소식</a>
            <ul class="submenu">
              <li><a href="alarmBoard.jsp">공지사항</a></li>
              <li><a href="#2">뉴스소식</a></li>
            </ul>
          </li>
          <li><a href="#2">농기구</a>
            <ul class="submenu">
              <li><a href="#">기구 대여</a></li>
              <li><a href="../../HTML/html/farmEquip.html">사용법</a></li>
            </ul>
          </li>
          <li><a href="../../HTML/Crop.jsp">작물·재배법</a>
            <ul class="submenu">
              <li><a href="../../HTML/Crop.jsp">작물 재배법</a></li>
              <li><a href="#2">밭 관리법</a></li>
            </ul>
          </li>
          <li><a href="#6">이용안내</a>
            <ul class="submenu">
              <li><a href="../../HTML/html/privacyBoard.html">개인정보처리방침</a></li>
              <li><a href="../../HTML/html/useExBoard.html">사이트 이용안내</a></li>
            </ul>
          </li>

        </ul>
      </div>
    </nav>
  </header>



  <!------------슬라이드-------------->
  <div class="section">
    <div class="slidewrap">
      <div class="items">
        <div class="slide_item active">
          <a href="#"><img src="../images/slide1.png"></a></div>
        <div class="slide_item">
          <a href="#"><img src="../images/slide2.png"></a></div>
        <div class="slide_item">
          <a href="#"><img src="../images/slide3.png"></a></div>
      </div>
    </div>
  </div>
  <!------------콘텐츠-------------->
  <!------------게시판-------------->
  <div class="contents">
    <div class="tabMenu">
      <label for="tab1_box"><a href="../../HTML/noteBoard.jsp">게시판</a></label>
      <div id="notice" class="tabContent">
        <ul>
          <a href="#"><li style="color: red; font-weight: bold;">게시판 이용시 주의사항</li></a>
          <a href="#"><li>게시판 이용시 주의사항</li></a>
          <a href="#"><li>처음 오신분들 가이드</li></a>
          <a href="#"><li>운영자 사칭에 주의해주세요.</li></a>
          <a href="#"><li>심한 욕설은 정지 사유입니다.</li></a>
        </ul>
      </div>
    </div>
    <!------------이달의 식물-------------->
    <section class="section-about">
      <div class="info-about">
        <div class="btn-about">
          <button class="btn-open" type="button">
            <img src="../images/hobby.png" alt=""/><br><h4>이달의 식물</h4>
          </button>
          <button class="btn-open" type="button">
            <img src="../images/character.png" alt="" /><br><h4>금주의 소식</h4>
          </button>
        </div>
      </div>
    </section>
    <div class="modal-background">
      <div class="modal">
        <h3>이달의 식물</h3>
        <h4>완두콩</h4>
        <img src="../images/been.png" alt="" />
        <p>
          1. 파종깊이 5cm, 파종간격 15cm~20cm정도로 심는다.<br>
          2. 한 구멍에 완두콩 씨앗 2~3알씩 파종한다.<br>
          3. 파종 후 10일~15일이면 싹이 나오고, <br>35일~40일 사이에 꽃이 핀다.<br>
          4. 꽃이 핀 후 10일 정도 지나면 꼬투리가 열린다.<br>
          5. 파종 후 보통 80일~90일 경에 수확한다.<br>
        </p>
        <button type="button" class="btn-close">Close</button>
      </div>
    </div>
    <div class="modal-background">
      <div class="modal">
        <h3>금주의 소식</h3>
        <h4>제목</h4>
        <img src="" alt="이미지" />
        <p>
          금주 내용
        </p>
        <button type="button" class="btn-close">Close</button>
      </div>
    </div>
  </div>

  <!------------푸터-------------->
  <footer>
    <div id="footer-div">
      <ul>
        <li><a href="#">회사 소개</a></li>
        <li><a href="#">개인정보처리방침</a></li>
        <li><a href="../../HTML/html/useExBoard.html">이용약관</a></li>
        <li><a href="#">사이트맵</a></li>
      </ul>
    </div>
    <div id="company">
      <p >경기도 안양시 동안구 임곡로 29 전산관 (대표전화) 123-456-7890</p>
    </div>
  </footer>
</div>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript" src="../js/secon.js"></script>
</body>
</html>