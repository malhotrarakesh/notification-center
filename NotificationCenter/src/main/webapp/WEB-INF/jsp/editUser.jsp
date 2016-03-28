<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form:form class="form-horizontal" role="form" action="submitUpdateUser"
	method="post" modelAttribute="user" id="userUpdateFormId">
	<fieldset>
		<!-- Text input-->
		<div class="form-group">
			<label class="col-sm-4 control-label" for="textinput">First
				Name</label>
			<div class="col-sm-7">
				<form:input type="text" placeholder="First Name" class="form-control"
					path="firstName" required="required"/>
			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-sm-4 control-label" for="textinput">Last
				Name</label>
			<div class="col-sm-7">
				<form:input type="text" placeholder="Last Name" path="lastName"
					class="form-control"/>
			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-sm-4 control-label" for="textinput">Username</label>
			<div class="col-sm-7">
				<form:input type="text" placeholder="Username" class="form-control"
					path="username" required="required"/>
			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-sm-4 control-label" for="textinput">Email</label>
			<div class="col-sm-7">
				<form:input type="email" placeholder="Email" class="form-control"
					path="emailAddress" required="required"/>
			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-sm-4 control-label" for="textinput">Password</label>
			<div class="col-sm-7">
				<form:input type="password" placeholder="Password" path="password"
					class="form-control" required="required"/>
			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-sm-4 control-label" for="textinput">Confirm
				Password</label>
			<div class="col-sm-7">
				<form:input type="password" placeholder="Confirm Password"
					path="confirmPassword" class="form-control" required="required"/>
			</div>
		</div>
		<!-- Text input-->
		<div class="form-group">
			<label class="col-sm-4 control-label" for="selectinput">Role</label>
			<div class="col-xs-6 col-sm-3">
				<a class="btn btn-primary btn-select"> 
					<form:input type="hidden" class="btn-select-input" path="roleEnum" /> 
					<span class="btn-select-value" id="roleId">Select an Item</span> 
					<span class='btn-select-arrow glyphicon glyphicon-chevron-down'></span>
					<ul>
						<li>ADMIN</li>
						<li>USER</li>
					</ul> 
				</a>
			</div>

		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<div class="pull-right">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary" onclick="submitUpdateUser()">Submit</button>
				</div>
			</div>
		</div>

	</fieldset>
</form:form>
