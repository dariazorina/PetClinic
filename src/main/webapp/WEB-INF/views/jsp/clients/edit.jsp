<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../resources/core/js/edit.js"></script>
    <meta charset="UTF-8">
    <title>Edit Client</title>
</head>
<body>


<%!
    String action;
%>

<sec:authorize access="hasRole('ROLE_ADMIN')">
    <%
        action = "../client/edit_admin";
    %>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_CLIENT')">
    <%
        action = "../client/edit";
    %>

</sec:authorize>

<%--<form:form method="POST" commandName="client" id="edit_client_form" action="../client/edit_admin">--%>
<form:form method="POST" commandName="client" id="edit_client_form" action="<%=action%>">
    <form:input path="id" type="hidden"/>
    <form:input path="deleted" type="hidden"/>

    <legend>Details:</legend>
    <br>
    <table>
        <tr>
            <td>Login:</td>
            <td>
                <c:if test="${empty client.id}">
                    <input type="text" name="login" value="${client.login}"/>
                </c:if>
                <c:if test="${not empty client.id}">
                    <input type="text" name="login" value="${client.login}" readonly="readonly"/>
                </c:if>
            </td>
        </tr>
        <tr>
            <td>Password:</td>
                <%--<td><input type="password" value="${client.password}"/></td>--%>
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
            <td colspan="2">
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

</body>
</html>
