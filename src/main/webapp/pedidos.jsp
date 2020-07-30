<!DOCTYPE html>

<%@page import="java.util.List" %>
<%@page import="br.com.pastaeriso.pedidos.Pedido" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="include/header_head.jsp" flush="true"></jsp:include>

<style>
	.pedidos {
		display: none;
	}
	.datas {
		display: none;
	}
</style>
<script>
	var pedidos = document.getElementsByClassName('pedidos');
	var datas = document.getElementsByClassName('datas');
	function hideAllPedidos (panels) {
	  var i;
	  for (i = 0; i < panels.length; i+= 1){
		pedidos[i].style.display = "none";
	  }
	}
	function showPanel(name,isDatas) {
		if(isDatas){
			hideAllPanels(datas);
		} else {
			hideAllPanels(pedidos);
		}
		
		document.getElementById(name).style.display = "block";
	}

</script>

<jsp:include page="include/header_head_to_body.jsp">
	<jsp:param name="title" value="Pedidos"/>
	<jsp:param name="active" value="pedidos"/>
</jsp:include>

<jsp:include page="include/header_body.jsp" flush="true"></jsp:include>



<c:forEach items="${requestScope.map.keys()}" var="data">
	<c:set var="pedidos" scope="request" value="${requestScope.map.get(data)}" />
	<div id="pedidos${data}" class="container-fluid datas">
		<div class="row">
			<div class="col-6 col-md-4">
				<table class="table-sm">
					<thead>
						<tr>
							<th scope="scope">Horário</th>
							<th scope="scope">Cliente</th>
							<th scope="scope">Ver detalhes</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.pedidos}" var="pedido">
						<tr>
							<td>${pedido.horarioEntrega}</td>
							<td>${pedido.cliente}</td>
							<td>
								<button type="button" 
										class="btn btn-primary"
										onClick="showPanel('pedido${pedido.id}')">
									Detalhes
								</button>
							</td>
						</tr>	
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-12 col-md-8">
				<c:set var="primeiro" scope="request" value="${true}"/>
				<c:forEach items="${requestScope.pedidos}" var="pedido">
					<div id="pedido${pedido.id}" class='pedidos'>
						<ul>
							<li>Id: ${pedido.id}</li>
							<li>Cliente: ${pedido.cliente}</li>
							<li>Contato: ${pedido.contato}</li>
							<li>Horario entrega: ${pedido.horarioEntrega}</li>
							<li>Troco para: ${pedido.trocoPara}</li>
						</li>
					</div>
					<c:set var="primeiro" value="${false}"/>
				</c:forEach>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="include/footer.jsp" flush="true"></jsp:include>