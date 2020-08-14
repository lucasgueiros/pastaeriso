function selectClientePorNome() {
  var nome = $("#nomeCliente").val();
  $.ajax({
    url: '/selectClientePorNome?nome=' + nome,
    type: 'post',
    success: function (data) {
      if(data == "false") {
        $("#contatoNome").removeClass("form-control-plaintext");
        $("#contatos").removeClass("form-control-plaintext");
        $("#contatosForma").removeClass("form-control-plaintext");
        $("#enderecoNome").removeClass("form-control-plaintext");
        $("#tipoDeEndereco").removeClass("form-control-plaintext");
        $("#rua").removeClass("form-control-plaintext");
        $("#numero").removeClass("form-control-plaintext");
        $("#bairro").removeClass("form-control-plaintext");
        $("#complemento").removeClass("form-control-plaintext");
        $("#pontoDeReferencia").removeClass("form-control-plaintext");
        $("#enderecoComentarios").removeClass("form-control-plaintext");

        $('#contatoNome').prop('readonly', false);
        $('#contatos').prop('readonly', false);
        $('#contatosForma').prop('readonly', false);
        $('#enderecoNome').prop('readonly', false);
        $('#rua').prop('readonly', false);
        $('#numero').prop('readonly', false);
        $('#bairro').prop('readonly', false);
        $('#complemento').prop('readonly', false);
        $('#pontoDeReferencia').prop('readonly', false);
        $('#enderecoComentarios').prop('readonly', false);

        localStorage.removeItem("clienteId");
        localStorage.removeItem("enderecoEntrega");

        // $("#contatoNome").addClass("form-control");
        // $("#contatos").addClass("form-control");
        // $("#contatosForma").addClass("form-control");
        // $("#rua").addClass("form-control");
        // $("#numero").addClass("form-control");
        // $("#bairro").addClass("form-control");
        // $("#complemento").addClass("form-control");
        // $("#pontoDeReferencia").addClass("form-control");
      } else {
        var cliente = data;
        $("#contatoNome").val( cliente.contatoPreferencial.nome);
        $("#contatos").val( cliente.contatoPreferencial.contato);
        $("#contatosForma").val( cliente.contatoPreferencial.forma.forma);
        $("#enderecoNome").val( cliente.enderecoPreferencial.nome);
        $("#tipoDeEndereco").val( cliente.enderecoPreferencial.tipo.tipo);
        $("#rua").val( cliente.enderecoPreferencial.rua);
        $("#numero").val( cliente.enderecoPreferencial.numero);
        $("#bairro").val( cliente.enderecoPreferencial.bairro);
        $("#complemento").val( cliente.enderecoPreferencial.complemento);
        $("#pontoDeReferencia").val( cliente.enderecoPreferencial.pontoDeReferencia);
        $("#enderecoComentarios").val( cliente.enderecoPreferencial.comentarios);

        // $("#nomeCliente").removeClass("form-control");
        // $("#contatoNome").removeClass("form-control");
        // $("#contatos").removeClass("form-control");
        // $("#contatosForma").removeClass("form-control");
        // $("#rua").removeClass("form-control");
        // $("#numero").removeClass("form-control");
        // $("#bairro").removeClass("form-control");
        // $("#complemento").removeClass("form-control");
        // $("#pontoDeReferencia").removeClass("form-control");

        $("#nomeCliente").addClass("form-control-plaintext");
        $("#contatoNome").addClass("form-control-plaintext");
        $("#contatos").addClass("form-control-plaintext");
        $("#contatosForma").addClass("form-control-plaintext");
        $("#enderecoNome").addClass("form-control-plaintext");
        $("#rua").addClass("form-control-plaintext");
        $("#numero").addClass("form-control-plaintext");
        $("#bairro").addClass("form-control-plaintext");
        $("#complemento").addClass("form-control-plaintext");
        $("#pontoDeReferencia").addClass("form-control-plaintext");
        $("#enderecoComentarios").addClass("form-control-plaintext");

        $('#nomeCliente').prop('readonly', true);
        $('#contatoNome').prop('readonly', true);
        $('#contatos').prop('readonly', true);
        $('#contatosForma').prop('readonly', true);
        $('#enderecoNome').prop('readonly', true);
        $('#tipoDeEndereco').prop('readonly', true);
        $('#rua').prop('readonly', true);
        $('#numero').prop('readonly', true);
        $('#bairro').prop('readonly', true);
        $('#complemento').prop('readonly', true);
        $('#pontoDeReferencia').prop('readonly', true);
        $('#enderecoComentarios').prop('readonly', true);

        localStorage.setItem("clienteId",cliente.id);
        localStorage.setItem("enderecoEntrega",cliente.enderecoPreferencial.id);
        $("#buttonAlterarCliente").show();
      }
    }
  });

}

