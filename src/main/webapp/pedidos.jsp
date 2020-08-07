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
	<c:forEach items="${request.clientes}" var="cliente">
		<option>${cliente.nome}</option>
	</c:forEach>
</datalist>
<datalist id="listaProdutos">
	<c:forEach items="${request.produtos}" var="produto">
		<option>${produto.nome}</option>
	</c:forEach>
</datalist>
<c:forEach items="${requestScope.map}" var="tupla">
	<c:set var="pedidos" scope="request" value="${tupla.value}" />
	<div id="dia${tupla.key}" class="container-fluid datas">
		<div class="row">
			<div class="col-6 col-md-4">
				<table class="table-sm table-hover">
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
							<td>${pedido.horarioEntrega}</td>
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
		</div>
		<div class="row">
			<div class="col-12 col-md-8">
				<c:set var="primeiro" scope="request" value="${true}"/>
				<c:forEach items="${requestScope.pedidos}" var="pedido">
					<div id="pedido${pedido.id}" class='pedidos'>
						<form>
							<div class="form-row">
								<div class="form-group col-md-6">
						      <label for="nomeCliente${pedido.id}">Cliente</label>
						      <input id="nomeCliente${pedido.id}"
										type="text"
										list="listaClientes"
										form="pedidoForm${pedido.id}"
										class="form-control"
										value="${pedido.cliente.nome}">
						    </div>
							</div>
						</form>
						<form id="pedidoForm${pedido.id}">
							<div class="form-row">
						    <div class="form-group col-md-6">
						      <label for="pedidoId${pedido.id}">Id</label>
						      <input id="pedidoId${pedido.id}"
										type="number"
										class="form-control"
										form="pedidoForm${pedido.id}"
										value="${pedido.id}">
						    </div>
								<div class="form-group col-md-6">
						      <label for="horarioEntrega${pedido.id}">Data e hora da entrega</label>
						      <input id="horarioEntrega${pedido.id}"
										type="datetime-local"
										form="pedidoForm${pedido.id}"
										class="form-control"
										value="${pedido.horarioEntrega}">
						    </div>
								<div class="form-group col-md-6">
						      <label for="total${pedido.id}">Total</label>
						      <input id="total${pedido.id}"
										type="number"
										form="pedidoForm${pedido.id}"
										class="form-control"
										value="${pedido.total}" readonly>
						    </div>
								<div class="form-group col-md-6">
						      <label for="trocoPara${pedido.id}">Troco para</label>
						      <input id="trocoPara${pedido.id}"
										type="number"
										form="pedidoForm${pedido.id}"
										class="form-control"
										value="${pedido.trocoPara}">
						    </div>
								<div class="form-group col-md-6">
						      <label for="troco${pedido.id}">Troco</label>
						      <input id="troco${pedido.id}"
										type="number"
										form="pedidoForm${pedido.id}"
										class="form-control"
										value="${pedido.troco}" readonly>
						    </div>
								<div class="form-group col-md-6">
						      <label for="comentarios${pedido.id}">Comentários</label>
						      <input id="comentarios${pedido.id}"
										type="textarea"
										form="pedidoForm${pedido.id}"
										class="form-control"
										value="${pedido.comentarios}">
						    </div>
							</div>
						</form>
						<form>
							<div class="form-row">
								<h3>Contato</h3>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="contatos${pedido.id}">Contato preferido</label>
									<input id="contatos${pedido.id}"
										type="text"
										class="form-control"
										form="pedidoForm${pedido.id}"
										value="${pedido.cliente.contatoPreferido.contato}">
								</div>
								<div class="form-group col-md-6">
									<label for="contatosForma${pedido.id}">Forma de contato</label>
									<input id="contatosForma${pedido.id}"
										type="text"
										form="pedidoForm${pedido.id}"
										class="form-control"
										value="${pedido.cliente.contatoPreferido.forma}">
								</div>
							</div>
						</form>
						<form>
							<div class="form-row">
								<h3>Endereço</h3>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
						      <label for="rua${pedido.id}">Endereço: Rua</label>
						      <input id="rua${pedido.id}"
										type="text"
										class="form-control"
										value="${pedido.enderecoEntrega.rua}" >
						    </div>
								<div class="form-group col-md-6">
						      <label for="numero${pedido.id}">Numero</label>
						      <input id="numero${pedido.id}"
										type="text"
										class="form-control"
										value="${pedido.enderecoEntrega.numero}" >
						    </div>
								<div class="form-group col-md-6">
						      <label for="bairro${pedido.id}">Bairro</label>
						      <input id="bairro${pedido.id}"
										type="text"
										class="form-control"
										value="${pedido.enderecoEntrega.bairro}">
						    </div>
								<div class="form-group col-md-6">
						      <label for="complemento${pedido.id}">Complemento</label>
						      <input id="complemento${pedido.id}"
										type="text"
										class="form-control"
										value="${pedido.enderecoEntrega.complemento}">
						    </div>
								<div class="form-group col-md-6">
						      <label for="pontoDeReferencia${pedido.id}">Ponto de referência</label>
						      <input id="pontoDeReferencia${pedido.id}"
										type="text"
										class="form-control"
										value="${pedido.enderecoEntrega.pontoDeReferencia}">
						    </div>
								<div class="form-group col-md-6">
						      <label for="comentarios${pedido.id}">Comentarios (endereço)</label>
						      <input id="comentarios${pedido.id}"
										type="text"
										class="form-control"
										value="${pedido.enderecoEntrega.comentarios}">
						    </div>
							</div>
						</form>
						<table class="table table-hover table-responsive-lg">
							<thead>
								<tr>
									<th scope="scope">#</th>
									<th scope="scope">Produto</th>
									<th scope="scope">Qtd.</th>
									<th scope="scope">Subtotal</th>
									<th scope="scope">Comentarios</th>
									<th scope="scope">Ações</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pedido.itens}" var="item">
									<form id="pedidoForm${pedido.id}itemForm${item.id}">
										<tr>
											<jsp:include page="pedidos/pedidoItens/view.jsp" flush="true">
												<jsp:param name="item" value="${item}"/>
											</jsp:include>
										</tr>
									</form>
								</c:forEach>
							</tbody>
						</table>
						<c:set var="primeiro" value="${false}"/>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</c:forEach>

<jsp:include page="include/footer.jsp" flush="true"></jsp:include>
