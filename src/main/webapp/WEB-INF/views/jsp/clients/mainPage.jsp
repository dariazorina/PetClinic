<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Client page</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
    <script src="/dasha/resources/core/js/clientMain.js"></script>
    <link href="/dasha/resources/core/css/table_style.css" rel="stylesheet" type="text/css"/>
    <link href="/dasha/resources/core/css/button_style.css" rel="stylesheet" type="text/css"/>


    <%--<script src="../resources/core/js/doctors.js"></script>--%>
    <%--http://localhost:8080/dasha  /resources/core/js/doctors.js--%>
    <%--http://localhost:8080/dasha -> controllers--%>
    <%--http://localhost:8080/dasha -> jsp--%>


    <%--D:\PROJECTS\DASHA\spring3-mvc-maven-xml-hello-world\src\main\webapp\resources\core\js\doctors.js--%>

</head>
<body>
<div class="container">
    <h3>Hello ${client.name} </h3>

    <b><i>Pets List</i></b> <br><br>
    <div class="row col-md-7 table-responsive">
        <table id="petsTable" class="table_orange">
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Species</th>
                <th>Age</th>
                <%--<th>Master</th>--%>
                <th>Appointm</th>
                <th></th>

            </tr>
            </thead>
            <tbody>

            <c:forEach var="pet" items="${client.pets}">
                <tr>
                    <c:url var="thisURL" value="./pet/edit">
                        <c:param name="client_id" value="${pet.master.id}"/>
                        <c:param name="pet_id" value="${pet.id}"/>
                    </c:url>


                    <td>${pet.id}</td>
                    <td><a href="<c:out value="${thisURL}"/>">${pet.name}</a></td>
                    <td>${pet.species}</td>
                    <td>${pet.age}</td>
                    <%--<td>${pet.master.name}</td>--%>

                        <%--&lt;%&ndash;<td><input type="button" value="EDIT" onclick="editClicked(${pet.id}, ${pet.master.id})"/>&ndash;%&gt;                    </td>--%>


                    <c:url var="thoseURL" value="./appointment/edit">
                        <c:param name="client_id" value="${pet.master.id}"/>
                        <c:param name="pet_id" value="${pet.id}"/>
                    </c:url>


                    <td><a href="<c:out value="${thoseURL}"/>" ><img src="./resources/med_plus.png" width="23" height="23" border="0"> </a></td>
                    <%--<td><input type="button" value="" id="image-button" onclick="makeAnAppointment(${pet.master.id}, ${pet.id})"></td>--%>

                    <td><a href="" onclick="return deleteClicked(${pet.id});"><img src="./resources/delete.png" width="23" height="23" border="0"> </a></td>
                    <%--<td><input type="button" value="DELETE" onclick="deleteClicked(${pet.id})"></td>--%>
                </tr>
            </c:forEach>
            </tbody>
        </table>


    </div>

    <br><br>
    <button type="button" onclick="addNewPet(${client.id})">Add A Pet</button>
</div>
<div>
    <br>
    <br>
    <br>
    <b><i>Appointments Table</i></b> <br><br>

    <c:forEach var="pet" items="${client.pets}">


    </tr>

    <p><i>for ${pet.name}</i></p>
    <div class="row col-md-7 table-responsive">
        <table id="appTable" class="table_orange">
            <thead>
            <tr>
                <th>Id</th>
                <th>Doctor</th>
                <th>Date</th>
                    <%--<th>Status</th>--%>
                    <%--<th>Comment</th>--%>
                    <%--<th>EDIT</th>--%>
                    <%--<th>DELETE</th>--%>

            </tr>
            </thead>
            <tbody>

                <%--<c:forEach var="appointment" items="${pet.appointments}">--%>
            <c:forEach var="appointment" items="${appointments}">

                <c:if test="${appointment.petName == pet.name}">


                    <tr>
                        <td>${appointment.id}</td>
                        <td>${appointment.doctorName}</td>
                        <td>${appointment.date}</td>

                            <%--<td>${appointment.status}</td>--%>
                            <%--<td>${appointment.comment}</td>--%>
                            <%--<td><input type="button" value="EDIT" onclick="editClicked(${pet.id}, ${pet.master.id})"/></td>--%>
                            <%--<td><input type="button" value="DELETE" onclick="deleteClicked(${pet.id})"></td>--%>
                    </tr>


                </c:if>

            </c:forEach>

            </tbody>
        </table>
        <br>
        <br>
        </c:forEach>


    </div>

</div>


<br> <br>
<a href="./">Back to main</a>

</body>
</html>

<%--<script type="text/javascript">--%>
    <%--function theFunction () {--%>
     <%--alert("fsd");--%>
   <%--return  false;--%>


    <%--}--%>
<%--</script>--%>
