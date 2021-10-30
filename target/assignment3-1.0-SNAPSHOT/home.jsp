<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: FB
  Date: 05/10/2021
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Home</title>
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
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
                data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <a class="navbar-brand mt-2 mt-lg-0" href="#">
                <img src="https://www.begear.it/wp-content/uploads/2015/11/java-logo.jpg" height="25" alt=""
                     loading="lazy">
            </a>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item chip-outlined">
                    <a class="nav-link" href="./home">Home <i class="fa fa-home"></i> </a>
                </li>
            </ul>
        </div>
        <div class="d-flex align-items-center">
            <a class="d-flex btn btn-danger" style="margin-right: 10px" href="./logout">Log out</a>
            <div class="chip chip-lg bg-warning" style="font-size: 15px;">${user.username}</div>
        </div>
    </div>
</nav>

<div class="p-5 text-center bg-light">
    <h1 class="mb-3">Home page</h1>
    <h4 class="mb-3">Users' standing</h4>
</div>
&nbsp;
<div class="container container-fluid"
     style="border-radius: 30px; border-width: 2px; border-color: darkgrey; border-style: solid; padding:20px;">
    <c:if test="${ not empty games}">
        <ul class="list-group" style=" max-height: 500px; overflow-y: scroll ">
            <c:forEach items="${games}" var="game">
                <li class="list-group-item d-flex justify-content-between align-items-start align-items-center list-group-item-action">
                    <div class=" ms-2 me-auto">
                        <div class="fw-bold"><h5>${game.username}</h5></div>
                        <div>Game id: ${game.id}</div>
                        <div>Time: ${game.time}</div>
                    </div>

                    <h2><span class="badge bg-primary rounded-pill">${game.score}</span></h2>
                </li>
            </c:forEach>
        </ul>
    </c:if>
    <c:if test="${empty games}">
        <div class="text-center">
            <h3>No games. You can play one. <i class="fas fa-times-circle"></i></h3>
        </div>
    </c:if>
</div>
&nbsp;
<div class="text-center container"><a class="btn btn-success" href="./play" style="margin-top: 20px;">
    Play game <i class="fas fa-play"></i></a></div>

<script
        type="text/javascript"
        src="${pageContext.request.contextPath}/js/mdb.min.js"
></script>
</body>
</html>
