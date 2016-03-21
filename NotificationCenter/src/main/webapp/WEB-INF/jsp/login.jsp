<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Login and Register</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="js/scripts.js"></script>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h1>Notification Center</h1>
				</div>
				<div class="row">
					<div class="col-md-6">
						<p>Notification Center allows you to subscribe for receiving
							Notifications in case of various Events happening in the system</p>
					</div>
					<div class="col-md-6">
						<form:form role="form" action="submit" method="post" modelAttribute="user">
							<div class="form-group">
								<label for="username"> Username </label> <input
									type="text" class="form-control" id="username" name="username" required="required">
							</div>
							<div class="form-group">
								<label for="password"> Password </label> <input
									type="password" class="form-control" id="password" name="password" required="required">
							</div>
							<button type="submit" class="btn btn-primary">Log In</button>
							<button class="btn btn-info" type="button" data-toggle="modal" data-target="#squarespaceModal">
								Click here to Register!
							</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
		<br/>
		<c:if test="${isError == true}">
		<div class="alert alert-danger col-md-6 col-md-offset-6">
    		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    		<strong>Invalid credentials, please try again!</strong> 
  		</div>
  		</c:if>
	</div>


	<!-- Register Yourself -->
	<div class="modal fade" id="squarespaceModal" tabindex="-1"
		role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title" id="lineModalLabel">Register Yourself</h3>
				</div>
				<div class="modal-body">

					<form:form class="form-horizontal" role="form" action="addUser" method="post" modelAttribute="user">
						<fieldset>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">First
									Name</label>
								<div class="col-sm-7">
									<input type="text" placeholder="First Name"
										class="form-control" required="required" name="firstName">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Last
									Name</label>
								<div class="col-sm-7">
									<input type="text" placeholder="Last Name" class="form-control" required="required" name="lastName">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Username</label>
								<div class="col-sm-7">
									<input type="text" placeholder="Username" class="form-control"
										required="required" name="username">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Email</label>
								<div class="col-sm-7">
									<input type="email" placeholder="Email" class="form-control"
										required="required" name="emailAddress">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Password</label>
								<div class="col-sm-7">
									<input type="password" placeholder="Password"
										class="form-control" required="required" name="password">
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Confirm
									Password</label>
								<div class="col-sm-7">
									<input type="password" placeholder="Confirm Password"
										class="form-control" required="required" name="confirmPassword">
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="pull-right">
										<button type="submit" class="btn btn-default">Cancel</button>
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</div>
							</div>

						</fieldset>
					</form:form>
				</div>

			</div>
		</div>
	</div>

</body>
</html>