<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="logic.MovieRoomController"%>
<%@page import="entities.RoomType"%>
<%@page import="logic.MovieController"%>
<%@page import="entities.Ubication"%>
<%@page import="java.util.LinkedList"%>
<%@page import="entities.Show"%>

<%

	Show s = (Show) request.getSession(false).getAttribute("show");
	LinkedList<Ubication> ubicElegidas = (LinkedList<Ubication>)request.getSession(false).getAttribute("ubicElegidas");
	MovieController ctrlMovie = new MovieController();
	MovieRoomController ctrlMovieRoom = new MovieRoomController();
	
	BigDecimal cant_entradas = (BigDecimal)request.getSession().getAttribute("total");
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
	
%>


<div class="container">
	<div class="row">
        <div class="col-12">
            <h2 style="text-align: center">Resumen</h2>
            <h4 style="text-align: center">Usted ha seleccionado: </h4>
        </div>
    </div>
    <div class="row">
        <div class="col-12 mt-4">

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Pelicula</th>
                        <th scope="col">Sala</th>
                        <th scope="col">Numero Sala</th>
                        <th scope="col">Ubicacion</th>
                        <th scope="col">Fecha y Hora</th>
                        <th scope="col">Cantidad Entradas</th>
                        <th scope="col">Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%=s.getMovie().getTitle()%></td>
                        <td><%=s.getMovieroom().getRt().getDescription()%></td>
                        <td><%=s.getMovieroom().getRoomNumber()%></td>
                        <td>
                        <% for(Ubication u : ubicElegidas){ %>
                        	<%=u.getRow()+"-"+u.getCol()%>
                        <%}%>
                        </td>
                        <td><%=s.getDt().format(formatter)%></td>
                        <td><%=cant_entradas %></td>
                        <td>$<%=s.getMovieroom().getRt().getPrice().multiply(cant_entradas) %></td>
                    </tr>
                </tbody>
            </table>

        </div>
    </div>
    <div class="row">
    	<form action="/TPI-Cine/src/servlet/ABMCTicket?action=new" method="post">
    		<div class="col-12">
	            <h4 style="text-align: center">¿Desea confirmar la reserva?</h4>
	            <div class="d-flex justify-content-center">
	                <button class="btn btn-success">Confirmar</button>
	            </div>
        	</div>
    	</form>
        
    </div>


</div>
