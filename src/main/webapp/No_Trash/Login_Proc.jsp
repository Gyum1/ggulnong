<%--
  Created by IntelliJ IDEA.
  User: itaegyeom
  Date: 2023/03/28
  Time: 8:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    String vUserId = request.getParameter("vUserId");
    String vPwd = request.getParameter("vPwd");
    // DB연결에 필요한 변수 선언
    String url = "jdbc:mysql://localhost:3306/ggulnong";
    String uid = "root";
    String upw = "tkyeom1478@";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String sql = "select * from ggulnong.Profile where vUserId = ? and vPwd = ?";

    try{
        // 드라이버 호출
        Class.forName("com.mysql.cj.jdbc.Driver");

        // conn 생성
        conn = DriverManager.getConnection(url, uid, upw);

        // pstmt 생성
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, vUserId);
        pstmt.setString(2, vPwd);

        // sql실행
        rs = pstmt.executeQuery();

        if(rs.next()){ // 로그인 성공(인증의 수단 session)
            vUserId = rs.getString("vUserId");
            String name = rs.getString("vName");

            session.setAttribute("user_id", vUserId);
            session.setAttribute("user_name", name);

            response.sendRedirect("Main.jsp"); // 페이지이동

        } else{ // 로그인 실패
            response.sendRedirect("Login_Fail.jsp"); // 실패 페이지
        }
    } catch(Exception e){
        e.printStackTrace();
        response.sendRedirect("Login.jsp"); // 에러가 난 경우도 리다이렉트
    } finally{
        try{
            if(conn != null) conn.close();
            if(pstmt != null) pstmt.close();
            if(rs != null) rs.close();
        } catch(Exception e){
            e.printStackTrace();
        }
    }
%>
</body>
</html>
