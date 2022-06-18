<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp"%>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
<div class="span11" >
    <ul class="breadcrumb">
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active">Information User</li>
    </ul>
	<h3> Information User</h3>	
	<hr class="soft"/>
	
	<div class="row">
	
		<div class="span4" style="margin-left:100px">
			<div class="well" >
			<h5>CREATE YOUR ACCOUNT</h5><br/>	
			<h3>${statusRegister }</h3>		
			<form:form action="register" method="POST" modelAttribute="user">  
			  <div class="control-group">
				<label class="control-label" for="inputEmail">Email</label>
				<div class="controls">
					<form:input class="span3" type="email" path="username" placeholder="Email" required="required"/>  				
				</div>
			  </div>
			  <div class="control-group">
				<label class="control-label" for="inputEmail">Password</label>
				<div class="controls">
					<form:input class="span3" type="password" path="password" placeholder="Password" required="required"/> 				  
				</div>
			  </div>
			  <div class="control-group">
				<label class="control-label" for="inputEmail">Full Name</label>
				<div class="controls">
					<form:input class="span3" type="text" path="display_name" placeholder="Full Name" required="required"/>					 
				</div>
			  </div>
			  <div class="control-group">
				<label class="control-label" for="inputEmail">Address</label>
				<div class="controls">
					<form:input class="span3" type="text" path="address" placeholder="Address" />			 
				</div>
			  </div>
			  <div class="controls">
			  <button type="submit" class="btn block">Create Your Account</button>
			  </div>
			</form:form>
		</div>
		</div>
		<div class="span1"> &nbsp;</div>
		<div class="span4">
			<div class="well">
			<h5>ALREADY REGISTERED ?</h5>
			<h3>${statusLogin }</h3>
			<form:form action="login" method="POST" modelAttribute="user">  
			  <div class="control-group">
				<label class="control-label" for="inputEmail">Account</label>
				<div class="controls">
				  <form:input class="span3" type="email" path="username" placeholder="Email" required="required"/>
				</div>
			  </div>
			  <div class="control-group">
				<label class="control-label" for="inputPassword">Password</label>
				<div class="controls">
				 <form:input class="span3" type="password" path="password" placeholder="Password" required="required"/>
				</div>
			  </div>
			  <div class="control-group">
				<div class="controls">
				  <button type="submit" class="defaultBtn">Sign in</button>
				</div>
			  </div>
			</form:form>
		</div>
		</div>
	</div>	
	
</div>

</body>
