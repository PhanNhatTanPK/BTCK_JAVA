<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp"%>
<header id="header">
	<div class="row">
		<div class="span4">
			<h1>
				<a class="logo" href="<c:url value="/home" />"> <img
					src="<c:url value="/assets/user/img/Thelaptopworld.png" />"
					alt="bootstrap sexy shop"> </a>
			</h1>
		</div>
		<div class="span4"></div>
		<div class="span4 alignR">
			<p>
				<br> <strong> Support (24/7) : 0941231069 </strong><br> <br>
			</p>
			<span class="btn btn-mini">[${totalQuantyCart }] <span
				class="icon-shopping-cart"></span></span> <span
				class="btn btn-warning btn-mini">₫</span>
		</div>
	</div>
</header>

<!--
Navigation Bar Section 
-->
<div class="navbar">
	<div class="navbar-inner">
		<div class="container">
			<a data-target=".nav-collapse" data-toggle="collapse"
				class="btn btn-navbar"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a>
			<div class="nav-collapse">
				<ul class="nav">
				  <li class=""><a href="<c:url value="/home" />">Home	</a></li>				
				  <li class=""><a href="<c:url value="/listCart" />">Cart</a></li>
				 
				</ul>				
				<ul class="nav pull-right">
					<c:if test="${empty UserInfo }">
						<li class="dropdown"><a data-toggle="dropdown"
							class="dropdown-toggle" href="#"><span class="icon-lock"></span>
								Account </a>
							</li>
					</c:if>
					<c:if test="${not empty UserInfo }">
						<li><a href="#">${UserInfo.display_name } </a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>