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
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="assets/css/main.css"/>
    <link rel="stylesheet" href="assets/css/noscript.css"/>
</head>
<body>
    <div class="container-fluid">
        <div class="col-sm-13">
            <div class="panel panel-info">
                <div class="panel-heading"><h4><span class="glyphicon glyphicon-user"></span></h4></div>
                <div class="panel-body">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th colspan="8" class="text-center">預約看診</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th class="text-center">身分證字號</th>
                            <th class="text-center">看診日期</th>
                            <th class="text-center">病例編號</th>
                            <th class="text-center">醫事機構</th>
                            <th class="text-center">看診科別</th>
                            <th class="text-center">看診醫師</th>
                            <th class="text-center">看診診室</th>
                            <th class="text-center">看診序號</th>
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
                                <td colspan="8">查無資料</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                    <button type='button' data-toggle='modal' data-target='#insert' class='btn btn-primary' style="background-color: rgba(255,255,255,0.51);width:100px;height:50px;border-color:#000000;">新增預約</button>
                </div>
            </div>
        </div>
</div><!-- /container -->
<form name="myForm" action="patientData" method="POST">
    <div class="modal fade" id="insert" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="title">新增預約</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="chinese_name" class="col-form-label">姓名：</label>
                        <input type="text" class="form-control" id="chinese_name" name="chinese_name" required>
                        <label for="id" class="col-form-label">身分證字號：</label>
                        <input type="text" class="form-control" id="id" name="id" required>
                        <label for="date" class="col-form-label">預約日期：</label>
                        <input type="date" class="form-control" id="date" name="date" required>
                        <label for="hospital" class="col-form-label">醫事機構：</label>
                        <select class="form-control" id="hospital" name="hospital">
                            <option value="1">1：臺大醫院</option>
                            <option value="2">2：高雄榮總</option>
                        </select>
                        <label for="department" class="col-form-label">看診科別：</label>
                        <select class="form-control" id="department" name="department">
                            <option value="1">1：泌尿科</option>
                            <option value="2">2：內科</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-info" data-dismiss="modal" aria-label="Close" value="取消">
                    <input type="submit" class="btn btn-info" value="新增">
                </div>
            </div>
        </div>
    </div>
</form>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>
