<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="windows-1251" buffer="8kb" %>

<jsp:include page="header.jsp"/>
<body>
<h1>Добавить авто:</h1>
<form action="/syst/car/add" method="post">
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Бренд</span>
        <input type="text" class="form-control" placeholder="Бренд" aria-label="Бренд"
               aria-describedby="basic-addon1" name="brand"/>
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon2">Сумма</span>
        <input type="text" class="form-control" placeholder="Сумма" aria-label="Сумма"
               aria-describedby="basic-addon2" name="carPrice"/>
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon2">Комплектация</span>
        <input type="text" class="form-control" placeholder="Комплектация" aria-label="Комплектация"
               aria-describedby="basic-addon2" name="equipment"/>
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon2">Мотор</span>
        <input type="text" class="form-control" placeholder="Мотор" aria-label="Мотор"
               aria-describedby="basic-addon2" name="carMotor"/>
    </div>

    <button type="submit" class="btn btn-primary">Submit</button>
</form>
<jsp:include page="footer.jsp"/>
