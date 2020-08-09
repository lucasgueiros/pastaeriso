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

@WebServlet("/prepare")
public class ServletPreparePedidos extends HttpServlet {
	protected void service (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

		List<Cliente> clientes;
		List<Produto> produtos;
		List<Pedido> pedidos;
		LocalDate data = LocalDate.now();

		try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
			ClienteMapper clienteMapper = sqlSession.getMapper(ClienteMapper.class);
			clientes = clienteMapper.selectClientes();
			ProdutoMapper produtoMapper = sqlSession.getMapper(ProdutoMapper.class);
			produtos = produtoMapper.selectProdutos();
			PedidoMapper pedidoMapper = sqlSession.getMapper(PedidoMapper.class);
			pedidos = pedidoMapper.selectPedidosPorData(data);
		}


		request.setAttribute("hoje",data);
		request.setAttribute("pedidos",pedidos);
    request.setAttribute("clientes",clientes);
    request.setAttribute("produtos",produtos);
		response.setContentType("text/html;chars	et=UTF-8");
		RequestDispatcher rd = request.getRequestDispatcher("pedidos.jsp");
		rd.forward(request,response);
	}
}
