<%--
  Created by IntelliJ IDEA.
  User: itaegyeom
  Date: 2023/03/29
  Time: 11:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script>
    function Check_Form() {
        var vName = document.forms["My_Form"]["vName"].value;
        var iPhone1 = document.forms["My_Form"]["iPhone1"].value;
        var iPhone2 = document.forms["My_Form"]["iPhone2"].value;
        var iPhone3 = document.forms["My_Form"]["iPhone3"].value;
        if (vName == "") {
            alert("이름를 입력해주세요.");
            return false;
        }
        else if (vName.length < 2) {
            alert("2글자 이상 입력해주세요");
            return false;
        }

        if (iPhone1 == "") {
            alert("전화번호를 입력해주세요.");
            return false;
        }else if (iPhone2 == "") {
            alert("전화번호를 입력해주세요.");
            return false;
        }else if (iPhone3 == "") {
            alert("전화번호를 입력해주세요.");
            return false;
        }

        My_Form.submit();
    }

</script>

<head>
    <title>아이디 찾기</title>
</head>
<body>
<form action="Find_Id_Proc.jsp" method="post" name="My_Form">
    이름:<input type="text" name="vName" placeholder="이름을 입력하세요."><br>
    전화번호:
    <select name="iPhone1">
        <option>010</option>
        <option>02</option>
        <option>031</option>
        <option>051</option>
    </select>
    - <input type="text" name="iPhone2" size="5">
    - <input type="text" name="iPhone3" size="5"><br>

    <input type="button" value="찾기" onclick="Check_Form()">
</form>
</body>
</html>