function addItemLinha() {
  var string = "";
  string += "<tr>";
  string += "<td>";
  string += "<div class=\"form-group\">";
  string += "<input";
  string += " type=\"text\"";
  string += " list=\"listaProdutos\"";
  string += " class=\"form-control itemProduto\">";
  string += "</div>";
  string += "</td>";
  string += "<td>";
  string += "<div class=\"form-group\">";
  string += "<input";
  string += " type=\"number\"";
  string += " class=\"form-control itemQuantidade\">";
  string += "</div>";
  string += "</td>";
  string += "<td>";
  string += "<div class=\"form-group\">";
  string += "<input";
  string += " type=\"number\"";
  string += " class=\"form-control\" readonly>";
  string += "</div>";
  string += "</td>";
  string += "<td>";
  string += "<div class=\"form-group\">";
  string += "<input";
  string += " type=\"text\"";
  string += " class=\"form-control itemComentarios\">";
  string += "</div>";
  string += "</td>";

  string += "<td>";
  string += "<button type=\"button\" onclick=\"apagarLinhaItem(this)\" class=\"btn btn-primary\">Remover</button>";
  string += "</td>";

  string += "</tr>";
  $("#pedidoItensBody").append(string);
}
function apagarLinhaItem(botao) {
  $(botao).parent().parent().remove();
}
function pedidoItemCheckUpdate (check) {
  if(check.checked == true) {
    document.getElementById(check.id+'row').classList.remove("table-active");
  } else {
    document.getElementById(check.id+'row').classList.add("table-active");
  }
}
function mostrarPedido(pedidoId) {
  string = localStorage.getItem("pedido" + pedidoId);
  pedido = JSON.parse(string);
  atualizarPedido(pedido);
}
function preparaNovo(){
  var data = new Date();
  var dataAsString = data.getFullYear() + "--" + (data.getMonth()+1) + "--" + data.getDate() + "T19:00";
  $("#nomeCliente").val("");
  $("#pedidoId").val(0);
  $("#total").val("");
  $("#datahoraEntrega").val(dataAsString);
  $("#trocoPara").val(0);
  $("#comentarios").val("");
  $("#troco").val(0);
  $("#formaDePagamento").val("");
  $("#contatoNome").val("");
  $("#contatos").val("");
  $("#contatosForma").val("");
  $("#tipoDeEndereco").val("");
  $("#enderecoNome").val("");
  $("#rua").val("");
  $("#numero").val("");
  $("#bairro").val("");
  $("#complemento").val("");
  $("#pontoDeReferencia").val("");
  $("#enderecoComentarios").val("");
  $("#pedidoItensBody").html("");

  $("#nomeCliente").removeClass("form-control-plaintext");
  $("#pedidoId").removeClass("form-control-plaintext");
  $("#total").removeClass("form-control-plaintext");
  $("#datahoraEntrega").removeClass("form-control-plaintext");
  $("#trocoPara").removeClass("form-control-plaintext");
  $("#comentarios").removeClass("form-control-plaintext");
  $("#troco").removeClass("form-control-plaintext");
  $("#formaDePagamento").removeClass("form-control-plaintext");
  $("#contatoNome").removeClass("form-control-plaintext");
  $("#contatos").removeClass("form-control-plaintext");
  $("#contatosForma").removeClass("form-control-plaintext");
  $("#enderecoNome").removeClass("form-control-plaintext");
  $("#tipoDeEndereco").removeClass("form-control-plaintext");
  $("#rua").removeClass("form-control-plaintext");
  $("#numero").removeClass("form-control-plaintext");
  $("#bairro").removeClass("form-control-plaintext");
  $("#complemento").removeClass("form-control-plaintext");
  $("#pontoDeReferencia").removeClass("form-control-plaintext");
  $("#enderecoComentarios").removeClass("form-control-plaintext");

  $('#nomeCliente').prop('readonly', false);
  $('#pedidoId').prop('readonly', true);
  $('#datahoraEntrega').prop('readonly', false);
  $('#trocoPara').prop('readonly', false);
  $('#comentarios').prop('readonly', false);
  $('#formaDePagamento').prop('readonly', false);
  $('#contatoNome').prop('readonly', false);
  $('#contatos').prop('readonly', false);
  $('#contatosForma').prop('readonly', false);
  $('#enderecoNome').prop('readonly', false);
  $('#tipoDeEndereco').prop('readonly', false);
  $('#rua').prop('readonly', false);
  $('#numero').prop('readonly', false);
  $('#bairro').prop('readonly', false);
  $('#complemento').prop('readonly', false);
  $('#pontoDeReferencia').prop('readonly', false);
  $('#enderecoComentarios').prop('readonly', false);

  // $("#nomeCliente").addClass("form-control");
  // $("#pedidoId").addClass("form-control");
  // $("#total").addClass("form-control");
  // $("#datahoraEntrega").addClass("form-control");
  // $("#trocoPara").addClass("form-control");
  // $("#comentarios").addClass("form-control");
  // $("#troco").addClass("form-control");
  // $("#formaDePagamento").addClass("form-control");
  // $("#contatoNome").addClass("form-control");
  // $("#contatos").addClass("form-control");
  // $("#contatosForma").addClass("form-control");
  // $("#rua").addClass("form-control");
  // $("#numero").addClass("form-control");
  // $("#bairro").addClass("form-control");
  // $("#complemento").addClass("form-control");
  // $("#pontoDeReferencia").addClass("form-control");

  $("#botaoAdicionarItem").show();
  addItemLinha();
}
function salvarNovo() {
  var pedido = {
    "cliente" : {
      "nome": $("#nomeCliente").val(),
      "contatoPreferencial" : {
        "nome" : $("#contatoNome").val(),
        "contato" : $("#contatos").val(),
        "forma" : $("#contatosForma").val(),
      },
      "enderecoPreferencial" : {
        "nome" : $("#enderecoNome").val(),
        "tipo" : $("#tipoDeEndereco").val(),
        "rua" : $("#rua").val(),
        "numero" : $("#numero").val(),
        "bairro" : $("#bairro").val(),
        "comentarios" : $("#enderecoComentarios").val(),
        "pontoDeReferencia" : $("#pontoDeReferencia").val(),
      }
    },
    "datahoraEntrega" : $("#datahoraEntrega").val(),
    "trocoPara" : $("#trocoPara").val(),
    "comentarios" : $("#comentarios").val(),
    "formaDePagamento" : $("#formaDePagamento").val(),
    "itens" : []
  };
  $("#pedidoItensBody").children('tr').each(function(i){
    var pedidoItem = {
      "produto" : $(this).find(".itemProduto").val(),
      "quantidade" : $(this).find(".itemQuantidade").val(),
      "comentarios" : $(this).find(".itemComentarios").val()
    }
    pedido.itens.push(pedidoItem);
  });
  if(localStorage.getItem("clienteId") !== null) {
    pedido.cliente = localStorage.getItem("clienteId");
  }
  var string = JSON.stringify(pedido);
  $.ajax({
    url: '/insertPedido',
    type: 'post',
    dataType: 'json',
    contentType: 'application/json',
    data : string,
    success: function (data) {
      //salvarPedidos(data.pedidos);
      //atualizarPedidosResumo(data.pedidos);
      //atualizarPedido(data.pedido);
    }
  });
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
  $("#enderecoNome").val( pedido.enderecoEntrega.nome);
  $("#tipoDeEndereco").val( pedido.enderecoEntrega.tipo.tipo);
  $("#rua").val( pedido.enderecoEntrega.rua);
  $("#numero").val( pedido.enderecoEntrega.numero);
  $("#bairro").val( pedido.enderecoEntrega.bairro);
  $("#complemento").val( pedido.enderecoEntrega.complemento);
  $("#pontoDeReferencia").val( pedido.enderecoEntrega.pontoDeReferencia);
  $("#enderecoComentarios").val( pedido.enderecoEntrega.comentarios);
  $("#botaoAdicionarItem").hide();
  var string = "";
  pedido.itens.forEach((item, i) => {
    string += "<tr id=\"rowitem" + item.id + "\">";
    string += "<td>";
    string += "<div class=\"form-group\">";
    string += "<input id=\"produto" + item.id + "\"";
    string += " type=\"text\"";
    string += " readonly";
    string += " list=\"listaProdutos\"";
    string += " value=\""+ item.produto +"\"";
    string += " class=\"form-control-plaintext itemProduto\">";
    string += "</div>";
    string += "</td>";
    string += "<td>";
    string += "<div class=\"form-group\">";
    string += "<input id=\"quantidade" + item.id + "\"";
    string += " type=\"number\"";
    string += " value=\""+ item.quantidade +"\"";
    string += " readonly";
    string += " class=\"form-control-plaintext itemQuantidade\">";
    string += "</div>";
    string += "</td>";
    string += "<td>";
    string += "<div class=\"form-group\">";
    string += "<input id=\"subtotal" + item.id + "\"";
    string += " value=\""+ item.subtotal +"\"";
    string += " type=\"number\"";
    string += "class=\"form-control-plaintext\" readonly>";
    string += "</div>";
    string += "</td>";
    string += "<td>";
    string += "<div class=\"form-group\">";
    string += "<input id=\"itemComentarios-plaintext" + item.id + "\"";
    string += "type=\"text\"";
    string += " readonly";
    string += " value=\""+ item.comentarios +"\"";
    string += "class=\"form-control-plaintext itemComentarios\">";
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

function mudarCliente() {
  $("#nomeCliente").removeClass("form-control-plaintext");
  $("#nomeCliente").addClass("form-control");
  $('#nomeCliente').prop('readonly', false);
  localStorage.removeItem("clienteId");
  localStorage.removeItem("enderecoEntrega");
}

$(document).ready(function () {
  var data = new Date();
  var stringData = data.getFullYear().toString() + '-' + (data.getMonth() + 1).toString().padStart(2, 0) +
  '-' + data.getDate().toString().padStart(2, 0);
  $("#selectData").val(stringData);
  mudancaDeData();
  $("#botaoAdicionarItem").hide();
  $("#buttonAlterarCliente").hide();
});
