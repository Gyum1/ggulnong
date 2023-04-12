<%--
  Created by IntelliJ IDEA.
  User: itaegyeom
  Date: 2023/03/29
  Time: 11:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    // 입력된 사용자 정보 가져오기
    String sPhone1 = request.getParameter("iPhone1");
    String sPhone2 = request.getParameter("iPhone2");
    String sPhone3 = request.getParameter("iPhone3");
    String Phone = sPhone1 + sPhone2 + sPhone3;
    String sName = request.getParameter("vName");
    String sUserId = request.getParameter("vUserId");

// 데이터베이스 연결
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/ggulnong";
    String uid = "root";
    String upw = "tkyeom1478@";
    Connection conn = DriverManager.getConnection(url, uid, upw);

// SQL 쿼리 실행
    String sql = "SELECT vPwd FROM ggulnong.Profile WHERE vPhone = ? AND vName = ? AND vUserId = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, Phone);
    pstmt.setString(2, sName);
    pstmt.setString(3, sUserId);
    ResultSet rs = pstmt.executeQuery();

// 결과 출력
    if (rs.next()) {
        String pwd = rs.getString("vPwd");
        out.println("비밀번호: " + pwd);
    } else {
        out.println("일치하는 사용자 정보가 없습니다.");
    }

// 연결 해제
    rs.close();
    pstmt.close();
    conn.close();

   // System.out.println(Phone);
%>
</body>
</html>
