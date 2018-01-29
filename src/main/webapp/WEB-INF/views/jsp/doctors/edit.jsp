<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html lang="en">
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../resources/core/js/edit.js"></script>
    <meta charset="UTF-8">
    <title>Edit Doctor</title>
</head>
<body>


<form:form method="POST" commandName="doctor" id="edit_doctor_form" action="../doctor/edit">
    <form:input path="id" type="hidden" />

    <legend>Doctor's Details:</legend> <br>
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
            <td>Specialization:</td>
            <td><form:input path="specialization" /></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("specialization")}
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
                <button type="button" onclick="backToDoctorsList()">Cancel</button>
                </td>
        </tr>
    </table>
</form:form>

</body>
</html>