<%@page import="entities.Role"%>
<%@page import="entities.User"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%
	User u = (User)session.getAttribute("usuario");
%>

<nav class="navbar" style="background-color: #000029;">
	<div class="site-menu">
		<ul>
			<li>
				<a href="/TPI-Cine/views/pages/index.jsp">CARTELERA</a>
			</li>
			<li>
				<a href="/TPI-Cine/views/pages/entradas.jsp" onclick="removeSessionAtbs()">ENTRADAS</a>
			</li>
			<% if(u!=null){
				
				if(u.esTaquillero() || u.estaAutorizado()){ %>
			<li>
				<a href="/TPI-Cine/views/pages/abmcShow.jsp">ADMINISTRAR FUNCIONES</a>
			</li>
			<li>
				<a href="/TPI-Cine/views/pages/abmcMovie.jsp">ADMINISTRAR PELICULAS</a>
			</li>
			<%} if (u.estaAutorizado()){ %>
			<li>
				<a href="/TPI-Cine/views/pages/adminPanel.jsp">PANEL ADMINISTRADOR</a>
			</li>
				<% } 
			}%>
		</ul>
	</div>
	
	<%if(u==null){%>
	
	<div id="login_link" class="user-menu">
       	<div class="navbar-account">
       		
           	<span id="ctl00_lblLogin"><a href="/TPI-Cine/views/pages/login.jsp"> Inicia Sesión! </a></span> 
           	<i class="fa fa-user" aria-hidden="true"></i>
           	
         </div>
   	</div>
      	
     <%} else{%>
     
     <div id="login_link" class="user-menu">
     	<div class="navbar-account">
     		<label><%=u.getName()+" "+ u.getSurname()%></label>
     		<i class="fa fa-user" aria-hidden="true"></i>
     	</div>
     	
     	
      	<div class="btn-group" role="group" aria-label="Button group with nested dropdown">
			 <a type="button" class="btn" href="/TPI-Cine/views/pages/MiCuenta.jsp" style="color:white;">Mi Cuenta</a>
  			 <a type="button" class="btn" href="/TPI-Cine/src/cerrarSesion" style="color:red;">Cerrar Sesión</a>
		</div>
    </div>
     
     <%} %>

</nav>

