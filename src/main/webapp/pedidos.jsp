﻿<!DOCTYPE html>

<%@page import="java.util.List" %>
<%@page import="br.com.pastaeriso.pedidos.Pedido" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="include/header_head.jsp" flush="true"></jsp:include>

<script src="pedidos/pedidos2.js"></script>

<jsp:include page="include/header_head_to_body.jsp">
	<jsp:param name="title" value="Pedidos"/>
	<jsp:param name="active" value="pedidos"/>
</jsp:include>

<div class="btn-group">
  <form>
		<div class="form-group">
			<input type="date" name="data" id="selectData"
				onchange="mudancaDeData()" class="form-control"/>
		</div>
	</form>
</div>

<div class="btn-group mr-2">
	<button
		onclick="preparaNovo()"
		type="button"
		class="btn btn-sm btn-outline-secondary">
		Novo
	</button>
	<button
		onclick="salvarNovo()"
		type="button"
		class="btn btn-sm btn-outline-secondary">
		Salvar
	</button>
</div>

<jsp:include page="include/header_body.jsp" flush="true"></jsp:include>

<datalist id="listaTiposDeEndereco">
	<c:forEach items="${requestScope.tiposDeEndereco}" var="tipo">
		<option>${tipo.tipo}</option>
	</c:forEach>
</datalist>

<datalist id="listaFormaDeContato">
	<c:forEach items="${requestScope.formasDeContato}" var="forma">
		<option>${forma.forma}</option>
	</c:forEach>
</datalist>

<datalist id="listaFormaDePagamento">
	<c:forEach items="${requestScope.formasDePagamento}" var="forma">
		<option>${forma.forma}</option>
	</c:forEach>
</datalist>

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
							<th scope="scope">Nº de pedido</th>
		          <th scope="scope">Horário</th>
		          <th scope="scope">Cliente</th>
		          <th scope="scope">Ver detalhes</th>
		        </tr>
		      </thead>
		      <tbody id="pedidosResumo">

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
					          list="listaClientes"
										onchange="selectClientePorNome()"
										class="form-control form-control-plaintext" readonly>
									<button id="buttonAlterarCliente"
										onclick="mudarCliente()"
										type="button"
										class="btn btn-sm btn-outline-secondary">
										Alterar cliente
									</button>
					      </div>
					    </div>
					  </form>
					  <form id="pedidoForm">
					    <div class="form-row">
					      <div class="form-group col-md-6">
					        <label for="pedidoId">Nº de pedido</label>
					        <input id="pedidoId"
					          type="number"
					          class="form-control form-control-plaintext" readonly>
					      </div>
					      <div class="form-group col-md-6">
					        <label for="datahoraEntrega">Data e hora da entrega</label>
					        <input id="datahoraEntrega"
					          type="datetime-local"
					          class="form-control form-control-plaintext" readonly>
					      </div>
					      <div class="form-group col-md-6">
					        <label for="total">Total</label>
					        <input id="total"
					          type="number"
					          class="form-control form-control-plaintext" readonly>
					      </div>
					      <div class="form-group col-md-6">
					        <label for="trocoPara">Troco para</label>
					        <input id="trocoPara"
					          type="number"
					          class="form-control form-control-plaintext" readonly>
					      </div>
					      <div class="form-group col-md-6">
					        <label for="troco">Troco</label>
					        <input id="troco"
					          type="number"
					          class="form-control form-control-plaintext" readonly>
					      </div>
								<div class="form-group col-md-6">
					        <label for="formaDePagamento">Forma de pagamento</label>
					        <input id="formaDePagamento"
					          type="text"
										list="listaFormaDePagamento"
					          class="form-control form-control-plaintext" readonly>
					      </div>
					      <div class="form-group col-md-6">
					        <label for="comentarios">Comentários</label>
					        <textarea id="comentarios"
					          rows="3"
					          class="form-control form-control-plaintext" readonly></textarea>
					      </div>
					    </div>
					  </form>
					  <form>
					    <div class="form-row">
					      <h3>Contato</h3>
					    </div>
					    <div class="form-row">
								<div class="form-group col-md-6">
					        <label for="contatoNome">Contato nome</label>
					        <input id="contatoNome"
					          type="text"
					          class="form-control form-control-plaintext" readonly>
					      </div>
					      <div class="form-group col-md-6">
					        <label for="contatos">Contato preferido</label>
					        <input id="contatos"
					          type="text"
					          class="form-control form-control-plaintext" readonly>
					      </div>
					      <div class="form-group col-md-6">
					        <label for="contatosForma">Forma de contato</label>
					        <input id="contatosForma"
					          type="text"
										list="listaFormaDeContato"
					          class="form-control form-control-plaintext" readonly>
					      </div>
					    </div>
					  </form>
					  <form>
					    <div class="form-row">
					      <h3>Endereço</h3>
					    </div>
					    <div class="form-row">
								<div class="form-group col-md-6">
					        <label for="enderecoNome">Endereço: nome</label>
					        <input id="enderecoNome"
					          type="text"
					          class="form-control form-control-plaintext" readonly>
					      </div>
								<div class="form-group col-md-6">
					        <label for="tipoDeEndereco">Tipo de endereco</label>
					        <input id="tipoDeEndereco"
					          type="text"
										list="listaTiposDeEndereco"
					          class="form-control form-control-plaintext" readonly>
					      </div>
					      <div class="form-group col-md-6">
					        <label for="rua">Endereço: Rua</label>
					        <input id="rua"
					          type="text"
					          class="form-control form-control-plaintext" readonly>
					      </div>
					      <div class="form-group col-md-6">
					        <label for="numero">Numero</label>
					        <input id="numero"
					          type="text"
					          class="form-control form-control-plaintext" readonly>
					      </div>
					      <div class="form-group col-md-6">
					        <label for="bairro">Bairro</label>
					        <input id="bairro"
					          type="text"
					          class="form-control form-control-plaintext" readonly>
					      </div>
					      <div class="form-group col-md-6">
					        <label for="complemento">Complemento</label>
					        <input id="complemento"
					          type="text"
					          class="form-control form-control-plaintext" readonly>
					      </div>
					      <div class="form-group col-md-6">
					        <label for="pontoDeReferencia">Ponto de referência</label>
					        <input id="pontoDeReferencia"
					          type="text"
					          class="form-control form-control-plaintext" readonly>
					      </div>
					      <div class="form-group col-md-6">
					        <label for="enderecoComentarios">Comentarios (endereço)</label>
					        <input id="enderecoComentarios"
					          type="text"
					          class="form-control form-control-plaintext" readonly>
					      </div>
					    </div>
					  </form>
					  <table class="table table-hover table-responsive-lg" style="width: 700px">
					    <thead>
					      <tr>
					        <!--<th scope="scope" style="width: 10%">#</th>-->
					        <th scope="scope" style="width: 50%">Produto</th>
					        <th scope="scope" style="width: 12%">Qtd.</th>
					        <th scope="scope" style="width: 13%">Sub.</th>
					        <th scope="scope" style="width: 20%">Comentarios</th>
					        <th scope="scope" style="width: 5%">Ações</th>
					      </tr>
					    </thead>
					    <tbody id="pedidoItensBody">
					    </tbody>
					  </table>
						<button
							id="botaoAdicionarItem"
							onclick="addItemLinha()"
							type="button"
							class="btn btn-sm btn-outline-secondary">
							Adicionar item
						</button>
					</div>
		  </div>
		</div>
	</div>

<jsp:include page="include/footer.jsp" flush="true"></jsp:include>
