
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="windows-1251" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <title>System</title>
</head>
<body>
<!-- Navigation bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand">S</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <security:authorize access="hasRole('ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link" href="/syst/credit/add">Добавить кредит</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/syst/admin/order">Просмотр заявок</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/syst/order/add">Добавить заявку</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/syst/credits">Просмотр кредитов</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/syst/order/payed">Просмотр перечисленных кредитов</a>
                    </li>
                </security:authorize>

                <security:authorize access="hasRole('USER')">
                    <li class="nav-item">
                        <a class="nav-link" href="/syst/">Просмотр всех кредитов</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/syst/order/add">Добавить заявку на кредит</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/syst/status">Статус кредитов</a>
                    </li>
                </security:authorize>

                <security:authorize access="hasRole('WORKER')">
                    <li class="nav-item">
                        <a class="nav-link" href="/syst/worker/order">Просмотр заявок</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/syst/credits">Просмотр всех кредитов</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/syst/worker/order/progress">В процессе обработки</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/syst/order/add">Добавить заявку</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/syst/order/payed">Просмотр перечисленных кредитов</a>
                    </li>
                </security:authorize>


            </ul>
            <security:authorize access="isAuthenticated() and hasAnyRole('ADMIN', 'WORKER')">
                <%--                    <a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>--%>
                <a class="nav-link" href="/syst/logout">Logout</a>
                <form action="/syst/order/search" class="d-flex">
                    <input name="searchParam" class="form-control me-2" type="search" placeholder="Search"
                           aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Поиск</button>
                </form>
            </security:authorize>

            <security:authorize access="isAuthenticated() and hasRole('USER')">
                <%--                    <a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>--%>
                <a class="nav-link" href="/syst/logout">Logout</a>
                <form action="/syst/credit/search" class="d-flex">
                    <input name="searchParam" class="form-control me-2" type="search" placeholder="Search"
                           aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Поиск</button>
                </form>
            </security:authorize>

            <security:authorize access="!isAuthenticated()">
                <a class="nav-link" href="/syst/login">Login</a>
            </security:authorize>

        </div>
    </div>
</nav>
