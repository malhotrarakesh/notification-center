<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
<body>

	<div class="container">
		<div class="row">

			<div class="page-header">
				<h1>Welcome! to Notification Center</h1>
			</div>

			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Administration</h3>
						<span class="pull-right"> <!-- Tabs -->
							<ul class="nav panel-tabs">
								<li class="active"><a href="#tab1" data-toggle="tab">Users</a>
								</li>
								<li><a href="#tab2" data-toggle="tab">Events</a>
								</li>
							</ul> </span>
					</div>
					<div class="panel-body">
						<div class="tab-content">
							<div class="tab-pane active" id="tab1">

								<div class="panel panel-default panel-table">
									<div class="panel-heading">
										<div class="row">
											<div class="col col-xs-6">
												<h3 class="panel-title">Manage Users</h3>
											</div>
											<div class="col col-xs-6 text-right">
												<button type="button" class="btn btn-sm btn-info btn-create"
													data-toggle="modal" data-target="#addUserModal">Create
													New</button>
											</div>
										</div>
									</div>
									<div class="panel-body">
										<table class="table table-striped table-bordered table-list">
											<thead>
												<tr>
													<th>First Name</th>
													<th>Last Name</th>
													<th>Username</th>
													<th>Email</th>
													<th>Role</th>
													<th>Options</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Rakesh</td>
													<td>Malhotra</td>
													<td>rakesh.malhotra</td>
													<td>rakesh.malhotra@globallogic.com</td>
													<td>Admin</td>
													<td>Admin</td>

												</tr>
												<tr>
													<td>Rahul</td>
													<td>Tyagi</td>
													<td>rahul.tyagi</td>
													<td>rahul.tyagi@globallogic.com</td>
													<td>User</td>
													<td>Admin</td>
												</tr>
											</tbody>
										</table>

									</div>
									<div class="panel-footer">
										<div class="row">
											<div class="col col-xs-3">Page 1 of 5</div>
											<div class="col col-xs-9">
												<ul class="pagination hidden-xs pull-right">
													<li><a href="#">1</a>
													</li>
													<li><a href="#">2</a>
													</li>
													<li><a href="#">3</a>
													</li>
													<li><a href="#">4</a>
													</li>
													<li><a href="#">5</a>
													</li>
												</ul>
												<ul class="pagination visible-xs pull-right">
													<li><a href="#"><</a>
													</li>
													<li><a href="#">></a>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>

							</div>
							<div class="tab-pane" id="tab2">

								<div class="panel panel-default panel-table">
									<div class="panel-heading">
										<div class="row">
											<div class="col col-xs-6">
												<h3 class="panel-title">Manage Events</h3>
											</div>
											<div class="col col-xs-6 text-right">
												<button type="button" class="btn btn-sm btn-info btn-create"
													data-toggle="modal" data-target="#addEventModal">Create
													New</button>
											</div>
										</div>
									</div>
									<div class="panel-body">
										<table class="table table-striped table-bordered table-list">
											<thead>
												<tr>
													<th>Title</th>
													<th>Description</th>
													<th>Scheduled On</th>
													<th>Status</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Title1</td>
													<td>Desc1</td>
													<td>Starting On</td>
													<td>Active</td>
												</tr>
												<tr>
													<td>Title1</td>
													<td>Desc1</td>
													<td>Starting On</td>
													<td>Active</td>
												</tr>
											</tbody>
										</table>

									</div>
									<div class="panel-footer">
										<div class="row">
											<div class="col col-xs-3">Page 1 of 5</div>
											<div class="col col-xs-9">
												<ul class="pagination hidden-xs pull-right">
													<li><a href="#">1</a>
													</li>
													<li><a href="#">2</a>
													</li>
													<li><a href="#">3</a>
													</li>
													<li><a href="#">4</a>
													</li>
													<li><a href="#">5</a>
													</li>
												</ul>
												<ul class="pagination visible-xs pull-right">
													<li><a href="#"><</a>
													</li>
													<li><a href="#">></a>
													</li>
												</ul>
											</div>
										</div>
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
	<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title" id="lineModalLabel">Add User</h3>
				</div>
				<div class="modal-body">

					<form class="form-horizontal" role="form">
						<fieldset>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">First
									Name</label>
								<div class="col-sm-7">
									<input type="text" placeholder="First Name"
										class="form-control" required>
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Last
									Name</label>
								<div class="col-sm-7">
									<input type="text" placeholder="Last Name" class="form-control">
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Username</label>
								<div class="col-sm-7">
									<input type="text" placeholder="Username" class="form-control"
										required>
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Email</label>
								<div class="col-sm-7">
									<input type="email" placeholder="Email" class="form-control"
										required>
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Password</label>
								<div class="col-sm-7">
									<input type="password" placeholder="Password"
										class="form-control" required>
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Confirm
									Password</label>
								<div class="col-sm-7">
									<input type="password" placeholder="Confirm Password"
										class="form-control" required>
								</div>
							</div>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-4 control-label" for="selectinput">Is
									Admin</label>
								<div class="col-xs-6 col-sm-3">
									<a class="btn btn-primary btn-select"> <input type="hidden"
										class="btn-select-input" id="" name="" value="" /> <span
										class="btn-select-value">Select an Item</span> <span
										class='btn-select-arrow glyphicon glyphicon-chevron-down'></span>
										<ul>
											<li class="selected">Yes</li>
											<li>No</li>
										</ul> </a>
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
					</form>
				</div>

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
				<div class="modal-body">

					<form class="form-horizontal" role="form">
						<fieldset>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Title</label>
								<div class="col-sm-7">
									<input type="text" placeholder="Title" class="form-control"
										required>
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Description</label>
								<div class="col-sm-7">
									<input type="text" placeholder="Description"
										class="form-control">
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Scheduled
									On</label>
								<div class="col-sm-7">
									<input type="text" placeholder="Scheduled On"
										class="form-control" required>
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-4 control-label" for="textinput">Last
									Till</label>
								<div class="col-sm-7">
									<input type="email" placeholder="Last Till"
										class="form-control" required>
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-4 control-label" for="selectinput">Is
									Active</label>
								<div class="col-xs-6 col-sm-3">
									<a class="btn btn-primary btn-select"> <input type="hidden"
										class="btn-select-input" id="" name="" value="" /> <span
										class="btn-select-value">Select an Item</span> <span
										class='btn-select-arrow glyphicon glyphicon-chevron-down'></span>
										<ul>
											<li class="selected">Yes</li>
											<li>No</li>
										</ul> </a>
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
					</form>
				</div>

			</div>
		</div>
	</div>

</body>
</html>