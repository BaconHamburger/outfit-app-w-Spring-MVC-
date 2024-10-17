<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Outfit Builder | The Outfit App</title>
</head>
<body>

	<h2>${startingPiece.id}</h2>
	
	
	<div id="piece1">
		<p>${clothesType1[$].id}</p>
		<button onclick="showNextPiece()">next</button>
	</div>
	
	<div id="piece2">
		<p>${clothesType2[0].id}</p>
		<button onclick="showNextPiece()">back</button>
	</div>
	
	<script>
		function showNextPiece(nextIndex){
			var piece1 = document.getElementById("piece1");
			piece1.innerHTML = ${clothesType1[1].id}
			<button onclick="showNextPiece()">back</button>
		}
	</script>
	
	


</body>
</html>