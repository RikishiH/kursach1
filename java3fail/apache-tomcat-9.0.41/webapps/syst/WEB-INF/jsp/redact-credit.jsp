<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="windows-1251" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<style>
    tr:nth-child(even) {
        background-color: #f2f2f2
    }
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
<h1></h1>
<table class="table">
    <thead>
    <tr>
        <th scope="col">Кредит</th>
        <th scope="col">Сумма</th>
        <th scope="col">Процент</th>
        <th scope="col">Платёж</th>
<%--        <security:authorize access="hasRole('ADMIN')">--%>
<%--            <c:forEach begin="0" end="20">--%>
<%--                <td></td>--%>
<%--            </c:forEach>--%>
<%--            <th scope="col"></th>--%>
<%--        </security:authorize>--%>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${creditList}" var="creditItem">
        <tr>
            <td>${creditItem.creditName}</td>
            <td> от ${creditItem.creditPrice}</td>
            <td> ${creditItem.creditPercent}</td>
            <td> от ${creditItem.creditPay}</td>
<%--            <security:authorize access="hasRole('ADMIN')">--%>
<%--                <c:forEach begin="0" end="20">--%>
<%--                    <td></td>--%>
<%--                </c:forEach>--%>
<%--                <td>--%>

<%--                    <form action="/syst/services/delete/${servicesItem.serviceId}" method="post">--%>
<%--                        <button type="submit" class="btn btn-outline-success">Удалить</button>--%>
<%--                    </form>--%>
<%--                </td>--%>
<%--            </security:authorize>--%>
        </tr>
    </c:forEach>
    </tbody>
</table>


<form action="/syst/" method="get">
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
