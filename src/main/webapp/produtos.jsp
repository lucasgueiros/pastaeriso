<!DOCTYPE html>

<%@page import="java.util.List" %>
<%@page import="br.com.pastaeriso.pedidos.Pedido" %>
<%@page import="org.apache.logging.log4j.LogManager" %>
<%@page import="org.apache.logging.log4j.Logger" %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="include/header_head.jsp" flush="true"></jsp:include>

<jsp:include page="include/header_head_to_body.jsp">
	<jsp:param name="title" value="Produtos"/>
	<jsp:param name="active" value="produtos"/>
</jsp:include>
<jsp:include page="include/header_body.jsp" flush="true"></jsp:include>

<%! Logger logger = LogManager.getLogger(this.getClass()); %>

<table class="table table-responsive-lg">
  <thead>
    <tr>
      <th style="width: 10%">Codigo</th>
      <th style="width: 50%">Produto</th>
      <th style="width: 20%">Custo</th>
      <th style="width: 20%">Preco</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="produto" items="${produtos}">
      <tr>
        <td>${produto.id}</td>
        <td>${produto.nome}</td>
        <td>
					<c:catch var="e">${produto.custo}</c:catch>
					<c:if test="${e != null}">
						${e.message}
						<% Exception e = (Exception)pageContext.getAttribute("e");
							 logger.atError().log(e.getMessage());
							 logger.atDebug().withThrowable(e).log(e.getMessage()); %>
					</c:if>
				</td>
        <td>${produto.preco}</td>
      </tr>
    </c:forEach>
  </tbody>
</table>
