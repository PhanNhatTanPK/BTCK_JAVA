<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp"%>
<head>
<meta charset="UTF-8">
<title>Product</title>
<style>
.pagination {
	display: flex;
	justify-content: center;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
}

.pagination a.active {
	background-color: dodgerblue;
	color: white;
}
.pagination

 

a


:hover


:not

 

(
.active

 

)
{
background-color


:

 

#ddd


;
}
</style>
</head>
<body>
	<div class="well well-small">	
		<h3>Products</h3>
		<c:if test="${ productsPaginate.size() > 0 }">
			<div class="row-fluid">
				<ul class="thumbnails">
					<c:forEach var="item" items="${ productsPaginate }" varStatus="loop">
						<li class="span4">
							<div class="thumbnail">
								<a href="/productDetail/${ item.id_product }" class="overlay"></a> <a
									class="zoomTool" href="<c:url value="/productDetail/${ item.id_product }"/>"
									title="add to cart"><span class="icon-search"></span> QUICK
									VIEW</a> <a href="<c:url value="/productDetail/${ item.id_product }"/>"><img
									src="<c:url value="/assets/user/img/${ item.img }"/>" alt=""></a>
								<div class="caption cntr">
									<p>${item.name }</p>
									<p>
										<strong><fmt:formatNumber type="number"
												groupingUsed="true" value="${ item.price }" />₫ </strong>
									</p>
									<h4>
										<a class="shopBtn" href="<c:url value="/AddCart/${ item.id_product }"/>" title="add to cart"> Add to
											cart </a>
									</h4>
									
									<br class="clr">
								</div>
							</div>
						</li>

						<c:if
							test="${ (loop.index + 1) % 3 == 0 || (loop.index + 1)  == productsPaginate.size() }">
								</ul>
							</div>
							<c:if test="${ (loop.index + 1) < productsPaginate.size() }">
								<div class="row-fluid">
									<ul class="thumbnails">
							</c:if>
						</c:if>
					</c:forEach>
		</c:if>

	</div>
	<div class="pagination">
		<c:forEach var="item" begin="1" end="${ paginateInfo.totalPage }" varStatus="loop">
			<c:if test="${loop.index == paginateInfo.currentPage}">
				<a class="active" href="<c:url value="/products/${idCategory}/${loop.index}"/>">${loop.index}</a>
			</c:if>
			<c:if test="${loop.index != paginateInfo.currentPage}">
				<a href="<c:url value="/products/${idCategory}/${loop.index}"/>">${loop.index}</a>
			</c:if>
		</c:forEach>					
	</div>
</body>
