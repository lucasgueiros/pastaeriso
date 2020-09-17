package br.com.pastaeriso.receitas;

import java.util.List;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.RequestDispatcher;
import org.apache.ibatis.session.SqlSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import br.com.pastaeriso.servicos.DatabaseConnection;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.PrintWriter;

import java.math.BigDecimal;

@WebServlet("/calcularReceita")
public class ServletCalcularReceita extends HttpServlet {

	final static Logger logger = LogManager.getLogger(ServletPrepareReceitas.class);

	protected void service (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    Receita receita = null;
    Integer id = -1;
    BigDecimal rendimento = new BigDecimal(0);
		logger.atDebug().log("Id: " + request.getParameter("id"));
		logger.atDebug().log("Rendimento: " + request.getParameter("rendimento"));
    try {
			id = Integer.parseInt(request.getParameter("id"));
      rendimento = new BigDecimal(request.getParameter("rendimento"));
		} catch(NullPointerException e) {
			id = new Integer(1);
      rendimento = new BigDecimal(1);
		}
		logger.atDebug().log("Id integer: " + id);
		logger.atDebug().log("Rendimento Big: " + rendimento);

    try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
      MapperReceita mapperReceita = sqlSession.getMapper(MapperReceita.class);
			receita = mapperReceita.selectReceitaPorId(id);
    }

    if(receita != null ) {
			logger.atDebug().log(receita);
      receita = new Receita(receita,rendimento);
      Gson gson = new GsonBuilder()
											.serializeNulls()
											.create();
      String string = gson.toJson(receita);
      response.setContentType("application/json;charset=UTF-8");
      PrintWriter out = response.getWriter();
      out.print(string);
    } else {
			logger.atDebug().log("Receita is null");
		}

  }
}
