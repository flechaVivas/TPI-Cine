<!DOCTYPE html>
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
	<link rel="stylesheet" href="./styles/styles.css"
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

<div class="container">
  <h2>Carousel Example</h2>  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
      <li data-target="#myCarousel" data-slide-to="5"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="./assets/img/quepasoayer.png" alt="Los Angeles" style="width:100%;">
      </div>

      <div class="item">
        <img src="./assets/img/el_pianista.png" alt="Chicago" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="./assets/img/spiderman_poster-1280_720.jpg" alt="New york" style="width:100%;">
      </div>
      
      <div class="item">
        <img src="./assets/img/shrek.png" alt="shrek" style="width:100%;">
      </div>
      
      <div class="item">
        <img src="./assets/img/8mile.png" alt="New york" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
	

	

</body>
</html>