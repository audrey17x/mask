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
		<footer id="footer">
			<div class="inner">

				<p style="color: #007799">
					究竟，"卸下你的。真面目"魅力何在？一場意外讓她顏色走樣，卻成註冊商標</br>
					花朵的嬌艷撐不過一季花期，都有著如煙花般得在有現實光中綻放一切的悽愴感，抓緊美麗與脆弱 </br>
					那是關於美麗底下的脆弱不堪、真偽與優劣的正反比關係、以及關於生命的反思。
				</p>

				<div class="icons">

					<a href="https://twitter.com/?lang=zh-tw"><img
						src="${pageContext.request.contextPath}/img/icon/twitter.ico"
						alt="twitter" height="42"></a> <a
						href="https://twitter.com/?lang=zh-tw"><img
						src="${pageContext.request.contextPath}/img/icon/instagram.ico"
						alt="instagram" height="42"></a> <a
						href="https://www.facebook.com/"><img
						src="${pageContext.request.contextPath}/img/icon/facebook.ico"
						alt="facebook" height="42"></a> <a
						href="https://plus.google.com/u/0/"><img
						src="${pageContext.request.contextPath}/img/icon/google.ico"
						alt="google+" height="42"></a>
				</div>
				<p class="copyright">版權所有&copy;2016~2017卸下你的。真面目 .ALL RIGHTS
					RESERVED. PRIVACY POLICY TERMS AND CONDITIONS</p>
				<span style="color: #003377;">&hearts;&hearts;女人永遠要愛自己&hearts;&hearts;
				</span>

			</div>
		</footer>
	</body>
</html>