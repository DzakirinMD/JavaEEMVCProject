<!DOCTYPE html>
<html>
<head>
<title>Kariah Registration Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/register.css" rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->
<style type="text/css">
label {
	color: white;
}
</style>
<script>
function clearInputs() {
   document.getElementById('myTextarea').value = '';
}


function validateForm() {
 	var ic = document.forms["myForm"]["ic"].value;
    var name = document.forms["myForm"]["name"].value;
    var address = document.getElementById("myTextarea").value;
    var phone = document.forms["myForm"]["notel"].value;
    var email = document.forms["myForm"]["email"].value;
    var password = document.forms["myForm"]["password"].value;
  
    if (ic == "") {
        document.getElementById("erroric").innerHTML = "IC cannot be empty !";
        return false;
    } else if (/\d{12}/.test(ic) != true) {
        document.getElementById("erroric").innerHTML = "12 numbers only (without -)";
        return false;
    } else if (name == "") {
        document.getElementById("errorname").innerHTML = "Name cannot be empty !";
        document.getElementById("erroric").innerHTML = "";
        return false; 
    } else if (/^[a-zA-Z.]{1,50}$/.test(name) != true) {
        document.getElementById("errorname").innerHTML = "name is less than 50 character";
        return false;
    } else if (address == "") {
        document.getElementById("erroraddress").innerHTML = "Address cannot be empty !";
        document.getElementById("errorname").innerHTML = "";
        return false;
    } else if (phone == "") {
        document.getElementById("errorphone").innerHTML = "Phone Number cannot be empty !";
        document.getElementById("erroraddress").innerHTML = "";
        return false;
    } else if (isNaN(phone) == true) {
        document.getElementById("errorphone").innerHTML = "Please enter number only !";
        return false;
    } else if (email == "") {
        document.getElementById("erroremail").innerHTML = "Email cannot be empty !";
        document.getElementById("errorphone").innerHTML = "";
        return false;
    } else if (/^[^0-9][A-z0-9_]+[@][A-z0-9_]+([.][A-z0-9_]+)*[.][A-z]{2,4}$/.test(email) != true) {
        document.getElementById("erroremail").innerHTML = "Your e-mail is NOT valid. Try again...";
        return false;
    } else if (password == "") {
        document.getElementById("errorpassword").innerHTML = "Password cannot be empty !";
        document.getElementById("erroremail").innerHTML = "";
        return false;
    } else if (/^[a-zA-Z0-9.]{5,12}$/.test(password) != true) {
        document.getElementById("errorpassword").innerHTML = "Password 5 - 12 characters only";
        return false;
    } 
    document.getElementById("errorpassword").innerHTML = "";
    alert("Registration Successfull !");   
}

</script>
</head>
<body>
	<!-- main -->
	<div class="main-w3layouts wrapper">
		<h1>Kariah Registration Form</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
				<form name="myForm" onsubmit="return validateForm()" method="post" action="AccountController">
					<input type="text" name="ic" placeholder="IC">
					<label><small style="text-transform: lowercase;">eg:950304028823 </small></label>
					<p id="erroric" style="color:red;"></p><br>
					<input type="text" name="name" placeholder="Name">
					<p id="errorname" style="color:red;"></p><br>
					<label>Home Address :</label><br>  <p id="erroraddress" style="color:red;"></p><br>
                    <textarea name="address" id="myTextarea" rows="3" cols="53" form="myform"></textarea><br><br>
                    <input type="text" name="notel" placeholder="Phone Number">
					<p id="errorphone" style="color:red;"></p><br><br>
					<input type="email" name="email" placeholder="Email">
					<p id="erroremail" style="color:red;"></p><br>
					<label>Gender :</label>
                      	<p id="errorgender" style="color:red;"></p>                              
                            <label>Male
                            	<input type="radio" checked="checked" name="gender" id="gender" value="male">
                            </label>
                            <label>Female
                            	<input type="radio" name="gender" id="gender" value="female">
                            </label><br><br>
					<input type="password" name="password" placeholder="Password">
                    <p id="errorpassword" style="color:red;"></p><br>
                    <label><small>Password 5 - 12 characters only</small></label>
         
       
				
				<input type="submit" id="submit" value="REGISTER"></input>
				<input type="reset" onclick="clearInputs()" value="RESET"></input>
				</form>
                <label class="labelhome"> Back to <a href="index.jsp">Home Page</a></label>
            </div>
		</div>
		
		<div class="colorlibcopy-agile">
			<p>© 2018 Computer Club Register Form. All rights reserved | Design by <a href="index.html" target="_blank">Dzakirin</a></p>
		</div>
		
		<ul class="colorlib-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	<!-- //main -->
</body>
</html>