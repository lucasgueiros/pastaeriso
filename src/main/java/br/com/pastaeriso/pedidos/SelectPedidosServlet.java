package br.com.pastaeriso.pedidos;

import java.util.List;
import java.util.LinkedList;
import java.util.HashMap;
import java.time.LocalDate;
import java.util.Map;
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

public class SelectPedidosServlet extends HttpServlet {
	protected void service (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
		
		List<Pedido> pedidos;
  
		try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
			PedidoMapper mapper = sqlSession.getMapper(PedidoMapper.class);
			pedidos = mapper.selectPedidos();
		}
		
		// Separando os pedidos por data de entrega
		Map<LocalDate,List<Pedido>> map = new HashMap<>();
		for(Pedido pedido : pedidos) {
			if(!map.containsKey(pedido.getDataEntrega())) {
				map.put(pedido.getDataEntrega(),new LinkedList<Pedido>());
			}
			map.get(pedido.getDataEntrega()).add(pedido);
		}
		
		request.setAttribute("todos",pedidos);
		request.setAttribute("map",map);
		RequestDispatcher rd = request.getRequestDispatcher("pedidos.jsp");
		rd.forward(request,response);
	}
}