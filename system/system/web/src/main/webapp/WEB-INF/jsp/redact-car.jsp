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
        <th scope="col">Бренд</th>
        <th scope="col">Комплектация</th>
        <th scope="col">Цена</th>
        <th scope="col">Мотор</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${carList}" var="carItem">
        <tr>
               <td>${carItem.brand}</td>
               <td>${carItem.equipment}</td>
               <td>${carItem.carPrice}</td>
               <td>${carItem.carMotor}</td>
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
