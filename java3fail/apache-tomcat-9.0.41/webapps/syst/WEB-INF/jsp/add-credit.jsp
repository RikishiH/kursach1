<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="windows-1251" buffer="8kb" %>

<jsp:include page="header.jsp"/>
<body>
<h1>�������� ������:</h1>
<form action="/syst/credit/add" method="post">
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">������������</span>
        <input type="text" class="form-control" placeholder="������������" aria-label="������������"
               aria-describedby="basic-addon1" name="creditName"/>
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon2">�����</span>
        <input type="text" class="form-control" placeholder="�����" aria-label="�����"
               aria-describedby="basic-addon2" name="creditPrice"/>
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon2">�������</span>
        <input type="text" class="form-control" placeholder="�������" aria-label="�������"
               aria-describedby="basic-addon2" name="creditPercent"/>
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon2">����� � �����</span>
        <input type="text" class="form-control" placeholder="�����" aria-label="�����"
               aria-describedby="basic-addon2" name="creditPay"/>
    </div>

    <button type="submit" class="btn btn-primary">Submit</button>
</form>
<jsp:include page="footer.jsp"/>
