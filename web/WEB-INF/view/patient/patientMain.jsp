<%--
  Created by IntelliJ IDEA.
  User: bao
  Date: 2019/11/15
  Time: 下午 03:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Medical Record System</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/css/login.css">
</head>
<body>
    <jsp:include page="../menuBar/patientTopBar.jsp"></jsp:include>
    <jsp:include page="../menuBar/patientSideBar.jsp"></jsp:include>
    <form method="POST">
        <div style="margin-left:200px;margin-top: 60px;width:90%;height: 100%;" >
            <iframe src="patientData" name="main" style="width:100%;height: 100%"></iframe>
        </div>
    </form>
</body>
</html>
