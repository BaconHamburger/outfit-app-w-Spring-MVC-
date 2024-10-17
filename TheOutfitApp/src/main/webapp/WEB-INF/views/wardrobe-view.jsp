<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Wardrobe | The Outfit App</title>
</head>
<body>
		
		
		
		<c:forEach var="clothing" items="${clothesList}">
		<p>${clothing.id}</p>
		<p>${clothing.clothingType}</p>
		<p>${clothing.occasion}</p>
		<br>
		<br>
		<br>		
		</c:forEach>  
	
	
	
	
</body>
</html>