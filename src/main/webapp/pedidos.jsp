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

<div class="btn-group">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span data-feather="calendar"></span>
		<div id="dataAtual">Datas</div>
  </button>
  <div class="dropdown-menu dropdown-menu-left" aria-labelledby="dropdownMenuButton">
		<c:forEach items="${datas}" var="data">
			<a class="dropdown-item" onClick="showData('${data}')">
				${data}
			</a>
		</c:forEach>
  </div>
</div>

<div class="btn-group mr-2">
	<button type="button" class="btn btn-sm btn-outline-secondary">Compartilhar</button>
	<button type="button" class="btn btn-sm btn-outline-secondary">Exportar</button>
</div>

<jsp:include page="include/header_body.jsp" flush="true"></jsp:include>

<datalist id="listaClientes">
	<c:forEach items="${requestScope.clientes}" var="cliente">
		<option>${cliente.nome}</option>
	</c:forEach>
</datalist>

<datalist id="listaProdutos">
	<c:forEach items="${requestScope.produtos}" var="produto">
		<option>${produto.nome}</option>
	</c:forEach>
</datalist>

<c:forEach items="${requestScope.map}" var="tupla">
	<c:set var="pedidos" scope="request" value="${tupla.value}" />
	<div id="dia${tupla.key}" class="container-fluid datas">
		<c:import url="pedidos/pedidosPorDataView.jsp"/>
	</div>
</c:forEach>

<jsp:include page="include/footer.jsp" flush="true"></jsp:include>
