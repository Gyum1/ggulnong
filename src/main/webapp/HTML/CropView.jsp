<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="Crop.crop" %>
<%@ page import="Crop.crop_DAO" %>

<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/style.css" type="text/css" />
  <link rel="stylesheet" href="css/container.css" type="text/css" />
  <link rel="stylesheet" href="css/side.css" type="text/css" />
  <link rel="stylesheet" href="css/contentsText.css" type="text/css" />
  <title>농작물 재배법</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
  <style>*{font-family: 'Nanum Gothic', sans-serif;}</style>
</head>
<body>
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
                <li class="desc"><a href="#1">-반려 식물 관련</a></li>
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

<%

  int nID = 0;
  if(request.getParameter("nID") != null){
    nID = Integer.parseInt(request.getParameter("nID"));
  }

  if(nID == 0){
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('유효하지 않은 글입니다.')");
    script.println("location.href = 'bbs.jsp'");
    script.println("</script>");
  }

  crop crop = new crop_DAO().getCrop(nID);
%>


<div class="container">
  <section class="box">

    <div class="box-contents">
      <div class="main-tit">
        <h3>농작물 재배법</h3>
      </div>

      <div class="box-title">
        <h3 class="vTitle">
          <strong><%= crop.getvName().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></strong>
        </h3>
        <div class="vInfo">
          <div class="nickname">
            <ul>
              <li>
                <span><%=crop.getnId() %></span>
              </li>
            </ul>
          </div>
          <div class="info">
            <ul>
              <li>
                <span>2023-05-17</span>
              </li>
              <li>
                <span>조회</span>
                20
              </li>
              <li>
                <span>추천</span>
                2
              </li>
            </ul>
          </div>
        </div><!--상단 end-->

        <div class="main-conts">
          <p><%= crop.getvGrow_Method().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></p><br>
          <p><%= crop.getvCultivation_Schedule().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></p><br>
          <p><%= crop.getvVariety_Selection().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></p><br>
          <p><%= crop.getvGrow_Method().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></p><br>
          <p><%= crop.getVMalnutrition().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></p><br>
          <p><%= crop.getvHarvest().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></p><br>
          <p><%= crop.getvNutritional_Value().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></p><br>
          <p><%= crop.getvManagement_Method().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></p><br>
          <p><%= crop.getvGrowing_Tip().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></p><br>
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