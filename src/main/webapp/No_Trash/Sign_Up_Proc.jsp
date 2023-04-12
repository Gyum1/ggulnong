<%--
  Created by IntelliJ IDEA.
  User: itaegyeom
  Date: 2023/03/27
  Time: 6:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    String sUserId = request.getParameter("vUserId");
    String sPwd = request.getParameter("vPwd");
    String sName = request.getParameter("vName");
    String sTelcom = request.getParameter("vTelcom");
    String sPhone1 = request.getParameter("iPhone1");
    String sPhone2 = request.getParameter("iPhone2");
    String sPhone3 = request.getParameter("iPhone3");
    String Phone = sPhone1 + sPhone2 + sPhone3;
    String sGender = request.getParameter("vGender");

    // 1.변수선언
    String url = "jdbc:mysql://localhost:3306/ggulnong";
    String uid = "root";
    String upw = "tkyeom1478@";

    Connection conn = null;
    PreparedStatement pstmt = null;

    String sql = "INSERT INTO ggulnong.Profile (vUserId, vPwd, vName, vTelcom, vPhone, vGender) VALUES (?, ?, ?, ?, ?, ?)";


    try{
        // 1. 드라이버 로드
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 2. conn 생성
        conn = DriverManager.getConnection(url, uid, upw);

        // 3. pstmt 생성
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, sUserId);
        pstmt.setString(2, sPwd);
        pstmt.setString(3, sName);
        pstmt.setString(4, sTelcom);
        pstmt.setString(5, Phone);
        pstmt.setString(6, sGender);

        // 4. sql문 실행
        int result = pstmt.executeUpdate();


        if(result == 1){ // 성공
            response.sendRedirect("Sign_Up_Succes.jsp");
        } else{ // 실패
            response.sendRedirect("Fail.jsp");
        }

    } catch(Exception e){
        e.printStackTrace();
    } finally{
        try{
            if(conn != null) conn.close();
            if(pstmt != null) pstmt.close();
        } catch(Exception e){
            e.printStackTrace();
        }
    }

%>
</body>
</html>
