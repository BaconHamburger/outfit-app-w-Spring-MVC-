<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up | The Outfit App</title>
</head>
<body>
	
	<h1>The Outfit App</h1>
	<div id="signup-form">
		<form action = "/TheOutfitApp/process-signup" method = "post">
			<label for="username">Username:</label>
			<input type = text id="username" name="username">
			<br><br>
			<label for="password">Password:</label>
			<input type = password id="password" name="password">
			<br><br>
			<label for="displayName">Display Name:</label>
			<input type = text id="displayName" name="displayName">
			<br><br>
			<input type="submit" value="Sign Up">
			<p style="color:red">${error}</p>
		</form>
	</div>
	
	

</body>
</html>