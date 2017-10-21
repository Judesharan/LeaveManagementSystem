<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard: Students</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="../dashboard/css/style.css">

</head>

<body>
	<span class="bckg"></span>
	<header>
		<h1>Dashboard</h1>
		<nav>
			<ul>
				<c:if test="${!empty PROFESSOR_LOGGED}">
					<li><a href="../dashboard" data-title="Profile">Profile</a></li>
					<li><a href="../professor/student-list" data-title="Students">Students</a></li>
					<li></li>
					<li><a href="../auth/logout" data-title="Logout">Logout</a></li>
				</c:if>
			</ul>
		</nav>
	</header>
	<main>
	<div class="title">
		<h2>Students</h2>
		<a href="javascript:void(0);">Hello ${PROFESSOR_LOGGED.username} !</a>
	</div>

	<article class="larg">
		<div>
			<h3>
				Students List <span class="entypo-up-open"></span>
			</h3>
			<table width="100%" border="1">
				<thead>
					<tr>
						<th width="5%">ID</th>
						<th>Name</th>
						<th>Username</th>
						<th>Gender</th>
						<th>Email</th>
						<th>Mobile Number</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${STUDENTS_LIST}" var="student">
						<tr>
							<td>${student.id}</td>
							<td>${student.name}</td>
							<td>${student.username}</td>
							<td>${student.gender}</td>
							<td>${student.emailId }</td>
							<td>${student.mobileNumber}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<h3>
				Applications for Leave <span class="entypo-up-open"></span>
			</h3>
			<table width="100%" border="1">
				<thead>
					<tr>
						<th width="5%">ID</th>
						<th>Student Name</th>
						<th>No Of Days</th>
						<th>Leave From</th>
						<th>Leave To</th>
						<th>Leave Type</th>
						<th>Leave Reason</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${STUDENTS_LEAVE_LIST}" var="studentLeave">
						<tr><form action="../leave/approval" method="POST">
							<td>${studentLeave.id}</td>
							<td>${studentLeave.student.name}</td>
							<td>${studentLeave.noOfDays}</td>
							<td>${studentLeave.leaveDetails.leaveFrom}</td>
							<td>${studentLeave.leaveDetails.leaveTo }</td>
							<td>${studentLeave.leaveDetails.leaveType}</td>
							<td>${studentLeave.leaveDetails.leaveReason}</td>
							<td>
									<input type="hidden" name="id" value="${studentLeave.id}"><select
										class="dropdown" name="status">
										<option value="" disabled="disabled" selected="selected">-- Choose Status --</option>
										<option value="APPROVED">Approved</option>
										<option value="REJECTED">Rejected</option>
									</select>
								</td>
								<td><button>Submit</button></td>
						</form></tr>
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