<!DOCTYPE html>

<%@page import="java.util.List" %>
<%@page import="br.com.pastaeriso.pedidos.Pedido" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="include/header_head.jsp" flush="true"></jsp:include>

<script src="receitas/receita.js"></script>

<jsp:include page="include/header_head_to_body.jsp">
	<jsp:param name="title" value="Receitas"/>
	<jsp:param name="active" value="receitas"/>
</jsp:include>
<jsp:include page="include/header_body.jsp" flush="true"></jsp:include>

<form>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="nome">Nome</label>
      <input id="nome"
        type="text"
        list="listaReceitas"
        onchange="selectReceitaPorNome()"
        class="form-control form-control-plaintext" readonly>
    </div>
  </div>
</form>

<jsp:include page="include/footer.jsp" flush="true"></jsp:include>
