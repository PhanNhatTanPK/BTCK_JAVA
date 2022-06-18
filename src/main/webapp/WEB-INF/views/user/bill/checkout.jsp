<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp"%>
<head>
<meta charset="UTF-8">
<title>Payment</title>
</head>
<body>
	<div class="row">
		<div id="sidebar" class="span3">
			<div class="well well-small">
				<ul class="nav nav-list">
					<c:forEach var="item" items="${categorys}">
						<li><a href="<c:url value = "/products/${item.id }"/>"><span
								class="icon-chevron-right"></span> ${item.name}</a></li>
					</c:forEach>

					<li><a class="totalInCart" href="cart.html"><strong>Total
								Amount <span class="badge badge-warning pull-right"
								style="line-height: 18px;"><fmt:formatNumber
													type="number" groupingUsed="true" value="${totalPriceCart }" />₫</span>
						</strong></a></li>
				</ul>
			</div>
	
		</div>
		<div class="span9">
			<ul class="breadcrumb">
				<li><a href="index.html">Home</a> <span class="divider">/</span></li>
				<li class="active">Information User</li>
			</ul>		
			<hr class="soft" />

			<div class="row">
				<div class="span9">
					<div class="well well-small">					
						<br />
						<h3 class="center">Your Billing Details</h3>
						<form:form class="form-horizontal center" action="checkout" method="POST" modelAttribute="bills">

							<div class="control-group">
								<label class="control-label">Full name<sup>*</sup></label>
								<div class="controls">
									<form:input class="span3" type="text" path="display_name" placeholder="Enter Full Name" required="required"/>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Email<sup>*</sup></label>
								<div class="controls">
									<form:input class="span3" type="email" path="username" placeholder="Enter Email" required="required"/>									
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Contact<sup>*</sup></label>
								<div class="controls">
									<form:input class="span3" type="text" path="phone" placeholder="Enter Phone" required="required"/>								
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Address<sup>*</sup></label>
								<div class="controls">
									<form:input class="span3" type="text" path="address" placeholder="Enter Address" required="required"/>
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									<input type="submit" name="submitAccount" value="Payment"
										class="shopBtn exclusive">
								</div>
							</div>
						</form:form>
					</div>
				</div>							
			</div>

		</div>
	</div>
</body>
