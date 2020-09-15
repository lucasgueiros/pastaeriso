function selectReceitaPorNome () {
  var receita = JSON.parse(localStorage.getItem($("#nome").val()));
  mostrarReceita (receita);
}

function mostrarReceita (receita) {
  $("#codigo").val(receita.id);
  $("#tempoAtivo").val(receita.tempoAtivo);
  $("#tempoTotal").val(receita.tempoTotal);
  $("#tempoGas").val(receita.tempoGas);
  $("#gas").val(receita.gas.insumo);
  $("#rendimento").val(receita.rendimento);
  $("#rendimentoUnidade").val(receita.rendimentoUnidade.unidade);
  $("#comentarios").val(receita.comentarios);

  var string = "";
  receita.ingredientes.forEach((ingrediente,i) => {
    string += "<tr>";

    string += "<td>";
    string += "<div class=\"form-group\">";
    string += "<input id=\"ingredienteInsumo" + i + "\"";
    string += " type=\"text\"";
    string += " value=\""+ ingrediente.insumo.insumo +"\"";
    string += " class=\"form-control form-control-plaintext ingrediente\" readonly>";
    string += "</div>";
    string += "</td>";

    string += "<td>";
    string += "<div class=\"form-group\">";
    string += "<input id=\"ingredienteQuantidade" + i + "\"";
    string += " type=\"number\"";
    string += " value=\""+ ingrediente.quantidade +"\"";
    string += " class=\"form-control form-control-plaintext ingrediente\" readonly>";
    string += "</div>";
    string += "</td>";

    string += "<td>";
    string += "<div class=\"form-group\">";
    string += "<input id=\"ingredienteUnidade" + i + "\"";
    string += " type=\"text\"";
    string += " value=\""+ ingrediente.unidade.unidade +"\"";
    string += " class=\"form-control form-control-plaintext ingrediente\" readonly>";
    string += "</div>";
    string += "</td>";

    string += "<td>";
    string += "<div class=\"form-group\">";
    string += "<input id=\"ingredienteComentarios" + i + "\"";
    string += " type=\"text\"";
    string += " value=\""+ ingrediente.comentarios +"\"";
    string += " class=\"form-control form-control-plaintext ingrediente\" readonly>";
    string += "</div>";
    string += "</td>";

    string += "</tr>";
  });

  $("#ingredientes").html(string);

  string = "";
  receita.etapas.forEach((etapa, i) => {
    string += "<tr>";

    string += "<td>";
    string += "<div class=\"form-group\">";
    string += "<textarea id=\"ingredienteInsumo" + i + "\"";
    string += " type=\"text\"";
    string += " rows=\"1\"";
    string += " class=\"form-control form-control-plaintext ingrediente\" readonly>";
    string += etapa;
    string += "</textarea>";
    string += "</div>";
    string += "</td>";

    string += "</tr>";
  });
  $("#etapas").html(string);
}

function calcularProporcao() {
  $.ajax({
    url: "/calcularReceita?id=" + $("#codigo").val() + "&rendimento=" + $("#rendimento").val(),
    type: "post",
    success: function(receita) {
      mostrarReceita(receita);
    }
  });
}

$(document).ready(function () {
  $.ajax({
    url: "/selectReceitas",
    type: "post",
    success: function(receitas) {
      receitas.forEach(function (receita){
        string = JSON.stringify(receita);
        localStorage.setItem(receita.nome,string);
      });
    }
  });
});
