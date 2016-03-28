<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		<c:forEach items="${users}" var="user">
			<tr>
				<td>${user.firstName}</td>
				<td>${user.lastName}</td>
				<td>${user.username}</td>
				<td>${user.emailAddress}</td>
				<td>${user.roleEnum}</td>
				<td>
					<button type="button" class="btn btn-sm btn-danger"
						data-toggle="modal" data-target="#deleteUserConfModal"
						onclick="holdUser('${user.username}')">Delete</button>
					<button type="button" class="btn btn-sm btn-success"
						data-toggle="modal" data-target="#addUserModal"
						onclick="prepareUpdateUser('${user.username}')">Edit</button></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<script>
	var isCurrentUser = '${isCurrentUser}';
	var isDuplicateUser = '${isDuplicateUser}';
	var isUserAdded = '${isUserAdded}';
	var isUserUpdated = '${isUserUpdated}';
</script>