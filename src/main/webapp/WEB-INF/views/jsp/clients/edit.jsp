<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../resources/core/js/edit.js"></script>
    <meta charset="UTF-8">
    <title>Edit Client</title>
</head>
<body>


<form:form method="POST" commandName="client" id="edit_client_form" action="../client/edit">
    <form:input path="id" type="hidden" />

    <legend>Client's Details:</legend> <br>
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
                <%--<td colspan="2"><input type="submit" value="SAVE"></td>--%>
            <td colspan="2">

                <button type="submit">Save</button>
                    <%--<button type="button" onclick="postEditedDoctor()">Save</button>--%>
                <button type="button" onclick="backToClientsList()">Cancel</button>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>
