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
    <title>Client page</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
    <script src="/dasha/resources/core/js/clientMain.js"></script>
    <link href="/dasha/resources/core/css/table_style.css" rel="stylesheet" type="text/css"/>

    <%--<script src="../resources/core/js/doctors.js"></script>--%>
    <%--http://localhost:8080/dasha  /resources/core/js/doctors.js--%>
    <%--http://localhost:8080/dasha -> controllers--%>
    <%--http://localhost:8080/dasha -> jsp--%>


    <%--D:\PROJECTS\DASHA\spring3-mvc-maven-xml-hello-world\src\main\webapp\resources\core\js\doctors.js--%>

</head>
<body>
<div class="container">
    <h1>Hello ${client.name} </h1>

    <h1>Pets List</h1>
    <div class="row col-md-7 table-responsive">
        <table id="petsTable" class="table table-bordered table-hover">
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Species</th>
                <th>Age</th>
                <th>Master</th>
                <th>Illness</th>
                <th>EDIT</th>
                <th>DELETE</th>

            </tr>
            </thead>
            <tbody>

            <c:forEach var="pet" items="${client.pets}">
                <tr>
                    <td>${pet.id}</td>
                    <td>${pet.name}</td>
                    <td>${pet.species}</td>
                    <td>${pet.age}</td>
                    <td>${pet.master}</td>
                    <td>${pet.illness}</td>
                    <td><input type="button" value="EDIT" onclick="editClicked(${pet.id})"/></td>
                    <td><input type="button" value="DELETE" onclick="deleteClicked(${pet.id})"></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>



    </div>

    <br><br>
    <button type="button" onclick="addNewPet(${client.id})">Add A Pet</button>


</div>

<%--<form:form method="POST" commandName="client" id="details_client_form" action="../client">
    <form:input path="id" type="hidden" />

    <legend>Your Details:</legend> <br>
    <table>
        <tr>

            <td>Name:</td>
            <td><form:input path="name" /></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("name")}
                </c:if>
            </td>

        </tr>
        <tr>
            <td>Address:</td>
            <td><form:input path="address" /></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("address")}
                </c:if>
            </td>
        </tr>
        <tr>
            <td>Phone:</td>
            <td><form:input path="phone" /></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("phone")}
                </c:if>
            </td>
        </tr>
        <tr>
                &lt;%&ndash;<td colspan="2"><input type="submit" value="SAVE"></td>&ndash;%&gt;
            <td colspan="2">

                <button type="submit">Save</button>
                    &lt;%&ndash;<button type="button" onclick="postEditedDoctor()">Save</button>&ndash;%&gt;
                <button type="button" onclick="backToClientsList()">Cancel</button>
            </td>
        </tr>
    </table>
</form:form>--%>







</body>
</html>
