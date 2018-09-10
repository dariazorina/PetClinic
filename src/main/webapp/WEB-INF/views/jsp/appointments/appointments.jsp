<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Appointments</title>


    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
    <script src="/dasha/resources/core/js/appointments.js"></script>
    <link href="/dasha/resources/core/css/table_style.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div class="container">
    <h1>Appointments List</h1>
    <div class="row col-md-7 table-responsive">
        <table id="appTable" class="table_orange">
            <thead>
            <tr>
                <th>Id</th>
                <th>Doctor</th>
                <th>Pet</th>
                <th>Date</th>
                <th>EDIT</th>
                <th>DELETE</th>

            </tr>
            </thead>
            <tbody>

            <c:forEach var="appointment" items="${appointmentList}">
                <tr>
                    <td>${appointment.id}</td>
                    <td>${appointment.doctorName}</td>
                    <td>${appointment.petName}</td>
                    <td>${appointment.date}</td>
                    <td><input type="button" value="EDIT" onclick="editClicked(${appointment.id})"/></td>
                    <td><input type="button" value="DELETE" onclick="deleteClicked(${appointment.id})"></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <br><br>
    <button type="button" onclick="addNewAppointment()">Add An Appointment</button>

    <br> <br>
    <a href="../">Back to main</a>

</div>

</body>
</html>
