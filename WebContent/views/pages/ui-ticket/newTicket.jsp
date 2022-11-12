<%@page import="entities.User"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alta Ticket</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<%
	
	User u = (User)session.getAttribute("usuario");
	
	if(u == null){
		response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
	} else if(!u.estaAutorizado()){
		response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
	}	
	
%>


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
                <h4>Tickets</h4>  

                <form action="/TPI-Cine/src/servlet/ABMCTicket?action=new" method="post">
                
                	<div class="col-12 col-sm-12 col-lg-12">
                
                   		<div class="table-responsive">
            
                        	<h2>Alta de Ticket</h2>
                
                        	<table class="table table-borderless">
	                            <tr>
	                    		    <td>Codigo Operacion</td>
	                    		    <td>Fecha y Hora</td>
	                    		    <td>Precio</td>
	                    		    <td>ID Usuario</td>
	                    		    <td>Fecha Cancelacion</td>
	                            </tr>
	                            <tr>
			                    	<td><input type="text" name="opcode"  class="form-control" required></td>
			                    	<td><input type="datetime-local" name="datetime"  class="form-control" required></td>
			                    	<td><input type="number" name="price"  class="form-control" required></td>
			                    	<td><input type="number" name="idUser" class="form-control" required></td>
			                    	<td><input type="date" name="canceldate" class="form-control" required></td>
	                            </tr>
                        	</table>
                        	<a href="/TPI-Cine/views/pages/ui-user/listUsers.jsp" class="btn">Volver a Tickets</a>
                    	</div>
                    </div>
                </form>
            </div>
        </div>
    </div>




</body>
</html>