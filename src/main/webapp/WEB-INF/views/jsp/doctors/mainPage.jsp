<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Client page</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
    <script src="/dasha/resources/core/js/clientMain.js"></script>
    <link href="/dasha/resources/core/css/table_style.css" rel="stylesheet" type="text/css"/>
    <link href="/dasha/resources/core/css/button_style.css" rel="stylesheet" type="text/css"/>


    <%--<script src="../resources/core/js/doctors.js"></script>--%>
    <%--http://localhost:8080/dasha  /resources/core/js/doctors.js--%>
    <%--http://localhost:8080/dasha -> controllers--%>
    <%--http://localhost:8080/dasha -> jsp--%>


    <%--D:\PROJECTS\DASHA\spring3-mvc-maven-xml-hello-world\src\main\webapp\resources\core\js\doctors.js--%>

</head>
<body>
<div class="container">
    <h3>Hello, ${doctor.name}! </h3>
    <div>
        <b><i>Appointments Table</i></b> <br><br>


        <div class="row col-md-7 table-responsive">
            <table id="appTable" class="table_orange">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Pet</th>
                    <th>Date</th>
                    <%--<th>Status</th>--%>
                    <%--<th>Comment</th>--%>
                    <%--<th>EDIT</th>--%>
                    <%--<th>DELETE</th>--%>

                </tr>
                </thead>
                <tbody>
                <c:forEach var="appointment" items="${appointments}">

                    <tr>
                        <td>${appointment.id}</td>
                        <td>${appointment.petName}</td>
                        <td>${appointment.date}</td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <br> <br>
    <a href="./">Back to main</a>

</body>
</html>

<%--<script type="text/javascript">--%>
<%--function theFunction () {--%>
<%--alert("fsd");--%>
<%--return  false;--%>


<%--}--%>
<%--</script>--%>
