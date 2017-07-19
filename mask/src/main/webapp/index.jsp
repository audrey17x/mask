<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
	<head>
		<!-- header -->
		<%@ include file="/WEB-INF/views/common/head.jsp"%>
		<!-- css -->
		<%@ include file="/WEB-INF/views/common/css.jsp"%>
		<!-- script -->
		<%@ include file="/WEB-INF/views/common/script.jsp"%>
		<script src="${pageContext.request.contextPath}/js/common/common.js" type="text/javascript"></script>

		<!-- Resource style -->
		<style type="text/css">
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
		
		/* body */
		.cd-fixed-bg1 {
			background-image:
				url("${pageContext.request.contextPath}/img/cd-bg1.jpg");
			background-size: cover;
			background-attachment: fixed;
			background-repeat: no-repeat;
			background-position: center center;
			height: 700px;
		}
		
		.cd-fixed-bg2 {
			background-image:
				url("${pageContext.request.contextPath}/img/cd-bg2.jpg");
			background-size: cover;
			background-attachment: fixed;
			background-repeat: no-repeat;
			background-position: center center;
			height: 700px;
		}
		
		.cd-fixed-bg3 {
			background-image:
				url("${pageContext.request.contextPath}/img/cd-bg3.jpg");
			background-size: cover;
			background-attachment: fixed;
			background-repeat: no-repeat;
			background-position: center center;
			height: 700px;
		}
		
		.cd-fixed-bg4 {
			background-image:
				url("${pageContext.request.contextPath}/img/cd-bg4.jpg");
			background-size: cover;
			background-attachment: fixed;
			background-repeat: no-repeat;
			background-position: center center;
			height: 700px;
		}
		
		.cd-scrolling-bg {
			height: 500px;
			background-color: white;
		}
		
		.cd-container {
			text-align: justify;
		}
		
		/*-- header */
		.nav {
			height: 100px;
			padding: 10px;
			background-attachment: fixed;
			line-hight: 29px;
			/*text-align: left;*/
		}
		
		a {
			color: #666666;
			font-size: 1em;
			padding: 5px;
		}
		
		.header {
			height: 60px;
			width: 100%;
			top: 0;
			position: fixed;
			background-color: black;
		}
		
		.sub-right {
			text-align: right;
		}
		/*contact us*/
		input[type=text] {
			width: 300px;
			height: 30px;
			padding: 12px 20px;
			margin: 8px 0;
			display: inline-block;
			border: 1px solid #ccc;
			border-radius: 4px;
			box-sizing: border-box;
		}
		
		textarea {
			width: 300px;
			height: 150px;
			padding: 12px 20px;
			box-sizing: border-box;
			border: 2px solid #ccc;
			border-radius: 4px;
			background-color: #f8f8f8;
			font-size: 16px;
			resize: none;
		}
		
		input[type=submit], input[type=reset] {
			width: 100px;
			background-color: dodgerblue;
			color: white;
			padding: 14px 20px;
			margin: 8px 0;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}
		
		input[type=submit]:hover, input[type=reset]:hover {
			background-color: blue;
		}
		
		.contactTitle {
			position: relative;
			left: 40%;
			top: 50%;
			border: 10px solid grey;
		}
		
		/* contact us end*/
		</style>
		<script>
			$(document).ready(function() {
				
				/*
				$('#login').click(function() {
					$.blockUI({
						message : $('#formLogin')
					});
				});
				
				$('#loginButton').click(function() {
					$.blockUI({
						message : $('#formLogin')
					});
				});				
				
				$('#registerButton').click(function() {
					$.blockUI({
						message : $('#registerDiv')
					});
				});
				
				$('#cancel').click(function() {
					$.unblockUI(); 
				});
				
				$('#cancelRegister').click(function() {
					$.unblockUI(); 
				});
				
				$("#registerSubmit").click(function() {
					$("#registerForm").validate();
					$("#registerForm").submit();
				});	
				
				*/
				
				$(function() {
					$("#gotop").click(function() {
						jQuery("html,body").animate({
							scrollTop : 0
						}, 1000);
					});
					$(window).scroll(function() {
						if ($(this).scrollTop() > 300) {
							$('#gotop').fadeIn("fast");
						} else {
							$('#gotop').stop().fadeOut("fast");
						}
					});
				});
				
			});
		</script>
	</head>
	<body>
		<!-- header -->
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
		<!-- body-->
		<div id="AboutTitle" class="cd-fixed-bg1" style="text-align: center;">
		</br>
				</br>
				</br>
				</br>
				</br>
				</br>
				</br>
				</br>
				</br>
				
				<font face="monospace" size="10" color="white" ><b>卸下你的。你的真面目.....</b></font>
					<img src="${pageContext.request.contextPath}/img/icon/mask.ico"	height="150"/>
		</div>
	
		<div class="cd-scrolling-bg cd-color1">
			<div class="cd-container" style="text-align: center;">
				</br>
				</br>
				</br>
				<h2 style="color: #33CCFF;">About Us</h2>
				<p style="color: grey;">
					有實力。經得起考驗~~不怕被懷疑!!</br> 法國上架的必備條件－需經過最嚴格的檢驗證實效果。 </br> Institut
					d‘ExpertiseClinique跟EvicFrance是法國專門測試化妝保養品品質的檢驗室。</br>
					卸下你的。你的真面目面膜與許多國際知名化妝保養品，都與IEC或EvicFrance合作多次經驗。</br>
					由英國領導美妝雜誌所舉辦，邀請專業美容顧問、美容俱樂部會員與讀者們共同票選，</br>
					卸下你的。你的真面目面膜在2016年首次入圍最佳新秀面膜獎，打敗來自各國的國際品牌，成為2016年的新秀面膜獎冠軍！</br>
					天下沒有醜女人，只有懶女人!</br> 你準備好了嗎 !!
				</p>
	
	
			</div>
		</div>
		<!-- repeat 結構*4 -->
		<div id="ProductTitle" class="cd-fixed-bg2">
		</br>
				</br>
				</br>
			<h1></h1>
		</div>
		<div class="cd-scrolling-bg cd-color-2">
			<div class="cd-container" style="text-align: center;">
				</br>
				</br>
				</br>
				<h2 style="color: #33CCFF;">Inspection Report</h2>
				<p style="color: grey;">
					有實力。經得起考驗~~不怕被懷疑!!</br> 法國上架的必備條件－需經過最嚴格的檢驗證實效果。 </br> Institut
					d‘ExpertiseClinique跟EvicFrance是法國專門測試化妝保養品品質的檢驗室。</br>
					卸下你的。你的真面目面膜與許多國際知名化妝保養品，都與IEC或EvicFrance合作多次經驗。</br>
					由英國領導美妝雜誌所舉辦，邀請專業美容顧問、美容俱樂部會員與讀者們共同票選，</br>
					卸下你的。你的真面目面膜在2016年首次入圍最佳新秀面膜獎，打敗來自各國的國際品牌，成為2016年的新秀面膜獎冠軍！</br>
					天下沒有醜女人，只有懶女人!</br> 你準備好了嗎 !!
				</p>
	
	
			</div>
		</div>
	
		<div id="ShopTitle" class="cd-fixed-bg3">
			<h1></h1>
		</div>
		<div class="cd-scrolling-bg cd-color-3">
		<div class="cd-container" style="text-align: center;">
				</br>
				</br>
				</br>
				<h2 style="color: #33CCFF;">Future Prospects</h2>
				<p style="color: grey;">
					有實力。經得起考驗~~不怕被懷疑!!</br> 法國上架的必備條件－需經過最嚴格的檢驗證實效果。 </br> Institut
					d‘ExpertiseClinique跟EvicFrance是法國專門測試化妝保養品品質的檢驗室。</br>
					卸下你的。你的真面目面膜與許多國際知名化妝保養品，都與IEC或EvicFrance合作多次經驗。</br>
					由英國領導美妝雜誌所舉辦，邀請專業美容顧問、美容俱樂部會員與讀者們共同票選，</br>
					卸下你的。你的真面目面膜在2016年首次入圍最佳新秀面膜獎，打敗來自各國的國際品牌，成為2016年的新秀面膜獎冠軍！</br>
					天下沒有醜女人，只有懶女人!</br> 你準備好了嗎 !!
				</p>
			</div>
		</div>
		<div id="ContactTitle" class="cd-fixed-bg4">
			<br> <br> <br> <br> <br> <br> <br>
			<br> <br> <br> <br> <br> <br> <br>
			<!--  		
			<form>
			 <fieldset>
	      <legend> Call Me Baby</legend>
			
				<div class="contactTitle">
					<input type="text" id="name" class="contactTitleClass" name="name" placeholder="親愛的如何稱呼你"><br>
					<input type="text" id="email" class="contactTitleClass" name="email" placeholder="輸入電子信箱"><br>
					<textarea class="contactTitleClass" placeholder="寫下你想告訴我們的話"></textarea><br>
					<input class="contactTitleClass" type="reset" value="重設"> 
					<input class="contactTitleClass" type="submit" value="確認送出">
				</div>
				</fieldset>
			</form>
			
		</div>
	
		<div class="cd-scrolling-bg cd-color-4">
			<div class="cd-container">
				<h2>About Feature</h2>
				<p>捲動色塊内容4...</p>
			</div>
		</div>
		-->
		<div id="formLogin">
			<form:form id="login" modelAttribute="member" action="${pageContext.request.contextPath}/views/index/login" method="post">
				<p>
					<input type="text" name="mName" place="帳號" />
				</p>
				<p>
					<input type="password" name="mPassword" require="true" label="密碼" place="密碼" />
				</p>
				<p>
					<button class="contactTitleClass" type="button">送出</button>
					<button id="registerButton" type="button">註冊</button>
					<button id="cancel" type="button">取消</button>
				</p>
			</form:form>
		</div>
		<div id="registerDiv">
			<form:form id="registerForm" modelAttribute="member" action="${pageContext.request.contextPath}/views/index/register" method="post">
				<input type="text" class="required" name="userName" />
				<input type="text" class="required" name="mName"/>
				<input type="text" class="required email" name="email"/>
				<input type="text" class="number" name="phone"/>
				<input type="text" class="required" name="gender"/>
				<input type="text" class="date" name="birthday"/>
				<input type="text" name="address"/>
				<input type="password" class="required" name="mPassword"/>
				<input type="password" class="required" name="mPasswordMatch"/>
				<input id="loginButton" type="button" value="登入" />
				<input id="registerSubmit" type="button" value="註冊" />
				<input id="cancelRegister" type="button" value="取消" />
			</form:form>
		</div>
		<!-- body end-->
		
		<!-- 移至頂端 -->
		<pre></pre>
		<div id="gotop">˄</div>
		
		<!-- Footer -->
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</body>
</html>