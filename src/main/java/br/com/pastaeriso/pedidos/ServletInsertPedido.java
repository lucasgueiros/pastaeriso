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
import java.time.LocalDateTime;
import org.apache.ibatis.session.SqlSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.GsonBuilder;
import com.google.gson.Gson;
import javax.servlet.ServletOutputStream;

import br.com.pastaeriso.pedidos.Pedido;
import br.com.pastaeriso.pedidos.pedidoItens.PedidoItem;
import br.com.pastaeriso.pedidos.pedidoItens.SerializerPedidoItem;
import br.com.pastaeriso.servicos.DatabaseConnection;
import br.com.pastaeriso.servicos.Deserializer;
import br.com.pastaeriso.pedidos.PedidoMapper;
import br.com.pastaeriso.clientes.Cliente;
import br.com.pastaeriso.clientes.ClienteMapper;
import br.com.pastaeriso.clientes.contatos.FormaDeContato;
import br.com.pastaeriso.clientes.enderecos.Endereco;
import br.com.pastaeriso.clientes.contatos.JsonContato;
import br.com.pastaeriso.clientes.JsonCliente;
import br.com.pastaeriso.produtos.ProdutoMapper;
import br.com.pastaeriso.produtos.Produto;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet("/insertPedido")
public class ServletInsertPedido extends HttpServlet {

	final static Logger logger = LogManager.getLogger(ServletPreparePedidos.class);

	protected void service (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

		BufferedReader br =
		new BufferedReader(new InputStreamReader(request.getInputStream()));

		String json = "";
		if(br != null){
			json = br.readLine();
		}
		logger.atDebug().addKeyValue("json",json).log("json recebido.");
		Gson gson = new GsonBuilder()
			.registerTypeAdapter(LocalDateTime.class, new Deserializer.LocalDateTimeDeserializer())
			.registerTypeAdapter(FormaDePagamento.class, new PedidoDeserializer.FormaDePagamentoDeserializer())
			.registerTypeAdapter(PedidoItem.class, new SerializerPedidoItem())
			.registerTypeAdapter(Cliente.class, new JsonCliente())
			.create();
		Pedido pedido = gson.fromJson(json, Pedido.class);
		pedido.setDatahoraFeito(LocalDateTime.now());
		if(!pedido.hasEnderecoEntrega()) {
			Cliente cliente = pedido.getCliente();
			Endereco endereco = cliente.getEnderecoPreferencial();
			pedido.setEnderecoEntrega(endereco);
		}
		logger.atDebug().addKeyValue("pedido",pedido).log("pedido construido");
		Integer pedido_id;
		try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
			PedidoMapper pedidoMapper = sqlSession.getMapper(PedidoMapper.class);
		  pedido_id = pedidoMapper.insertPedido(pedido);
			sqlSession.commit();
		}
		pedido.setId(pedido_id);
		logger.atDebug().addKeyValue("pedido.id",pedido.getId()).log("pedido inserido");
		try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
			PedidoMapper pedidoMapper = sqlSession.getMapper(PedidoMapper.class);
		  pedidoMapper.insertPedidoItens(pedido);
			sqlSession.commit();
		}

		// agora recupere
		try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
			PedidoMapper pedidoMapper = sqlSession.getMapper(PedidoMapper.class);
		  pedido = pedidoMapper.selectPedidoPorId(pedido_id);
		}
		logger.atDebug().addKeyValue("pedido",pedido).log("pedido inserido e recuperado");
		response.setContentType("text/html;chars	et=UTF-8");
		RequestDispatcher rd = request.getRequestDispatcher("pedidos.jsp");
		rd.forward(request,response);
  }
}
