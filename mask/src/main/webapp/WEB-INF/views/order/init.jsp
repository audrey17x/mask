<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order/main.css" />
	</head>
	<!-- Scripts -->
<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/skel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/util.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<body>
		<!-- header -->
		<header class="header">
			<nav class="nav">
				<ul>
					<!-- office -->
					<span>
						<button id="Home">Home</button>
						<button id="About">About</button>
						<button id="Product">Product</button>
						<button id="Contact">Contact</button>
					</span>
					<!-- social  -->
					    <c:choose>
					        <c:when test="${sessionScope.result == 'success'}">
								<span style="float: right;">
									您好！<c:out value="${sessionScope.name}"/>
									<button id="out">out</button>
								</span>
					    	</c:when>
						    <c:otherwise>
								<!-- social  -->
								<span style="float: right;">
									<button id="login">Login</button>
									<button id="register">register</button>
								</span>
						    </c:otherwise>
					    </c:choose>
				</ul>
			</nav>
		</header>
		<form:form modelAttribute="productList" id="productCheckout" action="${pageContext.request.contextPath}/views/order/save" method="post">
			<!-- Table -->
			<section>
				<h3>&nbsp;&nbsp;結帳</h3>
				<h4>&nbsp;&nbsp;商品列表</h4>
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th>商品名稱</th>
								<th>膚質</th>
								<th>效果</th>
								<th>銷售量</th>
								<th>庫存量</th>
								<th>價格</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${productList}" varStatus="status">
								<tr>
									<td>${product.name}</td>
									<td>${product.skinType}</td>
									<td>${product.feature}</td>
									<td>${product.sales}</td>
									<td>${product.stock}</td>
									<td>${product.price}</td>
								</tr>
								<input type="text" name="idList[${status.count-1}]" value="${product.id}" style="display:none">
								<input type="text" name="sumAmount" value="${sumAmount}" style="display:none">
								<c:if test="${status.last}">
								   <input type="text" name="count" value="${status.count-1}" style="display:none">
								</c:if>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5"></td>
								<td>${sumAmount}</td>
							</tr>
							<tr>
								<td colspan="5"></td>
								<td><input type="submit" value="送出訂單" class="special" /></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</section>
		</form:form>	
		<!-- Footer -->
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</body>
</html>