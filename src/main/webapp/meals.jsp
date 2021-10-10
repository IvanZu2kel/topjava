
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <c:choose>
            <c:when test="${meal.excess eq true}">
                <tr style="color: red">
                    <td>${meal.dateTime.toLocalDate()} ${meal.dateTime.toLocalTime()}"</td>
                    <td>${meal.description}</td>
                    <td>${meal.calories}</td>
                </tr>
            </c:when>
            <c:otherwise>
                <tr style="color: green">
                    <td>${meal.dateTime.toLocalDate()} ${meal.dateTime.toLocalTime()}"</td>
                    <td>${meal.description}</td>
                    <td>${meal.calories}</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</table>
</body>
</html>
