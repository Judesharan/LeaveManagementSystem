<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard: Profile</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="../dashboard/css/style.css">
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
		<h2>Profile</h2>
		<c:if test="${!empty STUDENT_LOGGED}">
			<a href="javascript:void(0);">Hello ${STUDENT_LOGGED.username} !</a>
		</c:if>
		<c:if test="${!empty PROFESSOR_LOGGED}">
			<a href="javascript:void(0);">Hello ${PROFESSOR_LOGGED.username}
				!</a>
		</c:if>
	</div>

	<article class="larg">
		<div>
			<h3>
				Basic Profile <span class="entypo-up-open"></span>
			</h3>
			<table>
				<c:if test="${!empty STUDENT_LOGGED}">
					<tr>
						<td width="55%">ID</td>
						<td>${STUDENT_LOGGED.id}</td>
					</tr>
					<tr>
						<td>Name</td>
						<td>${STUDENT_LOGGED.name}</td>
					</tr>
					<tr>
						<td>Department</td>
						<td>${STUDENT_LOGGED.department.name}</td>
					</tr>
					<tr>
						<td>Gender</td>
						<td>${STUDENT_LOGGED.gender}</td>
					</tr>
					<tr>
						<td>E-Mail Id</td>
						<td>${STUDENT_LOGGED.emailId}</td>
					</tr>
					<tr>
						<td>Mobile Number</td>
						<td>${STUDENT_LOGGED.mobileNumber}
					</tr>
				</c:if>

				<c:if test="${!empty PROFESSOR_LOGGED}">
					<tr>
						<td width="55%">ID</td>
						<td>${PROFESSOR_LOGGED.id}</td>
					</tr>
					<tr>
						<td>Name</td>
						<td>${PROFESSOR_LOGGED.name}</td>
					</tr>
					<tr>
						<td>Department</td>
						<td>${PROFESSOR_LOGGED.department.name}</td>
					</tr>
					<tr>
						<td>Gender</td>
						<td>${PROFESSOR_LOGGED.gender}</td>
					</tr>
					<tr>
						<td>E-Mail Id</td>
						<td>${PROFESSOR_LOGGED.emailId}</td>
					</tr>
					<tr>
						<td>Mobile Number</td>
						<td>${PROFESSOR_LOGGED.mobileNumber}</td>
					</tr>
				</c:if>
			</table>
		</div>
		<div>
			<h3>
				Details <span class="entypo-up-open"></span>
			</h3>
			<c:if test="${!empty STUDENT_LOGGED}">
				<section class="card_body">

					<div class="graph">
						<div class="txt_faded">
							<label class="txt_label space_n_b"> Your Attendance
								Percentage </label>
						</div>
						<div class="knob_data">${MY_LEAVE_PERCENTAGE}<span
								class="txt_smaller">%</span>
						</div>
					</div>
				</section>
				<section class="stats stats_row">
					<div class="stats_item half_whole">
						<div class="txt_faded">
							<label class="txt_label space_n_b"> Goal </label>
							<div class="txt_serif stats_item_number txt_success">
								75<span class="txt_smaller">%</span>
							</div>
						</div>
					</div>
					<div class="stats_item half_whole">
						<div class="txt_faded">
							<label class="txt_label space_n_b"> Red Line </label>
							<div class="txt_serif stats_item_number txt_error">
								65<span class="txt_smaller">.2%</span>
							</div>
						</div>
					</div>
				</section>
			</c:if>
			<c:if test="${!empty PROFESSOR_LOGGED}">
				<table>
					<tr>
						<td>Total Number Of Working Days</td>
						<td>-</td>
						<td>45</td>
					</tr>
					<tr>
						<td>No. of Students in the Department</td>
						<td>-</td>
						<td>${COUNT_OF_STUDENTS}</td>
					</tr>
				</table>
			</c:if>

		</div>
	</article>
	</main>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

	<script src="../dashboard/js/index.js"></script>

</body>
</html>