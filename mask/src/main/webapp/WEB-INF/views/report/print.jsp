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
	
		<!-- Scripts -->
		<%@ include file="/WEB-INF/views/common/script.jsp"%>		
		<script src="${pageContext.request.contextPath}/js/common/common.js" type="text/javascript"></script>		
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
				$("#tableElement").click(function() {
					$('#qForm').prop('action', "./exportPdfOfTableElement");
				  	$('#qForm').submit();	
				});	
				
				
				$("#submit").click(function() {
					pdfBtnEvent();
				});	
				
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
	</head>
	<body id="top">
		<!-- header -->
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		
		<fieldset>
			<legend>查詢條件</legend>
			<form:form modelAttribute="productList" id="qForm" action="${pageContext.request.contextPath}/views/report/exportPdf" method="post">
				</br>
				</br>
				</br>
				</br>
				</br>
				</br>
				</br>
				</br>
				<div id="conditionBox">
					<table style="width: 100%">
						<tr>
							<td">
								<label>價格：</label>
								<input type="text" name="priceStr" value="500">&nbsp;~&nbsp;<input type="text" name="priceEnd" value="800">
							</td>
						</tr>	
						<tr>
							<td>
								<button id="submit">列印</button>
							</td>
						</tr>
						<tr>
							<td>
								<button id="tableElement">表格元素版本的列印</button>
							</td>
						</tr>
					</table>
				</div>
			</form:form>	
		</fieldset>		
		
		<!-- Footer -->
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</body>
</html>
