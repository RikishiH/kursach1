<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="windows-1251" %>
<style>
    tr:nth-child(even) {
        background-color: #f2f2f2
    }
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>

<table class="table">
    <thead>
    <tr>
        <th scope="col">Кредит</th>
        <th scope="col">Сумма</th>
        <th scope="col">Процент</th>
        <th scope="col">Платёж</th>
    </tr>
    </thead>
    <tbody>
       <c:forEach items="${creditList}" var="creditItem">
           <tr>
               <td>${creditItem.creditName}</td>
               <td> от ${creditItem.creditPrice}</td>
               <td> ${creditItem.creditPercent}</td>
               <td> от ${creditItem.creditPay}</td>
           </tr>
       </c:forEach>
       </tbody>
</table>


<form action="/syst/credit/search" method="get">
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

