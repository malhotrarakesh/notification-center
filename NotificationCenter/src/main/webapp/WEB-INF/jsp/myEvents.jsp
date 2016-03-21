<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>My Events</title>
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

			<div class="page-header">
				<h1>Welcome! to Notification Center</h1>
			</div>

			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">My Events</h3>
					</div>
					<div class="panel-body">
						<div class="tab-content">
							<div class="tab-pane active" id="tab1">

								<div class="panel panel-default panel-table">

									<div class="panel-body">
										<table class="table table-striped table-bordered table-list">
											<thead>
												<tr>
													<th>#</th>
													<th>Event Title</th>
													<th>Channels</th>
													<th>Options</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>Event#1</td>
													<td><label for="primary1" class="btn btn-info">Email
															<input type="checkbox" id="primary1" class="badgebox"><span
															class="badge">&check;</span>
													</label> <label for="info1" class="btn btn-info">SMS <input
															type="checkbox" id="info1" class="badgebox"><span
															class="badge">&check;</span>
													</label></td>
													<td>
														<button class="btn btn-default" type="button"
															data-toggle="modal" data-target="#unsubscribeModal">Unsubscribe</button>
														<button class="btn btn-primary" type="button"
															data-toggle="modal" data-target="#subscribeModal">Subscribe</button>
													</td>
												</tr>
												<tr>
													<td>2</td>
													<td>Event#1</td>
													<td><label for="primary2" class="btn btn-info">Email
															<input type="checkbox" id="primary2" class="badgebox"><span
															class="badge">&check;</span>
													</label> <label for="info2" class="btn btn-info">SMS <input
															type="checkbox" id="info2" class="badgebox"><span
															class="badge">&check;</span>
													</label></td>
													<td>
														<button class="btn btn-default" type="button"
															data-toggle="modal" data-target="#unsubscribeModal">Unsubscribe</button>
														<button class="btn btn-primary" type="button"
															data-toggle="modal" data-target="#subscribeModal">Subscribe</button>
													</td>
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

	<!-- Subscribe Modal -->
	<div class="modal fade" id="subscribeModal" tabindex="-1" role="dialog"
		aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title" id="lineModalLabel">Edit Subscription</h3>
				</div>
				<div class="modal-body">

					<form class="form-horizontal" role="form">
						<fieldset>
							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-3 control-label" for="textinput">Event
									Name</label>
								<div class="col-sm-8">
									<label class="col-sm-6 control-label" style="text-align:left;"
										for="textinput">Name of the Event</label>
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-3 control-label" for="textinput">Email</label>
								<div class="col-sm-8">
									<input type="text" placeholder="Email" class="form-control">
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<label class="col-sm-3 control-label" for="textinput">SMS</label>
								<div class="col-sm-8">
									<input type="text" placeholder="SMS" class="form-control">
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

	<!-- Unsubscribe Modal -->
	<div class="modal fade" id="unsubscribeModal" tabindex="-1"
		role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h3 class="modal-title" id="lineModalLabel">Edit Subscription</h3>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
						Are you sure you want to unsubscribe from Email and SMS? Press Yes
						to continue and No to close

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="pull-right">
									<button type="submit" class="btn btn-default">No</button>
									<button type="submit" class="btn btn-primary">Yes</button>
								</div>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

</body>
</html>