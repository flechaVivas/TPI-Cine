<!DOCTYPE html>
<%@page import="entities.User"%>
<%@page import="entities.Movie"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logic.*"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="./styles/styles.css">
<!-- 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"> -->
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


	 
    <% // Me mapeo los datos de la db
    
    	MovieController ctrlMovie = new MovieController();
    	LinkedList<Movie> ml = ctrlMovie.getAll();
    	
	%>


</head>
<body>

	<!-- NAV BAR -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  		<div class="container-fluid">
  		
    		<a class="navbar-brand" href="#">Cine Name</a>
    		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      		<span class="navbar-toggler-icon"></span>
    		</button>
   			<div class="collapse navbar-collapse" id="navbarSupportedContent">
     			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
       				<li class="nav-item">
          			<a class="nav-link active" aria-current="page" href="#">Cartelera</a>
        			</li>
        			<li class="nav-item">
          			<a class="nav-link" href="#">Entradas</a>
        			</li>
        			<li class="nav-item">
          			<a class="nav-link" href="#">Contacto</a>
        			</li>
        			<li>
        				<form class="d-flex" role="search">
        					<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        					<button class="btn btn-outline-success" type="submit">Buscar</button>
      					</form>
        			</li>
      			</ul>
      			
      		</div>
      		
      		<div class="navbar-account ml-4">
      		
      			<a href="#">MI CUENTA</a>
      			<i class="fa-solid fa-user"></i>
      		</div>
      		
  	</div>
</nav>

<!-- END NAVBAR -->

<!-- BEGIN CARROUSEL -->

<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  
  <div class="carousel-inner">
  
  
    <div class="carousel-item active">
      <img src="./assets/img/shrek.png" alt="">
    </div>
    <div class="carousel-item">
      <img src="./assets/img/quepasoayer.png" alt="Chicago">
    </div>
    <div class="carousel-item">
      <img src="ny.jpg" alt="New York" width="1100" height="500">
    </div>
  </div>

  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
	

	

</body>
</html>