<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body style="background: #ADD8E6">
	<center>
		<div class="central-div" style="top:10%">
                    <form action="controller.jsp">
                        <input type="hidden" name="page" value="register"> 
				<table>
					<tr>
						<td colspan="2">
							<center><h2>Register New User</h2></center>
						</td>
					</tr>
                                        <tr>
						<td>
							<label>User Type</label>
						</td>
						<td>
                                                    <select name="utype" class="text" style="margin-left: 10px;">
                                                        <option value="company">Company</option>
                                                        <option value="candidate">Candidate</option>
                                                    </select>
						</td>
					</tr>
					<tr>
						<td>
							<label>Name</label>
						</td>
						<td>
                                                    <input type="text" name="fname" class="text" placeholder="Name">
						</td>
					</tr>
					<tr>
						<td>
							<label>User Name</label>
						</td>
						<td>
                                                    <input type="text" name="uname" class="text" placeholder="User Name">
						</td>
					</tr>
					<tr>
						<td>
							<label>Email</label>
						</td>
						<td>
                                                    <input type="email" name="email" class="text" placeholder="Email">
						</td>
					</tr>
					
					<tr>
						<td>
							<label>Password</label>
						</td>
						<td>
                                                    <input type="password" name="pass" class="text" placeholder="Password">
						</td>
					</tr>
                                        <tr>
						<td>
							<label>Contact No</label>
						</td>
						<td>
                                                    <input type="text" name="contactno" class="text" placeholder="Contact No">
						</td>
					</tr>
                                        <tr>
						<td>
							<label>City</label>
						</td>
						<td>
                                                    <input type="text" name="city" class="text" placeholder="City">
						</td>
					</tr>
                                        <tr>
						<td>
							<label>Address</label>
						</td>
						<td>
                                                    <input type="text" name="address" class="text" placeholder="Address">
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<center>
							
							<input type="submit" value="Register Now" class="button">
							</center>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</center>
</body>
</html>