<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="js/scripts.js"></script>
</head>
<body onload="getUsers()">
	<div class="container">
		<div class="row">

			<div class="page-header">
				<h1>Welcome! to Notification Center</h1>
				<div class="text-right">
			        <a href="logoff" class="btn btn-info btn-sm">
			          <span class="glyphicon glyphicon-log-out"></span> Log out
			        </a>
				</div>
			</div>

			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Administration</h3>
						<span class="pull-right"> <!-- Tabs -->
							<ul class="nav panel-tabs">
								<li class="active"><a href="#tab1" data-toggle="tab" onclick="getUsers()">Users</a>
								</li>
								<li><a href="#tab2" data-toggle="tab" onclick="getEvents()">Events</a>
								</li>
							</ul> </span>
					</div>
					<div class="panel-body">
						<div class="tab-content">
							<div class="tab-pane active" id="tab1">

								<div class="panel panel-default panel-table">
									<div class="panel-heading">
										<div class="row">
											<div class="col col-xs-2">
												<h3 class="panel-title">Manage Users</h3>
											</div>
											<div class="col col-xs-7 text-danger" style="display:block" id="userErrorDiv">
											</div>
											<div class="col col-xs-3 text-right">
												<button type="button" class="btn btn-sm btn-info btn-create"
													data-toggle="modal" data-target="#addUserModal" onclick="prepareAddUser()">Create
													New</button>
											</div>
										</div>
									</div>
									<div class="panel-body" id="userContentDiv">
										
									</div>
								</div>
							</div>
							<div class="tab-pane" id="tab2">

								<div class="panel panel-default panel-table">
									<div class="panel-heading">
										<div class="row">
											<div class="col col-xs-2">
												<h3 class="panel-title">Manage Events</h3>
											</div>
											<div class="col col-xs-7 text-danger" style="display:block" id="eventErrorDiv">
											</div>
											<div class="col col-xs-3 text-right">
												<button type="button" class="btn btn-sm btn-info btn-create"
													data-toggle="modal" data-target="#addEventModal" onclick="prepareAddEvent()">Create
													New</button>
											</div>
										</div>
									</div>
									<div class="panel-body" id="eventContentDiv">
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Add User -->
	<div class="modal" id="addUserModal" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title" id="lineModalLabel">Add User</h3>
				</div>
				<div class="modal-body" id="userAddEditModalBody">
					<!-- Replace this with Modal body -->
				</div>
			</div>
		</div>
	</div>
	<!--  Delete User Confirmation Modal -->
	<div class="modal fade" id="deleteUserConfModal" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title" id="lineModalLabel">Delete Confirmation</h3>
				</div>
				<div class="modal-body">
					Are you sure you want to delete user?
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="pull-right">
								<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
								<button type="submit" class="btn btn-primary" onclick="deleteUser()">Submit</button>
							</div>
						</div>
					</div>
				</div>
				<br/>
	        </div>
	    </div>
	</div>


	<!--  Delete Event Confirmation Modal -->
	<div class="modal fade" id="deleteEventConfModal" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title" id="lineModalLabel">Delete Confirmation</h3>
				</div>
				<div class="modal-body">
					Are you sure you want to delete event?
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="pull-right">
								<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
								<button type="submit" class="btn btn-primary" onclick="deleteEvent()">Submit</button>
							</div>
						</div>
					</div>
				</div>
				<br/>
	        </div>
	    </div>
	</div>


	<!-- Add Event -->
	<div class="modal fade" id="addEventModal" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title" id="lineModalLabel">Add Event</h3>
				</div>
				<div class="modal-body" id="eventAddEditModalBody">

				</div>

			</div>
		</div>
	</div>
</body>
</html>
