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
    <title>jQuery UI Datepicker - Default functionality</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <%--<link rel="stylesheet" href="./../resources/demos/style.css">--%>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>

    <title>Edit Pet</title>
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
    <td>
        <c:if test="${ !empty errorMessages}">
            ${errorMessages.get("doctor_name")}
        </c:if>
    </td>
    </tr>
    <tr>
            <%--$( ".selector" ).datepicker({--%>
            <%--dateFormat: "yy-mm-dd"--%>
            <%--});--%>

        <td>Date:</td>
        <td>

            <%--dsfsdfsdfsdfsdf--%>
                <input type="text" path="date" value=<%=new SimpleDateFormat("MM/dd/yyyy").format(((Appointment) request.getAttribute("appointment")).getDate())%> id="datepicker">

                <%--<input type="text" path="date" value="31/03/2017" id="datepicker">--%>

                <%--<form:input path="date" id="datepicker"></form:input>--%>
                <%--<script>var javascriptValue = <%=--%>


                <%--<%--%>
                <%--SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");--%>
                <%--Appointment appointment = (Appointment) request.getAttribute("appointment");--%>
                <%--if (appointment.getDate() != null) {--%>
                <%--String format = sdf.format(appointment.getDate());--%>
                <%--System.out.print("<input id=\"datepicker\" name=\"date\" type=\"text\" value=\"" + format + "\" class=\"hasDatepicker\">");--%>
                <%--System.out.print("1212121212121");//format);--%>

                <%--} else {--%>
                <%--Date date = new Date();--%>
                <%--String format = sdf.format(date);--%>
                <%--System.out.println("<input id=\"datepicker\" name=\"date\" type=\"text\" value=\"" + format + "\" class=\"hasDatepicker\">");--%>
                <%--}--%>
                <%--%>--%>

                <%--<script>var javascriptValue = <%=valueFromYourJavaCode%></script>--%>
                <%--<%format%>--%>

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

                <%--<td>--%>
                <%--<c:if test="${ !empty errorMessages}">--%>
                <%--${errorMessages.get(dateText)}--%>
                <%--</c:if>--%>
                <%--</td>--%>
            );


            <%--$("#datepicker").datepicker({--%>
            <%--defaultDate: "5/31/2013",--%>
            <%--hour: 19,--%>
            <%--minute: 30--%>
            <%--});--%>

                <%--var dateFormat = $( ".selector" ).datepicker( "option", "dateFormat" );--%>
                <%--<td><form:input path="date"/></td>--%>
                <%--<td>--%>
                <%--<c:if test="${ !empty errorMessages}">--%>
                <%--${errorMessages.get("dateAsString")}--%>
                <%--</c:if>--%>
                <%--</td>--%>
            </script>
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