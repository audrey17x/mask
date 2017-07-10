<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">
	</head>
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
	<!-- Scripts -->
<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/skel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/util.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script>
	$(document).ready(function() {
		$("#home").click(function() {
			  $("#indexTarget").submit();
		});	
		
		$("#product").click(function() {
			  $("#productTarget").submit();
		});	
		
		$("#register").click(function() {
			  $("#registerTarget").submit();
		});
	  	$( function() {
		    $( "#datepicker" ).datepicker();
		} );
	  	
		$("#registerSubmit").click(function() {
			$("#registerForm").validate();
			$("#registerForm").submit();
		});	
	});	
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
							<button id="contact">Contact</button>
						</span>
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
			<br/>
			<!-- Form -->
			<form:form id="registerForm" modelAttribute="member" action="${pageContext.request.contextPath}/views/index/loginConfirm" method="post">
				<div class="row uniform 50%">
					<div class="2u$ 12u$(xsmall)" style="margin:0px auto;">
						帳號：<input type="text" name="userName" id="userName" class="required" value="" style="margin:0px auto;" placeholder="帳號" />
					</div>
					<div class="2u$ 12u$(xsmall)">
						密碼：<input type="password" class="required" name="password" placeholder="密碼"/>
					</div>					
					<div class="12u$">
						<ul class="actions">
							<li><input id="registerSubmit" type="submit" value="登入" class="special" /></li>
							<li><input type="reset" value="清除" /></li>
						</ul>
					</div>
				</div>
			</form:form>			
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
		<form:form modelAttribute="product" id="registerTarget" action="${pageContext.request.contextPath}/views/index/register" method="get">
		</form:form>				

	</body>
</html>