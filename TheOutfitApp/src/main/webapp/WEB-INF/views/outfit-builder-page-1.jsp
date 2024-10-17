<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Build Outfit | The Outfit App</title>
</head>
<body>

	<h1>Pick one: </h1>

	<c:forEach var="clothing" items="${clothingRetrieved}">
		<img src="${clothing.imageURL}" alt="${clothing.imageURL}" width="250" height="150">
		
		
		
	</c:forEach>
	<img src="images\black_sparkles.jpg" alt="${clothing.imageURL}" width="250" height="150">


</body>
</html>