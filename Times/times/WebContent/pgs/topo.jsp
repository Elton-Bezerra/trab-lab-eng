<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="assets/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Laborat�rio de Engenharia de Software</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/css/animate.min.css" rel="stylesheet" />
<link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />



<!--     Fontes e icones     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300'
	rel='stylesheet' type='text/css'>
<link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />

<script src="assets/js/jquery-3.2.1.min.js"></script>
<!--    mascaras     -->
<!--    mascaras  CPF    -->
<script>
	function formatar(mascara, documento) {
		var i = documento.value.length;
		var saida = mascara.substring(0, 1);
		var texto = mascara.substring(i)
		if (texto.substring(0, 1) != saida) {
			documento.value += texto.substring(0, 1);
		}
	}
</script>


<script>
	function formatar(mascara, documento) {
		var i = documento.value.length;
		var saida = mascara.substring(0, 1);
		var texto = mascara.substring(i)

		if (texto.substring(0, 1) != saida) {
			documento.value += texto.substring(0, 1);
		}
	}
</script>
<!--    mascaras  CEP    -->
<script>
	function MM_formtCep(e, src, mask) {
		if (window.event) {
			_TXT = e.keyCode;
		} else if (e.which) {
			_TXT = e.which;
		}
		if (_TXT > 47 && _TXT < 58) {
			var i = src.value.length;
			var saida = mask.substring(0, 1);
			var texto = mask.substring(i)
			if (texto.substring(0, 1) != saida) {
				src.value += texto.substring(0, 1);
			}
			return true;
		} else {
			if (_TXT != 8) {
				return false;
			} else {
				return true;
			}
		}
	}
</script>


</head>
<body>

	<div class="wrapper">
		<div class="sidebar" data-color="blue"
			data-image="assets/img/sidebar-5.jpg">


			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="" class="simple-text"> Teams </a>
				</div>

				<ul class="nav">
					<li><a href="index.jsp"> <i class="pe-7s-shield"></i>
							<p>Times</p>
					</a></li>

					<li><a href="elenco.jsp"> <i class="pe-7s-users"></i>
						<p>Elenco</p>
					</a></li>

				</ul>
			</div>
		</div>

		<div class="main-panel">
			<nav class="navbar navbar-default navbar-fixed">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#navigation-example-2">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">Laborat�rio de Engenharia de Software</a>
					</div>
					
				</div>
			</nav>