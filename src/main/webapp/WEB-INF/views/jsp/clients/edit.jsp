<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../resources/core/js/edit.js"></script>
    <script src="../resources/core/js/clientMain.js"></script>
    <meta charset="UTF-8">
    <title>Edit Client</title>

    <link href="/dasha/resources/core/css/table_style.css" rel="stylesheet" type="text/css"/>

</head>
<body>


<%!
    String action;
%>

<%--<sec:authorize access="hasRole('ROLE_ADMIN')">--%>
<%--<%--%>
<%--action = "../client/edit_admin";--%>
<%--%>--%>
<%--</sec:authorize>--%>

<%--<sec:authorize access="hasRole('ROLE_CLIENT')">--%>
<%--<%--%>
<%--action = "../client/edit";--%>
<%--%>--%>

<%--</sec:authorize>--%>

<form:form method="POST" commandName="client" id="edit_client_form" action="../client/edit">
    <%--<form:form method="POST" commandName="client" id="edit_client_form" action="<%=action%>">--%>
    <form:input path="id" type="hidden"/>
    <form:input path="deleted" type="hidden"/>

    <legend>Details:</legend>
    <br>
    <table class="forEdit">
        <tr>
            <td>Login:</td>
            <td>
                <c:choose>
                    <c:when test="${client.id==null}">
                        <input type="text" name="login" value="${client.login}"/>
                    </c:when>
                    <c:otherwise>
                        <input type="text" name="login" value="${client.login}" readonly="readonly"/>
                    </c:otherwise>
                </c:choose>
            </td>
            <td></td>
        </tr>
        <tr>
            <td>Password:</td>
                <%--<td><input type="password" value="${client.password}"/></td>--%>
            <td><form:input path="password" type="password"/></td>
            <td></td>

        </tr>
        <tr>
            <td>Logo:</td>
            <td><form:input path="logo"/></td>
            <td>
                    <%--<c:if test="${ !empty errorMessages}">--%>
                    <%--${errorMessages.get("password")}--%>
                    <%--</c:if>--%>
            </td>
        </tr>
        <tr class="forEdit">
            <td class="forEdit">Name:</td>
            <td><form:input path="name"/></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("name")}
                </c:if>
            </td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><form:input path="address"/></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("address")}
                </c:if>
            </td>
        </tr>
        <tr>
            <td>Phone:</td>
            <td><form:input path="phone"/></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("phone")}
                </c:if>
            </td>
        </tr>
        <tr>
                <%--<td colspan="2"><input type="submit" value="SAVE"></td>--%>
            <td colspan="3">
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <button type="submit">Save</button>
                    <%--<button type="button" onclick="postEditedDoctor()">Save</button>--%>
                    <button type="button" onclick="backToClientsList()">Cancel</button>
                </sec:authorize>

                <sec:authorize access="hasRole('ROLE_CLIENT')">
                    <button type="submit">Save</button>
                    <button type="button" onclick="history.back()">Cancel</button>
                </sec:authorize>
            </td>
        </tr>
    </table>
</form:form>


<sec:authorize access="hasRole('ROLE_ADMIN')">
    <div class="container">

        <b><i>Pets List</i></b> <br><br>
        <div class="row col-md-7 table-responsive">
            <table id="petsTable" class="table_orange">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Species</th>
                    <th>Age</th>
                    <th></th>
                    <th></th>

                </tr>
                </thead>
                <tbody>

                <c:forEach var="pet" items="${client.pets}">
                    <tr>
                        <c:url var="thisURL" value="../pet/edit">
                            <c:param name="client_id" value="${pet.master.id}"/>
                            <c:param name="pet_id" value="${pet.id}"/>
                        </c:url>


                        <td>${pet.id}</td>
                        <td><a href="<c:out value="${thisURL}"/>">${pet.name}</a></td>
                        <td>${pet.species}</td>
                        <td>${pet.age}</td>
                            <%--<td>${pet.master.name}</td>--%>

                            <%--&lt;%&ndash;<td><input type="button" value="EDIT" onclick="editClicked(${pet.id}, ${pet.master.id})"/>&ndash;%&gt;                    </td>--%>


                        <c:url var="thoseURL" value="../appointment/edit">
                            <c:param name="client_id" value="${pet.master.id}"/>
                            <c:param name="pet_id" value="${pet.id}"/>
                        </c:url>


                        <td><a href="<c:out value="${thoseURL}"/>"><img src="../resources/med_plus.png" width="23"
                                                                        height="23" border="0"> </a></td>
                            <%--<td><input type="button" value="" id="image-button" onclick="makeAnAppointment(${pet.master.id}, ${pet.id})"></td>--%>

                        <td><a href="" onclick="return deleteClicked(${pet.id});"><img src="../resources/delete.png"
                                                                                       width="23" height="23"
                                                                                       border="0"> </a></td>
                            <%--<td><input type="button" value="DELETE" onclick="deleteClicked(${pet.id})"></td>--%>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


        </div>

        <br><br>
        <button type="button" onclick="addNewPetAdmin(${client.id})">Add A Pet</button>
    </div>
    <div>
        <br>
        <br>
        <br>
        <c:if test="${!empty client.pets}">
            <b><i>Appointments Table</i></b> <br><br>
        </c:if>

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


</sec:authorize>

</body>
</html>
