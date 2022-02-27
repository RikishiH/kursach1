<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="windows-1251" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    tr:nth-child(even) {
        background-color: #f2f2f2
    }
</style>
<jsp:include page="header.jsp"/>

<h1>
    Заявки:
</h1>

<table class="table">
    <thead>
    <tr>
        <th scope="col">Номер</th>
        <th scope="col">Бренд</th>
        <th scope="col">Комплектация</th>
        <th scope="col">Цена</th>
        <th scope="col">Мотор</th>
                <c:forEach begin="0" end="15">
                    <th></th>
                </c:forEach>
        <th scope="col">Статус</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${orderList}" var="orderItem">
        <tr>
            <td><a href="/syst/order/${orderItem.orderId}">${orderItem.orderId}</a></td>
             <td>${orderItem.car.brand}</td>
             <td> ${orderItem.car.equipment}</td>
             <td> ${orderItem.car.carPrice}</td>
             <td> ${orderItem.car.carMotor}</td>
            <c:forEach begin="0" end="15">
                <td></td>
            </c:forEach>
            <td>${orderItem.status}</td>
            <td>
                <form action="/syst/worker/accept/${orderItem.orderId}" method="post">
                    <button type="submit" class="btn btn-outline-success">Принять</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<form action="/syst/worker/order" method="get">
    <div name="pageNumber">
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <c:forEach var="number" begin="1" end="${pageCount}">
                    <li class="page-item" tabindex="0">
                        <input class="btn btn-outline-success" type="submit" name="pageNumber" value="${number}">
                    </li>
                </c:forEach>
            </ul>
        </nav>
    </div>
</form>

<jsp:include page="footer.jsp"/>

