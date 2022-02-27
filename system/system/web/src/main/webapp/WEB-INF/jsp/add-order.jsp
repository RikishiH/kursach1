<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="windows-1251" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp"/>
<body>
<h1>�������� �������:</h1>
<form action="/syst/order/add" method="post">
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">�������</span>
        <input type="text" class="form-control" placeholder="�������" aria-label="�������"
               aria-describedby="basic-addon1" name="product.productName">
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon2">����������</span>
        <textarea type="text" class="form-control" placeholder="����������" aria-label="����������"
                  aria-describedby="basic-addon2" name="product.description" rows="5"></textarea>
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon3">���</span>
        <input type="text" class="form-control" placeholder="���" aria-label="���"
               aria-describedby="basic-addon1" name="person.name">
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon4">�������</span>
        <input type="text" class="form-control" placeholder="�������" aria-label="�������"
               aria-describedby="basic-addon1" name="person.secondName">
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon5">��������</span>
        <input type="text" class="form-control" placeholder="��������" aria-label="��������"
               aria-describedby="basic-addon1" name="person.middleName">
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon6">�������</span>
        <input type="text" class="form-control" placeholder="�������" aria-label="�������"
               aria-describedby="basic-addon1" name="phoneNumber.phoneNumber">
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon7">������</span>
        <select class="btn btn-outline-success" name="car.brand">
            <c:forEach var="carItem" items="${car}">
                <option value="${carItem.brand}">
                        ${carItem.brand}
                </option>
            </c:forEach>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
<jsp:include page="footer.jsp"/>

