<%--
  Created by IntelliJ IDEA.
  User: FB
  Date: 10/10/2021
  Time: 22:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Home</title>
    <!-- Font Awesome -->

    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
            rel="stylesheet"
    />
    <!-- Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
    />
    <!-- MDB -->

    <link
            href="${pageContext.request.contextPath}/mdb.min.css"
            rel="stylesheet"
    />
</head>

<body>


<c:if test="${ not empty successNotification}">
    <div class="toast show fade text-white bg-success" role="alert" aria-live="assertive" aria-atomic="true"
         data-mdb-color="success" style="position: absolute; top: 0; right: 0; z-index: 500; margin: 20px;">
        <div class="toast-header text-white bg-success">
            <i class="fas fa-check fa-lg me-2"></i>
            <strong class="me-auto">Success</strong>
            <small><%= session.getAttribute("notificationTime") %>
            </small>
            <button type="button" class="btn-close btn-close-white" data-mdb-dismiss="toast"
                    aria-label="Close"></button>
        </div>
        <div class="toast-body">${successNotification}</div>
    </div>
    <% session.removeAttribute("successNotification"); %>
</c:if>
<c:if test="${ not empty errorNotification}">
    <div class="toast show fade text-white bg-success" role="alert" aria-live="assertive" aria-atomic="true"
         data-mdb-color="danger" style="position: absolute; top: 0; right: 0; z-index: 500; margin: 20px;">
        <div class="toast-header text-white bg-success">
            <i class="fas fa-check fa-lg me-2"></i>
            <strong class="me-auto">Fail</strong>
            <small><%=session.getAttribute("notificationTime") %>
            </small>
            <button type="button" class="btn-close btn-close-white" data-mdb-dismiss="toast"
                    aria-label="Close"></button>
        </div>
        <div class="toast-body">${errorNotification}</div>
    </div>
    <% session.removeAttribute("errorNotification"); %>
</c:if>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <!-- Container wrapper -->
    <div class="container-fluid">
        <!-- Toggle button -->
        <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
                data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>

        <!-- Collapsible wrapper -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Navbar brand -->
            <a class="navbar-brand mt-2 mt-lg-0" href="#">
                <img src="https://www.begear.it/wp-content/uploads/2015/11/java-logo.jpg" height="25" alt=""
                     loading="lazy">
            </a>
            <!-- Left links -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item chip-outlined">
                    <a class="nav-link" href="./home">Home <i class="fa fa-home"></i> </a>

                </li>
                <c:if test="${user.isAdmin}">
                    <li class="nav-item">
                        <a class="nav-link" href="./loadUsers">Manage Users <i class="fa fa-user"></i></a>
                    </li>
                </c:if>
            </ul>
            <!-- Left links -->
        </div>
        <!-- Collapsible wrapper -->

        <!-- Right elements -->
        <div class="d-flex align-items-center">
            <a class="d-flex btn btn-danger" style="margin-right: 10px" href="./logout">Log out</a>
            <!-- Icon -->
            <div class="chip chip-lg bg-warning" style="font-size: 15px;">${user.username}</div>

        </div>

    </div>
    <!-- Container wrapper -->
</nav>

<div class="p-5 text-center bg-light">
    <h1 class="mb-3">User management</h1>
    <h4 class="mb-3">Add new users</h4>
</div>

&nbsp;
<div class="container">
    <div class="container container-lg"
         style="border-radius: 30px; border-width: 2px; border-color: darkgrey; border-style: solid; padding:20px">
        <c:if test="${ not empty users}">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th scope="col">Username</th>
                <th scope="col">Password</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.username}</td>
                    <td>
                        <div class="d-flex align-items-center">
                            <div id="pswdiv${user.username}"></div>&nbsp;
                        </div>
                    </td>
                    <td>
                        <button id="btnpswd${user.username}" onclick="showHide${user.username}()"
                                class=" btn btn-floating btn-info">
                            <i class="fas fa-eye"></i></button>
                    </td>
                    <script>
                        var txt${user.username} = document.getElementById('pswdiv${user.username}');
                        var btn${user.username} = document.getElementById('btnpswd${user.username}');
                        var visible${user.username} = false;
                        var value${user.username} = '${user.password}';
                        txt${user.username}.innerHTML = '*'.repeat(value${user.username}.length);

                        function showHide${user.username}() {
                            if (visible${user.username}) {
                                value${user.username} = txt${user.username}.innerHTML;
                                txt${user.username}.innerHTML = '*'.repeat(value${user.username}.length);
                                btn${user.username}.innerHTML = '<i class="fas fa-eye"></i>';
                            } else {
                                txt${user.username}.innerHTML = value${user.username};
                                btn${user.username}.innerHTML = '<i class="fas fa-eye-slash"></i>';
                            }
                            visible${user.username} = !visible${user.username};
                        }
                    </script>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        </c:if>
        <c:if test="${ empty users}">
            <div class="text-center">
                <h3>No users. You can add one. <i class="fas fa-times-circle"></i> </h3>
            </div>
        </c:if>
    </div>
    &nbsp;
    <button class="btn btn-success" data-mdb-toggle="modal" data-mdb-target="#modalAddUser" style="margin-top: 20px;">
        Add user <i class="fa fa-plus-circle"></i></button>
</div>
<div class="modal fade" id="modalAddUser" tabindex="-1" aria-labelledby="exampleModalLabel"
     data-gtm-vis-first-on-screen-2340190_1302="1873" data-gtm-vis-total-visible-time-2340190_1302="100"
     data-gtm-vis-has-fired-2340190_1302="1" style="display: none;" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add new user</h5>
                <button type="button" class="btn-close" data-mdb-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="./addUser" method="post">
                <div class="modal-body">
                    <!-- Email input -->
                    <div class="form-outline mb-4">
                        <input type="text" name="username" id="username" class="form-control">
                        <label class="form-label" for="username" style="margin-left: 0px;">Username</label>
                        <div class="form-notch">
                            <div class="form-notch-leading" style="width: 9px;"></div>
                            <div class="form-notch-middle" style="width: 88.8px;"></div>
                            <div class="form-notch-trailing"></div>
                        </div>
                    </div>
                    <div class="form-outline mb-4">
                        <input type="password" name="password" id="password" class="form-control">
                        <label class="form-label" for="password" style="margin-left: 0px;">Password</label>
                        <div class="form-notch">
                            <div class="form-notch-leading" style="width: 9px;"></div>
                            <div class="form-notch-middle" style="width: 88.8px;"></div>
                            <div class="form-notch-trailing"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-mdb-dismiss="modal"> Close</button>
                    <button type="submit" class="btn btn-success"> Add user <i class="fa fa-plus-circle"></i></button>
                </div>
            </form>
        </div>
    </div>
</div>
<script
        type="text/javascript"
        src="${pageContext.request.contextPath}/js/mdb.min.js"
></script>


</body>
</html>
