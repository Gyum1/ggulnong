<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>
<%@ page import="Notice.bbs" %>
<%@ page import="Notice.bbs_DAO" %>

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
  <title>자유게시판내용1</title>
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
          <li><a href="html/alamBoard.html" >공지사항</a></li>
          <li class="on"><a href="html/noteBoard.html" >자유게시판</a></li>
        </ul>
      </div>
    </aside><!--사이드 메뉴 end-->

    <div class="box-contents">
      <div class="main-tit">
        <h3>자유게시판</h3>
      </div>

      <div class="box-title">
        <h3 class="vTitle">
          <strong><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></strong>
        </h3>
        <div class="vInfo">
          <div class="nickname">
            <ul>
              <li>
                <span><%= bbs.getUserID() %></span>
              </li>
            </ul>
          </div>
          <div class="info">
            <ul>
              <li>
                <span><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분"%></span>
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
          <p><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></p>
        </div>

        <div class="box-comment">
          <ul>
            <li id="#" class="comment-li">
              <div class="cmt-nickname">
                <span>홍길동</span>
              </div>
              <div class="cmt-txt">
                <p>댓글내용1</p>
              </div>
            </li>
          </ul>
        </div><!--댓글 end-->

        <div class="box-select">
          <button type="button" id="#" class="btn-good">좋아요</button>
          <button type="button" id="#" class="btn-bad">싫어요</button>
        </div>

        <form id="#" name="cmt_form">
          <div class="box-cmt-write">
            <div class="user-nickname">
              <span>홍길동</span>
            </div>
            <div class="cmt-txt-cont">
              <div class="cmt-write">
                <textarea id="#"></textarea>
              </div>
              <div class="cmt-write-btn">
                <button type="button" id="btn_cmt">제출</button>
              </div>
            </div>
          </div>
        </form><!--댓글작성 end-->

        <div class="list-btn">
          <button type="button" id="btn_list" class="btn_list" onclick="location.href='noteBoard.html'">목록</button>
        </div>
      </div><!--메인내용 end-->
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