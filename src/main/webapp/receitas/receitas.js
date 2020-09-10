function selectReceitaPorNome () {
  var nome = $("#nome").val();
  $.ajax({
    url: "/selectReceitaPorNome?nome=" + nome,
    type: "post",
    success: function(receita) {
      if(data != "\"false\"") {
        $("#codigo").val(receita.id);
        $("#tempoAtivo").val(receita.tempoAtivo);
        $("#tempoTotal").val(receita.tempoTotal);
        $("#tempoGas").val(receita.tempoGas);
        $("#gas").val(receita.gas);
        $("#rendimento").val(receita.rendimento);
        $("#redimentoUnidade").val(receita.redimentoUnidade);
        $("#comentarios").val(receita.comentarios);

        var insumos = "";
        receita.ingredientes.forEach((ingrediente,i) => {
          string += "<tr>";

          string += "<td>";
          string += "<div class=\"form-group\">";
          string += "<input id=\"ingredienteInsumo" + i + "\"";
          string += " type=\"text\"";
          string += " value=\""+ ingrediente.insumo +"\"";
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
          string += " value=\""+ ingrediente.unidade +"\"";
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

        $("#ingrediente").val(string);

        string = "";
        receita.etapas.forEach((etapa, i) => {
          string += "<tr>";

          string += "<td>";
          string += "<div class=\"form-group\">";
          string += "<textarea id=\"ingredienteInsumo" + i + "\"";
          string += " type=\"text\"";
          string += " rows=\"3\"";
          string += " value=\"" + etapa +"\"";
          string += " class=\"form-control form-control-plaintext ingrediente\" readonly>";
          string += "</div>";
          string += "</td>";

          string += "</tr>";
        });
        $("#etapas").val(string);

      }
    }
  });

}
