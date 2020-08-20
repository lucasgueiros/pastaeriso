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
import br.com.pastaeriso.pedidos.FormaDePagamento;
import br.com.pastaeriso.clientes.contatos.FormaDeContato;
import br.com.pastaeriso.clientes.enderecos.TipoDeEndereco;
import br.com.pastaeriso.clientes.contatos.ContatoMapper;
import br.com.pastaeriso.clientes.enderecos.EnderecoMapper;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet("/prepare")
public class ServletPreparePedidos extends HttpServlet {

	final static Logger logger = LogManager.getLogger(ServletPreparePedidos.class);

	protected void service (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

		logger.atDebug().log("testando");
		List<Cliente> clientes;
		List<Produto> produtos;
		List<FormaDePagamento> formasDePagamento;
		List<FormaDeContato> formasDeContato;
		List<TipoDeEndereco> tiposDeEndereco;

		try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
			ClienteMapper clienteMapper = sqlSession.getMapper(ClienteMapper.class);
			clientes = clienteMapper.selectClientes();
		}

		try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
			ProdutoMapper produtoMapper = sqlSession.getMapper(ProdutoMapper.class);
			produtos = produtoMapper.selectProdutos();
		}

		//logger.debug(produtos.toString());

		try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
			ContatoMapper mapper = sqlSession.getMapper(ContatoMapper.class);
			formasDeContato = mapper.selectFormasDeContato();
		}

		try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
			EnderecoMapper mapper = sqlSession.getMapper(EnderecoMapper.class);
			tiposDeEndereco = mapper.selectTiposDeEndereco();
		}

		try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
			PedidoMapper pedidoMapper = sqlSession.getMapper(PedidoMapper.class);
			formasDePagamento = pedidoMapper.selectFormasDePagamento();
		}

		request.setAttribute("formasDeContato",formasDeContato);
		request.setAttribute("tiposDeEndereco",tiposDeEndereco);
		request.setAttribute("formasDePagamento",formasDePagamento);
    request.setAttribute("clientes",clientes);
    request.setAttribute("produtos",produtos);
		response.setContentType("text/html;chars	et=UTF-8");
		RequestDispatcher rd = request.getRequestDispatcher("pedidos.jsp");
		rd.forward(request,response);
	}
}
