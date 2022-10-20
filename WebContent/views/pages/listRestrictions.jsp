<%@page import="entities.Restriction"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logic.RestrictionController"%>
<%@page import="entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Restricciones</title>

	<%
		User u = (User)request.getSession().getAttribute("usuario");
		
		RestrictionController ctrlRes = new RestrictionController();
		LinkedList<Restriction> restrictions = ctrlRes.getAll();
	
	%>
	

</head>
<body>

	<jsp:include page="/views/partials/adminMenu.jsp"></jsp:include>
	
	
	
	<div class="container">
		<div class="row mt-5">
        	<h4>Restricciones</h4>
            	<div class="col-12 col-sm-12 col-lg-12">
                	<div class="table-responsive">
                    	<table class="table table-hover table-borderless ">
                    		<thead>
                    			<tr>
                    				<th>ID</th>
                    		    	<th>Descripcion</th>
                        			<th></th>
                        			<th></th>
                      			</tr>
                      		</thead>
                    		<tbody>
                    		<% for (Restriction r : restrictions) { %>
                    			<tr>
                    				<td><%=r.getIdRestriction()%></td>
                    				<td><%=r.getDescription()%></td>
                    				
                    				<td>
                    					<a href="editRestriction?id=<%=r.getIdRestriction()%>" class="btn" type="submit">Editar</a><!-- editar -->
                    					<a href="deleteRestriction?id=<%=r.getIdRestriction()%>" class="btn btn-danger">Eliminar</a><!-- borrar -->
                    				</td>
                    			</tr>
                    		<% } %>
                    		</tbody>	
                    </table>
                    </div>
             	</div>	
             <a href="adminPanel.jsp" class="btn">Volver al menu</a>
        </div>
	</div> <!-- /container -->
	
	

</body>
</html>