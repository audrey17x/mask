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
		$(document).ready(function () {
			
		});
		
		
		function pdfBtnEvent() {
			if (chkColumns()) {
				$('#qForm').prop('action', "./exportPdf");
			  	$('#qForm').submit();		
			}
		}
		
		function csvBtnEvent(){
			if (chkColumns()) {
				$('#qForm').prop('action', "./exportCsv");
			  	$('#qForm').submit();		
			}
		}
		
		function chkColumns(){
			return ok;
		}
		
		function clearBtnEvent() {
			$.ajax({
				type: "POST",
				url: "./clear",
				data: {},
			   	success: function(data) {
			   		$("#bodyContent").html(data);			
				}
			});
		}	
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
		
<fieldset>
	<legend>查詢條件</legend>
	<form:form modelAttribute="productList" id="qForm" action="${pageContext.request.contextPath}/views/report/exportPdf" method="post">
		<div id="conditionBox">
			<table style="width: 100%">
				<tr>
					<td">
						<label>價格：</label>
						<input type="text" name="priceStr" value="600">&nbsp;~&nbsp;<input type="text" name="priceEnd" value="800">
					</td>
				</tr>	
				<tr>
					<td>
						<input type="submit" value="列印"/>
					</td>
				</tr>
			</table>
		</div>
	</form:form>	
</fieldset>		
		
		
		<pre></pre >
		<!--  <a href="#header" class="abgne_gotoheader button">Go To Header</a>-->
		<div id="gotop">˄</div>
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
		<form:form modelAttribute="product" id="productTarget" action="${pageContext.request.contextPath}/views/product/show" method="post">
		</form:form>				
		<form:form modelAttribute="product" id="indexTarget" action="${pageContext.request.contextPath}/views/index/init" method="get">
		</form:form>					
	</body>
</html>
