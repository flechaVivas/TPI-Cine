<%@page import="entities.Role"%>
<%@page import="entities.User"%>

<%
		User u = new User();
		u=(User)session.getAttribute("usuario");
 %>
 
<script type="text/javascript">

//  	function removeSessionAtbs() {
<%-- 		<% session.removeAttribute("show"); %> --%>
// 		return 0;
//  	}

</script>

<nav class="navbar">
	<div class="site-menu">
		<ul>
			<li>
				<a href="#">CARTELERA</a>
			</li>
			<li>
				<a href="/TPI-Cine/views/pages/entradas.jsp" onclick="removeSessionAtbs()">ENTRADAS</a>
			</li>
			<li>
				<a href="#">CONTACTO</a>
			</li>
			<% if(u!=null){
				if(u.getRole().getDescription().equals("taquillero")){ %>
			<li>
				<a href="#">ADMINISTRAR FUNCIONES</a>
			</li>
			<li>
				<a href="#">ADMINISTRAR PELICULAS</a>
			</li>
			<%}
				} %>
		</ul>
	</div>
	
	<%if(u==null){%>
	
	<div id="login_link" class="user-menu">
       	<div class="navbar-account">
       		
           	<span id="ctl00_lblLogin"><a href="login.jsp"> Inicia Sesión! </a></span> 
           	<i class="fa-solid fa-user"></i>
          	</div>
      	</div>
      	
     <%} else{%>
     
     <div id="login_link" class="user-menu">
       	<div class="navbar-account">
           	<span id="ctl00_lblLogin"><a href="administrarCuenta.jsp"><%=u.getName()+" "+u.getSurname()%> </a></span> 
           	<i class="fa-solid fa-user"></i>
      	</div>
    </div>
     
     <%} %>

</nav>

