<%--
  Created by IntelliJ IDEA.
  User: itaegyeom
  Date: 2023/03/27
  Time: 6:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script>
    function Check_Form() {
        var vUserId = document.forms["My_Form"]["vUserId"].value;
        var vPwd = document.forms["My_Form"]["vPwd"].value;
        if (vUserId == "") {
            alert("아이디를 입력해주세요.");
            return false;
        }
        else if (vUserId.length < 4) {
            alert("4글자 이상 입력해주세요");
            return false;
        }

        if (vPwd == "") {
            alert("비밀번호를 입력해주세요.");
            return false;
        }
        if(vPwd.length < 8 || (!/[A-Z]/.test(vPwd) && !/[a-z]/.test(vPwd) && !/[0-9]/.test(vPwd) && !/[\!\@\#\$\%\^\&\*\(\)\_\+\.\,\;\:\-]/.test(vPwd))){
            alert("8자 이상의 영문 대소문자, 숫자, 특수문자 중 2가지 이상을 조합하여 입력해주세요.");
            return false;
        }
        document.forms["My_Form"].submit();
    }

</script>
<head>
    <title>회원가입</title>
</head>
<body>

<h2>회원가입</h2>

<form action="../joinAction.jsp" method="post" name="My_Form">
    아이디:<input type="text" name="vUserId" placeholder="아이디를 입력하세요."><br>
    비밀번호:<input type="password" name="vPwd" placeholder="비밀번호를 입력하세요."><br/>

    이름:<input type="text" name="vName"><br/>
    전화번호:
    <select name="vTelcom">
        <option>SKT</option>
        <option>KT</option>
        <option>LGU+</option>
    </select>
    <select name="iPhone1">
        <option>010</option>
        <option>02</option>
        <option>031</option>
        <option>051</option>
    </select>
    - <input type="text" name="iPhone2" size="5">
    - <input type="text" name="iPhone3" size="5">

    <br/>
    <input type="radio" name="vGender" value="M" checked>남자
    <input type="radio" name="vGender" value="F">여자

    <input type="button" value="가입" onclick="Check_Form()">

</form>



</body>
</html>
