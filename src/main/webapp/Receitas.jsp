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
        <label for="codigo">Código</label>
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
        <label for="tempoGas">Tempo de gás</label>
        <input id="tempoGas"
          type="number"
					class="form-control form-control-plaintext" readonly>
      </div>
      <div class="form-group col-md-6">
        <label for="gas">Gás insumo</label>
        <input id="gas"
          type="text"
					class="form-control form-control-plaintext" readonly>
      </div>
      <div class="form-group col-md-6">
        <label for="rendimento">Rendimento</label>
        <input id="rendimento"
          type="number"
					class="form-control form-control-plaintext" readonly>
      </div>
      <div class="form-group col-md-6">
        <label for="redimentoUnidade">Rendimento Unidade</label>
        <input id="redimentoUnidade"
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
        <table class="table table-hover table-responsive-lg">
          <thead>
            <caption>
              ingredientes
            </caption>
            <tr>
              <th>
              </th>
            </tr>
          </thead>
          <tbody id="ingredientes">
          </tbody>
        </table>
      </div>
      <div class="form-group col-md-6">
        <table class="table table-hover table-responsive-lg">
          <thead>
            <caption>
              Etapas
            </caption>
            <tr>
              <th>
                Descrição
              </th>
            </tr>
          </thead>
          <tbody id="etapas">
          </tbody>
        </table>
      </div>
    </div>


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
