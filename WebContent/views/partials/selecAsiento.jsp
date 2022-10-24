
<%@page import="entities.Show"%>
<%@page import="logic.RoomTypeController"%>
<%@page import="entities.RoomType"%>
<%@page import="entities.Ubication"%>
<%@page import="java.util.LinkedList"%>
<%@page import="logic.UbicationController"%>
<%

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
		System.out.println(asientos[u.getRow()][u.getCol()]);
	}
	
		
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
					
						<% for(int j=1; j <= rt.getSizeCol(); j++){ // Character fila = 'A'; %>
						
							<% if(asientos[i][j].getTicket() == null){ %>	
							
								<td><%=asientos[i][j].getRow()%>-<%=asientos[i][j].getCol()%>   <a href="#" style="color: blue"><i class="fa-solid fa-couch"></i> </a></td>
								
							<%} else { %>
								<td><%=asientos[i][j].getRow()%>-<%=asientos[i][j].getCol()%> 	<i class="fa-solid fa-xmark" style="color: red"></i> </td>
							<%} %>
						
						<%} %>
						
						</tr>	
					<%} %>
					
					
						
				</tbody>
			
			
			
			</table>
		
		
		
		
		
		
		</div>
	
	
	</div>

