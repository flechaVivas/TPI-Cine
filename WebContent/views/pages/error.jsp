<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>

	

<body>

    <div class="container" style="background-color: ;">
        <div class="row">
            <div class="col-md-12 d-flex flex-column justify-content-center align-items-center vh-100">
                <h1>Oops! Algo ha salido mal.</h1>
                <p>Un error interno ha provocado que no podamos procesar tu solicitud</p>
                <p>Por favor, inténtalo de nuevo más tarde.</p>
                <p>Gracias!</p>
                <p><%=request.getAttribute("error")%></p>
            </div>
        </div>
    </div>


</body>
</html>