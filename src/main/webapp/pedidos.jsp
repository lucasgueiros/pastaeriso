<!DOCTYPE html>

<%@page import="java.util.List" %>
<%@page import="br.com.pastaeriso.pedidos.Pedido" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="include/header_head.jsp" flush="true"></jsp:include>

<script>
	function pedidoItemCheckUpdate (check) {
		if(check.checked == true) {
			document.getElementById(check.id+'row').classList.remove("table-active");
		} else {
			document.getElementById(check.id+'row').classList.add("table-active");
		}
	}
	function mostrarPedido(pedidoId) {
		$.ajax({
			url: '/selectPedidoPorId?id='+pedidoId,
			type: 'post',
			dataType: 'json',
			contentType: 'application/json',
			success: function (data) {
				atualizarPedido(data);
			}
		});
	}

	function atualizarPedido(pedido) {
		$("#nomeCliente").val(pedido.cliente.nome);
		$("#pedidoId").val(pedido.id);
		$("#total").val(pedido.total);
		$("#trocoPara").val(pedido.trocoPara);
		$("#comentarios").val(pedido.comentarios);
		$("#troco").val( pedido.troco);
		//$("#contatos").val( pedido.contato.contato);
		//$("#contatosForma").val( pedido.contato.contatosForma);
		$("#rua").val( pedido.enderecoEntrega.rua);
		$("#numero").val( pedido.enderecoEntrega.numero);
		$("#bairro").val( pedido.enderecoEntrega.bairro);
		$("#complemento").val( pedido.enderecoEntrega.complemento);
		$("#pontoDeReferencia").val( pedido.enderecoEntrega.pontoDeReferencia);
		$("#enderecoComentarios").val( pedido.enderecoEntrega.enderecoComentarios);
	}
</script>

<jsp:include page="include/header_head_to_body.jsp">
	<jsp:param name="title" value="Pedidos"/>
	<jsp:param name="active" value="pedidos"/>
</jsp:include>

<div class="btn-group">
  <form>
		<div class="form-group">
			<input type="date" name="data" id="selectData"/>
		</div>
	</form>
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
		        <c:forEach items="${requestScope.pedidos}" var="pedido">
		          <tr id="linhaPedido" class="linhaPedido">
		            <td>${pedido.horarioEntrega}</td>
		            <td>${pedido.cliente.nome}</td>
		            <td>
		              <button type="button"
		                  class="btn btn-primary"
		                  onClick="mostrarPedido('${pedido.id}')">
		                Detalhes
		              </button>
		            </td>
		          </tr>
		        </c:forEach>
						<tr>
							<td colspan="3">
								<button>
									Novo pedido
								</button>
								NOVO
							</td>
						</tr>
		      </tbody>
		    </table>
		  </div>
		</div>
		<div class="row">
		  <div class="col-12 col-md-8">
		      <c:set var="pedido" scope="request" value="${pedido}"/>
					<div id="pedido" class='pedidos'>
					  <form>
					    <div class="form-row">
					      <div class="form-group col-md-6">
					        <label for="nomeCliente">Cliente</label>
					        <input id="nomeCliente"
					          type="text"
					          list="listaClientes">
					      </div>
					    </div>
					  </form>
					  <form id="pedidoForm">
					    <div class="form-row">
					      <div class="form-group col-md-6">
					        <label for="pedidoId">Id</label>
					        <input id="pedidoId"
					          type="number"
					          class="form-control">
					      </div>
					      <div class="form-group col-md-6">
					        <label for="datahoraEntrega">Data e hora da entrega</label>
					        <input id="datahoraEntrega"
					          type="datetime-local"
					          class="form-control">
					      </div>
					      <div class="form-group col-md-6">
					        <label for="total">Total</label>
					        <input id="total"
					          type="number"
					          class="form-control" readonly>
					      </div>
					      <div class="form-group col-md-6">
					        <label for="trocoPara">Troco para</label>
					        <input id="trocoPara"
					          type="number"
					          class="form-control">
					      </div>
					      <div class="form-group col-md-6">
					        <label for="troco">Troco</label>
					        <input id="troco"
					          type="number"

					          class="form-control" readonly>
					      </div>
					      <div class="form-group col-md-6">
					        <label for="comentarios">Comentários</label>
					        <input id="comentarios"
					          type="textarea"

					          class="form-control">
					      </div>
					    </div>
					  </form>
					  <form>
					    <div class="form-row">
					      <h3>Contato</h3>
					    </div>
					    <div class="form-row">
					      <div class="form-group col-md-6">
					        <label for="contatos">Contato preferido</label>
					        <input id="contatos"
					          type="text"
					          class="form-control">
					      </div>
					      <div class="form-group col-md-6">
					        <label for="contatosForma">Forma de contato</label>
					        <input id="contatosForma"
					          type="text"
					          class="form-control">
					      </div>
					    </div>
					  </form>
					  <form>
					    <div class="form-row">
					      <h3>Endereço</h3>
					    </div>
					    <div class="form-row">
					      <div class="form-group col-md-6">
					        <label for="rua">Endereço: Rua</label>
					        <input id="rua"
					          type="text"
					          class="form-control">
					      </div>
					      <div class="form-group col-md-6">
					        <label for="numero">Numero</label>
					        <input id="numero"
					          type="text"
					          class="form-control">
					      </div>
					      <div class="form-group col-md-6">
					        <label for="bairro">Bairro</label>
					        <input id="bairro"
					          type="text"
					          class="form-control">
					      </div>
					      <div class="form-group col-md-6">
					        <label for="complemento">Complemento</label>
					        <input id="complemento"
					          type="text"
					          class="form-control">
					      </div>
					      <div class="form-group col-md-6">
					        <label for="pontoDeReferencia">Ponto de referência</label>
					        <input id="pontoDeReferencia"
					          type="text"
					          class="form-control">
					      </div>
					      <div class="form-group col-md-6">
					        <label for="enderecoComentarios">Comentarios (endereço)</label>
					        <input id="enderecoComentarios"
					          type="text"
					          class="form-control">
					      </div>
					    </div>
					  </form>
					  <table class="table table-hover table-responsive-lg">
					    <thead>
					      <tr>
					        <th scope="scope" style="width: 10%">#</th>
					        <th scope="scope" style="width: 50%">Produto</th>
					        <th scope="scope" style="width: 10%">Qtd.</th>
					        <th scope="scope" style="width: 10%">Subtotal</th>
					        <th scope="scope" style="width: 50%">Comentarios</th>
					        <th scope="scope" style="width: 20%">Ações</th>
					      </tr>
					    </thead>
					    <tbody>
								<form id="pedidoItemForm">
					          <tr id="check1row">
											<td>
												<div class="form-group">
													<input
														id="check1"
														class="form-check-input"
														type="checkbox"
														onchange="pedidoItemCheckUpdate(this)"/>
												</div>
											</td>
											<td>
											  <div class="form-group">
											    <input id="produto1"
											      type="text"
											      list="listaProdutos"
											      class="form-control">
											  </div>
											</td>
											<td>
											  <div class="form-group">
											    <input id="quantidade1"
											      type="number"
											      class="form-control">
											  </div>
											</td>
											<td>
											  <div class="form-group">
											    <input id="subtotal1"
											      type="number"
											      class="form-control" readonly>
											  </div>
											</td>
											<td>
											  <div class="form-group">
											    <input id="itemComentarios1"
											      type="text"
											      class="form-control">
											  </div>
											</td>
					          </tr>
					        </form>
					    </tbody>
					  </table>
					</div>
		  </div>
		</div>
	</div>

<jsp:include page="include/footer.jsp" flush="true"></jsp:include>
