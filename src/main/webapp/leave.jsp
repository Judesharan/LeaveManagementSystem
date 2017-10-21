<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard: Leave</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="../dashboard/css/style.css">
<style type="text/css">
tab1 {
	padding-left: 4em;
}
</style>
</head>

<body>
	<span class="bckg"></span>
	<header>
		<h1>Dashboard</h1>
		<nav>
			<ul>
				<c:if test="${!empty STUDENT_LOGGED}">
					<li><a href="../dashboard" data-title="Profile">Profile</a></li>
					<li></li>
					<li><a href="../leave" data-title="Leave">Leave</a></li>
					<li><a href="../auth/logout" data-title="Logout">Logout</a></li>
				</c:if>
			</ul>
		</nav>
	</header>
	<main>
	<div class="title">
		<h2>Leave</h2>
		<c:if test="${!empty STUDENT_LOGGED}">
			<a href="javascript:void(0);">Hello ${STUDENT_LOGGED.username} !</a>
		</c:if>
	</div>

	<article class="larg">
		<div>
			<h3>
				Leave <span class="entypo-up-open"></span>
			</h3>

			<form action="../leaveDetails/applyLeave" method="post">
				<input type="hidden" name="id" value="${STUDENT_LOGGED.id} " />
					<table>
						<tr>
							<td>Name</td>
							<td><input type="text" name="name"
								value="${STUDENT_LOGGED.name}" readonly /></td>
						</tr>
						<tr>
							<td>Leave Type</td>
							<td><input name="leave-type" type="text" /></td>
						</tr>
						<tr>
							<td>Leave Reason</td>
							<td><input name="leave-reason" type="text" /></td>
						</tr>
						<tr>
							<td>No.of.Days</td>
							<td><input name="no-of-days" type="number" /></td>
						</tr>
						<tr>
							<td>Leave From</td>
							<td><input name="leave-from" type="date" /></td>
						</tr>
						<tr>
							<td>Leave To</td>
							<td><input name="leave-to" type="date" /></td>
						</tr>
					</table>
					<tab1><input type="submit" value="Submit"></tab1>
			</form>
		</div>
		<div>
			<h3>
				My Leave List <span class="entypo-up-open"></span>
			</h3>
			<table width="100%" border="1">
				<thead>
					<tr>
						<th width="5%">ID</th>
						<th>Name</th>
						<th>No Of Days</th>
						<th>Leave From</th>
						<th>Leave To</th>
						<th>Leave Type</th>
						<th>Leave Reason</th>
						<th>Professor</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${MY_LEAVE_LIST}" var="myLeave">
						<tr>
							<td>${myLeave.id}</td>
							<td>${myLeave.student.name}</td>
							<td>${myLeave.noOfDays}</td>
							<td>${myLeave.leaveDetails.leaveFrom}</td>
							<td>${myLeave.leaveDetails.leaveTo }</td>
							<td>${myLeave.leaveDetails.leaveType}</td>
							<td>${myLeave.leaveDetails.leaveReason}</td>
							<td>${myLeave.professor.name}</td>
							<td>${myLeave.status}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</article>
	</main>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="../dashboard/js/index.js"></script>

</body>
</html>