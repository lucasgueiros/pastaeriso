<td>
  <div class="form-group">
    <input id="numero${item.id}"
      type="number"
      class="form-control form-control-sm"
      value="${item.id}" readonly>
  </div>
</td>
<td>
  <div class="form-group">
    <input id="produto${item.id}"
      type="text"
      list="listaProdutos"
      class="form-control form-control-lg"
      value="${item.produto.nome}">
  </div>
</td>
<td>
  <div class="form-group">
    <input id="quantidade${item.id}"
      type="number"
      class="form-control form-control-sm"
      value="${item.quantidade}">
  </div>
</td>
<td>
  <div class="form-group">
    <input id="subtotal${item.id}"
      type="number"
      class="form-control form-control-sm"
      value="${item.subtotal}" readonly>
  </div>
</td>
<td>
  <div class="form-group">
    <input id="comentarios${item.id}"
      type="text"
      class="form-control form-control-lg"
      value="${item.comentarios}">
  </div>
</td>
<td>
  <div class="btn-group">
    <button class="btn btn-secondary dropdown-toggle"
      type="button" id="dropdownItem${item.id}"
      data-toggle="dropdown" aria-haspopup="true"
      aria-expanded="false">
      <!--<span data-feather="calendar"></span>-->
      <div>Ações</div>
    </button>
    <div class="dropdown-menu dropdown-menu-left"
      aria-labelledby="dropdownItem${item.id}">
      <input id="submitItem${item.id}"
        name="submitItem${item.id}" type="submit">
        Alterar
      </input>
      <form method="post" action="pedidos/pedidoItens/DeletePedidoItemServlet">
        <input id="item${item.id}" name="item${item.id}" type="hidden" value="${item.id}" />
        <input id="submitItem${item.id}" name="submitItem${item.id}" type="submit" />
      </form>
      <a class="dropdown-item" onClick="">Editar</a>
    </div>
  </div>
</td>
