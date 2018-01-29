<%--
  Created by IntelliJ IDEA.
  User: Tom
  Date: 23.01.2018
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Clients</title>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
    <script src="path/to/your/script.js"></script>

    <script src="/dasha/resources/core/js/clients.js"></script>
    <link href="/dasha/resources/core/css/table_style.css" rel="stylesheet" type="text/css" />

    <%--<script src="../resources/core/js/doctors.js"></script>--%>
    <%--http://localhost:8080/dasha  /resources/core/js/doctors.js--%>
    <%--http://localhost:8080/dasha -> controllers--%>
    <%--http://localhost:8080/dasha -> jsp--%>


    <%--D:\PROJECTS\DASHA\spring3-mvc-maven-xml-hello-world\src\main\webapp\resources\core\js\doctors.js--%>

</head>
<body>
<div class="container">
    <h1>Clients List</h1>
    <div class="row col-md-7 table-responsive">
        <table id="customerTable" class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Pets</th>
                <th>EDIT</th>
                <th>DELETE</th>

            </tr>
            </thead>
            <tbody>

            <c:forEach var="client" items="${clientList}">
                <tr>
                    <td>${client.id}</td>
                    <td>${client.name}</td>
                    <td>${client.address}</td>
                    <td>${client.phone}</td>
                    <td></td>
                    <td><input type="button" value="EDIT" onclick="editClicked(${client.id})"/></td>
                    <td><input type="button" value="DELETE" onclick="deleteClicked(${client.id})"></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <br><br>
    <button type="button" onclick="addNewClient()">Add A Client</button>

    <br> <br>
    <a href="../">Back to main</a>

</div>


</body>
</html>
