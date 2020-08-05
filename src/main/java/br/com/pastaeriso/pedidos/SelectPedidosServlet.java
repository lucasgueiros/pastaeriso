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
import javax.servlet.RequestDispatcher;
import org.apache.ibatis.session.SqlSession;

import br.com.pastaeriso.pedidos.Pedido;
import br.com.pastaeriso.servicos.DatabaseConnection;
import br.com.pastaeriso.pedidos.PedidoMapper;
import br.com.pastaeriso.clientes.Cliente;
import br.com.pastaeriso.clientes.ClienteMapper;
import br.com.pastaeriso.produtos.ProdutoMapper;
import br.com.pastaeriso.produtos.Produto;

public class SelectPedidosServlet extends HttpServlet {
	protected void service (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

		List<Pedido> pedidos;
		List<Cliente> clientes;
		List<Produto> produtos;

		try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
			PedidoMapper pedidoMapper = sqlSession.getMapper(PedidoMapper.class);
			pedidos = pedidoMapper.selectPedidos();
			ClienteMapper clienteMapper = sqlSession.getMapper(ClienteMapper.class);
			clientes = clienteMapper.selectClientes();
			ProdutoMapper produtoMapper = sqlSession.getMapper(ProdutoMapper.class);
			produtos = produtoMapper.selectProdutos();
		}

		// Separando os pedidos por data de entrega
		TreeMap<LocalDate,List<Pedido>> map = new TreeMap<>();
		for(Pedido pedido : pedidos) {
			if(!map.containsKey(pedido.getDataEntrega())) {
				map.put(pedido.getDataEntrega(),new LinkedList<Pedido>());
			}
			map.get(pedido.getDataEntrega()).add(pedido);
		}

		LocalDate primeiroDia  = LocalDate.now();
		if(!map.containsKey(primeiroDia)) {
			primeiroDia = map.floorKey(primeiroDia);
		}

		request.setAttribute("produtos", produtos);
		request.setAttribute("primeiro",  primeiroDia );
		request.setAttribute("datas",map.navigableKeySet());
		request.setAttribute("map",map.entrySet());
		response.setContentType("text/html;charset=UTF-8");
		RequestDispatcher rd = request.getRequestDispatcher("pedidos.jsp");
		rd.forward(request,response);
	}
}
