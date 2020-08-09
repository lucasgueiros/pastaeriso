<!DOCTYPE html>
<%@page import="br.com.pastaeriso.pedidos.Pedido" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="pedido" value="${requestScope.pedido}" />
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
        <label for="datahoraEntrega${pedido.id}">Data e hora da entrega</label>
        <input id="datahoraEntrega${pedido.id}"
          type="datetime-local"
          form="pedidoForm${pedido.id}"
          class="form-control"
          value="${pedido.datahoraEntrega}">
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
        <th scope="scope" style="width: 10%">#</th>
        <th scope="scope" style="width: 50%">Produto</th>
        <th scope="scope" style="width: 10%">Qtd.</th>
        <th scope="scope" style="width: 10%">Subtotal</th>
        <th scope="scope" style="width: 50%">Comentarios</th>
        <th scope="scope" style="width: 20%">Ações</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${pedido.itens}" var="item">
        <form id="pedidoForm${pedido.id}itemForm${item.id}">
          <c:set var="item" value="${item}" scope="request"/>
          <tr>
            <c:import url="viewPedidoItem.jsp"/>
          </tr>
        </form>
      </c:forEach>
    </tbody>
  </table>
  <c:set var="primeiro" value="${false}"/>
</div>
