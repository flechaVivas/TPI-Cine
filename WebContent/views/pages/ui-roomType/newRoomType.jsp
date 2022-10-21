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
        <!-- Menu de la izquierda-->
            <div id="Menu" class="col-2 mt-5">
                <!-- Sidebar Column -->
                <div class="list-group">
                    <a class="list-group-item" href="listUsers.jsp">Usuarios</a>
                    <a class="list-group-item" href="listRoles.jsp">Roles</a>
                    <a class="list-group-item" href="listTickets.jsp">Tickets</a>
                    <a class="list-group-item" href="listShows.jsp">Funciones</a>
                    <a class="list-group-item" href="listMovies.jsp">Películas</a>
                    <a class="list-group-item" href="/TPI-Cine/views/pages/ui-restriction/listRestrictions.jsp">Restricciones</a>
                    <a class="list-group-item" href="/TPI-Cine/views/pages/ui-genre/listGenres.jsp">Generos</a>
                    <a class="list-group-item" href="listMoovieRooms.jsp">Salas de Cine</a>
                    <a class="list-group-item" href="listRoomTypes.jsp">Tipos de Salas</a>
                    <a class="list-group-item" href="listUbication.jsp">Ubicaciones</a>
                </div>
            </div>
            
            <!-- Content Column -->
            <div class="col-10 ">
                <h2>PANEL ADMINISTRADOR</h2>
                <h4>Generos</h4>  

                <form action="/TPI-Cine/src/servlet/ABMCGenre?action=new" method="post">
                    <div class="container mt-5">
            
                        <h2>Alta de Genero</h2>
                
                        <table class="table table-borderless">
                            <tr>
                                <td> Descripcion </td>
                                <td><input name="description" type="text" class="form-control" required></td>
                                <td> <button class="btn btn-success">Aceptar</button> </td>
                            </tr>
                        </table>
                        <a href="/TPI-Cine/views/pages/ui-genre/listGenres.jsp" class="btn">Volver a Generos</a>
                    </div>
                </form>
            </div>
        </div>
    </div>




</body>
</html>