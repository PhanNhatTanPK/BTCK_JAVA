<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/layouts/user/taglib.jsp"%>
<title>Home</title>
<body>
	<!-- Body Section -->
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
			<div class="well np">
				<div id="myCarousel" class="carousel slide homCar">
					<div class="carousel-inner">
						<c:forEach var="item" items="${slides}" varStatus="index">
							<c:if test="${index.first }">
								<div class="item active">
							</c:if>
							<c:if test="${not index.first }">
								<div class="item">
							</c:if>
							<img style="width: 100%"
								src="<c:url value="/assets/user/img/slides/${item.img }"/>"
								alt="bootstrap ecommerce templates">
							<div class="carousel-caption">
								<h4>${item.caption }</h4>
								<p>
									<span>${item.content }</span>
								</p>
							</div>
					</div>
					</c:forEach>

				</div>
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
					href="#myCarousel" data-slide="next">&rsaquo;</a>
			</div>
		</div>
		<!--
New Products
-->
		<div class="row well well-small">
			<h3>New Products</h3>
			<hr class="soften" />
			<div class="row-fluid">
				<div id="newProductCar" class="carousel slide">
					<div class="carousel-inner">
					
					<c:if test="${ newProducts.size() > 0 }">
						<div class="item active">
							<ul class="thumbnails">
							<c:forEach var="item" items="${ newProducts }" varStatus="loop">
								<li class="span3">
									<div class="thumbnail">
										<a class="zoomTool" href="<c:url value="/productDetail/${ item.id_product }"/>"
											title="add to cart"><span class="icon-search"></span>
											QUICK VIEW</a> <a href="#" class="tag"></a> <a
											href="product_details.html"><img
											src="<c:url value="/assets/user/img/${item.img }"/>"
											alt="bootstrap-ring"></a>
									</div>
								</li>
								<c:if test="${ (loop.index + 1) % 4 == 0 || (loop.index + 1)  == newProducts.size() }">
										</ul>
									</div>
									<c:if test="${ (loop.index + 1) < newProducts.size() }">
										<div class="item">
											<ul class="thumbnails">
									</c:if>
								</c:if>
							</c:forEach>
					</c:if>						
					</div>
					<a class="left carousel-control" href="#newProductCar"
						data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
						href="#newProductCar" data-slide="next">&rsaquo;</a>
				</div>
			</div>
		</div>
		<!--
	Featured Products
	-->
		<div class="row well well-small">
			<h3>				
				Featured Products
			</h3>
			<hr class="soften" />
			<div class="row-fluid">
				<c:if test="${ highLightproducts.size() > 0 }">
					<ul class="thumbnails">

						<c:forEach var="item" items="${ highLightproducts }" varStatus="loop">
							<li class="span4">
								<div class="thumbnail">
									<a class="zoomTool" href="<c:url value="/productDetail/${ item.id_product }"/>" title="add to cart"><span
										class="icon-search"></span> QUICK VIEW</a> <a
										href="productDetail/${ item.id_product }"><img
										src="<c:url value="/assets/user/img/${ item.img }"/>" alt=""></a>
									<div class="caption">
										<h5>${ item.name }</h5>
										<h4>
											<a class="defaultBtn" href="<c:url value="/productDetail/${ item.id_product }"/>"
												title="Click to view"><span class="icon-zoom-in"></span></a>
											<a class="shopBtn" href="<c:url value="/AddCart/${ item.id_product }"/>" title="add to cart"><span
												class="icon-plus"></span></a> <span class="pull-right"><fmt:formatNumber
													type="number" groupingUsed="true" value="${ item.price }" />
												₫</span>
										</h4>
									</div>
								</div>
							</li>

							<c:if test="${ (loop.index + 1) % 3 == 0 || (loop.index + 1)  == highLightproducts.size() }">
								</ul>
								<c:if test="${ (loop.index + 1) < highLightproducts.size() }">
									<ul class="thumbnails">
								</c:if>
							</c:if>
				</c:forEach>
				</c:if>
				
			</div>
		</div>
	</div>
	</div>

</body>