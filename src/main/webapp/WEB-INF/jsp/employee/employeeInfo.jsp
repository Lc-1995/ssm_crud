<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <table class="table table-hover" id="emp_table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>Email</th>
                    <th>所属部门</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <%--分页信息--%>
    <div class="row">
        <%--分页文字--%>
        <div class="col-md-6" id="page_info_div">
        </div>
        <%--分页条--%>
        <div class="col-md-6" id="page_nav_idv">
        </div>
    </div>
</div>

<script type="text/javascript">

    // 1.页面加载后发送ajax请求获取分页数据
    $(function () {
        ajax_toMain(1);
    });

    function ajax_toMain(pn) {
        var url = "emp/" + pn;
        $.get(url, function (result) {
            build_emp_table(result);
            build_page_info(result);
            build_page_nav(result);
        });
    }

    // 构建员工信息
    function build_emp_table(result) {
        // 清空table表格
        $("#emp_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, emp) {
            var empIdTd = $("<td></td>").append(emp.empId);
            var empNameTd = $("<td></td>").append(emp.empName);
            var empGenderTd = $("<td></td>").append(emp.gender == 0 ? '女' : '男');
            var empEmailTd = $("<td></td>").append(emp.email);
            var empDeptTd = $("<td></td>").append(emp.dept.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(empIdTd)
                .append(empNameTd)
                .append(empGenderTd)
                .append(empEmailTd)
                .append(empDeptTd)
                .append(btnTd)
                .appendTo("#emp_table tbody");
        });
    }

    // 构建分页文字信息
    function build_page_info(result) {
        // 清空分页文字信息
        $("#page_info_div").empty();
        var pageNumB = $("<b></b>").append(result.extend.pageInfo.pageNum);
        var pagesB = $("<b></b>").append(result.extend.pageInfo.pages);
        var totalB = $("<b></b>").append(result.extend.pageInfo.total);
        $("#page_info_div")
            .append("当前第[")
            .append(pageNumB).append("]页,")
            .append("总[")
            .append(pagesB).append("]页,")
            .append("总[")
            .append(totalB).append("]条记录")
    }

    // 构建分页条
    function build_page_nav(result) {
        // 清空分页条
        $("#page_nav_idv").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        // 首页
        var firstPageLi = $("<li></li>").append($("<a></a>").append($("<span></span>").append("首页")).attr("href", "#"));
        // 上一页
        var prePageLi = $("<li></li>").append($("<a></a>").append($("<span></span>").append("&laquo;")).attr("href", "#"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else { // 添加点击事件
            firstPageLi.click(function () {
                ajax_toMain(1);
            });
            prePageLi.click(function () {
                ajax_toMain(result.extend.pageInfo.pageNum - 1);
            });
        }
        // 下一页
        var nextPageLi = $("<li></li>").append($("<a></a>").append($("<span></span>").append("&raquo;")).attr("href", "#"));
        // 尾页
        var lastPageLi = $("<li></li>").append($("<a></a>").append($("<span></span>").append("尾页")).attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else { // 添加点击事件
            nextPageLi.click(function () {
                ajax_toMain(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                ajax_toMain(result.extend.pageInfo.pages);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            // 分页数字
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            // 添加点击事件
            numLi.click(function () {
                ajax_toMain(item);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav_idv");
    }
</script>
</body>
</html>
