<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="windows-1251" %>
<style>
    tr:nth-child(even) {
        background-color: #f2f2f2
    }
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
<h1>Результат поиска заявки:</h1>
<table class="table">
    <thead>
    <tr>
        <th scope="col">Номер</th>
        <th scope="col">Kредит</th>
        <th scope="col">ФИО</th>
        <th scope="col">Телефон</th>
        <th scope="col">Статус</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${orderList}" var="orderItem">
        <tr>
            <td><a href="/syst/order/${orderItem.orderId}">${orderItem.orderId}</a></td>
            <td>${orderItem.car.brand}</td>
            <td>${orderItem.person.secondName} ${orderItem.person.name} ${orderItem.person.middleName}</td>
            <td>${orderItem.phoneNumber.phoneNumber}</td>
            <td>${orderItem.status}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<form action="/syst/order/search" method="get">
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



