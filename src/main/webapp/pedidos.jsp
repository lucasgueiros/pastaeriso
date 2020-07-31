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
	function hideAll(panels) {
	  var i;
	  for (i = 0; i < panels.length; i+= 1){
			panels[i].style.display = "none";
	  }
	}
	function showData(data) {
		hideAll(datas);
		document.getElementById("dataAtual").innerHtml = data;
		document.getElementById("dia" + data).style.display = "block";
	}
	function showPedido(id){
		hideAll(pedidos);
		document.getElementById("pedido" + id).style.display = "block";
		document.getElementsByClassName("table-light")[0].classList.remove("table-light");
		document.getElementById("linhaPedido" + id).classList.add("table-light");
	}
</script>

<jsp:include page="include/header_head_to_body.jsp">
	<jsp:param name="title" value="Pedidos"/>
	<jsp:param name="active" value="pedidos"/>
</jsp:include>

<div class="btn-group mr-2">
	<button type="button" class="btn btn-sm btn-outline-secondary">Compartilhar</button>
	<button type="button" class="btn btn-sm btn-outline-secondary">Exportar</button>
</div>

<div class="btn-group">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span data-feather="calendar"></span>
		<p id="dataAtual">Datas</p>
  </button>
  <div class="dropdown-menu dropdown-menu-left" aria-labelledby="dropdownMenuButton">
		<c:forEach items="${datas}" var="data">
			<a class="dropdown-item" onClick="showData('${data}')">
				${data}
			</a>
		</c:forEach>
  </div>
</div>

<jsp:include page="include/header_body.jsp" flush="true"></jsp:include>

<c:forEach items="${requestScope.map}" var="tupla">
	<c:set var="pedidos" scope="request" value="${tupla.value}" />
	<div id="dia${tupla.key}" class="container-fluid datas">
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
						<c:forEach items="${tupla.value}" var="pedido">
						<tr id="linhaPedido${pedido.id}" class="linhaPedido">
							<td>${pedido.horarioSomenteEntrega}</td>
							<td>${pedido.cliente.nome}</td>
							<td>
								<button type="button"
										class="btn btn-primary"
										onClick="showPedido('${pedido.id}')">
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
							<li>Cliente: ${pedido.cliente.nome}</li>
							<li>Endereço: ${pedido.enderecoEntrega}</li>
							<li>Entrega: às ${pedido.horarioSomenteEntrega} do dia ${pedido.dataEntrega}</li>
							<li>Troco para: R$${pedido.trocoPara}</li>
						</li>
					</div>
					<c:set var="primeiro" value="${false}"/>
				</c:forEach>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="include/footer.jsp" flush="true"></jsp:include>
