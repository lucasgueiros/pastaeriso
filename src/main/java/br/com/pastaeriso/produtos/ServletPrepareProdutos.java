package br.com.pastaeriso.produtos;

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
import java.io.PrintWriter;

import com.google.gson.Gson;
import javax.servlet.ServletOutputStream;

import br.com.pastaeriso.servicos.DatabaseConnection;
import br.com.pastaeriso.clientes.Cliente;
import br.com.pastaeriso.clientes.ClienteMapper;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet("/prepareProdutos")
public class ServletPrepareProdutos extends HttpServlet {

	static final Logger logger = LogManager.getLogger(ServletPrepareProdutos.class);

	protected void service (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

		logger.atTrace().log("Iniciando");

		List<Produto> produtos;

    try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
			ProdutoMapper produtoMapper = sqlSession.getMapper(ProdutoMapper.class);
			produtos = produtoMapper.selectProdutos();
		}

		logger.atDebug().log("Produtos recuperados : " + produtos.size());
    request.setAttribute("produtos",produtos);
    response.setContentType("text/html;chars	et=UTF-8");
		RequestDispatcher rd = request.getRequestDispatcher("produtos.jsp");
		rd.forward(request,response);
	}
}
