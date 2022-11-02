<%@page import="java.util.LinkedList"%>
<%@page import="entities.Movie"%>
<%@page import="logic.MovieController"%>
<%@page import="entities.Show" %>
<%@page import="entities.MovieRoom" %>
<%@page import="logic.MovieRoomController"%>
<%@page import="logic.ShowController"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
ShowController ctrlShow = new ShowController();
LinkedList<Show> shows = ctrlShow.getAll();

MovieController ctrlMovie = new MovieController();
LinkedList<Movie> movies = ctrlMovie.getBillboard();

MovieRoomController ctrlMR = new MovieRoomController();
LinkedList<MovieRoom> movierooms = ctrlMR.list();
Movie mo=new Movie();
MovieRoom mrm=new MovieRoom();
Show s=new Show();
mo.setIdMovie(Integer.parseInt((String)request.getParameter("idM")));
s.setMovie(mo);
mrm.setRoomNumber(Integer.parseInt((String)request.getParameter("room")));
s.setMovieroom(mrm);
s.setDt(LocalDateTime.parse((String)request.getParameter("dt")));
%>
<head>
<meta charset="UTF-8">
<title>Modificar funcion</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="./styles/styles.css"> 
	<link rel="stylesheet" href="../../styles/navbar.css">
	<link rel="stylesheet" href="../../styles/abmcShow.css"/>

	<%
	
		/*if(session.getAttribute("usuario")==null){
			response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
		}*/
	%>
</head>
<body>
	<jsp:include page="../partials/navbar.jsp"></jsp:include>
	<main>
		<div class="input-group">
    	<form name="showForm" method="post" action="/TPI-Cine/src/servlet/abmcShow?action=update&exMovie=<%=s.getMovie().getIdMovie() %>&exRoom=<%=s.getMovieroom().getRoomNumber() %>&exdt=<%=s.getDt()%>">
        	<p><b>Película:</b>
        	<select name="movie" required>
        	<%for(Movie m: movies) {
        		if(m.getIdMovie()==s.getMovie().getIdMovie()){%>
                <option value="<%=m.getIdMovie()%>" selected><%=m.getTitle() %></option>
            <%}else{%>
            	<option value="<%=m.getIdMovie()%>"><%=m.getTitle() %></option>
            <%}} %>
        	</select>
        	<b>Dia y horario:</b>
        	<input type="datetime-local" name="dt" value="<%=s.getDt()%>" required>
        	<b>Sala:</b> 
        	<select name="room" required>
            <%for(MovieRoom mr: movierooms) {
            	if(mr.getRoomNumber()==s.getMovieroom().getRoomNumber()){%>
                <option value="<%=mr.getRoomNumber()%>" selected><%=mr.getRoomNumber() %></option>
                <%}else{%>
                <option value="<%=mr.getRoomNumber()%>"><%=mr.getRoomNumber() %></option>
            <%}} %>
        	</select>                  
        	<input type="submit" value="Modificar funcion"></p>
    	</form>
    	</div>
	</main>
</body>
</html>