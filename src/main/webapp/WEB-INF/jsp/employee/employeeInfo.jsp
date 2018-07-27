<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getContextPath();
    if (!"/".equals(basePath)) {
        basePath += "/";
    }
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>员工信息表</title>
    <!--引入jQuery-->
    <script type="text/javascript" src="static/js/jquery-3.3.1.js"></script>
    <%--引入样式--%>
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%--搭建页面--%>
<div class="container">
    <%--标题--%>
    <div class="row">
        <%--占的栅格数,max 12--%>
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <%--偏移量8--%>
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-success">
                <%--添加图标--%>
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                添加
            </button>
            <button class="btn btn-danger">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                删除
            </button>
        </div>
    </div>
    <%--表格--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>Email</th>
                    <th>所属部门</th>
                    <th>操作</th>
                </tr>
                <tr>
                    <td>#</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>Email</td>
                    <td>所属部门</td>
                    <td>
                        <button class="btn btn-primary btn-sm">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            编辑
                        </button>
                        <button class="btn btn-danger btn-sm">
                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                            删除
                        </button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <%--分页信息--%>
    <div class="row">
        <%--分页文字--%>
        <div class="col-md-6">

        </div>
        <%--分页条--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="#">首页</a></li>
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <li><a href="#">尾页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
