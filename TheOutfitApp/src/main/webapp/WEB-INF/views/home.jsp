<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>The Outfit App</title>
</head>
<body>
	<div id="homepage-header">
		<h1>The Outfit App</h1>
		<h3>Your personal stylist.</h3>
	</div>
	<div id="login-form">
		<form action = "login" method = "post">
			<label for="username">Username:</label>
			<input type = text id="username" name="username">
			<br><br>
			<label for="password">Password:</label>
			<input type = password id="password" name="password">
			<br><br>
			<input type="submit" value="Login">
			<p style="color:red">${error}</p>
		</form>
	</div>
	<p>Don't have an account? <a href="/TheOutfitApp/sign-up">Sign up</a></p>
</body>
</html>