<%@page import="entities.User"%>
<%@page import="logic.RoomTypeController"%>
<%@page import="entities.RoomType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<%
	
		User u = (User)session.getAttribute("usuario");
		
		if(u == null){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		} else if(!u.estaAutorizado()){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		}
	
		Integer id = Integer.parseInt((String)request.getParameter("idRoomType"));
		RoomTypeController ctrlRT = new RoomTypeController();
		RoomType r = new RoomType();
		r.setIdRoomType(id);
		r = ctrlRT.getOne(r);
	
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
			<div class="col-10 ">
	        	<h2>PANEL ADMINISTRADOR</h2>
	        	<h4>Tipos de Salas</h4>
				
				<form action="/TPI-Cine/src/servlet/ABMCRoomType?action=update&idRoomType=<%=r.getIdRoomType()%>" method="post">
				
				<div class="col-12 col-sm-12 col-lg-12">
			     	<div class="table-responsive">
						<table class="table table-hover table-borderless ">
			            	<thead>
			                	<tr>
			                		<th>ID</th>
			                		<th>Descripcion</th>
			                		<th>Filas</th>
                    		   		<th>Columnas</th>
                    		   		<th>Precio</th>
			                  	</tr>
			                </thead>
							<tbody>
								<tr>
			                		<td><input type="number" value="<%=r.getIdRoomType()%>" name="idRoomType" readonly="" class="form-control"></td>
			                    	<td><input type="text" value="<%=r.getDescription()%>"name="description"  class="form-control" required></td>
			                    	<td><input type="number" value="<%=r.getSizeRow()%>"name="row"  class="form-control" required></td>
			                    	<td><input type="number" value="<%=r.getSizeCol()%>"name="col" class="form-control" required></td>
			                    	<td><input type="number" value="<%=r.getPrice()%>"name="price" class="form-control" required></td>
			                    				
			                    	<td>
										<button class="btn btn-warning" type="submit">Confirmar</button>
			               			</td>
			                    </tr>
			               </tbody>
			            </table>
			         </div>
			      </div>
	    		</form>	
				<a href="/TPI-Cine/views/pages/ui-roomType/listRoomTypes.jsp" class="btn">Volver a Tipos de Sala</a>
			</div>
		</div>
	</div>





</body>
</html>