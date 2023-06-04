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
<%@ page import="Crop.crop_DAO" %>
<%@ page import="Crop.crop" %>
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
<header>
    <%
        String userid = (String)session.getAttribute("userID");
        if(userid == null){
    %>
    <div class="login-bar">
        <a href="../HTML(동빈)/html/login.html">로그인 / 회원가입</a>

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
                                <li class="desc"><a href="#1">-농작물 관련</a></li>
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

<div class="container">
    <section class="box">

            <h2>재배법</h2>



        <div class="box-contents">
            <div class="main-tit">
                <h3>농작물 재배법</h3>
            </div>


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
                        crop_DAO crop_DAO = new crop_DAO();
                        ArrayList<crop> list = crop_DAO.getList(pageNumber);
                        for (int i = 0; i < list.size(); i++) {
                    %>
                    <tr>
                        <td class="list-num"><%=list.get(i).getnId()%></td>
                        <td><a href="CropView.jsp?nID=<%=list.get(i).getnId()%>"><span style="color: black"><%=list.get(i).getvName()%></span></a></td>
                        <td class="list-writer">진희도</td>
                        <td class="list-date">2023-05-17</td>
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
                    <a href="Crop.jsp?pageNumber=1" title="현재">1</a>
                </span>
                <span>
                    <a href="Crop.jsp?pageNumber=2">2</a>
                </span>
                <span>
                    <a href="Crop.jsp?pageNumber=3">3</a>
                </span>
                <span>
                    <a href="Crop.jsp?pageNumber=4">4</a>
                </span>
                <span>
                    <a href="Crop.jsp?pageNumber=5">5</a>
                </span>
                <a href="#1" class="next" title="다음"></a>
                <a href="Crop.jsp?pageNumber=5%>" class="last" title="마지막">>></a>
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