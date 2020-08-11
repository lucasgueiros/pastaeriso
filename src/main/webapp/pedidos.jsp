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
		/*$.ajax({
			url: '/selectPedidoPorId?id='+pedidoId,
			type: 'post',
			dataType: 'json',
			contentType: 'application/json',
			success: function (data) {
				atualizarPedido(data);
			}
		});*/
		string = localStorage.getItem("pedido" + pedidoId);
		pedido = JSON.parse(string);
		atualizarPedido(pedido);
	}

	function atualizarPedido(pedido) {
		$("#nomeCliente").val(pedido.cliente.nome);
		$("#pedidoId").val(pedido.id);
		$("#total").val(pedido.total);
		$("#datahoraEntrega").val(pedido.datahoraEntrega);
		$("#trocoPara").val(pedido.trocoPara);
		$("#comentarios").val(pedido.comentarios);
		$("#troco").val( pedido.troco);
		$("#formaDePagamento").val( pedido.formaDePagamento);
		$("#contatoNome").val( pedido.cliente.contatoPreferencial.nome);
		$("#contatos").val( pedido.cliente.contatoPreferencial.contato);
		$("#contatosForma").val( pedido.cliente.contatoPreferencial.forma.forma);
		$("#rua").val( pedido.enderecoEntrega.rua);
		$("#numero").val( pedido.enderecoEntrega.numero);
		$("#bairro").val( pedido.enderecoEntrega.bairro);
		$("#complemento").val( pedido.enderecoEntrega.complemento);
		$("#pontoDeReferencia").val( pedido.enderecoEntrega.pontoDeReferencia);
		$("#enderecoComentarios").val( pedido.enderecoEntrega.comentarios);
		var string = "";
		pedido.itens.forEach((item, i) => {
			string += "<tr id=\"rowitem" + item.id + "\">";
			string += "<td>";
			string += "<div class=\"form-group\">";
			string += "<input id=\"produto" + item.id + "\"";
			string += " type=\"text\"";
			string += " list=\"listaProdutos\"";
			string += " value=\""+ item.produto +"\"";
			string += " class=\"form-control\">";
			string += "</div>";
			string += "</td>";
			string += "<td>";
			string += "<div class=\"form-group\">";
			string += "<input id=\"quantidade" + item.id + "\"";
			string += " type=\"number\"";
			string += " value=\""+ item.quantidade +"\"";
			string += "class=\"form-control\">";
			string += "</div>";
			string += "</td>";
			string += "<td>";
			string += "<div class=\"form-group\">";
			string += "<input id=\"subtotal" + item.id + "\"";
			string += " value=\""+ item.subtotal +"\"";
			string += " type=\"number\"";
			string += "class=\"form-control\" readonly>";
			string += "</div>";
			string += "</td>";
			string += "<td>";
			string += "<div class=\"form-group\">";
			string += "<input id=\"itemComentarios" + item.id + "\"";
			string += "type=\"text\"";
			string += " value=\""+ item.comentarios +"\"";
			string += "class=\"form-control\">";
			string += "</div>";
			string += "</td>";
			string += "</tr>";
		});
		$("#pedidoItensBody").html(string);
	}

	function mudancaDeData() {
		var dataSelecionada = $("#selectData").val();
		$.ajax({
			url: '/selectPedidosPorData?data=' + dataSelecionada,
			type: 'post',
			dataType: 'json',
			contentType: 'application/json',
			success: function (data) {
				salvarPedidos(data);
				atualizarPedidosResumo(data);
				atualizarPedido(data[0]);
			}
		});
	}

	function atualizarPedidosResumo(pedidos){
		var string = "";
		pedidos.forEach((pedido, i) => {
			string += "<tr id=\"linhaPedido\" class=\"linhaPedido\">";
			string += "<td>";
			string += "" + pedido.horaEntrega;
			string += "</td>";
			string += "<td>";
			string += "" + pedido.cliente.nome;//cliente.nome
			string += "</td>";
			string += "<td>";
			string += "<button type=\"button\"";
			string += " class=\"btn btn-primary\"";
			string += " onClick=\"mostrarPedido(\'";
			string += "" + pedido.id;//id
			string += "\')\">";
			string += "Detalhes";
			string += "</button>";
			string += "</td>";
			string += "</tr>";
		});
		$("#pedidosResumo").html(string);
	}

	function salvarPedidos(pedidos) {
		pedidos.forEach(function (pedido){
			string = JSON.stringify(pedido);
			localStorage.setItem("pedido" + pedido.id,string);
		});
	}

	$(document).ready(function () {
		var data = new Date();
		var stringData = data.getFullYear().toString() + '-' + (data.getMonth() + 1).toString().padStart(2, 0) +
    '-' + data.getDate().toString().padStart(2, 0);
		$("#selectData").val(stringData);
		mudancaDeData();
	});
</script>

<jsp:include page="include/header_head_to_body.jsp">
	<jsp:param name="title" value="Pedidos"/>
	<jsp:param name="active" value="pedidos"/>
</jsp:include>

<div class="btn-group">
  <form>
		<div class="form-group">
			<input type="date" name="data" id="selectData"
				onchange="mudancaDeData()"/>
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
										class="form-control">
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
					        <label for="formaDePagamento">Forma de pagamento</label>
					        <input id="formaDePagamento"
					          type="text"
					          class="form-control">
					      </div>
					      <div class="form-group col-md-6">
					        <label for="comentarios">Comentários</label>
					        <input id="comentarios"
					          type="text"
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
					        <label for="contatoNome">Contato nome</label>
					        <input id="contatoNome"
					          type="text"
					          class="form-control">
					      </div>
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
					        <!--<th scope="scope" style="width: 10%">#</th>-->
					        <th scope="scope" style="width: 50%">Produto</th>
					        <th scope="scope" style="width: 20%">Qtd.</th>
					        <th scope="scope" style="width: 20%">Subtotal</th>
					        <th scope="scope" style="width: 50%">Comentarios</th>
					        <th scope="scope" style="width: 20%">Ações</th>
					      </tr>
					    </thead>
					    <tbody id="pedidoItensBody">
					    </tbody>
					  </table>
					</div>
		  </div>
		</div>
	</div>

<jsp:include page="include/footer.jsp" flush="true"></jsp:include>
