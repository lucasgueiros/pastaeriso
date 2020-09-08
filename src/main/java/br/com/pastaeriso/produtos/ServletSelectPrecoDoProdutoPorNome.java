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

@WebServlet("/selectPrecoDoProdutoPorNome")
public class ServletSelectPrecoDoProdutoPorNome extends HttpServlet {

	static final Logger logger = LogManager.getLogger(ServletSelectPrecoDoProdutoPorNome.class);

	protected void service (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

		logger.atTrace().log("Iniciando");

		Produto produto;
    String nome = request.getParameter("nome");

		logger.atDebug().log("Parameter nome : " + nome);

    try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
			ProdutoMapper produtoMapper = sqlSession.getMapper(ProdutoMapper.class);
			produto = produtoMapper.selectProdutoPorNome(nome);
		}

		logger.atDebug().log("Produto recuperado : " + produto);

		PrintWriter out = response.getWriter();
    Gson gson = new Gson();
    if(produto != null ) {
			response.setContentType("application/json;charset=UTF-8");
      String string = gson.toJson(produto.getPreco(LocalDate.now()));
			logger.atDebug().log("Preco do produto em jsn : " + string);
      out.print(string);
    } else {
			response.setContentType("application/text;charset=UTF-8");
      String string = gson.toJson("false");
			logger.atDebug().log("produto is null, responde = false");
      out.print(string);
    }
	}
}
