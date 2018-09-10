<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Clients</title>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>

    <script src="/dasha/resources/core/js/clients.js"></script>
    <link href="/dasha/resources/core/css/table_style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div class="container">
    <h1>Clients List</h1>
    <div class="row col-md-7 table-responsive">
        <table id="clientTable" class="table_orange">
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Login</th>
                <th>Logo</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Deleted</th>
                <th>EDIT</th>
                <th>DELETE</th>

            </tr>
            </thead>
            <tbody>

            <c:forEach var="client" items="${clientList}">

                <c:url var="thisURL" value="./edit">
                    <c:param name="id" value="${client.id}"/>
                </c:url>


                <tr>
                    <td>${client.id}</td>
                    <td><a href="<c:out value="${thisURL}"/>">${client.name}</a></td>
                    <td>${client.login}</td>
                    <td>${client.logo}</td>
                    <td>${client.address}</td>
                    <td>${client.phone}</td>
                    <td>${client.deleted}</td>
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
