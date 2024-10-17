<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Wardrobe | The Outfit App</title>
</head>
<body>
	<h1>${displayName}'s Wardrobe</h1>
	
	<button onclick="showOutfitBuilderForm()">Build An Outfit</button>
	
	<script>
		function showOutfitBuilderForm(){
			var formDiv = document.getElementById("outfitBuilderFormDiv");
			if(formDiv.style.display==="none"){
				formDiv.style.display = "block";
			}
			else{
				formDiv.style.display="none";
			}
		}
	</script>
	
	<div id="outfitBuilderFormDiv" style="display:none">
		<form id="outfitBuilderForm" action="start-building-outfit" method="get">
			<p>Where are you going?</p>
	    	<input type="radio" id="school" value="school" name="occasion"/>
	    	<label for="school">School</label>
	    	<br><br>
	    	<input type="radio" id="party" value="party" name="occasion"/>
	    	<label for="party">A Party</label>
	    	<br><br>
	    	<input type="radio" id="casual" value="casual" name="occasion"/>
	    	<label for="casual">Casual Hangout</label>
	    	<br><br>
	    	<input type="radio" id="professional" value="professional" name="occasion"/>
	    	<label for="professional">Work / Professional Event</label>
	    	<br><br>
	    	<input type="radio" id="cozy" value="cozy" name="occasion"/>
	    	<label for="cozy">Staying In / Somewhere Cozy</label>
	    	<br><br>
	    	<p>What do you want to start with?</p>
	    	<input type="radio" id="top" value="top" name="clothingType"/>
	    	<label for="top">Top</label>
	    	<br><br>
	    	<input type="radio" id="bottoms" value="bottoms" name="clothingType"/>
	    	<label for="bottoms">Bottoms</label>
	    	<br><br>
	    	<input type="radio" id="shoes" value="shoes" name="clothingType"/>
	    	<label for="shoes">Shoes</label>
	    	<br><br>
	    	<input type="hidden" id="id" name="id" value="${user.id}">
			<input type="submit" value="Go">
		</form>
	</div>
	

	
</body>
</html>

