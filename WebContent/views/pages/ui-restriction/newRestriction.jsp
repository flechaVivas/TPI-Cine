<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nueva Restriccion</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>
<body>

	<form action="/TPI-Cine/src/servlet/ABMCRestriction?action=new" method="post">
		<div class="container mt-5">

			<h2>Alta de Restriccion</h2>
	
			<table class="table table-borderless">
				<tr>
					<td> Descripcion </td>
					<td><input name="description" type="text" class="form-control" required></td>
					<td> <button class="btn btn-success">Aceptar</button> </td>
				</tr>
			</table>
			<a href="/TPI-Cine/views/pages/ui-restriction/listRestrictions.jsp" class="btn">Volver a restricciones</a>
		</div>
	</form>
	


</body>
</html>