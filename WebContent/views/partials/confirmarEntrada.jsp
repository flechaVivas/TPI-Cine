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
	
	s.setMovie(ctrlMovie.getbyIdMovie(s.getMovie()));
	s.setMovieroom(ctrlMovieRoom.getOne(s.getMovieroom()));

%>


<div class="container">
	<div class="row">
        <div class="col-12">
            <h2 style="text-align: center">Resumen</h2>
            <h4 style="text-align: center">Usted ha seleccionado: </h4>
        </div>
    <div class="row">
        <div class="col-12">

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Pelicula</th>
                        <th scope="col">Sala</th>
                        <th scope="col">Numero Sala</th>
                        <th scope="col">Fecha y Hora</th>
                        <th scope="col">Ubicacion</th>
                        <th scope="col">Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%=s.getMovie().getTitle()%></td>
                        <td><%=s.getMovieroom().getRt().getDescription()%></td>
                        <td><%=s.getMovieroom().getRoomNumber()%></td>
                        <td><%=s.getDt()%></td>
                        <td>
                        <% for(Ubication u : ubicElegidas){ %>
                        	<%=u.getRow()+" "+u.getCol()%>
                        
                        <%}%>
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>

        </div>
    </div>

    </div>


</div>
