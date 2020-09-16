<!DOCTYPE html>

<%@page import="java.util.List" %>
<%@page import="br.com.pastaeriso.pedidos.Pedido" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="include/header_head.jsp" flush="true"></jsp:include>

<script src="receitas/receitas.js"></script>

<jsp:include page="include/header_head_to_body.jsp">
	<jsp:param name="title" value="Receitas"/>
	<jsp:param name="active" value="receitas"/>
</jsp:include>

<jsp:include page="include/header_body.jsp" flush="true"></jsp:include>

<datalist id="listaReceitas">
	<c:forEach items="${requestScope.receitas}" var="receita">
		<option>${receita}</option>
	</c:forEach>
</datalist>

<div id="receita">
  <form>
    <div class="form-row">
      <div class="form-group col-md-6">
        <label for="nome">Nome</label>
        <input id="nome"
          type="text"
          list="listaReceitas"
					class="form-control">
				<button id="buttonAlterarReceita"
					onclick="selectReceitaPorNome()"
					type="button"
					class="btn btn-sm btn-outline-secondary">
					Vizualizar
				</button>
      </div>
    </div>
    <div class="form-row">
      <div class="form-group col-md-6">
        <label for="codigo">Codigo</label>
        <input id="codigo"
          type="number"
					class="form-control form-control-plaintext" readonly>
      </div>
      <div class="form-group col-md-6">
        <label for="tempoAtivo">Tempo ativo</label>
        <input id="tempoAtivo"
          type="number"
					class="form-control form-control-plaintext" readonly>
      </div>
      <div class="form-group col-md-6">
        <label for="tempoTotal">Tempo total</label>
        <input id="tempoTotal"
          type="number"
					class="form-control form-control-plaintext" readonly>
      </div>
      <div class="form-group col-md-6">
        <label for="tempoGas">Tempo de gas</label>
        <input id="tempoGas"
          type="number"
					class="form-control form-control-plaintext" readonly>
      </div>
      <div class="form-group col-md-6">
        <label for="gas">Gas insumo</label>
        <input id="gas"
          type="text"
					class="form-control form-control-plaintext" readonly>
      </div>
			<div class="form-group col-md-6">
        <label for="equivalente">Insumo equivalente</label>
        <input id="equivalente"
          type="text"
					class="form-control form-control-plaintext" readonly>
      </div>
      <div class="form-group col-md-6">
        <label for="comentarios">Comentarios</label>
        <input id="comentarios"
          type="text"
					class="form-control form-control-plaintext" readonly>
      </div>
    </div>
		<div class="form-row">
			<div class="form-group col-md-6">
        <label for="rendimento">Rendimento</label>
        <input id="rendimento"
          type="number"
					class="form-control">
      </div>
      <div class="form-group col-md-6">
        <label for="calcularReceitaButton">Rendimento Unidade</label>
        <input id="calcularReceitaButton"
          type="text"
					class="form-control form-control-plaintext" readonly>
				<button id="buttonProporcionarReceita"
					onclick="calcularProporcao()"
					type="button"
					class="btn btn-sm btn-outline-secondary">
					Calcular
				</button>
      </div>
		</div>
		<table class="table table-responsive-lg">
			<thead>
				<tr>
					<th style="width: 50%">Ingredientes</th>
					<th style="width: 10%">Qtd.</th>
					<th style="width: 10%">Uni.</th>
					<th style="width: 30%">Comentarios</th>
				</tr>
			</thead>
			<tbody id="ingredientes">
			</tbody>
		</table>
		<table class="table table-responsive-lg">
			<thead><tr><th>Etapas</th></tr></thead>
			<tbody id="etapas">
			</tbody>
		</table>
	</form>
</div>

<jsp:include page="include/footer.jsp" flush="true"></jsp:include>
