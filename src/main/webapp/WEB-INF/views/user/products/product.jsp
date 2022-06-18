<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp"%>
<head>
<meta charset="UTF-8">
<title>Product Detail</title>
<style>
	.product-content{
		overflow-x: hidden;
	}
</style>
</head>
<body>
	<!-- 
Body Section 
-->
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
	<div class="row product-content">		
		<div class="span8">
			<ul class="breadcrumb">
				<li><a href="<c:url value="/home" />">Home</a> <span class="divider">/</span></li>				
				<li class="active">Detail</li>
			</ul>
			<div class="well well-small">
				<div class="row-fluid">
					<div class="span5">
						<div id="myCarousel" class="carousel slide cntr">
							<div class="carousel-inner">
								<div class="item active">
									<a href="#"> <img src="<c:url value="/assets/user/img/${ product.img }"/>" alt=""
										style="width: 100%"></a>
								</div>								
							</div>
							<a class="left carousel-control" href="#myCarousel"
								data-slide="prev">‹</a> <a class="right carousel-control"
								href="#myCarousel" data-slide="next">›</a>
						</div>
					</div>
					<div class="span7">
						<h3>${product.name }</h3>
						<hr class="soft" />

						<form class="form-horizontal qtyFrm" method="GET" action="<c:url value="/AddCart/${ product.id_product }"/>">
							<div class="control-group">
								<label class="control-label"><span><fmt:formatNumber type="number"
												groupingUsed="true" value="${ product.price }" />₫ </span></label>
								<div class="controls">
									<input type="number" min ="1" value="1" class="span6" >
								</div>
							</div>

							<div class="control-group">
								<label class="control-label"><span>Color</span></label>
								<div class="controls">
									<select class="span11">
										<option>${product.name_color }</option>										
									</select>
								</div>
							</div>
							
							
							<p>${product.title }
							<p>
								<button type="submit" class="shopBtn">
									<span class=" icon-shopping-cart"></span> Add to cart
								</button>
						</form>
					</div>
				</div>
				<hr class="softn clr" />


				<ul id="productDetail" class="nav nav-tabs">
					<li class="active"><a href="#home" data-toggle="tab">Product
							Details</a></li>
					<li class=""><a href="#profile" data-toggle="tab">Related
							Products </a></li>					
				</ul>
				<div id="myTabContent" class="tab-content tabWrapper">
					<div class="tab-pane fade active in" id="home">
					${product.details }		
					</div>
					<div class="tab-pane fade" id="profile">
					
					
					
					<c:forEach var="item" begin="0"  items="${ productByIdCategory }" varStatus="loop">
						<div class="row-fluid">
							<div class="span2">
								<img src="<c:url value="/assets/user/img/${ item.img }"/>" alt="">
							</div>
							<div class="span6">
								<h5>${item.name}</h5>
								<p>${item.title}</p>
							</div>
							<div class="span4 alignR">
								<form class="form-horizontal qtyFrm">
									<h3><fmt:formatNumber type="number"
												groupingUsed="true" value="${ item.price }" />₫ </h3>									
									<div class="btn-group">
										<a href="<c:url value="/AddCart/${ item.id_product }"/>" class="defaultBtn"><span
											class=" icon-shopping-cart"></span> Add to cart</a>
									</div>
								</form>
							</div>
						</div>
						<hr class="soft">
						
					</c:forEach>
																																	
					</div>
				</div>

			</div>
		</div>
	</div>
	
	<!-- Body wrapper -->
</body>
