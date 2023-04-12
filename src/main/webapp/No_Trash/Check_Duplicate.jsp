<%--
  Created by IntelliJ IDEA.
  User: itaegyeom
  Date: 2023/04/04
  Time: 11:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    // Connect to the database
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/ggulnong";
        String uid = "root";
        String upw = "tkyeom1478@";
        conn = DriverManager.getConnection(url, uid, upw);

        // Get the ID from the request parameters
        String userId = request.getParameter("vUserId");

        // Check if the ID already exists in the database
        String query = "SELECT COUNT(*) FROM ggulnong.Profile WHERE vUserId = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();
        rs.next();
        int count = rs.getInt(1);

        // Send the result as response
        if (count > 0) {
            response.getWriter().write("exist");
        } else {
            response.getWriter().write("not_exist");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { }
        if (conn != null) try { conn.close(); } catch (SQLException e) { }
    }
%>
