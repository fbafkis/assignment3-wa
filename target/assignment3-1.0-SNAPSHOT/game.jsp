<%--
  Created by IntelliJ IDEA.
  User: FB
  Date: 07/10/2021
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Game</title>
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

<jsp:include page="game_logic.jsp"/>

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
    <h1 class="mb-3">Memory game</h1>
    <h4 class="mb-3">Try to guess the cards' positions</h4>
</div>
&nbsp;
<div class="container"><h2>Tentativi rimasti: <strong id="leftAttempts">4</strong></h2></div>
&nbsp;
<div class="container"><h2>Score: <strong id="score">4</strong></h2></div>
&nbsp;
<div class="container-sm d-flex justify-content-center"
     style="border-radius: 30px; border-width: 2px; border-color: darkgrey; border-style: solid; padding:20px; ">
    <table class="table table-borderless" style="width: 71%">
        <tbody>
        <% for (int i = 1; i <= 4; i++) { %>
        <tr>
            <% for (int e = 1; e <= 4; e++) { %>
            <td style=" padding:3px;">
                <div style="border-style: solid; border-radius: 20px; min-width: 100%;min-height: 100%;"
                     class="container-sm bg-image hover-overlay rippl" id="card<%=e+((i-1)*4)%>"
                     data-mdb-ripple-color="light"><img
                        class="container-sm game-card-img" style="padding:0px;" src="img/playing-card.png"
                        alt="card<%=e+((i-1)*4)%>"> <a href="#!" onclick="checkCard(<%=e+((i-1)*4)%>)">
                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.4)"></div>
                </a></div>
            </td>
            <% } %>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
&nbsp;

</div>

<div
        class="modal fade"
        id="gameOverModal"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
            <div class="modal-body d-flex align-items-center justify-content-center">
                <h1><span class="bg-danger badge rounded-pill">Game over!</span></h1>
            </div>
        </div>
    </div>
</div>


</body>
</html>
