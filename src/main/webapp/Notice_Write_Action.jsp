<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="Notice.bbs_DAO" %>
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>    <!-- 받는 모든 문자열을 UTF-8로 인코딩한다. -->

<jsp:useBean id="bbs" class="Notice.bbs" scope="page" />    <!-- 현재 페이지에서만 자바빈을 사용가능하게 설정 -->

<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Kanari 웹 사이트</title>
</head>
<body>

<%

  String userID = null;

  if(session.getAttribute("userID") != null ){
    userID = (String) session.getAttribute("userID");
  }

  if(userID == null){
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('로그인을 해주세요.')");
    script.println("location.href = 'HTML(동빈)/html/login.html'");
    script.println("</script>");
  }

  else{
    if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('입력이 안된 사항이있습니다.')");
      script.println("history.back()");
      script.println("</script>");
    }

    else{

      bbs_DAO bbsDAO = new bbs_DAO();

      int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());

      if(result == -1){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('오류 발생')");
        script.println("history.back()");
        script.println("</script>");
      }

      else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'HTML/noteBoard.jsp'");
        script.println("</script>");
      }

    }
  }



%>

</body>
</html>