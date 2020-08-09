package br.com.pastaeriso.pedidos;

import java.util.List;
import java.util.LinkedList;
import java.util.TreeMap;
import java.time.LocalDate;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.RequestDispatcher;
import org.apache.ibatis.session.SqlSession;

import br.com.pastaeriso.pedidos.Pedido;
import br.com.pastaeriso.servicos.DatabaseConnection;
import br.com.pastaeriso.pedidos.PedidoMapper;
import br.com.pastaeriso.clientes.Cliente;
import br.com.pastaeriso.clientes.ClienteMapper;
import br.com.pastaeriso.produtos.ProdutoMapper;
import br.com.pastaeriso.produtos.Produto;

@WebServlet("/selectPorData")
public class ServletSelectPedidosPorData extends HttpServlet {
	protected void service (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

		List<Pedido> pedidos;
    LocalDate data = null;
		try {
			data = LocalDate.parse(request.getParameter("data"));
		} catch(NullPointerException e) {
			data = LocalDate.now();
		}
		if(data == null) {
			data = LocalDate.now();
		}
		try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
			PedidoMapper pedidoMapper = sqlSession.getMapper(PedidoMapper.class);
			pedidos = pedidoMapper.selectPedidosPorData(data);
		}

		request.setAttribute("pedidos",pedidos);
		response.setContentType("text/html;charset=UTF-8");
		RequestDispatcher rd = request.getRequestDispatcher("pedidosPorDataView.jsp");
		rd.include(request,response);
	}
}
