<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="windows-1251" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    tr:nth-child(even) {
        background-color: #f2f2f2
    }
</style>
<jsp:include page="header.jsp"/>

<h1>
    Заявки в процессе рассмотрения:
</h1>

<table class="table">
    <thead>
    <tr>
        <th scope="col">Кредит</th>
        <th scope="col">Сумма</th>
        <th scope="col">Процент</th>
        <th scope="col">Платёж</th>
        <c:forEach begin="0" end="15">
            <th></th>
        </c:forEach>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${orderList}" var="orderItem">
        <tr>
            <td><a href="/syst/order/${orderItem.orderId}">${orderItem.orderId}</a></td>
            <td>${orderItem.credit.creditName}</td>
             <td> ${orderItem.credit.creditPrice}</td>
             <td> ${orderItem.credit.creditPercent}</td>
             <td> ${orderItem.credit.creditPay}</td>
            <c:forEach begin="0" end="15">
                <td></td>
            </c:forEach>
            <td>
                <form action="/syst/worker/progress/${orderItem.orderId}" method="post">
                    <button type="submit" class="btn btn-outline-success">Деньги переведены</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<form action="/syst/worker/order/progress" method="get">
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

