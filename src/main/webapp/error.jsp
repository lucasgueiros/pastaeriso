<!DOCTYPE html>
<jsp:include page="include/header.jsp" flush="true">
    <jsp:param name="title" value="Home"/>
	<jsp:param name="active" value="index"/>
</jsp:include>
    <% Exception e = request.getParameter("e"); %>
    <%= e.printStackTrace()%>
<jsp:include page="include/footer.jsp" flush="true"></jsp:include>
