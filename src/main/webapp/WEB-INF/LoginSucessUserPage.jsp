<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="language" value="${language}" scope="session" />

<fmt:setLocale value="${language}" scope="session" />
<fmt:setBundle var="bundle" basename="com.finalweb.bundle.local" />
<fmt:message var="search" bundle="${bundle}" key="local.search" />
<fmt:message var="logout" bundle="${bundle}" key="local.logout" />
<fmt:message var="booktitle" bundle="${bundle}" key="local.booktitle" />
<fmt:message var="author" bundle="${bundle}" key="local.author" />
<fmt:message var="description" bundle="${bundle}"
	key="local.description" />
<fmt:message var="action" bundle="${bundle}" key="local.action" />
<fmt:message var="moreinfo" bundle="${bundle}" key="local.moreinfo" />
<fmt:message var="removebook" bundle="${bundle}" key="local.removebook" />

<html lang="${language}">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<title>${userName}Library</title>
<style>
body {
	background-repeat: no-repeat;
	background-size: cover;
}

.table {
	padding-top: 400px;
}
</style>
</head>
<body>






	<nav class="navbar navbar-default" role="navigation"> <!-- Brand and toggle get grouped for better mobile display -->


	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
		
			<li class="dropdown"><a href="user?commandName=userBook"><button
						type="button" class="btn btn-warning btn-sm">
						<span class="glyphicon glyphicon-home" aria-hidden="true"></span>

					</button></a></li>

			
		</ul>
		<div class="col-sm-3 col-md-3">
			<form class="navbar-form" role="search" action="search">
				<div class="input-group">
					<input type="hidden" name="commandName" value="search" /> <input
						type="text" class="form-control" placeholder="${search}"
						name="search">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
		<ul class="nav navbar-nav navbar-right">

			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown">${userName} <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="user?commandName=accountDetails">Account Details</a></li>
					<li><a href="logout?commandName=logout">${logout}</a>
						</form></li>

				</ul></li>
		</ul>
	</div>
	<div></div>



	<!-- /.navbar-collapse --> </nav>
	<div class="container">
		<a href="user?commandName=allbook"><button type="button"
				class="btn btn-primary  btn-lg pull-right">Show All Books</button> </a>
	</div>
<div class="text-danger">
			<h4>
				<c:if test="${errorMessage!=null}">${errorMessage}</c:if>
			</h4>
		</div>

	<div class="container  text-danger">
		<h4>
			<c:if test="${libraryEmpty!=null}">${libraryEmpty}</c:if>
		</h4>
	</div>
	<div class="container">
		<c:if test="${newUser!=null}">
			<h3>Sorry, You don't have books in your Library Why don't we add
				few</h3>
		</c:if>
	</div>


	<div class="container">
		<table class="table table-hover">
			<thead class="thead-inverse table-active">

				<tr>

					<th>${booktitle}</th>
					<th>${author}</th>
					<th>${moreinfo}</th>
					<th>${action}</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${books}">
					<tr>

						<td>${book.bookTitle}</td>
						<td>${book.bookAuthor}</td>
						<td>

							<button type="button" class="btn btn-info btn-sm"
								data-toggle="modal" data-target="#${book.bookId}">More
								Info</button> <!-- Modal -->
							<div class="modal fade" id="${book.bookId}" role="dialog">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Book Details</h4>
										</div>
										<div class="modal-body">
											<table>
												<td>
												<tr>
													<h5>Book Title :${book.bookTitle}</h5>
												</tr>
												<tr>
													<h5>Auther name :${book.bookAuthor}</h5>
												</tr>
												<tr>
													<h5>Book Type:${book.bookType}</h5>
												</tr>
												<tr>
													<h5>Book Description :${book.description}</h5>
												</tr>
												</td>
											</table>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>

								</div>
							</div>

						</td>
						<td><a
							href="user?commandName=removebook&bookId=${book.bookId}"><button
									type="button" class="btn btn-danger btn-sm ">${removebook}</button>
						</a></td>

					</tr>

				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>