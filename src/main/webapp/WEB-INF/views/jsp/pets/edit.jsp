<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html lang="en">
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../resources/core/js/edit.js"></script>
    <meta charset="UTF-8">
    <title>Edit Pet</title>
</head>
<body>
<% String path = "../pet/edit?client_id="+request.getParameter("client_id"); %>"
<form:form method="POST" commandName="pet" id="edit_pet_form" action="<%=path%>">
    <form:input path="id" type="hidden" />

    <legend>Pet's Details:</legend> <br>
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
            <td>Species:</td>
            <td><form:input path="species" /></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("species")}
                </c:if>
            </td>
        </tr>
        <tr>
            <td>Age:</td>
            <td><form:input path="age" /></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("age")}
                </c:if>
            </td>
        </tr>
<%--        <tr>
            <td>Master:</td>
            <td><form:input path="master" /></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("master")}
                </c:if>
            </td>
        </tr>--%>
        <tr>
            <td>Doctor:</td>
            <td><form:input path="doctor" /></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("doctor")}
                </c:if>
            </td>
        </tr>
        <tr>
            <td>Illness:</td>
            <td><form:input path="illness" /></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("illness")}
                </c:if>
            </td>
        </tr>
        <tr>
                <%--<td colspan="2"><input type="submit" value="SAVE"></td>--%>
            <td colspan="2">

                <button type="submit">Save</button>
                    <%--<button type="button" onclick="postEditedDoctor()">Save</button>--%>
                <button type="button" onclick="backToPetsList()">Cancel</button>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>