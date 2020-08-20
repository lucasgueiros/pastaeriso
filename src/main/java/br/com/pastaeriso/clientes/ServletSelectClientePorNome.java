package br.com.pastaeriso.clientes;

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

import br.com.pastaeriso.servicos.DatabaseConnection;
import br.com.pastaeriso.clientes.Cliente;
import br.com.pastaeriso.clientes.ClienteMapper;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet("/selectClientePorNome")
public class ServletSelectClientePorNome extends HttpServlet {

	static final Logger logger = LogManager.getLogger(ServletSelectClientePorNome.class);

	protected void service (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

		logger.atTrace().log("Iniciando");

		Cliente cliente;
    String nome = request.getParameter("nome");

		logger.atDebug().log("Parameter nome : " + nome);

    try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
			ClienteMapper clienteMapper = sqlSession.getMapper(ClienteMapper.class);
			cliente = clienteMapper.selectClientePorNome(nome);
		}

		logger.atDebug().log("Cliente recuperado : " + cliente);

    ServletOutputStream out = response.getOutputStream();
    Gson gson = new Gson();
    if(cliente != null ) {
			response.setContentType("application/json;charset=UTF-8");
      String string = gson.toJson(cliente);
			logger.atDebug().log("Cliente em jsn : " + string);
      out.print(string);
    } else {
			response.setContentType("application/text;charset=UTF-8");
      String string = gson.toJson("false");
			logger.atDebug().log("cliente is null, responde = false");
      out.print(string);
    }
	}
}
