<%--
  Created by IntelliJ IDEA.
  User: bao
  Date: 2019/11/15
  Time: 上午 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <div class="container-fluid">
        <div class="col-sm-13">
            <div class="panel panel-info">
                <div class="panel-heading"><h4><span class="glyphicon glyphicon-user">　看診紀錄</span></h4></div>
                <div class="panel-body">
                    <table class="table table-bordered">
                        <tbody>
                        <tr>
                            <th class="text-center">就醫日期</th>
                            <th class="text-center">醫事機構</th>
                            <th class="text-center">疾病分類名稱</th>
                            <th class="text-center">看診醫師</th>
                        </tr>
                        <c:forEach items="${memberList}" var="member" varStatus="status">
                            <tr class="text-center">
                                <td>${member.getIdNumber()}</td>
                                <td>${member.getChineseName()}</td>
                                <td>${member.getPhone()}</td>
                                <td>${member.getEmail()}</td>
                            </tr>
                        </c:forEach>
                        <c:if test = "${fn:length(memberList) == 0}">
                            <tr class="text-center">
                                <td colspan="5">查無資料</td>
                            </tr>
                        </c:if>
                        </tbody>
                        <tbody>
                        <tr>
                            <th class="text-center">藥品代碼</th>
                            <th class="text-center">藥品名稱</th>
                            <th class="text-center">給藥日數</th>
                            <th class="text-center">藥品用量</th>
                        </tr>
                        <c:forEach items="${memberList}" var="member" varStatus="status">
                            <tr class="text-center">
                                <td>${member.getIdNumber()}</td>
                                <td>${member.getChineseName()}</td>
                                <td>${member.getPhone()}</td>
                                <td>${member.getEmail()}</td>
                            </tr>
                        </c:forEach>
                        <c:if test = "${fn:length(memberList) == 0}">
                            <tr class="text-center">
                                <td colspan="5">查無資料</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                    <button type='button' data-toggle='modal' data-target='#insert' class='btn btn-primary'>修改</button>
                </div>
            </div>
        </div>
</div><!-- /container -->
<form name="myForm" action="patientData" method="POST">
    <div class="modal fade" id="insert" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="title">新增帳戶</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="account" class="col-form-label">職員編號：</label>
                        <input type="text" class="form-control" id="account" name="account" value="${latestId}" readonly="readonly" required>
                        <label for="chinese_name" class="col-form-label">中文名：</label>
                        <input type="text" class="form-control" id="chinese_name" name="chinese_name" required>
                        <label for="english_name" class="col-form-label">英文名：</label>
                        <input type="text" class="form-control" id="english_name" name="english_name" required>
                        <label for="role_code" class="col-form-label">角色代碼：</label>
                        <select class="form-control" id="role_code" name="role_code">
                            <option value="1">1：Product Owner</option>
                            <option value="2">2：Developer</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    <input type="submit" class="btn btn-info" value="修改">
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>
