<%--
  Created by IntelliJ IDEA.
  User: itaegyeom
  Date: 2023/03/29
  Time: 11:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>아이디 찾기 프로세스</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    // 사용자가 입력한 이메일
    String sName = request.getParameter("vName");
    String sPhone1 = request.getParameter("iPhone1");
    String sPhone2 = request.getParameter("iPhone2");
    String sPhone3 = request.getParameter("iPhone3");
    String Phone = sPhone1 + sPhone2 + sPhone3;

    // 데이터베이스 연결 정보
    String url = "jdbc:mysql://localhost:3306/ggulnong";
    String uid = "root";
    String upw = "tkyeom1478@";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // 데이터베이스 연결
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, uid, upw);

        // SQL 쿼리 작성 및 실행
        String sql = "SELECT vUserId FROM ggulnong.Profile WHERE vName = ? AND vPhone = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, sName);
        pstmt.setString(2, Phone);
        rs = pstmt.executeQuery();

        // 결과 처리
        if (rs.next()) {
            out.println("찾으시는 아이디는 " + rs.getString("vUserId") + "입니다.");
        } else {
            out.println("해당 아이디 또는 전화번호로 등록된 사용자가 없습니다.");
            out.println(sName);
            out.println(Phone);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // 리소스 해제
        if (rs != null) {
            try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        if (pstmt != null) {
            try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        if (conn != null) {
            try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
%>

</body>
</html>
