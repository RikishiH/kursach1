<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="windows-1251" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp"/>
<body>
<h1>Оформить заявку:</h1>
<form action="/syst/order/add" method="post">
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Паспорт</span>
        <input type="text" class="form-control" placeholder="Паспорт" aria-label="Паспорт"
               aria-describedby="basic-addon1" name="product.productName">
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon2">Перечислить остальные кредиты</span>
        <textarea type="text" class="form-control" placeholder="Перечислить остальные кредиты" aria-label="Перечислить остальные кредиты"
                  aria-describedby="basic-addon2" name="product.description" rows="5"></textarea>
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon3">Имя</span>
        <input type="text" class="form-control" placeholder="Имя" aria-label="Имя"
               aria-describedby="basic-addon1" name="person.name">
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon4">Фамилия</span>
        <input type="text" class="form-control" placeholder="Фамилия" aria-label="Фамилия"
               aria-describedby="basic-addon1" name="person.secondName">
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon5">Отчество</span>
        <input type="text" class="form-control" placeholder="Отчество" aria-label="Отчество"
               aria-describedby="basic-addon1" name="person.middleName">
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon6">Телефон</span>
        <input type="text" class="form-control" placeholder="Телефон" aria-label="Телефон"
               aria-describedby="basic-addon1" name="phoneNumber.phoneNumber">
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon7">Кредит</span>
        <select class="btn btn-outline-success" name="credit.creditName">
            <c:forEach var="creditItem" items="${credit}">
                <option value="${creditItem.creditName}">
                        ${creditItem.creditName}
                </option>
            </c:forEach>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
<jsp:include page="footer.jsp"/>

