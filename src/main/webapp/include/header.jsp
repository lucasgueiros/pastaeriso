<jsp:include page="header_head.jsp" flush="true"></jsp:include>
<jsp:include page="header_head_to_body.jsp" flush="true">
	<jsp:param name="title" value='<%=request.getParameter("title")%>'/>
	<jsp:param name="active" value='<%=request.getParameter("active")%>'/>
</jsp:include>
<jsp:include page="header_body.jsp" flush="true"></jsp:include>