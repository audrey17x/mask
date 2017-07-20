<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp" %>
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
<fieldset>
	<legend>查詢條件</legend>
	<form:form modelAttribute="productList" id="qForm" action="${pageContext.request.contextPath}/views/report/exportPdf" method="post">
		<div id="conditionBox">
			<table style="width: 100%">
				<tr>
					<td>
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