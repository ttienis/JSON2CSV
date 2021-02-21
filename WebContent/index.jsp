<!DOCTYPE html>
<html>
<head>
<title>JSON2CSV</title>
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<script type="text/javascript" language="javascript">
	function valida_form() {
		if (document.getElementById("json").value.length < 3) {
			alert('Por favor, preencha o campo com o codigo em JSON');
			document.getElementById("json").focus();
			return false
		}
	}
</script>

<link rel="stylesheet" type="text/css" href="css/main.css">
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
					</div>
					<div class="container-json2csv-form-btn">
						<button class="json2csv-form-btn">JSON --> CSV</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>