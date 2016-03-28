<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-striped table-bordered table-list">
	<thead>
		<tr>
			<th>Name</th>
			<th>Title</th>
			<th>Description</th>
			<th>Scheduled On</th>
			<th>Status</th>
			<th>Options</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${events}" var="event">
			<tr>
				<td>${event.name}</td>
				<td>${event.title}</td>
				<td>${event.description}</td>
				<td>${event.scheduledOn}</td>
				<td>${event.status}</td>
				<td>
					<button type="button" class="btn btn-sm btn-danger"
						data-toggle="modal" data-target="#deleteEventConfModal"
						onclick="holdEvent('${event.name}')">Delete</button>
					<button type="button" class="btn btn-sm btn-success"
						data-toggle="modal" data-target="#addEventModal"
						onclick="prepareUpdateEvent('${event.name}')">Edit</button></td>
				</td>
			</tr>
		</c:forEach>	
	</tbody>
</table>

<script>
	var isEventAdded = '${isEventAdded}';
	var isEventUpdated = '${isEventUpdated}';
	var isEventDeleted = '${isEventDeleted}';
	var isDuplicateEvent = '${isDuplicateEvent}';
</script>
