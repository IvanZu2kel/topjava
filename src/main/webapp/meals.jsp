<%--
  Created by IntelliJ IDEA.
  User: Ivan
  Date: 09.10.2021
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ru">
<head>
    <title>Meals</title>
</head>
<body>
<h3><a href="index.html">Home</a></h3>
<hr>
<h2>Meals</h2>
<hr>
<table border="2">
    <tr>
        <th>Date</th>
        <th>Description</th>
        <th>Calories</th>
    </tr>
    <jsp:useBean id="meals" scope="request" type="java.util.List"/>
    <c:forEach var="meal" items="${meals}">
        <%--        <fmt:formatDate type="time" value="${meal.getTime}" pattern="dd.MM.yyyy HH:mm"/>--%>
        <c:if test="${meal.excess eq true}">
            <tr style="color: red">
                <td>${meal.dateTime}"</td>
<%--                <td><fmt:formatDate value='${meal.getDateTime()}' type="both" pattern='dd.MM.yyyy'--%>
<%--                                    var="parsedDate"/>${parsedDate}</td>--%>
                <td>${meal.description}</td>
                <td>${meal.calories}</td>
            </tr>
        </c:if>
        <c:if test="${meal.excess eq false}">
            <tr style="color: green">
                <td>${meal.dateTime}"</td>
                <td>${meal.description}</td>
                <td>${meal.calories}</td>
            </tr>
        </c:if>
    </c:forEach>
</table>
</body>
</html>
