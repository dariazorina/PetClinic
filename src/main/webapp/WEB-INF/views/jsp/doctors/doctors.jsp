<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Doctors</title>


    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>--%>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
    <script src="path/to/your/script.js"></script>

    <script src="/dasha/resources/core/js/doctors.js"></script>
    <link href="/dasha/resources/core/css/table_style.css" rel="stylesheet" type="text/css" />

    <%--<script src="../resources/core/js/doctors.js"></script>--%>
    <%--http://localhost:8080/dasha  /resources/core/js/doctors.js--%>
    <%--http://localhost:8080/dasha -> controllers--%>
    <%--http://localhost:8080/dasha -> jsp--%>


    <%--D:\PROJECTS\DASHA\spring3-mvc-maven-xml-hello-world\src\main\webapp\resources\core\js\doctors.js--%>

</head>
<body>
<div class="container">
    <h1>Doctors List JSP ${msg}</h1>
    <div class="row col-md-7 table-responsive">
        <table id="doctorTable" class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Specialization</th>
                <th>Age</th>
                <th>Phone</th>
                <th>EDIT</th>
                <th>DELETE</th>

            </tr>
            </thead>
            <tbody>

            <c:forEach var="doctor" items="${doctorList}">
            <tr>
                <td>${doctor.id}</td>
                <td>${doctor.name}</td>
                <td>${doctor.specialization}</td>
                <td>${doctor.age}</td>
                <td>${doctor.phone}</td>
                <td><input type="button" value="EDIT" onclick="editClicked(${doctor.id})"/></td>
                <td><input type="button" value="DELETE" onclick="deleteClicked(${doctor.id})"></td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <br><br>
    <button type="button" onclick="addNewDoctor()">Add A Doctor</button>

    <br> <br>
    <a href="../">Back to main</a>

</div>

</body>
</html>
