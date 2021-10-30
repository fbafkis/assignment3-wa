<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Memory game</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
            rel="stylesheet"
    />
    <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
    />
    <link
            href="${pageContext.request.contextPath}/css/mdb.min.css"
            rel="stylesheet"
    />
    <link
            href="${pageContext.request.contextPath}/css/main.css"
            rel="stylesheet"
    />
</head>

<body>
<div class="p-5 text-center bg-light">
    <h1 class="mb-3">Memory game</h1>
    <h4 class="mb-3">Made by Francesco Bertamini</h4>
</div>
&nbsp;
<c:if test="${not empty errorNotification}">
    <div class="alert alert-danger" role="alert" data-mdb-color="danger">
            ${sessionScope.errorNotification}
    </div>
    <% session.removeAttribute("errorNotification"); %>
</c:if>

<div class="container" style=" border-radius: 30px; border-width: 2px; border-color: darkgrey; border-style: solid;">
    <div class="p-4 d-flex align-middle justify-content-center">
        <form style="width: 22rem;" method="post" action="./login">
            <div class="form-outline mb-4">
                <input type="text" name="username" id="username" class="form-control">
                <label class="form-label" for="username" style="margin-left: 0px;">Username</label>
                <div class="form-notch">
                    <div class="form-notch-leading" style="width: 9px;"></div>
                    <div class="form-notch-middle" style="width: 88.8px;"></div>
                    <div class="form-notch-trailing"></div>
                </div>
            </div>
            <button type="submit" class="btn btn-warning btn-block">Log in</button>
        </form>
    </div>
</div>

<script
        type="text/javascript"
        src="${pageContext.request.contextPath}/js/mdb.min.js"
></script>
</body>
</html>
