<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/main.js"></script>
</head>
<body>

<div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Register</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form:form id="login-form" action="submit" method="post" style="display:block;" modelAttribute="user">
									<div class="form-group">
										<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group text-center">
										<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
										<label for="remember"> Remember Me</label>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="#" tabindex="5" class="forgot-password">Forgot Password?</a>
												</div>
											</div>
										</div>
									</div>
								</form:form>
								
								<form:form id="register-form" action="addUser" method="post" style="display:none;" modelAttribute="user">
									<div class="row">
										<div class="form-horizontal form-group">
											<div class="col-md-6">
												<input type="text" name="firstName" id="firstName" tabindex="1" class="form-control" placeholder="First Name" value="">
											</div>
											<div class="col-md-6">
												<input type="text" name="lastName" id="lastName" tabindex="2" class="form-control" placeholder="Last Name" value="">
											</div>	
										</div>
									</div>
									<br/>
									<div class="row">
										<div class="form-horizontal form-group">
											<div class="col-md-6">
												<input type="text" name="username" id="username" tabindex="3" class="form-control" placeholder="Username" value="">
											</div>
											<div class="col-md-6">
												<input type="email" name="emailAddress" id="emailAddress" tabindex="4" class="form-control" placeholder="Email Address" value="">
											</div>	
										</div>
									</div>
									<br/>
									<div class="row">
										<div class="form-horizontal form-group">
											<div class="col-md-6">
												<input type="password" name="password" id="password" tabindex="5" class="form-control" placeholder="Password">
											</div>
											<div class="col-md-6">
												<input type="password" name="confirmPassword" id="confirmPassword" tabindex="2" class="form-control" placeholder="Confirm Password">
											</div>	
										</div>
									</div>
									<br/>
									<div class="row">
										<div class="form-group">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="registerSubmit" id="registerSubmit" tabindex="4" class="form-control btn btn-register" value="Register Now">
											</div>
										</div>	
									</div>									
									
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>