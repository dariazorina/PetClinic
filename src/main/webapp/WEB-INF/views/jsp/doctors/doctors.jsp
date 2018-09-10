<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Doctors</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
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
        <table id="doctorTable" class="table_orange">
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Login</th>
                <th>Logo</th>
                <th>Specialization</th>
                <th>Age</th>
                <th>Phone</th>
                <th>Deleted</th>
                <th>EDIT</th>
                <th>DELETE</th>

            </tr>
            </thead>
            <tbody>

            <c:forEach var="doctor" items="${doctorList}">
            <tr>
                <c:url var="thisURL" value="./edit">
                    <c:param name="id" value="${doctor.id}"/>
                </c:url>


                <td>${doctor.id}</td>
                <td><a href="<c:out value="${thisURL}"/>">${doctor.name}</a></td>
                <td>${doctor.login}</td>
                <td>${doctor.logo}</td>
                <td>${doctor.specialization}</td>
                <td>${doctor.age}</td>
                <td>${doctor.phone}</td>
                <td>${doctor.deleted}</td>
                <%--<td><input type="button" value="EDIT" onclick="editClicked(${doctor.id})"/></td>--%>

                <c:url var="thoseURL" value="./edit">
                    <c:param name="id" value="${doctor.id}"/>
                </c:url>
                <td><a href="<c:out value="${thoseURL}"/>" ><img src="../resources/med_plus.png" width="23" height="23" border="0"> </a></td>

                <c:url var="thoseURL" value="./edit">
                    <c:param name="id" value="${doctor.id}"/>
                </c:url>

                <td><a href="" onclick="return deleteClicked(${doctor.id});"><img src="../resources/delete.png" width="23" height="23" border="0"> </a></td>

            <%--<td><input type="button" value="DELETE" onclick="deleteClicked(${doctor.id})"></td>--%>
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
