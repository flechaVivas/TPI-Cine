
<%@page import="entities.User"%>
<%@page import="entities.Show"%>
<%@page import="logic.RoomTypeController"%>
<%@page import="entities.RoomType"%>
<%@page import="entities.Ubication"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logic.UbicationController"%>
<%

	User user = (User)session.getAttribute("usuario");
	
	if(user == null){
		response.sendRedirect("/TPI-Cine/views/pages/login.jsp");
	}

	Show s = (Show)session.getAttribute("show");

	RoomType rt = (RoomType)session.getAttribute("tipoSala");
	RoomTypeController ctrlRT = new RoomTypeController();
	
	rt = ctrlRT.getOne(rt);

	UbicationController ctrlUbi = new UbicationController();
	LinkedList<Ubication> ubicaciones = ctrlUbi.getByShow(s);
	
	Ubication[][] asientos = new Ubication[rt.getSizeRow()+1][rt.getSizeCol()+1]; 
	
	for(int i=1; i <= rt.getSizeRow(); i++){
		for(int j=1; j <= rt.getSizeCol(); j++){ 
			Ubication u = new Ubication();
			u.setRow(i);
			u.setCol(j);
			asientos[i][j] = u;
		}
	}
	
	for(Ubication u : ubicaciones){
		asientos[u.getRow()][u.getCol()] = u;
	}
	
	request.setAttribute("asientos", asientos);
	
	LinkedList<Ubication> ubicElegidas = (LinkedList<Ubication>)request.getSession(false).getAttribute("ubicElegidas");
		
%>


	<div class="container mt4">
		
		<div class="table-responsive">
			<h3>Seleccione un Asiento</h3>
			<table class="table table-responsive table-borderless">
				<thead>
					<tr> <h2 style="text-align: center; border: 1px solid black">PANTALLA</h2> </tr>
				</thead>
				<tbody>
					
					<% for(int i=1; i <= rt.getSizeRow(); i++){ %>
					
						<tr>
					
						<% for(int j=1; j <= rt.getSizeCol(); j++){  Character fila = '@'; %>
						
							<% if(asientos[i][j].getTicket() == null ){ %>	
							
								<td><%=Character.toString(fila+i)%>-<%=asientos[i][j].getCol()%>   <a 
								href="/TPI-Cine/src/servlet/EntradasServlet?step=asiento&fila=<%=asientos[i][j].getRow()%>&col=<%=asientos[i][j].getCol()%>"
								style="color: blue" type="submit"><i class="fa-solid fa-couch"></i> </a></td>
								
							<%} else { %>
								<td><%=Character.toString(fila+i)%>-<%=asientos[i][j].getCol()%> 	<i class="fa-solid fa-xmark" style="color: red"></i> </td>
							<%} %>
						
						<%} %>
						
						</tr>	
					<%} %>
					
						
				</tbody>
			
			</table>
		
		</div>
	
	</div>

