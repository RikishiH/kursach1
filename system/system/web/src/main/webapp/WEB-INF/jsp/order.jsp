<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="windows-1251" %>
<jsp:include page="header.jsp"/>

<h1>Заявка: ${order.orderId}</h1>

<table class="table">
    <tr>
        <td><h5>Бренд</h5></td>
    </tr>
    <tr>
        <td>${order.car.brand}</td>
    </tr>
    <tr>
        <td><h5>Паспорт</h5></td>
    </tr>
    <tr>
        <td>${order.product.productName}</td>
    </tr>
    <tr>
        <td><h5>Заметки соглашения</h5></td>
    </tr>
    <tr>
        <td>${order.product.description}</td>
    </tr>
    <tr>
        <td><h5>ФИО</h5></td>
    </tr>
    <tr>
        <td>${order.person.name}</td>
    </tr>
    <tr>
        <td>${order.person.secondName}</td>
    </tr>
    <tr>
        <td>${order.person.middleName}</td>
    </tr>
    <tr>
        <td><h5>Телефон</h5></td>
    </tr>
    <tr>
        <td>${order.phoneNumber.phoneNumber}</td>
    </tr>
</table>

<jsp:include page="footer.jsp"/>


