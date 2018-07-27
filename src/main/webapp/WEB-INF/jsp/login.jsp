<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getContextPath();
    if (!"".equals(basePath)) {
        basePath += "/";
    }
%>
<html>
<head>
    <base href="<%=basePath%>">
    <!--引入jQuery-->
    <script type="text/javascript" src="static/js/jquery-3.3.1.js"></script>
    <%--引入样式--%>
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link href="static/css/signin.css" rel="stylesheet">
    <title>登录界面</title>
</head>
<body>
<div class="container">

    <form class="form-signin" action="/login" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputUsername" class="sr-only">User name</label>
        <input type="text" id="inputUsername" name="username" class="form-control" placeholder="User name" required>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password">
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> Remember me
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form>

</div>
</body>
</html>
