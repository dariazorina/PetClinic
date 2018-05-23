<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html lang="en">
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../resources/core/js/edit.js"></script>
    <meta charset="UTF-8">
    <title>Edit Doctor</title>
</head>
<body>


<form:form method="POST" commandName="doctor" id="edit_doctor_form" action="../doctor/edit">
    <form:input path="id" type="hidden"/>
    <form:input path="deleted" type="hidden"/>


    <legend>Doctor's Details:</legend>
    <br>
    <table>

        <tr>
            <td>Login:</td>
                <%--<td><input type="text" name="login" value="${doctor.login}" readonly="readonly"/></td>--%>
            <td>
                <c:choose>
                    <c:when test="${doctor.id==null}">
                        <input type="text" name="login" value="${doctor.login}"/>
                    </c:when>
                    <c:otherwise>
                        <input type="text" name="login" value="${doctor.login}" readonly="readonly"/>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><form:input path="password" type="password"/></td>
            <td>
                    <%--<c:if test="${ !empty errorMessages}">--%>
                    <%--${errorMessages.get("password")}--%>
                    <%--</c:if>--%>
            </td>
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

        <tr>

            <td>Name:</td>
            <td><form:input path="name"/></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("name")}
                </c:if>
            </td>

        </tr>
        <tr>
            <td>Specialization:</td>
            <td><form:input path="specialization"/></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("specialization")}
                </c:if>
            </td>
        </tr>
        <tr>
            <td>Age:</td>
            <td><form:input path="age"/></td>
            <td>
                <c:if test="${ !empty errorMessages}">
                    ${errorMessages.get("age")}
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
            <td colspan="2">

                <button type="submit">Save</button>
                    <%--<button type="button" onclick="postEditedDoctor()">Save</button>--%>
                <button type="button" onclick="history.back()">Cancel</button>
                    <%--<button type="button" onclick="backToDoctorsList()">Cancel</button> for admin--%>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>