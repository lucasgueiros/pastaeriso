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

import com.google.gson.Gson;
import javax.servlet.ServletOutputStream;

import br.com.pastaeriso.pedidos.Pedido;
import br.com.pastaeriso.servicos.DatabaseConnection;
import br.com.pastaeriso.pedidos.PedidoMapper;
import br.com.pastaeriso.clientes.Cliente;
import br.com.pastaeriso.clientes.ClienteMapper;
import br.com.pastaeriso.produtos.ProdutoMapper;
import br.com.pastaeriso.produtos.Produto;

@WebServlet("/selectPedidoPorId")
public class ServletSelectPedidoPorId extends HttpServlet {
	protected void service (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

		Pedido pedido;
    Integer id = Integer.decode(request.getParameter("id"));

    try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
			PedidoMapper pedidoMapper = sqlSession.getMapper(PedidoMapper.class);
			pedido = pedidoMapper.selectPedidoPorId(id);
		}

    if(pedido != null ) {
      Gson gson = new Gson();
      String string = gson.toJson(pedido);
      response.setContentType("application/json;charset=UTF-8");
      ServletOutputStream out = response.getOutputStream();
      out.print(string);
    }
	}
}
