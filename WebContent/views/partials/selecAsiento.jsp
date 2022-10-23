
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
	LinkedList<Ubication> asientos = ctrlUbi.getByShow(s);
	
	
%>


	<div class="container mt4">
		
		<div class="table-responsive">
			<h3>Seleccione un Asiento</h3>
			<table class="table table-responsive table-borderless">
				<thead>
					<tr><h2 style="text-align: center; border: 1px solid black">PANTALLA</h2></tr>
				</thead>
				<tbody>
					<% for(int i=1; i <= rt.getSizeRow(); i++){ %>
						<tr>
							<% for(int j=1; j <= rt.getSizeCol(); j++){ %>
							
<%-- 								<% if (asientos.get(i).getTicket() != null){ %> --%>
								
<!-- 									<td><a> <i class="fa-solid fa-couch"></i> </a></td> -->
								
<%-- 								<%} %> --%>
								
							<%} %>
							
						</tr>
							
					<%} %>
				</tbody>
			
			
			
			</table>
		
		
		
		
		
		
		</div>
	
	
	
	
	
	
	
	
	
	
	
	
	</div>

