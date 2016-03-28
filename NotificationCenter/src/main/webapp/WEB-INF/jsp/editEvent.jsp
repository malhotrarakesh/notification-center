<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form:form class="form-horizontal" role="form" method="post" id="eventUpdateFormId" action="updateEvent" modelAttribute="event">
	<fieldset>
		<div class="form-group">
			<label class="col-sm-4 control-label" for="textinput">Name</label>
			<div class="col-sm-7">
				<form:input type="text" placeholder="Name" path="name" class="form-control" required="required"/>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-4 control-label" for="textinput">Title</label>
			<div class="col-sm-7">
				<form:input type="text" placeholder="Title" path="title" class="form-control" required="required"/>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-4 control-label" for="textinput">Description</label>
			<div class="col-sm-7">
				<form:input type="text" placeholder="Description" class="form-control" path="description"
					required="required"/>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-4 control-label" for="textinput">Scheduled On</label>
			<div class="col-sm-7">
				<form:input type="text" placeholder="Scheduled On" class="form-control" path="scheduledOn"
					required="required"/>
			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-sm-4 control-label" for="selectinput">Is
				Active</label>
			<div class="col-xs-6 col-sm-3">
				<a class="btn btn-primary btn-select"> <form:input type="hidden"
					class="btn-select-input" path="status" /> <span
					class="btn-select-value">Select an Item</span> <span
					class='btn-select-arrow glyphicon glyphicon-chevron-down'></span>
					<ul>
						<li class="selected">Active</li>
						<li>Expired</li>
					</ul> </a>
			</div>

		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<div class="pull-right">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary" onclick="submitUpdateEvent()">Submit</button>
				</div>
			</div>
		</div>

	</fieldset>
</form:form>
