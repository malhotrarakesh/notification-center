$(document).ready(function () {
    $(".btn-select").each(function (e) {
        var value = $(this).find("ul li.selected").html();
        if (value != undefined) {
            $(this).find(".btn-select-input").val(value);
            $(this).find(".btn-select-value").html(value);
        }
    });
});

$(document).on('click', '.btn-select', function (e) {
    e.preventDefault();
    var ul = $(this).find("ul");
    if ($(this).hasClass("active")) {
        if (ul.find("li").is(e.target)) {
            var target = $(e.target);
            target.addClass("selected").siblings().removeClass("selected");
            var value = target.html();
            $(this).find(".btn-select-input").val(value);
            $(this).find(".btn-select-value").html(value);
        }
        ul.hide();
        $(this).removeClass("active");
    }
    else {
        $('.btn-select').not(this).each(function () {
            $(this).removeClass("active").find("ul").hide();
        });
        ul.slideDown(300);
        $(this).addClass("active");
    }
});

$(document).on('click', function (e) {
    var target = $(e.target).closest(".btn-select");
    if (!target.length) {
        $(".btn-select").removeClass("active").find("ul").hide();
    }
});

function prepareAddUser() {
	$.get("prepareAddUser", {}, function(data){
		$("#userAddEditModalBody").empty().html(data);
	});
}

function prepareUpdateUser(username) {
	$.get("prepareUpdateUser", {'username' : username}, function(data){
		$("#userAddEditModalBody").empty().html(data);
	});
}

function prepareUpdateEvent(eventName) {
	$.get("prepareUpdateEvent", {'name' : eventName}, function(response){
		$("#eventAddEditModalBody").empty().html(response);
	});
}


function prepareAddEvent() {
	$.get("prepareAddEvent", {}, function(data){
		$("#eventAddEditModalBody").empty().html(data);
	});
}

var username;
var eventName;
function holdUser(username) {
	this.username = username;
}
function holdEvent(name) {
	this.eventName = name;
}

// Get all the users
function getUsers() {
	$("#userErrorDiv").empty();
	$("#eventErrorDiv").empty();
	$.get("getUsers", {}, function(data){
		$("#userContentDiv").empty().html(data);
	});
}

// Get all the events
function getEvents() {
	$("#userErrorDiv").empty();
	$("#eventErrorDiv").empty();
	$.get("getEvents", {}, function(data){
		$("#eventContentDiv").empty().html(data);
	});
}


// Create a user
function submitAddUser() {
	$().ready(function() {
        $("#userAddFormId").validate({
           rules: {
        	   firstName: {
                  required: true
              },
              lastName: {
                  required: true
              }
           }
        });
  });
	
	var dataToPost = $("#userAddFormId").serialize();
	$.post("submitAddUser", dataToPost, function(data){
		$("#userContentDiv").empty().html(data);
		$("#addUserModal").modal('hide');
		checkUserError();
	});
}

// Update a user
function submitUpdateUser() {
	var dataToPost = $("#userUpdateFormId").serialize();
	$.post("submitUpdateUser", dataToPost, function(data){
		$("#userContentDiv").empty().html(data);
		$("#addUserModal").modal('hide');
		checkUserError();
	});
}

// Delete a user
function deleteUser() {
	$.post("deleteUser", {'username' : username}, function(data){
		$("#userContentDiv").empty().html(data);
		$("#deleteUserConfModal").modal('hide');
		checkUserError();
	});
}


// Create an event
function submitAddEvent() {
	var dataToPost = $("#eventAddFormId").serialize();
	$.post("addEvent", dataToPost, function(response){
		$("#eventContentDiv").empty().html(response);
		$("#addEventModal").modal('hide');
		checkEventError();
	});
}

// Delete an event
function deleteEvent() {
	$.post("deleteEvent", {'name' : eventName}, function(data){
		$("#eventContentDiv").empty().html(data);
		$("#deleteEventConfModal").modal('hide');
		checkEventError();
	});
}

// Update an event
function submitUpdateEvent() {
	var dataToPost = $("#eventUpdateFormId").serialize();
	$.post("updateEvent", dataToPost, function(data){
		$("#eventContentDiv").empty().html(data);
		$("#addEventModal").modal('hide');
		checkEventError();
	});
}


function checkUserError() {
	$("#userErrorDiv").empty();
	
	if(isCurrentUser == 'true' || isCurrentUser == 'false' || isDuplicateUser == 'true' || isUserAdded == 'true' || isUserUpdated == 'true') {
		if(isCurrentUser == 'true') {
			$("#userErrorDiv").empty().html("<li><strong>Can't delete logged in user</strong></li>");	
		} else {
			$("#userErrorDiv").empty().html("<li><strong>User deleted successfully</strong></li>");
		}
		
		if(isDuplicateUser == 'true') {
			$("#userErrorDiv").empty().html("<li><strong>The user with this username already exists. Please try again with different username</strong></li>");	
		}
		
		if(isUserAdded == 'true') {
			$("#userErrorDiv").empty().html("<li><strong>User added successfully</strong></li>");				
		}
		
		if(isUserUpdated == 'true') {
			$("#userErrorDiv").empty().html("<li><strong>User updated successfully</strong></li>");
		}
	} 
}


function checkEventError() {
	$("#eventErrorDiv").empty();
	
	if(isEventAdded == 'true' || isEventUpdated == 'true' || isEventDeleted == 'true' || isDuplicateEvent == 'true') {
		if(isEventDeleted == 'true') {
			$("#eventErrorDiv").empty().html("<li><strong>Event deleted successfully</strong></li>");
		}
		
		if(isDuplicateEvent == 'true') {
			$("#eventErrorDiv").empty().html("<li><strong>An Event with this name already exists. Please try again with different name</strong></li>");	
		}
		
		if(isEventAdded == 'true') {
			$("#eventErrorDiv").empty().html("<li><strong>Event added successfully</strong></li>");				
		}
		
		if(isEventUpdated == 'true') {
			$("#eventErrorDiv").empty().html("<li><strong>Event updated successfully</strong></li>");
		}
	} 
}


