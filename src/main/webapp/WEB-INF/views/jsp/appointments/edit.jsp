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
<form:form method="POST" commandName="appointment" id="edit_appointment_form" action="../appointment/edit">
    <form:input path="id" type="hidden" />

    <legend>Appointment's Details:</legend> <br>
    <table>
        <tr>

            <td>Doctor's name:</td>
            <td><form:input path="doctor_name" /></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("doctor_name")}
                </c:if>
            </td>

        </tr>
        <tr>
            <td>Pet's name:</td>
            <td><form:input path="pet_name" /></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("pet_name")}
                </c:if>
            </td>
        </tr>
        <tr>
            <td>Date:</td>
            <td><form:input path="date" /></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("date")}
                </c:if>
            </td>
        </tr>
        <tr>
            <td colspan="2">

                <button type="submit">Save</button>
                    <%--<button type="button" onclick="postEditedDoctor()">Save</button>--%>
                <button type="button" onclick="backToAppointmentsList()">Cancel</button>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>