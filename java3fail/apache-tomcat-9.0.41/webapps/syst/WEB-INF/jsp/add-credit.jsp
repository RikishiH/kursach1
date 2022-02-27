<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="windows-1251" buffer="8kb" %>

<jsp:include page="header.jsp"/>
<body>
<h1>Добавить кредит:</h1>
<form action="/syst/credit/add" method="post">
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Наименование</span>
        <input type="text" class="form-control" placeholder="Наименование" aria-label="Наименование"
               aria-describedby="basic-addon1" name="creditName"/>
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon2">Сумма</span>
        <input type="text" class="form-control" placeholder="Сумма" aria-label="Сумма"
               aria-describedby="basic-addon2" name="creditPrice"/>
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon2">Процент</span>
        <input type="text" class="form-control" placeholder="Процент" aria-label="Процент"
               aria-describedby="basic-addon2" name="creditPercent"/>
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon2">Плата в месяц</span>
        <input type="text" class="form-control" placeholder="Плата" aria-label="Плата"
               aria-describedby="basic-addon2" name="creditPay"/>
    </div>

    <button type="submit" class="btn btn-primary">Submit</button>
</form>
<jsp:include page="footer.jsp"/>
