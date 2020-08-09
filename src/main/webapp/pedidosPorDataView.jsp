<!DOCTYPE html>
<%@page import="br.com.pastaeriso.pedidos.Pedido" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
    <c:forEach items="${requestScope.pedidos}" var="pedido">
      <c:set var="pedido" scope="request" value="${pedido}"/>
      <c:import url="pedidoView.jsp" />
    </c:forEach>
  </div>
</div>
