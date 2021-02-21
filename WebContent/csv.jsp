<!DOCTYPE html>
<html>
<head>
<title>JSON2CSV</title>
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<script type="text/javascript">
	function valida_form() {
		if (document.getElementById("json").value.length < 3) {
			alert('Por favor, preencha o campo com o codigo em JSON');
			document.getElementById("json").focus();
			return false
		}
	}
</script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<%@	page import="java.util.*"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<div class="limiter">
		<div class="container-json2csv"
			style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-json2csv">
				<form class="json2csv-form validate-form" method="post"
					action=json2csv onsubmit="return valida_form(this)">
					<div class="wrap-input100 validate-input" data-validate="json">
						<textarea class="texto" name="json" id="json"
							placeholder="Insira o codigo a ser convertido"></textarea>
						<textarea class="texto" name="csv" disabled="disabled">${csvfinal}</textarea>
						<table id="demo-table">
							<tr>
								<c:forEach var="titulo" items="${cabecalho}">
									<th>${titulo}</th>
								</c:forEach>
							</tr>
							<c:forEach var="csv" items="${teste}">
								<tr>
									<c:forEach var="csv2" items="${csv}">
										<td>${csv2}</td>
									</c:forEach>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="container-json2csv-form-btn">
						<button class="json2csv-form-btn">JSON --> CSV</button>
						<button class="json2csv-form-btn" type="button"
							onclick="window.location.href = '/Yardim'">Limpar</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>