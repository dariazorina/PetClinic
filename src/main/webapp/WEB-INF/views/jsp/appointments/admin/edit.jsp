<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.mkyong.web.model.Appointment" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html lang="en">
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="./../resources/core/js/edit.js"></script>
    <meta charset="UTF-8">


    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Appointment</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <%--<link rel="stylesheet" href="./../resources/demos/style.css">--%>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>

    <title>Edit Appointment</title>
</head>
<body>
<form:form method="POST" commandName="appointment" id="edit_appointment_form" action="./../appointment/edit">
    <form:input path="id" type="hidden"/>

    <legend>Appointment's Details For: (admin version)</legend>
    <br>
    <table>
        <tr>

        <tr>
            <td>Pet:</td>

            <td>
                <form:select path="pet.id">
                    <form:options items="${pets}" itemLabel="name" itemValue="id"/>
                </form:select>

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
        <%--<td>--%>
            <%--<c:if test="${ !empty errorMessages}">--%>
                <%--${errorMessages.get("doctor_name")}--%>
            <%--</c:if>--%>
        <%--</td>--%>
        </tr>
        <tr>
                <%--$( ".selector" ).datepicker({--%>
                <%--dateFormat: "yy-mm-dd"--%>
                <%--});--%>

            <td>Date:</td>
            <td>
                    <%--value=<%=new SimpleDateFormat("MM/dd/yyyy").format(((Appointment) request.getAttribute("appointment")).getDate())%> id="datepicker">--%>
                <form:input path="date" id="datepicker"></form:input>

            </td>
            <script>

                $("#datepicker").datepicker({
                        onSelect: function (dateText, inst) {
                            var dateAsString = dateText;
                            var dateAsObject = $(this).datepicker('getDate');
                        },

                        defaultDate: "5/31/2013",
                        hour: 19,
                        minute: 30
                    }
                );
            </script>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("date")}
                </c:if>
            </td>



                    <%--<c:if test="${ !empty errorMessages}">--%>
                        <%--${errorMessages.get("doctor_name")}--%>
                    <%--</c:if>--%>
        </tr>
        <tr>
            <td colspan="2">

                <button type="submit">Save</button>
                <button type="button" onclick="history.back()">Cancel</button>
            </td>
        </tr>
    </table>


</form:form>

</body>
</html>