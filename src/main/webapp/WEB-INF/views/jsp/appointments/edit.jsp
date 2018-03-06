<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html lang="en">
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../resources/core/js/edit.js"></script>
    <meta charset="UTF-8">
    <title>Edit Pet</title>
</head>
<body>
<form:form method="POST" commandName="appointment" id="edit_appointment_form" action="../appointment/edit">
    <form:input path="id" type="hidden"/>
    <form:input path="pet.id" type="hidden"/>
    <%--<input type="hidden" name="pet.id"  value="<%=request.getParameter("pet_id")%>"/>--%>


    <legend>Appointment's Details For:</legend>
    <br>
    <table>
        <tr>

        <tr>
            <td>Pet:</td>
                <%--<td><form:input path="${appointment.pet.name}" /></td>--%>

            <td><input type="text" value="${pet.name}" readonly="readonly"/>

                    <%--<c:if test="${ !empty errorMessages}">--%>
                    <%--${errorMessages.get("pet_name")}--%>
                    <%--</c:if>--%>
            </td>
        </tr>

        <td>Doctor's name:</td>
            <%--<td><form:input path="doctor_name" /></td>--%>

        <td>
            <form:select path="doctor.id">
                <form:options items="${doctors}" itemLabel="name" itemValue="id"/>
            </form:select>

                <%--<c:forEach var="appointment" items="${appointmentList}">--%>
                <%--<select name="doctors">--%>
                <%--<c:forEach var="item" items="${doctors}">--%>
                <%--<option value="${item.name}">${item.name}</option>--%>
                <%--</c:forEach>--%>
                <%--</select>--%>
                <%--<form:input path="doctor" type="hidden" value = "request.getParameter('doctors')"/>--%>
        </td>
        <td>
            <c:if test="${ !empty errorMessages}">
                ${errorMessages.get("doctor_name")}
            </c:if>
        </td>
        </tr>
        <tr>
            <td>Date:</td>


                <%--$.datepicker.setDefaults({--%>
                <%--showOn: "both",--%>
                <%--buttonImageOnly: true,--%>
                <%--buttonImage: "calendar.gif",--%>
                <%--buttonText: "Calendar"--%>
                <%--});--%>

            <td><form:input path="date"/></td>
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
                    <%--<button type="button" onclick="backToPetsEdit(${pet.master.id}, ${pet.id})">Cancel</button>--%>
                <button type="button" onclick="backToPetsEdit(<%=request.getParameter("client_id")%>, ${pet.id})">
                    Cancel
                </button>
            </td>
        </tr>
    </table>


</form:form>

</body>
</html>