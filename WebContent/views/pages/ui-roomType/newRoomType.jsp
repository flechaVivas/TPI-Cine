<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alta Genero</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>
<body>

    <div class="container mt-4" style="min-height: 65vh;">

        <!-- Body de la pagina -->
        <div class="row"> 

			<% if(request.getAttribute("error")!=null){ %>
				<div class="col-12">
					<div class="alert alert-danger" role="alert">
						<strong style="color: #660708;">Error! <%=request.getAttribute("error")%></strong>
					</div>
				</div>
				
			<% } %>
        
        	<jsp:include page="/views/partials/menuIzq.jsp"></jsp:include>
            
            <!-- Content Column -->
            <div class="col-10">
                <h2>PANEL ADMINISTRADOR</h2>
                <h4>Tipos de Sala</h4>  

                <form action="/TPI-Cine/src/servlet/ABMCRoomType?action=new" method="post">
                
                	<div class="col-12 col-sm-12 col-lg-12">
                
                   		<div class="table-responsive">
            
                        	<h2>Alta de Tipo de Sala</h2>
                
                        	<table class="table table-borderless">
	                            <tr>
	                                <td> Descripcion </td>
	                                <td> Filas </td>
	                                <td> Columnas </td>
	                                <td>Precio</td>
	                            </tr>
	                            <tr>
	                            	<td><input name="description" type="text" class="form-control" required></td>
	                            	<td><input name="row" type="number" class="form-control" required></td>
	                            	<td><input name="col" type="number" class="form-control" required></td>
	                            	<td><input name="price" type="number" class="form-control" required></td>
	                            	<td> <button class="btn btn-success">Aceptar</button> </td>
	                            </tr>
                        	</table>
                        	<a href="/TPI-Cine/views/pages/ui-roomType/listRoomTypes.jsp" class="btn">Volver a Tipos de Sala</a>
                    	</div>
                    </div>
                </form>
            </div>
        </div>
    </div>




</body>
</html>