<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
	<head>
		<title>Full Motion</title>
		<meta charset="utf-8" />
		<!-- 網站設計css -->
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
		<!-- car -->
		<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/car/reset.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/car/htmleaf-demo.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/car/style.css"> <!-- Resource style -->
	</head>
	<!-- car -->
	
	<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
	
	<!-- 網站設計 -->
	<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.poptrox.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/skel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/js/car/main.js"></script>
	<style type="text/css">
		.header {
			height: 60px;
			width: 100%;
			top: 0;
			position: fixed;
			background-color: black;
		}
		.nav {
			height: 100px;
			padding: 10px;
			background-attachment: fixed;
			line-hight: 29px;
			/*text-align: left;*/
		}
		#gotop {
		    display: none;
		    position: fixed;
		    right: 20px;
		    bottom: 20px;    
		    padding: 10px 15px;    
		    font-size: 20px;
		    background: #777;
		    color: white;
		    cursor: pointer;
		}
	</style>
	<script>
		/*  login 彈現  對話視窗 */
		$(document).ready(function() {
			$('#Login').click(function() {
				$.blockUI({
					message : $('#form-login')
				});
		
				setTimeout($.unblockUI, 2000);
			});
			/*login end*/
			/* 下拉 連接畫面  */
			$('#About').click(function() {
				$('html,body').animate({
					scrollTop : $('#AboutTitle').offset().top
				}, 800);
			});
		
			$('#Product').click(function() {
				$('html,body').animate({
					scrollTop : $('#ProductTitle').offset().top
				}, 800);
			});
		
			$('#Shop').click(function() {
				$('html,body').animate({
					scrollTop : $('#ShopTitle').offset().top
				}, 800);
			});
		
			$('#Contact').click(function() {
				$('html,body').animate({
					scrollTop : $('#ContactTitle').offset().top
				}, 800);
			});
			/*
			$(function(){
				// 幫 a.abgne_gotoheader 加上 click 事件
				$('a.abgne_gotoheader').click(function(){
					// 讓捲軸用動畫的方式移動到 0 的位置
					// 感謝網友 sam 修正 Opera 問題
					var $body = (window.opera) ? (document.compatMode == "CSS1Compat" ? $('html') : $('body')) : $('html,body');
					$body.animate({
						scrollTop: 0
					}, 600);
			 
					return false;
				});
			});
			*/
			$(function(){
			    $("#gotop").click(function(){
			        jQuery("html,body").animate({
			            scrollTop:0
			        },1000);
			    });
			    $(window).scroll(function() {
			        if ( $(this).scrollTop() > 300){
			            $('#gotop').fadeIn("fast");
			        } else {
			            $('#gotop').stop().fadeOut("fast");
			        }
			    });
			});
			
			
			$("#checkout").click(function() {
				  $("#productCheckout").submit();
			});	
			
			$("#home").click(function() {
				  $("#indexTarget").submit();
			});	
			
			$("#product").click(function() {
				  $("#productTarget").submit();
			});	
			
		});
	/* 下拉 連接畫面  end*/
	</script>
	<body id="top">
		<!-- header -->
		<header class="header"> 
			<nav class="nav">
				<ul>
					<!-- office -->
					<span>
						<button id="home">Home</button>
						<button id="about">About</button>
						<button id="product">Product</button>
						<button id="shop">Shop</button>
						<button id="contact">Contact</button>
					</span>
					<!-- social  -->
					    <c:choose>
					        <c:when test="${sessionScope.result == 'success'}">
								<span style="float: right;">
									您好！<c:out value="${member.name}"/>
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
		<a href="#" id="header">Header</a>
		<!-- Main -->
		<div id="main">
			<div class="inner">
			<!-- Boxes -->
				<div class="thumbnails">
					<c:forEach var="product" items="${productList}" >
						<div class="box">
							<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="${pageContext.request.contextPath}/img/${product.id}.jpg"/></a>
							<div class="inner">
								<h3>${product.name}</h3>
								<h5>${product.skinType}</h5><br/>
								<button class="cd-add-to-cart" data-price="${product.price}" value="${product.name}" lang="${product.id}" type="button">加入購物車</button>
								<!-- <a href="https://youtu.be/s6zR2T9vn2c" class="button fit" data-poptrox="youtube,800x400">Watch</a>  -->
							</div>
						</div>							
					
					</c:forEach>
				</div>
			</div>
		</div>
		<form:form modelAttribute="productList" id="productCheckout" action="${pageContext.request.contextPath}/views/order/init" method="post">
			<div class="cd-cart-container empty">
				<a href="#0" class="cd-cart-trigger">
					Cart
					<ul class="count"> <!-- cart items count -->
						<li>0</li>
						<li>0</li>
					</ul> <!-- .count -->
				</a>
				<div class="cd-cart">
					<div class="wrapper">
						<header>
							<h2>Cart</h2>
							<span class="undo">商品刪除. <a href="#0">取消刪除</a></span>
						</header>
						
						<div class="body">
							<ul>
								<!-- products added to the cart will be inserted here using JavaScript -->
							</ul>
						</div>
	
						<footer>
							<a href="#0" id="checkout" class="checkout btn"><em>結帳 - $<span>0</span></em></a>
						</footer>
					</div>
				</div> <!-- .cd-cart -->
			</div> <!-- cd-cart-container -->
		</form:form>		
		<pre></pre >
		<!--  <a href="#header" class="abgne_gotoheader button">Go To Header</a>-->
		<div id="gotop">˄</div>
		<!-- Footer -->
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
		
		<form:form modelAttribute="product" id="productTarget" action="${pageContext.request.contextPath}/views/product/show" method="post">
		</form:form>				
		<form:form modelAttribute="product" id="indexTarget" action="${pageContext.request.contextPath}/views/index/init" method="get">
		</form:form>					
	</body>
</html>